import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19660

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [6, 7]⟩,
    ⟨.and, [2, 10]⟩,
    ⟨.or, [4, 9]⟩,
    ⟨.or, [5, 12]⟩,
    ⟨.or, [3, 4]⟩,
    ⟨.and, [9, 14]⟩,
    ⟨.or, [2, 15]⟩,
    ⟨.not, [16]⟩,
    ⟨.and, [13, 17]⟩,
    ⟨.or, [11, 18]⟩], 19⟩

end PEqualNP.Outside.L_meta_19660

theorem PEqualNP.Outside.L_meta_19660 :
    ∃ C : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.FanInTwo C ∧ C.size ≤ 10 ∧ PEqualNP.Represents.Represents (fun u v : Fin 5 => (15768113 : ℕ).testBit (5 * u.val + v.val)) C := by
  exact ⟨PEqualNP.Outside.L_meta_19660.witness, by simp [PEqualNP.Outside.L_meta_19660.witness, PEqualNP.MetaComplexity.FanInTwo],
    by decide, by decide +kernel⟩
