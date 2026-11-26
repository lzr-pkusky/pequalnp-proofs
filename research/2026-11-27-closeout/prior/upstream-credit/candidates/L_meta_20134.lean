import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20134

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [3, 6]⟩,
    ⟨.or, [4, 7]⟩,
    ⟨.or, [1, 5]⟩,
    ⟨.or, [0, 2]⟩,
    ⟨.or, [1, 17]⟩,
    ⟨.and, [8, 20]⟩,
    ⟨.or, [5, 16]⟩,
    ⟨.and, [9, 22]⟩,
    ⟨.or, [7, 18]⟩,
    ⟨.and, [10, 24]⟩,
    ⟨.or, [6, 17]⟩,
    ⟨.and, [11, 26]⟩,
    ⟨.or, [4, 19]⟩,
    ⟨.and, [12, 28]⟩,
    ⟨.or, [3, 19]⟩,
    ⟨.and, [13, 30]⟩,
    ⟨.or, [0, 18]⟩,
    ⟨.and, [14, 32]⟩,
    ⟨.or, [2, 16]⟩,
    ⟨.and, [15, 34]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [25, 36]⟩,
    ⟨.or, [27, 37]⟩,
    ⟨.or, [29, 38]⟩,
    ⟨.or, [31, 39]⟩,
    ⟨.or, [33, 40]⟩,
    ⟨.or, [35, 41]⟩], 42⟩

end PEqualNP.Outside.L_meta_20134

theorem PEqualNP.Outside.L_meta_20134 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (975669345196721520 : ℕ).testBit (8 * u.val + v.val)) 27 := by
  exact ⟨PEqualNP.Outside.L_meta_20134.witness, by simp [PEqualNP.Outside.L_meta_20134.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
