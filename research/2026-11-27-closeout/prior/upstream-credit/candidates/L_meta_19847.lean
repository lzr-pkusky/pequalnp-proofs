import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19847

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [1, 5]⟩,
    ⟨.or, [3, 6]⟩,
    ⟨.or, [2, 7]⟩,
    ⟨.or, [0, 17]⟩,
    ⟨.or, [0, 18]⟩,
    ⟨.or, [4, 16]⟩,
    ⟨.or, [2, 21]⟩,
    ⟨.and, [8, 22]⟩,
    ⟨.or, [5, 19]⟩,
    ⟨.and, [9, 24]⟩,
    ⟨.or, [4, 19]⟩,
    ⟨.and, [10, 26]⟩,
    ⟨.or, [7, 21]⟩,
    ⟨.and, [11, 28]⟩,
    ⟨.or, [1, 20]⟩,
    ⟨.and, [12, 30]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [13, 32]⟩,
    ⟨.or, [3, 20]⟩,
    ⟨.and, [14, 34]⟩,
    ⟨.or, [4, 6]⟩,
    ⟨.or, [18, 36]⟩,
    ⟨.and, [15, 37]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [27, 39]⟩,
    ⟨.or, [29, 40]⟩,
    ⟨.or, [31, 41]⟩,
    ⟨.or, [33, 42]⟩,
    ⟨.or, [35, 43]⟩,
    ⟨.or, [38, 44]⟩], 45⟩

end PEqualNP.Outside.L_meta_19847

theorem PEqualNP.Outside.L_meta_19847 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (15611213044641773910 : ℕ).testBit (8 * u.val + v.val)) 30 := by
  exact ⟨PEqualNP.Outside.L_meta_19847.witness, by simp [PEqualNP.Outside.L_meta_19847.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
