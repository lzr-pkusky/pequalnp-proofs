import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19662

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.and, [1, 7]⟩,
    ⟨.or, [5, 6]⟩,
    ⟨.and, [0, 11]⟩,
    ⟨.or, [4, 9]⟩,
    ⟨.and, [4, 9]⟩,
    ⟨.or, [1, 14]⟩,
    ⟨.not, [15]⟩,
    ⟨.and, [13, 16]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.or, [10, 18]⟩], 19⟩

end PEqualNP.Outside.L_meta_19662

theorem PEqualNP.Outside.L_meta_19662 :
    ∃ C : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.FanInTwo C ∧ C.size ≤ 10 ∧ PEqualNP.Represents.Represents (fun u v : Fin 5 => (16269459 : ℕ).testBit (5 * u.val + v.val)) C := by
  exact ⟨PEqualNP.Outside.L_meta_19662.witness, by simp [PEqualNP.Outside.L_meta_19662.witness, PEqualNP.MetaComplexity.FanInTwo],
    by decide, by decide +kernel⟩
