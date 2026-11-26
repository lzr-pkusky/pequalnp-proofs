import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19671

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.and, [0, 9]⟩,
    ⟨.and, [1, 6]⟩,
    ⟨.or, [4, 5]⟩,
    ⟨.or, [1, 9]⟩,
    ⟨.not, [13]⟩,
    ⟨.and, [12, 14]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [10, 16]⟩], 17⟩

end PEqualNP.Outside.L_meta_19671

theorem PEqualNP.Outside.L_meta_19671 :
    ∃ C : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.FanInTwo C ∧ C.size ≤ 10 ∧ PEqualNP.Represents.Represents (fun u v : Fin 5 => (15762513 : ℕ).testBit (5 * u.val + v.val)) C := by
  exact ⟨PEqualNP.Outside.L_meta_19671.witness, by simp [PEqualNP.Outside.L_meta_19671.witness, PEqualNP.MetaComplexity.FanInTwo],
    by decide, by decide +kernel⟩
