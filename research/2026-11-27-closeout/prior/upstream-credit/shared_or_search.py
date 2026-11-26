import itertools
import json
import re
import subprocess
import sys
import tempfile
from pathlib import Path

from find_witnesses import ROOT, indices, transpose, write


class Formula:
    def __init__(self):
        self.count = 0
        self.clauses = []

    def var(self):
        self.count += 1
        return self.count

    def add(self, *clause):
        self.clauses.append(clause)

    def at_most(self, group, limit):
        if limit < 0:
            self.add()
            return
        if limit == 0:
            for x in group: self.add(-x)
            return
        above = None
        for x in group:
            row = [self.var() for _ in range(limit)]
            self.add(-x, row[0])
            if above is not None:
                self.add(-x, -above[-1])
                for j, above_var in enumerate(above):
                    self.add(-above_var, row[j])
                    if j:
                        self.add(-x, -above[j-1], row[j])
            above = row


def oracle(targets, limit, overlaps):
    if not targets:
        return {}
    unique = set()
    for row in targets:
        part = row
        while part:
            if part.bit_count() > 1:
                unique.add(part)
            part = (part - 1) & row
    f = Formula()
    choose = {p: f.var() for p in sorted(unique)}
    for t in targets:
        if t in choose:
            f.add(choose[t])
    recipes = {}
    for s,x in choose.items():
        available = []
        a = (s - 1)&s
        while a:
            absent = s^a
            possible = a
            while True:
                b = absent|possible if overlaps else absent
                if a < b < s:
                    part = f.var()
                    available.append((part,a,b))
                    for edge in (a,b):
                        if edge in choose:
                            f.add(-part, choose[edge])
                if not overlaps or not possible: break
                possible = (possible-1)&a
            a = (a-1)&s
        recipes[s] = available
        f.add(-x,*(d for d,_,_ in available))
    f.at_most(list(choose.values()),limit)
    with tempfile.TemporaryDirectory() as scratch:
        file = Path(scratch)/'shared.cnf'
        with file.open('w') as stream:
            print(f'p cnf {f.count} {len(f.clauses)}',file=stream)
            for clause in f.clauses: print(*clause,0,file=stream)
        try:
            result = subprocess.run([ROOT.parent/'lean-4.36.0-darwin_aarch64/bin/cadical','-q',file],text=True,capture_output=True,timeout=1.7)
        except subprocess.TimeoutExpired:
            return None
    if result.returncode != 10:
        return None
    model = {int(v) for ln in result.stdout.splitlines() if ln.startswith('v ') for v in ln.split()[1:]}
    return {s:(a,b) for s,choices in recipes.items() if choose[s] in model
            for _,a,b in [next((d,a,b) for d,a,b in choices if d in model)]}


def star(mask, limit, size, flip, overlaps):
    full = (1 << size)-1
    rows = [(mask>>(size*i))&full for i in range(size)]
    if flip:
        rows = transpose(rows)
    termcount = sum(bool(row) for row in rows)
    cost = termcount - 1 + sum(0<row<full for row in rows)
    recipes = oracle([p for p in rows if 0<p<full],limit-cost,overlaps)
    if recipes is None or not termcount:
        return None
    gates=[]
    group = {1 << i: (0 if flip else size) + i for i in range(size)}

    def emit(op,v,w):
        out = 2*size+len(gates)
        gates.append((op,(v,w)))
        return out

    def wire(p):
        if p not in group:
            a,b = recipes[p]
            group[p] = emit('or',wire(a),wire(b))
        return group[p]

    terms=[]
    for i,row in enumerate(rows):
        if not row: continue
        raw = (size if flip else 0)+i
        terms.append(raw if row==full else emit('and',raw,wire(row)))
    result=terms[0]
    for term in terms[1:]:
        result=emit('or',result,term)
    return gates,result


def main():
    catalog=json.loads(Path(sys.argv[1]).read_text())['gaps']
    pattern=r'PEqualNP\.Represents\.RepSizeAtMost \(fun u v : Fin (\d+) => \((\d+) : ℕ\)\.testBit \((\d+) \* u\.val \+ v\.val\)\) (\d+)'
    for gap in reversed(catalog):
        if gap.get('weight',0)<=1 or gap.get('held_now') or gap.get('pr_open') or not gap.get('offerable_now'):
            continue
        m=re.fullmatch(pattern,gap.get('statement',''))
        if not m: continue
        a,mask,b,budget=map(int,m.groups())
        if a!=8 or b!=8 or (ROOT/'candidates'/(gap['id']+'.txt')).exists(): continue
        for overlaps,flip in itertools.product((False,True),repeat=2):
            result=star(mask,budget,a,flip,overlaps)
            if result:
                assert len(result[0])<=budget
                write(gap,result,a,b,mask)
                break


if __name__=='__main__':
    main()
