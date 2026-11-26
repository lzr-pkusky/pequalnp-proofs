from concurrent.futures import ThreadPoolExecutor
from itertools import combinations
from pathlib import Path
import subprocess
import sys
import time

base=Path(__file__).resolve().parents[3]/'referenced-chatgpt-conversation-this-is-an-2'/'work'
sys.path.insert(0,str(base))
from circuit_search import build,evaluate

n,k,table=5,9,4276677288
rows=range(32)

def run(not_count):
    trace={}
    f,w=build(n,k,table,rows,True,require_inputs=True,order=True,trace=trace)
    nots=[ops[2] for _,_,ops in w]
    for gates in combinations(nots,not_count+1): f.add(*(-x for x in gates))
    for gates in combinations(nots,k-not_count+1): f.add(*gates)
    if not_count==1: f.add(-nots[-1])
    for j,(left,right,ops) in enumerate(w):
        for group in (left,right):
            f.add(-group[n]); f.add(-group[n+1])
        for l,r in zip(left,right): f.add(-l,-r,ops[2])
        gate=[trace[row][n+2+j] for row in rows]
        f.add(*gate); f.add(*(-z for z in gate))
        for inp in range(n): f.add(*(z if not(row>>inp&1) else -z for row,z in enumerate(gate)))
    cnf=Path(__file__).with_name(f'not-{not_count}.cnf')
    with cnf.open('w') as out:
        print('p cnf',f.variables,len(f.clauses),file=out)
        for c in f.clauses: print(*c,0,file=out)
    start=time.monotonic()
    print('Starting targeted SAT with',not_count,'NOTs,',f.variables,'vars,',len(f.clauses),'clauses',flush=True)
    try: r=subprocess.run([base/'lean-4.36.0-darwin_aarch64/bin/cadical','-q',cnf],text=True,capture_output=True,timeout=100)
    except subprocess.TimeoutExpired:
        print('Inconclusive timeout',not_count,flush=True)
        return
    print('Solver returned',r.returncode,'after',time.monotonic()-start,'s for',not_count,'NOTs',flush=True)
    if r.returncode==10:
        model={int(t) for line in r.stdout.splitlines() if line.startswith('v ') for t in line.split()[1:]}
        c=[tuple(next(i for i,x in enumerate(group) if x in model) for group in gate) for gate in w]
        assert all(evaluate(n,c,x)==bool(table>>x&1) for x in rows)
        witness=[('and or not'.split()[op],tuple(z if z<n else z-2 for z in ((i,) if op==2 else (i,j)))) for i,j,op in c]
        print(witness,n+k-1,flush=True)
        Path(__file__).with_name(f'witness-{not_count}.txt').write_text(repr(witness)+'\n')

if __name__=='__main__':
    with ThreadPoolExecutor(max_workers=3) as executor: list(executor.map(run,map(int,sys.argv[1:])))
