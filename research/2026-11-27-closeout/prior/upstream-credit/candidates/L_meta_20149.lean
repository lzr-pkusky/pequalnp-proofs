import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20149

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 15]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [11, 18]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [17, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [13, 15]⟩,
    ⟨.or, [21, 25]⟩,
    ⟨.and, [1, 26]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [19, 28]⟩,
    ⟨.and, [2, 29]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [20, 37]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [21, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [24, 27]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [34, 45]⟩,
    ⟨.or, [36, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_20149

theorem PEqualNP.Outside.L_meta_20149 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (6759311759757734295 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_20149.witness, by simp [PEqualNP.Outside.L_meta_20149.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
