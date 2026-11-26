import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19814

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 11]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [8, 18]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.and, [2, 23]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.and, [3, 25]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [4, 27]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [15, 29]⟩,
    ⟨.and, [5, 30]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.and, [6, 32]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [14, 34]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 37]⟩,
    ⟨.or, [26, 38]⟩,
    ⟨.or, [28, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [33, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19814

theorem PEqualNP.Outside.L_meta_19814 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (7093347072485314830 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19814.witness, by simp [PEqualNP.Outside.L_meta_19814.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
