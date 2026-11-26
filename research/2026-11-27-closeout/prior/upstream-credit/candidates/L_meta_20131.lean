import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20131

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [4, 7]⟩,
    ⟨.or, [2, 6]⟩,
    ⟨.or, [0, 5]⟩,
    ⟨.or, [1, 3]⟩,
    ⟨.or, [3, 17]⟩,
    ⟨.and, [8, 20]⟩,
    ⟨.or, [2, 19]⟩,
    ⟨.and, [9, 22]⟩,
    ⟨.or, [1, 16]⟩,
    ⟨.and, [10, 24]⟩,
    ⟨.or, [7, 18]⟩,
    ⟨.and, [11, 26]⟩,
    ⟨.or, [5, 16]⟩,
    ⟨.and, [12, 28]⟩,
    ⟨.or, [0, 17]⟩,
    ⟨.and, [13, 30]⟩,
    ⟨.or, [6, 19]⟩,
    ⟨.and, [14, 32]⟩,
    ⟨.or, [4, 18]⟩,
    ⟨.and, [15, 34]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [25, 36]⟩,
    ⟨.or, [27, 37]⟩,
    ⟨.or, [29, 38]⟩,
    ⟨.or, [31, 39]⟩,
    ⟨.or, [33, 40]⟩,
    ⟨.or, [35, 41]⟩], 42⟩

end PEqualNP.Outside.L_meta_20131

theorem PEqualNP.Outside.L_meta_20131 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (2045083468351882920 : ℕ).testBit (8 * u.val + v.val)) 27 := by
  exact ⟨PEqualNP.Outside.L_meta_20131.witness, by simp [PEqualNP.Outside.L_meta_20131.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
