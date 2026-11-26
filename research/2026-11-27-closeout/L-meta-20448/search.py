import argparse
import itertools
from pathlib import Path
import subprocess
import sys

here = Path(__file__).resolve().parent
upstream = here.parents[2] / "referenced-chatgpt-conversation-this-is-an-2" / "work"
sys.path.insert(0, str(upstream))
from circuit_search import build, evaluate

target = 11896017
parser = argparse.ArgumentParser()
parser.add_argument("omit", type=int)
parser.add_argument("budget", type=int, default=9, nargs="?")
parser.add_argument("--seed", type=int, default=42)
parser.add_argument("--omit-rows", default="34")
parser.add_argument("--max-not", type=int)
parser.add_argument("--seconds", type=int, default=90)
args = parser.parse_args()

omit_rows = {int(i) for i in args.omit_rows}
read = [i for i in range(10) if i not in omit_rows and (args.omit < 0 or i != 5 + args.omit)]
n = len(read)
k = args.budget
encoding = {i: 1 << j for j, i in enumerate(read)}
samples = tuple((encoding.get(i,0) | encoding.get(5+j,0), bool((target >> (5*i+j)) & 1))
                for i in range(5) for j in range(5))
samples = tuple(dict(samples).items())
rows = [i for i, _ in samples]
table = sum(1<<i for i,p in samples if p)
trace = {}
f, wiring = build(n,k,table,rows,True,require_inputs=True,order=True,trace=trace)
negations = [groups[2][2] for groups in wiring]
f.add(*negations)
max_not = k - (n-1)
if args.max_not is not None:
    max_not = min(max_not, args.max_not)
for subset in itertools.combinations(negations, max_not+1):
    f.add(*(-v for v in subset))
for step,(left,right,ops) in enumerate(wiring):
    for invalid in (n,n+1):
        f.add(-left[invalid])
        f.add(-right[invalid])
    for i in range(len(left)):
        f.add(-left[i],-right[i],ops[2])
    for i in range(step):
        f.add(-ops[2],-wiring[i][2][2],-left[n+2+i])
    wire = n+2+step
    for i in range(wire+1):
        if i==wire:
            continue
        differences=[]
        for sample in rows:
            a=trace[sample][i]
            b=trace[sample][wire]
            if isinstance(a,bool):
                d=-b if a else b
            else:
                d=f.new()
                f.add(-d, a, b)
                f.add(-d, -a, -b)
            differences.append(d)
        f.add(*differences)
file = here / f"search-{args.omit_rows}-{args.omit}-{k}-{args.seed}.cnf"
with file.open("w") as stream:
    print("p cnf",f.variables,len(f.clauses),file=stream)
    for clause in f.clauses:
        print(*clause,0,file=stream)
solution = here / f"search-{args.omit_rows}-{args.omit}-{k}-{args.seed}.log"
solver=upstream/'lean-4.36.0-darwin_aarch64/bin/cadical'
try:
    with solution.open("w") as stream:
        p=subprocess.run([str(solver),f"--seed={args.seed}","-q",str(file)],stdout=stream,timeout=args.seconds)
except subprocess.TimeoutExpired:
    print(args.omit_rows,args.omit,k,args.seed,"timeout")
    sys.exit(0)
if p.returncode!=10:
    print(args.omit_rows,args.omit,k,args.seed,p.returncode)
    sys.exit(0)
model={int(v) for line in solution.read_text().splitlines() if line.startswith("v ") for v in line.split()[1:]}
candidate=[tuple(next(i for i,x in enumerate(group) if x in model) for group in gate) for gate in wiring]
assert all(evaluate(n,candidate,row)==val for row,val in samples)
def raw(i):
    if i < n:
        return read[i]
    return 10+i-(n+2)
gates=[]
for l,r,op in candidate:
    gates.append((("and","or","not")[op],[raw(l)] if op==2 else [raw(l),raw(r)]))
for row in range(5):
    for col in range(5):
        values=[index==row or index==5+col for index in range(10)]
        for op,src in gates:
            vals=[values[x] for x in src]
            values.append(all(vals) if op=="and" else any(vals) if op=="or" else not vals[0])
        assert values[-1]==bool((target>>(5*row+col))&1)
print(args.omit_rows,args.omit,k,args.seed,gates)
