import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19777

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [0, 1]⟩,
    ⟨.or, [4, 5]⟩,
    ⟨.or, [6, 7]⟩,
    ⟨.or, [2, 3]⟩,
    ⟨.or, [5, 19]⟩,
    ⟨.and, [8, 20]⟩,
    ⟨.or, [1, 17]⟩,
    ⟨.and, [9, 22]⟩,
    ⟨.or, [6, 16]⟩,
    ⟨.and, [10, 24]⟩,
    ⟨.or, [7, 17]⟩,
    ⟨.and, [11, 26]⟩,
    ⟨.or, [4, 19]⟩,
    ⟨.and, [12, 28]⟩,
    ⟨.or, [3, 16]⟩,
    ⟨.and, [13, 30]⟩,
    ⟨.or, [0, 18]⟩,
    ⟨.and, [14, 32]⟩,
    ⟨.or, [2, 18]⟩,
    ⟨.and, [15, 34]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [25, 36]⟩,
    ⟨.or, [27, 37]⟩,
    ⟨.or, [29, 38]⟩,
    ⟨.or, [31, 39]⟩,
    ⟨.or, [33, 40]⟩,
    ⟨.or, [35, 41]⟩], 42⟩

end PEqualNP.Outside.L_meta_19777

theorem PEqualNP.Outside.L_meta_19777 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (14466700110149527140 : ℕ).testBit (8 * u.val + v.val)) 27 := by
  exact ⟨PEqualNP.Outside.L_meta_19777.witness, by simp [PEqualNP.Outside.L_meta_19777.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
