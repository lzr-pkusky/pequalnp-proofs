import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20136

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [14, 15]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.or, [18, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [21, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [20, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [20, 34]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [19, 37]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.or, [17, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [29, 43]⟩,
    ⟨.or, [31, 44]⟩,
    ⟨.or, [33, 45]⟩,
    ⟨.or, [36, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_20136

theorem PEqualNP.Outside.L_meta_20136 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (17022383772369540555 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_20136.witness, by simp [PEqualNP.Outside.L_meta_20136.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
