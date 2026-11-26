import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19935

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 15]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [16, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [15, 19]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [9, 19]⟩,
    ⟨.and, [4, 30]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [5, 32]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [20, 34]⟩,
    ⟨.and, [6, 35]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [18, 37]⟩,
    ⟨.and, [7, 38]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [27, 40]⟩,
    ⟨.or, [29, 41]⟩,
    ⟨.or, [31, 42]⟩,
    ⟨.or, [33, 43]⟩,
    ⟨.or, [36, 44]⟩,
    ⟨.or, [39, 45]⟩], 46⟩

end PEqualNP.Outside.L_meta_19935

theorem PEqualNP.Outside.L_meta_19935 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8164297279589376675 : ℕ).testBit (8 * u.val + v.val)) 31 := by
  exact ⟨PEqualNP.Outside.L_meta_19935.witness, by simp [PEqualNP.Outside.L_meta_19935.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
