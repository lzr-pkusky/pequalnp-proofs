import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19871

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 11]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.and, [2, 23]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [3, 25]⟩,
    ⟨.or, [11, 18]⟩,
    ⟨.and, [4, 27]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.and, [5, 29]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [15, 31]⟩,
    ⟨.and, [6, 32]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [15, 34]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 37]⟩,
    ⟨.or, [26, 38]⟩,
    ⟨.or, [28, 39]⟩,
    ⟨.or, [30, 40]⟩,
    ⟨.or, [33, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19871

theorem PEqualNP.Outside.L_meta_19871 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (11871860300395540620 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19871.witness, by simp [PEqualNP.Outside.L_meta_19871.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
