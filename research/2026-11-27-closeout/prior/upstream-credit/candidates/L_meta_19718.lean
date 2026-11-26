import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19718

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [0, 2]⟩,
    ⟨.or, [5, 7]⟩,
    ⟨.or, [1, 4]⟩,
    ⟨.or, [3, 6]⟩,
    ⟨.or, [6, 16]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.or, [3, 16]⟩,
    ⟨.or, [17, 22]⟩,
    ⟨.and, [8, 23]⟩,
    ⟨.or, [2, 21]⟩,
    ⟨.and, [9, 25]⟩,
    ⟨.or, [1, 7]⟩,
    ⟨.or, [20, 27]⟩,
    ⟨.and, [10, 28]⟩,
    ⟨.or, [18, 22]⟩,
    ⟨.and, [11, 30]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [12, 32]⟩,
    ⟨.or, [0, 17]⟩,
    ⟨.or, [18, 34]⟩,
    ⟨.and, [13, 35]⟩,
    ⟨.or, [4, 21]⟩,
    ⟨.and, [14, 37]⟩,
    ⟨.or, [5, 18]⟩,
    ⟨.or, [19, 39]⟩,
    ⟨.and, [15, 40]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [31, 43]⟩,
    ⟨.or, [33, 44]⟩,
    ⟨.or, [36, 45]⟩,
    ⟨.or, [38, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19718

theorem PEqualNP.Outside.L_meta_19718 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (7482418488621907005 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19718.witness, by simp [PEqualNP.Outside.L_meta_19718.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
