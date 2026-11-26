import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19667

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.and, [1, 6]⟩,
    ⟨.not, [1]⟩,
    ⟨.or, [6, 7]⟩,
    ⟨.or, [0, 12]⟩,
    ⟨.or, [4, 9]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.and, [13, 15]⟩,
    ⟨.or, [5, 16]⟩,
    ⟨.and, [11, 17]⟩,
    ⟨.or, [10, 18]⟩], 19⟩

end PEqualNP.Outside.L_meta_19667

theorem PEqualNP.Outside.L_meta_19667 :
    ∃ C : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.FanInTwo C ∧ C.size ≤ 10 ∧ PEqualNP.Represents.Represents (fun u v : Fin 5 => (7373913 : ℕ).testBit (5 * u.val + v.val)) C := by
  exact ⟨PEqualNP.Outside.L_meta_19667.witness, by simp [PEqualNP.Outside.L_meta_19667.witness, PEqualNP.MetaComplexity.FanInTwo],
    by decide, by decide +kernel⟩
