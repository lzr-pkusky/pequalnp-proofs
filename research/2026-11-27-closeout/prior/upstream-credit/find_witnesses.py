import collections
import itertools
import json
import random
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from matrix_synthesis import greedy_cover, indices, net, transpose, verify


ROOT = Path(__file__).resolve().parent


def finite_formula(a, b, target, limit):
    initial = [((1 << b)-1) << (b*i) for i in range(a)]
    initial += [sum(1 << (b*i+j) for i in range(a)) for j in range(b)]
    seen = {mask: i for i,mask in enumerate(initial)}
    layers = [initial]
    for d in range(1, limit+1):
        new = []
        for i in range((d+1)//2):
            for x in layers[i]:
                for y in layers[d-1-i]:
                    for op, value in (('or', x|y), ('and', x&y)):
                        if value not in seen:
                            seen[value] = (op,x,y)
                            new.append(value)
        layers.append(new)
        if target in seen:
            gates = []
            def render(k):
                item = seen[k]
                if isinstance(item,int): return item
                op,x,y = item
                args = (render(x),render(y))
                wire = a+b+len(gates)
                gates.append((op,args))
                seen[k] = wire
                return wire
            out = render(target)
            return gates,out


def rectangle_network(mask, limit, rounds):
    n = 8
    rows = [(mask >> (n*i)) & 255 for i in range(n)]
    cols = transpose(rows)
    rng = random.Random(mask)
    boxes = set()
    for a in range(1,256):
        b = 255
        for i in indices(a): b &= rows[i]
        if not b: continue
        enlarged = 255
        for j in indices(b): enlarged &= cols[j]
        boxes.add((enlarged,b))
    boxes = sorted(boxes)
    all_stars = [[(1 << i,r) for i,r in enumerate(rows) if r],
                 [(c, 1<<j) for j,c in enumerate(cols) if c]]

    def test(rects):
        out = net(n,rects,rng)
        if len(out[0]) <= limit:
            verify(rows,*out)
            return out

    for _ in range(rounds):
        for rects in all_stars:
            result = test(rects)
            if result: return result
        for inverse in (False,True):
            side = cols if inverse else rows
            bb = sorted((b,a) for a,b in boxes) if inverse else boxes
            for c in (0.70, 0.95, 1.2, 1.5):
                for rects in greedy_cover(side,bb,rng,c):
                    if inverse: rects = [(b,a) for a,b in rects]
                    result = test(rects)
                    if result: return result


def write(g, circuit, a, b, mask):
    gates, output = circuit
    for u in range(a):
        for v in range(b):
            w = [i in (u,a+v) for i in range(a+b)]
            for op,(i,j) in gates:
                w.append((w[i] and w[j]) if op=='and' else (w[i] or w[j]))
            assert w[output]==bool(mask>>(b*u+v)&1)
    module = g['module']
    inputs = ',\n    '.join(f'⟨.{op}, [{i}, {j}]⟩' for op,(i,j) in gates)
    folder = ROOT/'candidates'
    folder.mkdir(exist_ok=True)
    path = folder / Path(g['file']).name
    path.write_text(f'''import PEqualNP.Defs

namespace {module}

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[{inputs}], {output}⟩

end {module}

theorem {module} :
    {g['statement']} := by
  exact ⟨{module}.witness, by simp [{module}.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
''')
    (folder/(g['id']+'.txt')).write_text(g['statement']+'\n')
    print(g['id'], len(gates), g.get('weight'), g.get('offerable_now'), g.get('held_now'), flush=True)


def main():
    catalog_path = Path(sys.argv[2]) if len(sys.argv) > 2 else ROOT/'gaps.json'
    catalog = json.loads(catalog_path.read_text())
    one = r'PEqualNP\.Represents\.RepSizeAtMost \(fun u v : Fin (\d+) => \((\d+) : ℕ\)\.testBit \((\d+) \* u\.val \+ v\.val\)\) (\d+)'
    two = r'PEqualNP\.Represents\.RepSizeAtMost \(fun \(u : Fin (\d+)\) \(v : Fin (\d+)\) => \((\d+) : ℕ\)\.testBit \((\d+) \* u\.val \+ v\.val\)\) (\d+)'
    mode = sys.argv[1]
    for g in catalog['gaps']:
        if g.get('weight',0)<=1 or g.get('pr_open') or g.get('held_now') or not g.get('offerable_now'):
            continue
        statement = g.get('statement','')
        if mode == 'small':
            m = re.fullmatch(two,statement)
            if not m: continue
            a,b,mask,width,k = map(int,m.groups())
            if a*b > 16: continue
            circuit = finite_formula(a,b,mask,k)
        else:
            m = re.fullmatch(one,statement)
            if not m: continue
            a,mask,b,k = map(int,m.groups()); width=b
            if a != 8: continue
            circuit = rectangle_network(mask,k,4)
        if b==width and circuit:
            write(g,circuit,a,b,mask)


if __name__=='__main__':
    main()
