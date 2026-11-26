import json
import subprocess
import sys
import tempfile
from pathlib import Path

from circuit_search import build, evaluate


def target(row):
    return any(row >> i & (row >> ((i+1) % 7)) & 1 for i in range(7))


def search(a, b):
    n = 8
    k = 8
    rows_map = {}
    for row in range(128):
        h = (row >> a) & (row >> b) & 1
        extended = (row | h) | (h << 7)
        assert extended not in rows_map or rows_map[extended] == target(row)
        rows_map[extended] = target(row)
    table = sum(1 << row for row, hit in rows_map.items() if hit)
    cnf, wiring = build(n, k, table, rows_map, True, require_inputs=False, order=True)
    uses = []
    for left, right, ops in wiring:
        selected = cnf.new()
        cnf.add(-selected, ops[0])
        cnf.add(-selected, left[0], right[0])
        uses.append(selected)
    cnf.add(*uses)
    base = Path(__file__).resolve().parent
    with tempfile.TemporaryDirectory() as d:
        p = Path(d) / 'cycle.cnf'
        with p.open('w') as out:
            print(f'p cnf {cnf.variables} {len(cnf.clauses)}', file=out)
            for clause in cnf.clauses:
                print(*clause, 0, file=out)
        print(a, b, cnf.variables, len(cnf.clauses), flush=True)
        try:
            run = subprocess.run([base / 'lean-4.36.0-darwin_aarch64/bin/cadical', '-q', p],
                                 capture_output=True, text=True, timeout=180)
        except subprocess.TimeoutExpired:
            print(a, b, 'timeout', flush=True)
            return
    if run.returncode != 10:
        print(a, b, 'UNSAT' if run.returncode == 20 else run.stderr, flush=True)
        return
    model = {int(v) for line in run.stdout.splitlines() if line.startswith('v ') for v in line.split()[1:]}
    candidate = [tuple(next(i for i, x in enumerate(choices) if x in model) for choices in gate) for gate in wiring]
    assert all(evaluate(n, candidate, row) == result for row, result in rows_map.items())
    (base / f'cycle-prefix-{a}{b}.json').write_text(json.dumps(candidate)+'\n')
    print(a, b, candidate, flush=True)


def flexible(first_gate, last_gate, duration):
    n, k = 7, 10
    inputs = n + 2
    trace = {}
    table = sum(1 << row for row in range(1 << n) if target(row))
    cnf, wiring = build(n, k, table, range(1 << n), True, order=True, trace=trace)
    only_use = []
    for i, (left, right, ops) in enumerate(wiring):
        if i not in range(first_gate, last_gate):
            cnf.add(-left[0])
        else:
            only_use.append(left[0])
            cnf.add(-left[0], ops[1])
            for raw in range(n):
                cnf.add(-left[0], -right[raw])
            h_choices = []
            for j in range(inputs, inputs+i):
                for row in range(0, 1 << n, 2):
                    if target(row) != target(row | 1):
                        cnf.add(-left[0], -right[j], -trace[row][j])
                some = cnf.new()
                cnf.add(-some, right[j])
                cnf.add(-some, *(trace[row][j] for row in range(0, 1 << n, 4) if row < 64))
                h_choices.append(some)
            cnf.add(-left[0], *h_choices)
            and_choices = []
            for an_l,an_r,an_o in wiring[i+1:]:
                some = cnf.new()
                cnf.add(-some, an_o[0])
                cnf.add(-some, an_l[inputs+i], an_r[inputs+i])
                and_choices.append(some)
            cnf.add(-left[0], *and_choices)
        for const in (n,n+1):
            cnf.add(-left[const])
            cnf.add(-right[const])
    cnf.add(*only_use)
    for i,a in enumerate(only_use):
        for b in only_use[i+1:]:
            cnf.add(-a,-b)
    base = Path(__file__).resolve().parent
    with tempfile.TemporaryDirectory() as d:
        p=Path(d)/'flexible.cnf'
        with p.open('w') as out:
            print(f'p cnf {cnf.variables} {len(cnf.clauses)}',file=out)
            for clause in cnf.clauses: print(*clause,0,file=out)
        try:
            run=subprocess.run([base/'lean-4.36.0-darwin_aarch64/bin/cadical','-q',p],capture_output=True,text=True,timeout=duration)
        except subprocess.TimeoutExpired:
            print('cycle gate placements',first_gate,last_gate,'timeout',flush=True)
            return
    if run.returncode!=10:
        print('cycle gate placements',first_gate,last_gate,'UNSAT' if run.returncode==20 else run.stderr,flush=True)
        return
    model={int(v) for line in run.stdout.splitlines() if line.startswith('v ') for v in line.split()[1:]}
    candidate=[tuple(next(i for i,x in enumerate(choices) if x in model) for choices in gate) for gate in wiring]
    assert all(evaluate(n,candidate,row)==target(row) for row in range(1<<n))
    (base/'cycle-flexible.json').write_text(json.dumps(candidate)+'\n')
    print('cycle SAT',candidate,flush=True)


if __name__ == '__main__':
    if sys.argv[1]=='--flexible':
        flexible(*(int(q) for q in sys.argv[2:]))
    else:
        search(int(sys.argv[1]), int(sys.argv[2]))
