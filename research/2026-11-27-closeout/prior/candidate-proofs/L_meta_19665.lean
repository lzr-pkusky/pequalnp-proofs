import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19665

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.and, [4, 5]⟩,
    ⟨.not, [6]⟩,
    ⟨.and, [0, 11]⟩,
    ⟨.or, [2, 3]⟩,
    ⟨.or, [6, 13]⟩,
    ⟨.or, [4, 9]⟩,
    ⟨.or, [1, 15]⟩,
    ⟨.and, [14, 16]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.or, [10, 18]⟩], 19⟩

end PEqualNP.Outside.L_meta_19665

theorem PEqualNP.Outside.L_meta_19665 :
    ∃ C : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.FanInTwo C ∧ C.size ≤ 10 ∧ PEqualNP.Represents.Represents (fun u v : Fin 5 => (3686493 : ℕ).testBit (5 * u.val + v.val)) C := by
  exact ⟨PEqualNP.Outside.L_meta_19665.witness, by simp [PEqualNP.Outside.L_meta_19665.witness, PEqualNP.MetaComplexity.FanInTwo],
    by decide, by decide +kernel⟩
