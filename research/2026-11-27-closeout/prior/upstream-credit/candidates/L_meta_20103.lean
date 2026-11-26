import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20103

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [0, 5]⟩,
    ⟨.or, [1, 4]⟩,
    ⟨.or, [6, 17]⟩,
    ⟨.or, [6, 7]⟩,
    ⟨.or, [2, 3]⟩,
    ⟨.or, [4, 7]⟩,
    ⟨.or, [20, 21]⟩,
    ⟨.and, [8, 22]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [9, 24]⟩,
    ⟨.or, [1, 3]⟩,
    ⟨.or, [5, 26]⟩,
    ⟨.or, [7, 27]⟩,
    ⟨.and, [10, 28]⟩,
    ⟨.or, [2, 18]⟩,
    ⟨.and, [11, 30]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [12, 32]⟩,
    ⟨.or, [3, 18]⟩,
    ⟨.and, [13, 34]⟩,
    ⟨.or, [0, 2]⟩,
    ⟨.or, [19, 36]⟩,
    ⟨.and, [14, 37]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [15, 39]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [29, 41]⟩,
    ⟨.or, [31, 42]⟩,
    ⟨.or, [33, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_20103

theorem PEqualNP.Outside.L_meta_20103 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (5146091177712921810 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_20103.witness, by simp [PEqualNP.Outside.L_meta_20103.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
