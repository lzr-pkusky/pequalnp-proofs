import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19845

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [12, 14]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [15, 22]⟩,
    ⟨.or, [19, 23]⟩,
    ⟨.and, [0, 24]⟩,
    ⟨.or, [12, 20]⟩,
    ⟨.and, [1, 26]⟩,
    ⟨.or, [18, 21]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [11, 18]⟩,
    ⟨.or, [19, 30]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [10, 20]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.or, [17, 35]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [17, 21]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [19, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [25, 27]⟩,
    ⟨.or, [29, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [34, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19845

theorem PEqualNP.Outside.L_meta_19845 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8572844398234278885 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19845.witness, by simp [PEqualNP.Outside.L_meta_19845.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
