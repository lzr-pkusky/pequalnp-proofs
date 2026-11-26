import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19826

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [3, 5]⟩,
    ⟨.or, [0, 6]⟩,
    ⟨.or, [1, 4]⟩,
    ⟨.or, [2, 7]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.or, [0, 16]⟩,
    ⟨.or, [18, 22]⟩,
    ⟨.and, [8, 23]⟩,
    ⟨.or, [3, 20]⟩,
    ⟨.and, [9, 25]⟩,
    ⟨.or, [7, 16]⟩,
    ⟨.or, [17, 27]⟩,
    ⟨.and, [10, 28]⟩,
    ⟨.or, [2, 20]⟩,
    ⟨.and, [11, 30]⟩,
    ⟨.or, [4, 17]⟩,
    ⟨.or, [19, 32]⟩,
    ⟨.and, [12, 33]⟩,
    ⟨.or, [6, 21]⟩,
    ⟨.and, [13, 35]⟩,
    ⟨.or, [5, 18]⟩,
    ⟨.or, [19, 37]⟩,
    ⟨.and, [14, 38]⟩,
    ⟨.or, [1, 21]⟩,
    ⟨.and, [15, 40]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [31, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [36, 45]⟩,
    ⟨.or, [39, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19826

theorem PEqualNP.Outside.L_meta_19826 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (17599756575633361695 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19826.witness, by simp [PEqualNP.Outside.L_meta_19826.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
