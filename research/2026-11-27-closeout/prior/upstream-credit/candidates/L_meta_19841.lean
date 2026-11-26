import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19841

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 12]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [8, 18]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [13, 23]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [5, 30]⟩,
    ⟨.or, [13, 18]⟩,
    ⟨.and, [6, 32]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [14, 34]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [33, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19841

theorem PEqualNP.Outside.L_meta_19841 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (5899763987308416705 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19841.witness, by simp [PEqualNP.Outside.L_meta_19841.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
