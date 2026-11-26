import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19672

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.and, [0, 5]⟩,
    ⟨.and, [1, 6]⟩,
    ⟨.or, [4, 9]⟩,
    ⟨.and, [4, 9]⟩,
    ⟨.or, [1, 13]⟩,
    ⟨.not, [14]⟩,
    ⟨.and, [12, 15]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.or, [10, 17]⟩], 18⟩

end PEqualNP.Outside.L_meta_19672

theorem PEqualNP.Outside.L_meta_19672 :
    ∃ C : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.FanInTwo C ∧ C.size ≤ 10 ∧ PEqualNP.Represents.Represents (fun u v : Fin 5 => (16269393 : ℕ).testBit (5 * u.val + v.val)) C := by
  exact ⟨PEqualNP.Outside.L_meta_19672.witness, by simp [PEqualNP.Outside.L_meta_19672.witness, PEqualNP.MetaComplexity.FanInTwo],
    by decide, by decide +kernel⟩
