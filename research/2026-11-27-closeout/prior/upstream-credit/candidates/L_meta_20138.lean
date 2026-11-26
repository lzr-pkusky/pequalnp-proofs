import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20138

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [2, 5]⟩,
    ⟨.or, [3, 7]⟩,
    ⟨.or, [1, 6]⟩,
    ⟨.or, [0, 4]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.or, [4, 16]⟩,
    ⟨.or, [0, 3]⟩,
    ⟨.or, [6, 22]⟩,
    ⟨.or, [16, 23]⟩,
    ⟨.and, [8, 24]⟩,
    ⟨.or, [0, 20]⟩,
    ⟨.and, [9, 26]⟩,
    ⟨.or, [18, 21]⟩,
    ⟨.and, [10, 28]⟩,
    ⟨.or, [17, 21]⟩,
    ⟨.and, [11, 30]⟩,
    ⟨.or, [7, 16]⟩,
    ⟨.or, [19, 32]⟩,
    ⟨.and, [12, 33]⟩,
    ⟨.or, [2, 18]⟩,
    ⟨.or, [19, 35]⟩,
    ⟨.and, [13, 36]⟩,
    ⟨.or, [5, 20]⟩,
    ⟨.and, [14, 38]⟩,
    ⟨.or, [1, 17]⟩,
    ⟨.or, [19, 40]⟩,
    ⟨.and, [15, 41]⟩,
    ⟨.or, [25, 27]⟩,
    ⟨.or, [29, 43]⟩,
    ⟨.or, [31, 44]⟩,
    ⟨.or, [34, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_20138

theorem PEqualNP.Outside.L_meta_20138 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (15737650488314554035 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_20138.witness, by simp [PEqualNP.Outside.L_meta_20138.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
