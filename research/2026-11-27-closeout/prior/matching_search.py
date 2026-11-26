import itertools
import json
import subprocess
import sys
import tempfile
from pathlib import Path

from circuit_search import build, evaluate


def search(use_not):
    n, k = 9, 11
    perms = [sum(1 << (i*3+j) for i,j in enumerate(p)) for p in itertools.permutations(range(3))]
    all_rows = range(1 << n)
    answers = {x: any(x & p == p for p in perms) for x in all_rows}
    table = sum(1 << r for r,v in answers.items() if v)
    rows = perms + [r for r in all_rows if not answers[r]
                    and all(answers[r | (1 << j)] for j in range(n) if not (r >> j & 1))]
    base = Path(__file__).resolve().parent
    for iteration in range(12):
        cnf, wiring = build(n, k, table, rows, use_not, order=True)
        for left, right, _ in wiring:
            for const in (n,n+1):
                cnf.add(-left[const])
                cnf.add(-right[const])
        print('matching', 'AND/OR/NOT' if use_not else 'AND/OR', 'rows', len(rows), flush=True)
        with tempfile.TemporaryDirectory() as directory:
            p = Path(directory) / 'matching.cnf'
            with p.open('w') as out:
                print(f'p cnf {cnf.variables} {len(cnf.clauses)}',file=out)
                for clause in cnf.clauses:
                    print(*clause,0,file=out)
            try:
                r = subprocess.run([base/'lean-4.36.0-darwin_aarch64/bin/cadical','-q',p],
                                   capture_output=True,text=True,timeout=135)
            except subprocess.TimeoutExpired:
                print('matching search timeout', flush=True)
                return
        if r.returncode != 10:
            print('matching', 'UNSAT' if r.returncode==20 else r.stderr, flush=True)
            return
        truth = {int(v) for line in r.stdout.splitlines() if line.startswith('v ') for v in line.split()[1:]}
        candidate = [tuple(next(i for i,x in enumerate(q) if x in truth) for q in w) for w in wiring]
        violations = [x for x in all_rows if evaluate(n,candidate,x)!=answers[x]]
        if not violations:
            (base/'matching3-witness.json').write_text(json.dumps(candidate)+'\n')
            print('matching SAT', candidate,flush=True)
            return
        spacing = max(1,len(violations)//28)
        rows = sorted(set(rows) | set(violations[::spacing]))


if __name__ == '__main__':
    search(len(sys.argv)>1 and sys.argv[1]=='not')
