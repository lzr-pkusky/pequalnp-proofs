import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19713

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 14]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.or, [8, 16]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [14, 21]⟩,
    ⟨.or, [15, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [18, 25]⟩,
    ⟨.and, [1, 26]⟩,
    ⟨.or, [10, 19]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [17, 32]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [10, 20]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [11, 19]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [11, 20]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [24, 27]⟩,
    ⟨.or, [29, 41]⟩,
    ⟨.or, [31, 42]⟩,
    ⟨.or, [34, 43]⟩,
    ⟨.or, [36, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19713

theorem PEqualNP.Outside.L_meta_19713 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (5420442459739364580 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19713.witness, by simp [PEqualNP.Outside.L_meta_19713.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
