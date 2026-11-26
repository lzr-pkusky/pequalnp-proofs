import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19813

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [13, 15]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [11, 20]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.or, [18, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.or, [18, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [19, 30]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [19, 33]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [12, 21]⟩,
    ⟨.and, [7, 40]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [39, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19813

theorem PEqualNP.Outside.L_meta_19813 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (6614477138885590260 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19813.witness, by simp [PEqualNP.Outside.L_meta_19813.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
