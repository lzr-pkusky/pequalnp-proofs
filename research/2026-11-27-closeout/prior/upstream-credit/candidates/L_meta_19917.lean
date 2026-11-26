import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19917

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 12]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [13, 15]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [14, 21]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.or, [20, 23]⟩,
    ⟨.and, [0, 24]⟩,
    ⟨.or, [19, 20]⟩,
    ⟨.and, [1, 26]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.or, [18, 28]⟩,
    ⟨.and, [2, 29]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [11, 22]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [10, 22]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [14, 37]⟩,
    ⟨.or, [18, 38]⟩,
    ⟨.and, [6, 39]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [25, 27]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [34, 45]⟩,
    ⟨.or, [36, 46]⟩,
    ⟨.or, [40, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19917

theorem PEqualNP.Outside.L_meta_19917 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (12602045345396281050 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19917.witness, by simp [PEqualNP.Outside.L_meta_19917.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
