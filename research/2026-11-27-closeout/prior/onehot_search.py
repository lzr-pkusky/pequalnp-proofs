import json
import subprocess
import sys
import tempfile
from pathlib import Path

from circuit_search import build, evaluate


TARGETS = {
    'L-meta-17166': (5, 10, {0, 1, 3}, True),
    'L-meta-18564': (5, 11, {1, 4}, False),
}


def search(step, size, budget, mask, use_not, timeout=45):
    n = 2 * size
    rows = [(1 << i) | (1 << (size + j)) for i in range(size) for j in range(size)]
    table = sum(1 << r for q, r in enumerate(rows) if mask >> q & 1)
    formula, wiring = build(n, budget, table, rows, use_not, require_inputs=False, order=True)
    base = Path(__file__).resolve().parent
    with tempfile.TemporaryDirectory() as folder:
        path = Path(folder) / 'onehot.cnf'
        with path.open('w') as out:
            print(f'p cnf {formula.variables} {len(formula.clauses)}', file=out)
            for c in formula.clauses:
                print(*c, 0, file=out)
        print(step, formula.variables, len(formula.clauses), flush=True)
        try:
            p = subprocess.run([base / 'lean-4.36.0-darwin_aarch64/bin/cadical', '-q', '--seed=32', path], capture_output=True, text=True, timeout=timeout)
        except subprocess.TimeoutExpired:
            print(step, 'TIMEOUT', flush=True)
            return
        if p.returncode != 10:
            print(step, 'UNSAT' if p.returncode == 20 else p.stderr, flush=True)
            return
        model = {int(v) for line in p.stdout.splitlines() if line.startswith('v ') for v in line.split()[1:]}
        candidate = [tuple(next(i for i, x in enumerate(group) if x in model) for group in gate) for gate in wiring]
        assert all(evaluate(n, candidate, r) == bool(table >> r & 1) for r in rows)
        (base / f'{step}-witness.json').write_text(json.dumps(dict(mask=mask, size=size, gates=candidate)) + '\n')
        print(step, candidate, flush=True)


if __name__ == '__main__':
    step = sys.argv[1]
    if step in TARGETS:
        size, budget, shifts, use_not = TARGETS[step]
        mask = sum(1 << (i * size + j) for i in range(size) for j in range(size) if (j-i) % size in shifts)
        search(step, size, budget, mask, use_not, 180)
    else:
        search(step, int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]), True,
               int(sys.argv[5]) if len(sys.argv) > 5 else 45)
