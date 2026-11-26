import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19959

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [0, 5]⟩,
    ⟨.or, [7, 16]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [15, 18]⟩,
    ⟨.and, [17, 19]⟩,
    ⟨.or, [1, 2]⟩,
    ⟨.or, [5, 21]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [14, 23]⟩,
    ⟨.and, [22, 24]⟩,
    ⟨.or, [3, 4]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [12, 27]⟩,
    ⟨.or, [13, 28]⟩,
    ⟨.and, [26, 29]⟩,
    ⟨.or, [2, 6]⟩,
    ⟨.or, [7, 31]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.and, [32, 33]⟩,
    ⟨.or, [0, 1]⟩,
    ⟨.or, [6, 35]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.and, [36, 37]⟩,
    ⟨.or, [3, 6]⟩,
    ⟨.and, [10, 39]⟩,
    ⟨.or, [4, 6]⟩,
    ⟨.and, [15, 41]⟩,
    ⟨.or, [20, 25]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩,
    ⟨.or, [42, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_19959

theorem PEqualNP.Outside.L_meta_19959 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (16914613873039728090 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_19959.witness, by simp [PEqualNP.Outside.L_meta_19959.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
