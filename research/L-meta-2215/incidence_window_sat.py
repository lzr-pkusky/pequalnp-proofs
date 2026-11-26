import itertools
import json
import pathlib
import subprocess
import sys
import tempfile

from sat_formula import Formula
from incidence2215 import EDGES, PENCIL, LINES, POINTS


def make_problem(points, shared_lines):
    edges = [(p, l) for p, l in EDGES if p in points]
    lines = range(POINTS, POINTS + LINES) if shared_lines else sorted(set(PENCIL) | {l for _, l in edges})
    wires = tuple(points) + tuple(lines)
    bit = {wire: 1 << j for j, wire in enumerate(wires)}
    line_mask = sum(bit[l] for l in wires if l not in points)

    def independent_rows(mask):
        for exclude in range(1 << len(points)):
            allowed = mask
            for p, l in edges:
                if exclude & bit[p]:
                    allowed &= ~bit[l]
            yield exclude | allowed

    output_pos = {bit[p] | bit[l] for p, l in edges}
    output_neg = set(independent_rows(line_mask))
    aux_pos = {bit[l] for l in PENCIL}
    aux_neg = set(independent_rows(line_mask & ~sum(aux_pos)))
    rows = sorted(output_pos | output_neg | aux_pos | aux_neg)
    specs = [(output_pos, output_neg), (aux_pos, aux_neg)]
    return wires, rows, specs


def mux(f, choices, values, result):
    for choose, value in zip(choices, values):
        if isinstance(value, bool):
            f.add(-choose, result if value else -result)
        else:
            f.add(-choose, -value, result)
            f.add(-choose, value, -result)


def encode(points, k, fixed_pencil, shared_lines):
    headers, tests, specs = make_problem(points, shared_lines)
    n = len(headers)
    prefix = []
    if shared_lines:
        for p in range(POINTS):
            if p not in points:
                first, *rest = (headers.index(l) for a, l in EDGES if a == p)
                for other in rest:
                    prefix.append((1, first, other))
                    first = n + len(prefix) - 1
    shared = len(prefix)
    if fixed_pencil:
        if len(PENCIL) == 4:
            a, b, c, d = (headers.index(w) for w in PENCIL)
            prefix += [(1, a, b), (1, c, d), (1, n + shared, n + shared + 1)]
        elif len(PENCIL) == 2:
            a, b = (headers.index(w) for w in PENCIL)
            prefix.append((1, a, b))
        else:
            raise ValueError('Expected two or four distinguished inputs')
        specs = specs[:1]
        k -= len(PENCIL) - 1
    inputs = n + len(prefix)
    f = Formula()
    structure = []
    for g in range(k):
        width = inputs + g
        l, r, o = f.select(width), f.select(width), f.new()
        for i, choice in enumerate(l):
            for j in range(i):
                f.add(-choice, -r[j])
        if structure:
            for larger, choice in enumerate(structure[-1][1]):
                for smaller in range(larger):
                    f.add(-choice, -r[smaller])
        structure.append((l, r, o))
    outputs = [f.select(inputs + k) for _ in specs]
    for wire in range(inputs if fixed_pencil or shared_lines else 0, inputs + k):
        f.add(*(v[wire] for l, r, _ in structure for v in (l, r) if wire < len(v)),
              *(choices[wire] for choices in outputs))

    for row in tests:
        values = [bool(row >> j & 1) for j in range(n)]
        for _, a, b in prefix:
            values.append(values[a] or values[b])
        for l, r, o in structure:
            a, b, z = f.new(), f.new(), f.new()
            mux(f, l, values, a)
            mux(f, r, values, b)
            f.add(o, -a, -b, z)
            f.add(o, a, -z)
            f.add(o, b, -z)
            f.add(-o, a, b, -z)
            f.add(-o, -a, z)
            f.add(-o, -b, z)
            values.append(z)
        for choices, (yes, no) in zip(outputs, specs):
            if row in yes or row in no:
                result = f.new()
                mux(f, choices, values, result)
                f.add(result if row in yes else -result)
    return headers, prefix, shared, f, structure, outputs


def run(solver, points, k, timeout, fixed_pencil=False, shared_lines=False):
    headers, prefix, shared, f, wiring, selects = encode(points, k, fixed_pencil, shared_lines)
    print(f'Points {points}: {len(headers)} inputs, {k} gates, '
          f'{f.variables} variables, {len(f.clauses)} clauses', flush=True)
    with tempfile.TemporaryDirectory(dir=pathlib.Path(__file__).resolve().parent) as folder:
        path = pathlib.Path(folder) / 'window.cnf'
        with path.open('w') as out:
            out.write(f'p cnf {f.variables} {len(f.clauses)}\n')
            for c in f.clauses:
                out.write(' '.join(map(str, c)) + ' 0\n')
        try:
            p = subprocess.run([solver, '-q', str(path)], text=True, capture_output=True, timeout=timeout)
        except subprocess.TimeoutExpired:
            print('No conclusion within the search limit', flush=True)
            return
    if p.returncode == 20:
        print('UNSAT', flush=True)
        return
    if p.returncode != 10:
        raise RuntimeError(p.stdout + p.stderr)
    model = {int(v) for line in p.stdout.splitlines() if line.startswith('v ') for v in line.split()[1:]}
    choose = lambda options: next(i for i, x in enumerate(options) if x in model)
    candidate = prefix + [(int(op in model), choose(l), choose(r)) for l, r, op in wiring]
    outputs = [choose(options) for options in selects]
    if fixed_pencil:
        outputs.append(len(headers) + len(prefix) - 1)
    print(json.dumps(dict(points=points, inputs=headers, gates=candidate, outputs=outputs,
                          reusable_prefix=shared)), flush=True)


if __name__ == '__main__':
    for option in sys.argv[4:]:
        if option.startswith('--flags='):
            PENCIL = tuple(map(int, option.removeprefix('--flags=').split(',')))
    run(sys.argv[1], tuple(int(arg) for arg in sys.argv[4:] if not arg.startswith('--')),
        int(sys.argv[2]), int(sys.argv[3]), '--fixed-pencil' in sys.argv, '--shared-lines' in sys.argv)
