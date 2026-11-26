import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19824

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [12, 13]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [8, 18]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.or, [14, 19]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [14, 27]⟩,
    ⟨.or, [17, 28]⟩,
    ⟨.and, [2, 29]⟩,
    ⟨.or, [8, 22]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [15, 22]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [10, 21]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [12, 21]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [20, 39]⟩,
    ⟨.and, [7, 40]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [30, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [36, 45]⟩,
    ⟨.or, [38, 46]⟩,
    ⟨.or, [41, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19824

theorem PEqualNP.Outside.L_meta_19824 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8347929566805686415 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19824.witness, by simp [PEqualNP.Outside.L_meta_19824.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
