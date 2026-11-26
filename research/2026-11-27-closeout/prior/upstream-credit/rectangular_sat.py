import json
import re
import subprocess
import sys
import tempfile
from pathlib import Path

from find_witnesses import ROOT, write
from circuit_search import build, evaluate


def find(a,b,mask,k):
    n = a+b
    rows = [(1<<u)|(1<<(a+v)) for u in range(a) for v in range(b)]
    table = sum(1<<r for i,r in enumerate(rows) if mask>>i&1)
    f,wiring = build(n,k,table,rows,False,require_inputs=False,order=True)
    for left,right,_ in wiring:
        for const in (n,n+1):
            f.add(-left[const]); f.add(-right[const])
    with tempfile.TemporaryDirectory() as scratch:
        file=Path(scratch)/'circuit.cnf'
        with file.open('w') as stream:
            print(f'p cnf {f.variables} {len(f.clauses)}',file=stream)
            for clause in f.clauses: print(*clause,0,file=stream)
        try:
            r=subprocess.run([ROOT.parent/'lean-4.36.0-darwin_aarch64/bin/cadical','-q',file],text=True,capture_output=True,timeout=8)
        except subprocess.TimeoutExpired:
            return None
    if r.returncode != 10: return None
    model={int(x) for line in r.stdout.splitlines() if line.startswith('v ') for x in line.split()[1:]}
    c=[tuple(next(i for i,x in enumerate(group) if x in model) for group in gate) for gate in wiring]
    assert all(evaluate(n,c,r)==bool(table>>r&1) for r in rows)
    gates=[('or' if op else 'and',(i if i<n else i-2,j if j<n else j-2)) for i,j,op in c]
    return gates,n+k-1


def main():
    rows=json.loads(Path(sys.argv[1]).read_text())['gaps']
    expr=r'PEqualNP\.Represents\.RepSizeAtMost \(fun \(u : Fin (\d+)\) \(v : Fin (\d+)\) => \((\d+) : ℕ\)\.testBit \((\d+) \* u\.val \+ v\.val\)\) (\d+)'
    for g in reversed(rows):
        if g.get('weight',0)<=1 or g.get('pr_open') or g.get('held_now') or not g.get('offerable_now'):continue
        match=re.fullmatch(expr,g.get('statement',''))
        if not match:continue
        a,b,mask,width,k=map(int,match.groups())
        if b!=width or a*b>20 or k>8 or k<1:continue
        result=find(a,b,mask,k)
        if result: write(g,result,a,b,mask)


if __name__=='__main__': main()
