import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19747

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 9]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [11, 19]⟩,
    ⟨.or, [15, 18]⟩,
    ⟨.or, [11, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [8, 20]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [13, 21]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [15, 20]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [9, 20]⟩,
    ⟨.and, [4, 30]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [19, 32]⟩,
    ⟨.and, [5, 33]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [18, 35]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [14, 21]⟩,
    ⟨.and, [7, 38]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [27, 40]⟩,
    ⟨.or, [29, 41]⟩,
    ⟨.or, [31, 42]⟩,
    ⟨.or, [34, 43]⟩,
    ⟨.or, [37, 44]⟩,
    ⟨.or, [39, 45]⟩], 46⟩

end PEqualNP.Outside.L_meta_19747

theorem PEqualNP.Outside.L_meta_19747 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (14348455746820602255 : ℕ).testBit (8 * u.val + v.val)) 31 := by
  exact ⟨PEqualNP.Outside.L_meta_19747.witness, by simp [PEqualNP.Outside.L_meta_19747.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
