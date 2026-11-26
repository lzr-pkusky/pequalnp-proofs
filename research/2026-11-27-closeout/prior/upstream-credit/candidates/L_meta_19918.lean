import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19918

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 15]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [1, 6]⟩,
    ⟨.or, [7, 18]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [14, 20]⟩,
    ⟨.and, [19, 21]⟩,
    ⟨.or, [2, 3]⟩,
    ⟨.or, [5, 23]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [24, 25]⟩,
    ⟨.or, [0, 5]⟩,
    ⟨.or, [6, 27]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [14, 29]⟩,
    ⟨.and, [28, 30]⟩,
    ⟨.or, [3, 4]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [15, 33]⟩,
    ⟨.and, [32, 34]⟩,
    ⟨.or, [0, 4]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.and, [36, 37]⟩,
    ⟨.and, [1, 17]⟩,
    ⟨.and, [2, 16]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [22, 26]⟩,
    ⟨.or, [31, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [39, 46]⟩,
    ⟨.or, [40, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19918

theorem PEqualNP.Outside.L_meta_19918 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (14797551480516013530 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19918.witness, by simp [PEqualNP.Outside.L_meta_19918.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
