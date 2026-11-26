import json
import subprocess
import tempfile
from pathlib import Path

from find_witnesses import ROOT
from circuit_search import build, evaluate


def search():
    n, k = 14, 22
    edges = [(1<<u)|(1<<(7+v)) for u in range(7) for v in range(7) if (u-v)%7 in (0,1,3)]
    required = [(1<<u)|(1<<(7+v)) for u in range(7) for v in range(7) if v!=1 and (u-v)%7 in (0,1,3)]
    negatives = []
    for r in range(1<<n):
        if all(r&e!=e for e in edges) and all(any((r|(1<<j))&e==e for e in edges) for j in range(n) if not r>>j&1):
            negatives.append(r)
    table = sum(1<<r for r in required)
    rows=sorted(set(required+negatives))
    f,wiring=build(n,k,table,rows,False,require_inputs=False,order=True)
    for left,right,_ in wiring:
        for const in (n,n+1):
            f.add(-left[const]); f.add(-right[const])
        for x,y in zip(left,right): f.add(-x,-y)
    for j in range(n):
        if j!=8: f.add(*(port[j] for g in wiring for port in g[:2]))
    print('Fano constraints',len(required),'positive',len(negatives),'negative',f.count if hasattr(f,'count') else f.variables,len(f.clauses),flush=True)
    solver=ROOT.parent/'lean-4.36.0-darwin_aarch64/bin/cadical'
    with tempfile.TemporaryDirectory() as scratch:
        p=Path(scratch)/'fano.cnf'
        with p.open('w') as out:
            print(f'p cnf {f.variables} {len(f.clauses)}',file=out)
            for clause in f.clauses:print(*clause,0,file=out)
        try:
            run=subprocess.run([solver,'-q',p],capture_output=True,text=True,timeout=150)
        except subprocess.TimeoutExpired:
            print('Fano search timed out',flush=True)
            return
    if run.returncode!=10:
        print('Fano constrained model UNSAT' if run.returncode==20 else run.stderr,flush=True)
        return
    model={int(v) for line in run.stdout.splitlines() if line.startswith('v ') for v in line.split()[1:]}
    candidate=[tuple(next(i for i,x in enumerate(group) if x in model) for group in gate) for gate in wiring]
    assert all(evaluate(n,candidate,r) for r in required)
    assert all(not evaluate(n,candidate,r) for r in negatives)
    path=ROOT/'fano-6670-witness.json';path.write_text(json.dumps(candidate)+'\n'); print('Candidate',path,flush=True)


if __name__=='__main__': search()
