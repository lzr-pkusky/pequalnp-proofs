import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19853

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 12]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [16, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [17, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [19, 20]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [18, 33]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [16, 36]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [17, 39]⟩,
    ⟨.and, [7, 40]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [28, 42]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [38, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19853

theorem PEqualNP.Outside.L_meta_19853 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (3115533915564101205 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19853.witness, by simp [PEqualNP.Outside.L_meta_19853.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
