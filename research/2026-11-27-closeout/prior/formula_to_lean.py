import ast
import json
import re
import sys
from pathlib import Path


def prove(gap, n, mask, tree, folder):
    gates, cache = [], {}
    operators = dict(A='and', O='or', N='not', T='and', F='or')

    def compile_gate(node):
        if isinstance(node, ast.Constant):
            return node.value
        name = operators[node.func.id]
        args = tuple(sorted(map(compile_gate, node.args)))
        key = name, args
        if key not in cache:
            cache[key] = 2 * n + len(gates)
            gates.append(key)
        return cache[key]

    wire = compile_gate(ast.parse(tree, mode='eval').body)
    statement = gap['statement']
    budget = int(re.search(r'C.size ≤ (\d+)', statement)[1])
    if len(gates) > budget:
        return
    for i in range(n):
        for j in range(n):
            wires = [k in (i, n+j) for k in range(2*n)]
            for op, args in gates:
                values = [wires[k] for k in args]
                wires.append((not values[0]) if op == 'not' else (all(values) if op == 'and' else any(values)))
            assert wires[wire] == bool(mask >> (n*i+j) & 1)
    rendered = ',\n    '.join(f'⟨.{op}, [{", ".join(map(str,args))}]⟩' for op,args in gates)
    module = gap['module']
    dest = folder / Path(gap['file']).name
    dest.write_text(f'''import PEqualNP.Defs

namespace {module}

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[{rendered}], {wire}⟩

end {module}

theorem {module} :
    {statement} := by
  exact ⟨{module}.witness, by simp [{module}.witness, PEqualNP.MetaComplexity.FanInTwo],
    by decide, by decide +kernel⟩
''')
    (folder/f'{gap["id"]}-statement.txt').write_text(statement+'\n')
    print(gap['id'], len(gates), budget, dest)


if __name__ == '__main__':
    base = Path(__file__).resolve().parent
    gaps = {g['id']: g for g in json.loads(Path(sys.argv[1]).read_text())['gaps']}
    folder = base / 'candidate-proofs'
    folder.mkdir(exist_ok=True)
    n = int(sys.argv[2])
    for line in Path(sys.argv[3]).read_text().splitlines():
        step, mask, _, tree = line.split()
        if step in gaps and step != 'L-meta-19304' and not gaps[step].get('pr_open'):
            prove(gaps[step], n, int(mask), tree, folder)
