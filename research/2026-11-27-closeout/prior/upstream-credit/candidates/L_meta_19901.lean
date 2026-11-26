import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19901

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 11]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [13, 21]⟩,
    ⟨.or, [14, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [17, 25]⟩,
    ⟨.and, [1, 26]⟩,
    ⟨.or, [8, 19]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [12, 19]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [18, 32]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [13, 20]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [12, 20]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [24, 27]⟩,
    ⟨.or, [29, 41]⟩,
    ⟨.or, [31, 42]⟩,
    ⟨.or, [34, 43]⟩,
    ⟨.or, [36, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19901

theorem PEqualNP.Outside.L_meta_19901 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (15123525816772544370 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19901.witness, by simp [PEqualNP.Outside.L_meta_19901.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
