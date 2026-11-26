import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_18726

open PEqualNP.CircuitLowerBounds PEqualNP.MetaComplexity

def exampleCircuit : Circuit :=
  ⟨[⟨.and, [0, 1]⟩, ⟨.and, [0, 1]⟩, ⟨.or, [3, 4]⟩], 5⟩

def fixedInput : Fin 3 := 2

def K : Finset (Fin exampleCircuit.gates.length) := {⟨2, by decide⟩}

def P : Finset (Fin exampleCircuit.gates.length) := {⟨0, by decide⟩, ⟨1, by decide⟩}

lemma eval_example (x : Fin 3 → Bool) :
    exampleCircuit.eval (List.ofFn (Function.update x fixedInput false)) = (x 0 && x 1) := by
  revert x
  decide +kernel

lemma no_zero_gate_example (D : Circuit) (hs : D.size = 0)
    (hv : ∀ x : Fin 3 → Bool,
      D.eval (List.ofFn x) = exampleCircuit.eval (List.ofFn (Function.update x fixedInput false))) : False := by
  have hl : D.gates = [] := List.length_eq_zero_iff.mp hs
  rw [show D = ⟨[], D.output⟩ by cases D; simp_all] at hv
  simp only [eval_example] at hv
  have impossible : ∀ j : Fin 3, ¬ ∀ x : Fin 3 → Bool, x j = (x 0 && x 1) := by decide +kernel
  by_cases bound : D.output < 3
  · apply impossible ⟨D.output, bound⟩
    intro x
    have h := hv x
    change (List.ofFn x).getD D.output false = (x 0 && x 1) at h
    simpa only [List.getD_eq_getElem?_getD, List.getElem?_ofFn, dif_pos bound, Option.getD_some] using h
  · have h := hv (fun _ => true)
    simp [Circuit.eval, Circuit.wires, List.getD_eq_getElem?_getD, List.getElem?_ofFn, bound] at h

theorem posted_statement_is_false : ¬ (∀ (n : ℕ) (C : PEqualNP.CircuitLowerBounds.Circuit) (v : Fin n) (b : Bool) (K P : Finset (Fin C.gates.length)), PEqualNP.MetaComplexity.FanInTwo C → (∀ g ∈ C.gates, g.op = PEqualNP.CircuitLowerBounds.GateOp.not → g.inputs.length = 1) → (∃ y : Fin n → Bool, C.eval (List.ofFn (Function.update y v b)) = false) → Disjoint K P → (∀ j ∈ K, (∃ c : Bool, ∀ x : Fin n → Bool, (C.wires (List.ofFn (Function.update x v b))).getD (n + j.val) false = c) ∨ (∃ w ∈ (C.gates.get j).inputs, ∃ c : Bool, ∀ x : Fin n → Bool, (C.wires (List.ofFn (Function.update x v b))).getD w false = c) ∨ ∃ w ∈ (C.gates.get j).inputs, w < n + j.val ∧ ∀ x : Fin n → Bool, (C.wires (List.ofFn (Function.update x v b))).getD (n + j.val) false = (C.wires (List.ofFn (Function.update x v b))).getD w false) → (∀ p ∈ P, n + p.val ≠ C.output ∧ ∀ k : Fin C.gates.length, n + p.val ∈ (C.gates.get k).inputs → k ∈ P ∨ (k ∈ K ∧ ((∃ c : Bool, ∀ x : Fin n → Bool, (C.wires (List.ofFn (Function.update x v b))).getD (n + k.val) false = c) ∨ ∃ w ∈ (C.gates.get k).inputs, w < n + k.val ∧ w ≠ n + p.val ∧ ∀ x : Fin n → Bool, (C.wires (List.ofFn (Function.update x v b))).getD (n + k.val) false = (C.wires (List.ofFn (Function.update x v b))).getD w false))) → ∃ D : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.FanInTwo D ∧ D.size + K.card + P.card ≤ C.size ∧ ∀ x : Fin n → Bool, D.eval (List.ofFn x) = C.eval (List.ofFn (Function.update x v b))) := by
  intro claim
  obtain ⟨D, _, hsize, heval⟩ := claim 3 exampleCircuit fixedInput false K P
    (by simp [exampleCircuit, FanInTwo])
    (by simp [exampleCircuit])
    ⟨fun _ => false, by rw [eval_example]; decide⟩
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
  apply no_zero_gate_example D _ heval
  have hK : K.card = 1 := by decide
  have hP : P.card = 2 := by decide
  have hs : exampleCircuit.size = 3 := by decide
  omega

end PEqualNP.Outside.L_meta_18726

theorem PEqualNP.Outside.L_meta_18726 : ¬ (∀ (n : ℕ) (C : PEqualNP.CircuitLowerBounds.Circuit) (v : Fin n) (b : Bool) (K P : Finset (Fin C.gates.length)), PEqualNP.MetaComplexity.FanInTwo C → (∀ g ∈ C.gates, g.op = PEqualNP.CircuitLowerBounds.GateOp.not → g.inputs.length = 1) → (∃ y : Fin n → Bool, C.eval (List.ofFn (Function.update y v b)) = false) → Disjoint K P → (∀ j ∈ K, (∃ c : Bool, ∀ x : Fin n → Bool, (C.wires (List.ofFn (Function.update x v b))).getD (n + j.val) false = c) ∨ (∃ w ∈ (C.gates.get j).inputs, ∃ c : Bool, ∀ x : Fin n → Bool, (C.wires (List.ofFn (Function.update x v b))).getD w false = c) ∨ ∃ w ∈ (C.gates.get j).inputs, w < n + j.val ∧ ∀ x : Fin n → Bool, (C.wires (List.ofFn (Function.update x v b))).getD (n + j.val) false = (C.wires (List.ofFn (Function.update x v b))).getD w false) → (∀ p ∈ P, n + p.val ≠ C.output ∧ ∀ k : Fin C.gates.length, n + p.val ∈ (C.gates.get k).inputs → k ∈ P ∨ (k ∈ K ∧ ((∃ c : Bool, ∀ x : Fin n → Bool, (C.wires (List.ofFn (Function.update x v b))).getD (n + k.val) false = c) ∨ ∃ w ∈ (C.gates.get k).inputs, w < n + k.val ∧ w ≠ n + p.val ∧ ∀ x : Fin n → Bool, (C.wires (List.ofFn (Function.update x v b))).getD (n + k.val) false = (C.wires (List.ofFn (Function.update x v b))).getD w false))) → ∃ D : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.FanInTwo D ∧ D.size + K.card + P.card ≤ C.size ∧ ∀ x : Fin n → Bool, D.eval (List.ofFn x) = C.eval (List.ofFn (Function.update x v b))) :=
  PEqualNP.Outside.L_meta_18726.posted_statement_is_false
