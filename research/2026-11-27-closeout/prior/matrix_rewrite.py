import itertools
import json
import re
import sys
from pathlib import Path

from matrix_synthesis import targets, verify


def optimize(n, gates, out, *, initial=None, scenarios=None, allow_not=True):
    if initial is None:
        scenarios = n*n
        initial = [((1 << n)-1) << (n*i) for i in range(n)]
        initial += [sum(1 << (n*i+j) for i in range(n)) for j in range(n)]
    full = (1 << scenarios) - 1
    first = len(initial)

    def op(name, v, args):
        if name == 'and':
            return v[args[0]] & v[args[1]]
        if name == 'or':
            return v[args[0]] | v[args[1]]
        if name == 'not':
            return full ^ v[args[0]]
        raise ValueError(name)

    def live(g, o):
        selected = set()

        def visit(wire):
            if wire >= first and wire not in selected:
                selected.add(wire)
                for v in g[wire - first][1]:
                    visit(v)

        visit(o)
        return selected

    def prune(g, o, replacement=None):
        kept = live(g, o)
        new = []
        renamed = {i:i for i in range(first)}
        for w in sorted(kept):
            name, args = g[w - first]
            if replacement and w == replacement[0]:
                renamed[w] = renamed[replacement[1]]
            else:
                renamed[w] = first + len(new)
                new.append((name, tuple(renamed[x] for x in args)))
        return new, renamed[o]

    gates, out = prune(gates, out)
    while True:
        v = initial.copy()
        for name, args in gates:
            v.append(op(name,v,args))
        optimum = (gates, out)
        minsize = len(gates)
        for i, original in enumerate(gates):
            w = first+i
            if w == out:
                care = full
            else:
                alt = v[:w]+[full ^ v[w]]
                for name, args in gates[i+1:]:
                    alt.append(op(name,alt,args))
                care = alt[out] ^ v[out]
            desired = v[w] & care
            limited = [x & care for x in v[:w]]
            bypasses = [j for j,x in enumerate(limited) if x==desired]
            for j in bypasses:
                new = [(name, tuple(j if x == w else x for x in args)) for name,args in gates]
                trial = prune(new, j if out==w else out)
                if len(trial[0]) < minsize:
                    optimum, minsize = trial, len(trial[0])
            new = gates.copy()
            new[i] = ('not',(0,))
            if len(live(new,out)) >= minsize:
                continue
            active = live(new,out) | set(range(first))
            # Prefer wires already feeding another live gate, so remplacement
            # never pays again to build a newly adopted operand's cone.
            usable = [j for j in sorted(active) if j < w]
            options = [('not',(a,)) for a in usable if (limited[a] ^ care) == desired] if allow_not else []
            for a,b in itertools.combinations(usable,2):
                x,y = limited[a],limited[b]
                if x & y == desired:
                    options.append(('and',(a,b)))
                if x | y == desired:
                    options.append(('or',(a,b)))
            for option in options[:25]:
                if option == original:
                    continue
                new[i] = option
                trial = prune(new,out)
                if len(trial[0]) < minsize:
                    optimum,minsize = trial,len(trial[0])
        if minsize == len(gates):
            return gates,out
        gates,out = optimum
        print('rewrite',len(gates),flush=True)


def main(path,step):
    source = Path(path).read_text()
    match = re.search(r'def cktGates : List Gate := \[(.*?)\]\s*def ckt : Circuit := ⟨cktGates, (\d+)⟩', source, re.S)
    gates = [(op, tuple(map(int, args.split(', ')))) for op,args in re.findall(r'⟨GateOp\.(\w+), \[([\d, ]+)\]⟩',match[1])]
    out = int(match[2]); print('original',len(gates),out,flush=True)
    rows = [int(s,16) for s in re.findall(r'0x[0-9a-f]+',targets()[step]['statement'])]
    verify(rows,gates,out)
    gates,out = optimize(len(rows),gates,out)
    verify(rows,gates,out)
    print('final',len(gates),flush=True)
    Path(__file__).with_name(f'{step}-rewritten.json').write_text(json.dumps(dict(gates=gates,output=out)))


if __name__ == '__main__':
    main(*sys.argv[1:])
