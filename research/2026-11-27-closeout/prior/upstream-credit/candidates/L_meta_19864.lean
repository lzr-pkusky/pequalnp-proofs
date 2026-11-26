import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19864

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [14, 15]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.or, [19, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [9, 20]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [10, 21]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [18, 31]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.or, [17, 34]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.or, [19, 37]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [12, 20]⟩,
    ⟨.and, [7, 40]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [28, 42]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [33, 44]⟩,
    ⟨.or, [36, 45]⟩,
    ⟨.or, [39, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19864

theorem PEqualNP.Outside.L_meta_19864 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (15374695358257377210 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19864.witness, by simp [PEqualNP.Outside.L_meta_19864.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
