import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19795

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 11]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.or, [18, 23]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [19, 28]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [19, 31]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [18, 34]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [20, 37]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [20, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [22, 25]⟩,
    ⟨.or, [27, 43]⟩,
    ⟨.or, [30, 44]⟩,
    ⟨.or, [33, 45]⟩,
    ⟨.or, [36, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19795

theorem PEqualNP.Outside.L_meta_19795 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (14662300726579244910 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19795.witness, by simp [PEqualNP.Outside.L_meta_19795.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
