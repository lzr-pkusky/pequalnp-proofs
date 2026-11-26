import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19869

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 12]⟩,
    ⟨.or, [13, 15]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [16, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [17, 26]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [10, 20]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [9, 20]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [5, 33]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [14, 35]⟩,
    ⟨.or, [15, 36]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [28, 41]⟩,
    ⟨.or, [30, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19869

theorem PEqualNP.Outside.L_meta_19869 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (2220931727598570300 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19869.witness, by simp [PEqualNP.Outside.L_meta_19869.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
