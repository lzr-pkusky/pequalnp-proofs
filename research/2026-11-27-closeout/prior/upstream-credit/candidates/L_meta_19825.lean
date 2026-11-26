import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19825

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 13]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.and, [2, 23]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [14, 25]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [15, 28]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [10, 18]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [30, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19825

theorem PEqualNP.Outside.L_meta_19825 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (1432153032174414900 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19825.witness, by simp [PEqualNP.Outside.L_meta_19825.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
