import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19782

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 11]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [19, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [19, 25]⟩,
    ⟨.and, [1, 26]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [16, 21]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [21, 32]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [13, 15]⟩,
    ⟨.or, [20, 39]⟩,
    ⟨.and, [7, 40]⟩,
    ⟨.or, [24, 27]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [31, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [36, 45]⟩,
    ⟨.or, [38, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19782

theorem PEqualNP.Outside.L_meta_19782 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (16823704204436992830 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19782.witness, by simp [PEqualNP.Outside.L_meta_19782.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
