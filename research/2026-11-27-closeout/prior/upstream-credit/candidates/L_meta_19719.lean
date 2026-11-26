import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19719

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 15]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.and, [2, 23]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [13, 25]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [10, 18]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [5, 30]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [14, 32]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [24, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19719

theorem PEqualNP.Outside.L_meta_19719 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (9901191629971542690 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19719.witness, by simp [PEqualNP.Outside.L_meta_19719.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
