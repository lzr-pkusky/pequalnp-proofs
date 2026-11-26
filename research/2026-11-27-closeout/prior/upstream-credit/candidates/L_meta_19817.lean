import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19817

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 12]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.and, [0, 18]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.and, [1, 20]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.and, [2, 22]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.and, [3, 24]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [14, 26]⟩,
    ⟨.and, [4, 27]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [10, 29]⟩,
    ⟨.and, [5, 30]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [13, 32]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [15, 35]⟩,
    ⟨.and, [7, 36]⟩,
    ⟨.or, [19, 21]⟩,
    ⟨.or, [23, 38]⟩,
    ⟨.or, [25, 39]⟩,
    ⟨.or, [28, 40]⟩,
    ⟨.or, [31, 41]⟩,
    ⟨.or, [34, 42]⟩,
    ⟨.or, [37, 43]⟩], 44⟩

end PEqualNP.Outside.L_meta_19817

theorem PEqualNP.Outside.L_meta_19817 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10102707875972420115 : ℕ).testBit (8 * u.val + v.val)) 29 := by
  exact ⟨PEqualNP.Outside.L_meta_19817.witness, by simp [PEqualNP.Outside.L_meta_19817.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
