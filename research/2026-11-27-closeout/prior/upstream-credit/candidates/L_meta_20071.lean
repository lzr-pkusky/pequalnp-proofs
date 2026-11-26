import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20071

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [13, 14]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [0, 6]⟩,
    ⟨.or, [7, 18]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [19, 20]⟩,
    ⟨.or, [2, 4]⟩,
    ⟨.or, [6, 22]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [23, 24]⟩,
    ⟨.or, [1, 3]⟩,
    ⟨.or, [7, 26]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.and, [27, 28]⟩,
    ⟨.or, [2, 5]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [15, 31]⟩,
    ⟨.and, [30, 32]⟩,
    ⟨.or, [0, 3]⟩,
    ⟨.or, [4, 34]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.and, [35, 36]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [1, 38]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.and, [3, 40]⟩,
    ⟨.and, [5, 16]⟩,
    ⟨.or, [21, 25]⟩,
    ⟨.or, [29, 43]⟩,
    ⟨.or, [33, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [39, 46]⟩,
    ⟨.or, [41, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_20071

theorem PEqualNP.Outside.L_meta_20071 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8465338603409387505 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_20071.witness, by simp [PEqualNP.Outside.L_meta_20071.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
