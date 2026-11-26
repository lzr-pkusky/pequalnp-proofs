import argparse
from itertools import combinations
import json
from pathlib import Path
import random
import subprocess
import tempfile


def axioms(holes):
    var = lambda pigeon, hole: 1 + pigeon * holes + hole
    pigeons = range(holes + 1)
    yield from (frozenset(var(p, h) for h in range(holes)) for p in pigeons)
    yield from (frozenset((-var(p, h), -var(q, h)))
                for p, q in combinations(pigeons, 2) for h in range(holes))


def parse_additions(proof_file):
    for line in proof_file.read_text().splitlines():
        values = line.split()
        if not values or not values[0].isdigit() or values[1] == 'd':
            continue
        data = list(map(int, values[1:]))
        i = data.index(0)
        yield int(values[0]), frozenset(data[:i]), data[i + 1:-1]


class Proof:
    def __init__(self, clauses):
        self.reasons = {c: None for c in clauses}

    def resolve(self, a, b, t):
        assert t in a and -t in b
        result = (a - {t}) | (b - {-t})
        if result not in self.reasons:
            self.reasons[result] = (a, b, t)
        return result

    def replay_rup(self, target, sources):
        assumed = {-t for t in target}
        trail = []
        assigned = assumed.copy()
        remaining = list(sources)
        while True:
            changed = False
            following = []
            for clause in remaining:
                pending = [t for t in clause if -t not in assigned]
                if any(t in assigned for t in pending):
                    continue
                if not pending:
                    result = clause
                    for t, reason in reversed(trail):
                        if -t in result:
                            result = self.resolve(reason, result, t)
                    assert result <= target
                    return result
                if len(pending) == 1:
                    t = pending[0]
                    assigned.add(t)
                    trail.append((t, clause))
                    changed = True
                else:
                    following.append(clause)
            if not changed:
                return None
            remaining = following

    def collect(self):
        order = []
        seen = {}

        def walk(c):
            if c in seen:
                return seen[c]
            why = self.reasons[c]
            if why is not None:
                a, b, t = why
                why = (walk(a), walk(b), t)
            index = len(order)
            order.append({'lits': sorted(c), 'why': why})
            seen[c] = index
            return index

        empty = frozenset()
        if empty not in self.reasons:
            return None
        walk(empty)
        return order


def try_order(solver, holes, clauses, seed, folder, solver_config):
    inp, trace = folder / 'php.cnf', folder / 'php.lrat'
    inp.write_text(f'p cnf {holes * (holes+1)} {len(clauses)}\n' + '\n'.join(
        ' '.join(map(str, c)) + ' 0' for c in clauses) + '\n')
    try:
        result = subprocess.run([solver, '-q', '--lrat', '--no-binary', '--no-elim',
                                 '--no-block', '--no-cover', f'--seed={seed}',
                                 *solver_config, str(inp), str(trace)],
                                capture_output=True, timeout=4)
    except subprocess.TimeoutExpired:
        return None
    if result.returncode != 20:
        raise RuntimeError(result.stderr.decode())
    replay = Proof(clauses)
    aliases = {i + 1: c for i, c in enumerate(clauses)}
    for idx, target, steps in parse_additions(trace):
        hinted = [aliases[s] for s in steps if s > 0 and s in aliases]
        found = replay.replay_rup(target, hinted)
        if found is None:
            found = replay.replay_rup(target, aliases.values())
        if found is not None:
            aliases[idx] = found
    return replay.collect()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('solver')
    ap.add_argument('holes', type=int)
    ap.add_argument('target', type=int)
    ap.add_argument('runs', type=int)
    args = ap.parse_args()
    clauses = list(axioms(args.holes))
    rng = random.Random(41129)
    best = 10000000
    configurations = [[], ['--no-vivify'], ['--no-probe', '--no-vivify'],
                      ['--phase=false'], ['--no-probe', '--phase=false']]
    with tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parent) as folder:
        for run in range(args.runs):
            rng.shuffle(clauses)
            proof = try_order(args.solver, args.holes, clauses, rng.randrange(10**7),
                              Path(folder), configurations[run % len(configurations)])
            if proof is not None and len(proof) < best:
                best = len(proof)
                print(f'{args.holes} holes, run {run + 1}, best {best} lines', flush=True)
                Path(__file__).with_name(f'php{args.holes}_best.json').write_text(json.dumps(proof))
                if best <= args.target:
                    return
    print(f'Best after {args.runs} runs: {best} lines', flush=True)


if __name__ == '__main__':
    main()
