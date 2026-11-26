import argparse
import itertools
import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2] / 'referenced-chatgpt-conversation-this-is-an-2/work'
sys.path.insert(0, str(ROOT))
from circuit_search import build, evaluate

MASK = 11896017
ROWS = [(1 << u) | (1 << (5 + v)) for u in range(5) for v in range(5)]
TABLE = sum(1 << row for i, row in enumerate(ROWS) if MASK >> i & 1)
SOLVER = ROOT / 'lean-4.36.0-darwin_aarch64/bin/cadical'


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('gates', type=int)
    parser.add_argument('seed', type=int)
    parser.add_argument('seconds', type=int)
    parser.add_argument('--omit', type=int, nargs='*', default=[])
    parser.add_argument('--nots', type=int, default=0)
    parser.add_argument('--unordered', action='store_true')
    args = parser.parse_args()
    formula, wiring = build(10, args.gates, TABLE, ROWS, True,
                            require_inputs=False, order=not args.unordered)
    for left, right, ops in wiring:
        for index in (10, 11, *args.omit):
            formula.add(-left[index])
            formula.add(-right[index])
        for index, first in enumerate(left):
            formula.add(-first, -right[index], ops[2])
    row_types = [(MASK >> (5 * u)) & 31 for u in range(5)]
    col_types = [sum(((MASK >> (5 * u + v)) & 1) << u for u in range(5)) for v in range(5)]
    for offset, types in ((0, row_types), (5, col_types)):
        for first, second in itertools.combinations(range(5), 2):
            if types[first] == types[second]:
                continue
            formula.add(*(ports[i + offset] for i in (first, second)
                          for left, right, _ in wiring for ports in (left, right)))
    nots = [ops[2] for _, _, ops in wiring]
    formula.add(*nots)
    if args.nots:
        for too_many in itertools.combinations(nots, args.nots + 1):
            formula.add(*(-lit for lit in too_many))
        for too_few in itertools.combinations(nots, len(nots) - args.nots + 1):
            formula.add(*too_few)

    prefix = Path(__file__).resolve().parent / f'L-meta-20448-{args.gates}-{args.seed}'
    cnf = prefix.with_suffix('.cnf')
    with cnf.open('w') as stream:
        print(f'p cnf {formula.variables} {len(formula.clauses)}', file=stream)
        for clause in formula.clauses:
            print(*clause, 0, file=stream)
    print(vars(args), formula.variables, len(formula.clauses), flush=True)
    try:
        result = subprocess.run([SOLVER, '-q', f'--seed={args.seed}', cnf],
                                capture_output=True, text=True, timeout=args.seconds)
    except subprocess.TimeoutExpired:
        print('TIMEOUT', flush=True)
        return
    if result.returncode != 10:
        print('UNSAT in this encoding' if result.returncode == 20 else result.stderr, flush=True)
        return
    model = {int(value) for line in result.stdout.splitlines() if line.startswith('v ')
             for value in line.split()[1:]}
    candidate = [tuple(next(i for i, variable in enumerate(group) if variable in model)
                       for group in gate) for gate in wiring]
    assert all(evaluate(10, candidate, row) == bool(TABLE >> row & 1) for row in ROWS)
    gates = [(['and', 'or', 'not'][op], [i if i < 10 else i - 2 for i in (a, b)[:1 if op == 2 else 2]])
             for a, b, op in candidate]
    output = {'gates': gates, 'output': 9 + args.gates}
    prefix.with_suffix('.json').write_text(json.dumps(output) + '\n')
    print('SAT', output, flush=True)


if __name__ == '__main__':
    main()
