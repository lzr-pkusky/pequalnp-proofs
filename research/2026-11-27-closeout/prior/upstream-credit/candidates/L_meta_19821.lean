import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19821

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [13, 14]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [15, 19]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [11, 16]⟩,
    ⟨.or, [20, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [18, 29]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [14, 32]⟩,
    ⟨.or, [20, 33]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [13, 21]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [12, 21]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [19, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [28, 43]⟩,
    ⟨.or, [31, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19821

theorem PEqualNP.Outside.L_meta_19821 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (2278450633163008380 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19821.witness, by simp [PEqualNP.Outside.L_meta_19821.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
