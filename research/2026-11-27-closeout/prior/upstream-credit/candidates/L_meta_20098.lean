import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20098

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 12]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.or, [9, 20]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [8, 21]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [18, 26]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.or, [19, 29]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [15, 34]⟩,
    ⟨.or, [19, 35]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [20, 38]⟩,
    ⟨.and, [6, 39]⟩,
    ⟨.or, [10, 21]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [28, 43]⟩,
    ⟨.or, [31, 44]⟩,
    ⟨.or, [33, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [40, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_20098

theorem PEqualNP.Outside.L_meta_20098 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (11447215094344424295 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_20098.witness, by simp [PEqualNP.Outside.L_meta_20098.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
