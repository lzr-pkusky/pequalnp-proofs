import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20145

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [0, 1]⟩,
    ⟨.or, [6, 16]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [15, 18]⟩,
    ⟨.and, [17, 19]⟩,
    ⟨.or, [2, 3]⟩,
    ⟨.or, [5, 21]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [12, 23]⟩,
    ⟨.and, [22, 24]⟩,
    ⟨.or, [1, 3]⟩,
    ⟨.or, [7, 26]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [11, 28]⟩,
    ⟨.and, [27, 29]⟩,
    ⟨.or, [4, 5]⟩,
    ⟨.or, [6, 31]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [14, 33]⟩,
    ⟨.and, [32, 34]⟩,
    ⟨.or, [2, 7]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [15, 37]⟩,
    ⟨.and, [36, 38]⟩,
    ⟨.or, [0, 4]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [14, 41]⟩,
    ⟨.and, [40, 42]⟩,
    ⟨.or, [20, 25]⟩,
    ⟨.or, [30, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [39, 46]⟩,
    ⟨.or, [43, 47]⟩], 48⟩

end PEqualNP.Outside.L_meta_20145

theorem PEqualNP.Outside.L_meta_20145 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (12602045345396281050 : ℕ).testBit (8 * u.val + v.val)) 33 := by
  exact ⟨PEqualNP.Outside.L_meta_20145.witness, by simp [PEqualNP.Outside.L_meta_20145.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
