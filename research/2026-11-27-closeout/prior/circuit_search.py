import itertools
import pathlib
import subprocess
import sys
import tempfile


class Formula:
    def __init__(self):
        self.variables = 0
        self.clauses = []

    def new(self):
        self.variables += 1
        return self.variables

    def add(self, *clause):
        self.clauses.append(clause)

    def select(self, size):
        choices = [self.new() for _ in range(size)]
        self.add(*choices)
        for first, second in itertools.combinations(choices, 2):
            self.add(-first, -second)
        return choices


def build(n, k, table, rows, use_not, split=None, *, require_inputs=True, order=False,
          trace=None):
    f = Formula()
    inputs = n + (2 if split is None else 0)
    wiring = []
    for step in range(k):
        width = inputs + step
        left, right = f.select(width), f.select(width)
        ops = f.select(3 if use_not else 2)
        for first in range(width):
            for second in range(first):
                f.add(-left[first], -right[second])
            if use_not:
                f.add(-ops[2], -left[first], right[first])
        if (split is not None or order) and wiring:
            prev_left, prev_right, prev_ops = wiring[-1]
            for high, choice in enumerate(prev_right):
                for low in range(high):
                    f.add(-choice, -right[low])
                for before in range(high + 1):
                    for after in range(before):
                        f.add(-choice, -right[high], -prev_left[before], -left[after])
                    for op in range(2):
                        f.add(-choice, -right[high], -prev_left[before], -left[before],
                              -prev_ops[op], -ops[op])
        wiring.append((left, right, ops))
    for wire in (list(range(n)) if require_inputs else []) + list(range(inputs, inputs + k - 1)):
        f.add(*(v[wire] for l, r, _ in wiring for v in (l, r) if wire < len(v)))
    if split is not None:
        colors = [(i < split, i >= split) for i in range(n)]
        for left, right, (is_and, is_or) in wiring:
            result_colors = []
            for color in (0, 1):
                a, b, z = f.new(), f.new(), f.new()
                for group, selected in ((left, a), (right, b)):
                    for selector, color_pair in zip(group, colors):
                        value = color_pair[color]
                        if isinstance(value, bool):
                            f.add(-selector, selected if value else -selected)
                        else:
                            f.add(-selector, -value, selected)
                            f.add(-selector, value, -selected)
                f.add(-is_and, -z)
                f.add(-is_or, a, b, -z)
                f.add(-is_or, -a, z)
                f.add(-is_or, -b, z)
                result_colors.append(z)
            f.add(*(-z for z in result_colors))
            colors.append(result_colors)
    useful_on_positive = [[] for _ in wiring]
    useful_on_negative = [[] for _ in wiring]
    for row in rows:
        positive = bool(table >> row & 1)
        values = [bool(row >> j & 1) for j in range(n)]
        if split is None:
            values += [False, True]
        for j, (left, right, ops) in enumerate(wiring):
            a, b, z = f.new(), f.new(), f.new()
            for group, result in ((left, a), (right, b)):
                for selector, value in zip(group, values):
                    if isinstance(value, bool):
                        f.add(-selector, result if value else -result)
                    else:
                        f.add(-selector, -value, result)
                        f.add(-selector, value, -result)
            f.add(-ops[0], -a, -b, z)
            f.add(-ops[0], a, -z)
            f.add(-ops[0], b, -z)
            f.add(-ops[1], a, b, -z)
            f.add(-ops[1], -a, z)
            f.add(-ops[1], -b, z)
            if use_not:
                f.add(-ops[2], a, z)
                f.add(-ops[2], -a, -z)
            values.append(z)
            if split is not None:
                if positive:
                    useful_on_positive[j].append(z)
                else:
                    useful_on_negative[j].append(-z)
        f.add(z if positive else -z)
        if trace is not None:
            trace[row] = values
    if split is not None:
        for conditions in (*useful_on_positive, *useful_on_negative):
            f.add(*conditions)
    return f, wiring


def evaluate(n, candidate, row, split=None):
    bits = [bool(row >> j & 1) for j in range(n)]
    if split is None:
        bits += [False, True]
    for l, r, op in candidate:
        bits.append((bits[l] and bits[r], bits[l] or bits[r], not bits[l])[op])
    return bits[-1]


def main(solver, n, k, table, use_not, split=None):
    domain = range(1 << n)
    rows = domain
    if split is not None:
        rows = [row for row in domain if all(
            (table >> (row ^ (1 << j)) & 1) != (table >> row & 1)
            for j in range(n) if (row >> j & 1) == (table >> row & 1))]
    formula, wiring = build(n, k, table, rows, use_not, split)
    with tempfile.TemporaryDirectory(dir=pathlib.Path(__file__).resolve().parent) as folder:
        path = pathlib.Path(folder) / 'search.cnf'
        with path.open('w') as out:
            out.write(f'p cnf {formula.variables} {len(formula.clauses)}\n')
            for clause in formula.clauses:
                out.write(' '.join(map(str, clause)) + ' 0\n')
        print(f'{formula.variables} variables, {len(formula.clauses)} clauses', flush=True)
        try:
            run = subprocess.run([solver, '-q', str(path)], capture_output=True, text=True, timeout=120)
        except subprocess.TimeoutExpired:
            print('Search timed out after 120 seconds')
            return
    if run.returncode == 20:
        print('UNSAT')
    elif run.returncode == 10:
        model = {int(v) for line in run.stdout.splitlines() if line.startswith('v ') for v in line.split()[1:]}
        candidate = [tuple(next(i for i, x in enumerate(xs) if x in model) for xs in gate) for gate in wiring]
        assert all(evaluate(n, candidate, row, split) == bool(table >> row & 1) for row in domain)
        print(candidate)
    else:
        raise RuntimeError(run.stdout + run.stderr)


if __name__ == '__main__':
    main(sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4], 0), sys.argv[5] == 'not',
         int(sys.argv[6]) if len(sys.argv) > 6 else None)
