import ast
import json
import subprocess
import tempfile
from pathlib import Path

from find_witnesses import ROOT
from shared_or_search import Formula


def main():
    f=Formula(); support={i:set() for i in range(14)}; symbols={}; gates=[]; roots=[]
    def parse(t):
        if isinstance(t,ast.Constant): return t.value
        a,b=sorted(map(parse,t.args)); name='or' if t.func.id=='O' else 'and'
        key=(name,a,b)
        if key not in symbols:
            w=14+len(gates); symbols[key]=w; gate=f.var()
            support[w]=support[a]|support[b]|{gate}
            gates.append((name,(a,b),gate))
        return symbols[key]

    cover=[[] for _ in range(18)]
    for line in (ROOT/'fano-terms.txt').read_text().splitlines():
        mask,term=line.split();mask=int(mask);w=parse(ast.parse(term,mode='eval').body); x=f.var()
        roots.append((x,w))
        for j in range(18):
            if mask>>j&1: cover[j].append(x)
        for y in support[w]:f.add(-x,y)
    for clause in cover:f.add(*clause)
    f.at_most([x for _,_,x in gates]+[x for x,_ in roots],23)
    with tempfile.TemporaryDirectory() as scratch:
        p=Path(scratch)/'shared.cnf'
        with p.open('w') as out:
            print(f'p cnf {f.count} {len(f.clauses)}',file=out)
            for clause in f.clauses:print(*clause,0,file=out)
        print('sharing encoding',len(gates),len(roots),f.count,len(f.clauses),flush=True)
        try:
            r=subprocess.run([ROOT.parent/'lean-4.36.0-darwin_aarch64/bin/cadical','-q',p],capture_output=True,text=True,timeout=60)
        except subprocess.TimeoutExpired:
            print('Shared term search timed out');return
    if r.returncode!=10:
        print('Shared term model UNSAT' if r.returncode==20 else r.stderr);return
    model={int(x) for line in r.stdout.splitlines() if line.startswith('v ') for x in line.split()[1:]}
    rename={i:i for i in range(14)};result=[]
    for i,(op,(a,b),x) in enumerate(gates):
        if x not in model:continue
        if a not in rename or b not in rename:continue
        rename[14+i]=14+len(result);result.append((op,(rename[a],rename[b])))
    nodes=[rename[w] for x,w in roots if x in model]
    output=nodes[0]
    for w in nodes[1:]:
        result.append(('or',(output,w)));output=13+len(result)
    assert len(result)<=22
    (ROOT/'fano-6670-rewrite.json').write_text(json.dumps(dict(gates=result,output=output)))
    print('Shared term candidate',len(result))


if __name__=='__main__': main()
