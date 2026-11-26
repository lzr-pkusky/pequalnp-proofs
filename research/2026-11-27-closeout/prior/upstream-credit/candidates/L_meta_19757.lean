import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19757

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 14]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [8, 18]⟩,
    ⟨.and, [2, 23]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [13, 25]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.and, [5, 30]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.and, [6, 32]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [15, 34]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [33, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19757

theorem PEqualNP.Outside.L_meta_19757 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (9891717104032518705 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19757.witness, by simp [PEqualNP.Outside.L_meta_19757.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
