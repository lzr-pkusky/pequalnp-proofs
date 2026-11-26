import argparse
import itertools
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2] / 'referenced-chatgpt-conversation-this-is-an-2/work'
sys.path.insert(0, str(ROOT))
from circuit_search import build, evaluate

TABLE = 4276677288
DOMAIN = tuple(range(32))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('seed', type=int)
    parser.add_argument('--gates', type=int, default=9)
    parser.add_argument('--seconds', type=int, default=220)
    parser.add_argument('--nots', type=int, default=0)
    parser.add_argument('--ordered', action='store_true')
    parser.add_argument('--cegis', action='store_true')
    args = parser.parse_args()
    samples = [x for x in DOMAIN if all((TABLE >> (x ^ (1 << j))) & 1 != (TABLE >> x) & 1
               for j in range(5) if (x >> j) & 1 == (TABLE >> x) & 1)] if args.cegis else list(DOMAIN)
    prefix = Path(__file__).resolve().parent / f'L-meta-17976-{args.seed}'
    cnf = prefix.with_suffix('.cnf')
    while True:
        formula, wiring = build(5, args.gates, TABLE, samples, True, order=args.ordered)
        nots = [ops[2] for _, _, ops in wiring]
        formula.add(*nots)
        if args.nots:
            for too_many in itertools.combinations(nots, args.nots + 1):
                formula.add(*(-lit for lit in too_many))
            for too_few in itertools.combinations(nots, len(nots) - args.nots + 1):
                formula.add(*too_few)
        with cnf.open('w') as stream:
            print(f'p cnf {formula.variables} {len(formula.clauses)}', file=stream)
            for clause in formula.clauses:
                print(*clause, 0, file=stream)
        print(vars(args), len(samples), formula.variables, len(formula.clauses), flush=True)
        try:
            answer = subprocess.run([ROOT / 'lean-4.36.0-darwin_aarch64/bin/cadical', '-q', f'--seed={args.seed}', cnf],
                                    capture_output=True, text=True, timeout=args.seconds)
        except subprocess.TimeoutExpired:
            print('TIMEOUT', flush=True)
            return
        if answer.returncode != 10:
            print('UNSAT in this encoding' if answer.returncode == 20 else answer.stderr, flush=True)
            return
        bits = {int(x) for line in answer.stdout.splitlines() if line.startswith('v ') for x in line.split()[1:]}
        candidate = [tuple(next(i for i, value in enumerate(group) if value in bits) for group in gate)
                     for gate in wiring]
        misses = [x for x in DOMAIN if evaluate(5, candidate, x) != bool(TABLE >> x & 1)]
        if misses:
            assert not set(misses) & set(samples)
            samples = sorted(set(samples) | set(misses))
            continue
        gates = []
        for first, second, op in candidate:
            wires = [first] if op == 2 else [first, second]
            if 6 in wires:
                raise SystemExit('validated candidate relies on a constant true wire; examine gate arity')
            wires = [wire if wire < 5 else (32767 if wire == 5 else wire - 2) for wire in wires]
            gates.append((['and', 'or', 'not'][op], wires))
        witness = {'gates': gates, 'output': 4 + args.gates}
        prefix.with_suffix('.json').write_text(json.dumps(witness) + '\n')
        print('SAT', witness, flush=True)
        return


if __name__ == '__main__':
    main()
