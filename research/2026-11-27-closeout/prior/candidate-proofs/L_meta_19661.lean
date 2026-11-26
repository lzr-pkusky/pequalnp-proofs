import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19661

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.and, [1, 5]⟩,
    ⟨.and, [2, 9]⟩,
    ⟨.or, [5, 8]⟩,
    ⟨.and, [0, 12]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [2, 14]⟩,
    ⟨.or, [1, 15]⟩,
    ⟨.not, [16]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.or, [10, 18]⟩], 19⟩

end PEqualNP.Outside.L_meta_19661

theorem PEqualNP.Outside.L_meta_19661 :
    ∃ C : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.FanInTwo C ∧ C.size ≤ 10 ∧ PEqualNP.Represents.Represents (fun u v : Fin 5 => (16236582 : ℕ).testBit (5 * u.val + v.val)) C := by
  exact ⟨PEqualNP.Outside.L_meta_19661.witness, by simp [PEqualNP.Outside.L_meta_19661.witness, PEqualNP.MetaComplexity.FanInTwo],
    by decide, by decide +kernel⟩
