import functools
import json
import re
from pathlib import Path


def mincover(n, edges):
    nbr = [0] * n
    for a, b in edges:
        nbr[a] |= 1 << b
        nbr[b] |= 1 << a

    @functools.lru_cache(maxsize=None)
    def solve(nodes):
        verts = [i for i in range(n) if (nodes >> i) & 1 and nbr[i] & nodes]
        if not verts:
            return ()
        v = max(verts, key=lambda i: (nbr[i] & nodes).bit_count())
        adjacent = [i for i in verts if (nbr[v] >> i) & 1]
        remaining = nodes & ~(1 << v)
        chosen = (v, *solve(remaining))
        rejected = (*adjacent, *solve(remaining & ~nbr[v]))
        return min((chosen, rejected), key=len)

    return solve((1 << n) - 1)


def main():
    catalog = Path(__file__).with_name('pnp-current-gaps.json')
    for g in json.loads(catalog.read_text())['gaps']:
        if g.get('weight', 0) <= 1 or g.get('pr_open'):
            continue
        s = g.get('statement', '')
        m = re.match(r'∃ C : .*?C.size ≤ (\d+) ∧ \(∀ x : Fin (\d+)', s)
        if m and '(u.val, v.val) ∈ ([' in s:
            k, n = map(int, m.groups())
            edges = [(int(a),int(b)) for a,b in re.findall(r'\((\d+), (\d+)\)', s)]
        else:
            m = re.match(r'PEqualNP.MetaComplexity.HasCircuitSize (\d+) \(fun x : Fin \d+ → Bool => (.*)\) (\d+)$', s)
            if not m or not re.fullmatch(r'\(x \d+ && x \d+\)( \|\| \(x \d+ && x \d+\))*', m[2]):
                continue
            n, k = int(m[1]), int(m[3])
            edges = [(int(a),int(b)) for a,b in re.findall(r'\(x (\d+) && x (\d+)\)', m[2])]
        if not edges or max(max(e) for e in edges) >= n or any(a == b for a,b in edges):
            continue
        edges = sorted(set(tuple(sorted(e)) for e in edges))
        cover = mincover(n, edges)
        stars = len(edges) + len(cover) - 1
        # A four-cycle offers an independent candidate for algebraic factoring.
        adj = [set() for _ in range(n)]
        for a,b in edges:
            adj[a].add(b)
            adj[b].add(a)
        cycles = sum(len(adj[a] & adj[b]) >= 2 for a in range(n) for b in range(a)) // 2
        print(f"{stars-k:3d} {g['id']:13s} n={n} edges={len(edges)} cover={len(cover)} cycles={cycles} k={k} {cover}")


if __name__ == '__main__':
    main()
