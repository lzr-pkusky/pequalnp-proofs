import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19737

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 11]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [12, 25]⟩,
    ⟨.or, [14, 26]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [16, 29]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [17, 32]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [16, 39]⟩,
    ⟨.and, [7, 40]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [28, 42]⟩,
    ⟨.or, [31, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [36, 45]⟩,
    ⟨.or, [38, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19737

theorem PEqualNP.Outside.L_meta_19737 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (5662696764710545965 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19737.witness, by simp [PEqualNP.Outside.L_meta_19737.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
