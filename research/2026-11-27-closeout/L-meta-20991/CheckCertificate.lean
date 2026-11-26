import Std.Tactic.BVDecide.LRAT

open Std.Sat Std.Tactic.BVDecide

def fields (line : String) : List String :=
  (line.splitOn " ").filter fun field => !field.isEmpty

def loadDimacs (path : System.FilePath) : IO (CNF Nat) := do
  let lines ← IO.FS.lines path
  let some header := lines[0]? | throw <| IO.userError "Missing DIMACS header"
  let ["p", "cnf", variables, clauses] := fields header
    | throw <| IO.userError "Expected DIMACS CNF header"
  let some variableCount := variables.toNat? | throw <| IO.userError "Invalid variable count"
  let some clauseCount := clauses.toNat? | throw <| IO.userError "Invalid clause count"
  let mut formula := CNF.emptyWithCapacity clauseCount
  for line in lines.toList.drop 1 do
    let tokens := fields line
    let some "0" := tokens.getLast? | throw <| IO.userError "Expected zero-terminated clause"
    let mut clause : CNF.Clause Nat := .empty
    for token in tokens.dropLast do
      let some literal := token.toInt? | throw <| IO.userError "Invalid DIMACS literal"
      if literal.natAbs == 0 || literal.natAbs > variableCount then
        throw <| IO.userError "DIMACS literal outside the header range"
      clause := clause.add (literal.natAbs - 1) (literal > 0)
    formula := formula.add clause
  if formula.clauses.size != clauseCount then
    throw <| IO.userError "DIMACS clause count mismatch"
  return formula

def main (args : List String) : IO Unit := do
  let [formulaPath, proofPath] := args
    | throw <| IO.userError "Usage: lean --run CheckCertificate.lean <cnf> <lrat>"
  let formula ← loadDimacs formulaPath
  let proof ← LRAT.loadLRATProof proofPath
  if LRAT.check proof formula then
    IO.println s!"LRAT verified UNSAT ({formula.clauses.size} clauses, {proof.size} actions)"
  else
    throw <| IO.userError "LRAT certificate failed"
