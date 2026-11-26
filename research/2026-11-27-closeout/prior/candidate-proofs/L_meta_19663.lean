import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19663

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.and, [0, 5]⟩,
    ⟨.or, [6, 7]⟩,
    ⟨.and, [1, 11]⟩,
    ⟨.or, [4, 9]⟩,
    ⟨.and, [4, 9]⟩,
    ⟨.or, [1, 14]⟩,
    ⟨.not, [15]⟩,
    ⟨.and, [13, 16]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.or, [10, 18]⟩], 19⟩

end PEqualNP.Outside.L_meta_19663

theorem PEqualNP.Outside.L_meta_19663 :
    ∃ C : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.FanInTwo C ∧ C.size ≤ 10 ∧ PEqualNP.Represents.Represents (fun u v : Fin 5 => (16269521 : ℕ).testBit (5 * u.val + v.val)) C := by
  exact ⟨PEqualNP.Outside.L_meta_19663.witness, by simp [PEqualNP.Outside.L_meta_19663.witness, PEqualNP.MetaComplexity.FanInTwo],
    by decide, by decide +kernel⟩
