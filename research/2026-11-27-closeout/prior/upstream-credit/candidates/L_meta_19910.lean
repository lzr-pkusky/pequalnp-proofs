import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19910

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 15]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [13, 21]⟩,
    ⟨.or, [16, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [19, 29]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.or, [18, 32]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [14, 35]⟩,
    ⟨.or, [18, 36]⟩,
    ⟨.and, [5, 37]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [20, 39]⟩,
    ⟨.and, [6, 40]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [7, 42]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [28, 44]⟩,
    ⟨.or, [31, 45]⟩,
    ⟨.or, [34, 46]⟩,
    ⟨.or, [38, 47]⟩,
    ⟨.or, [41, 48]⟩,
    ⟨.or, [43, 49]⟩], 50⟩

end PEqualNP.Outside.L_meta_19910

theorem PEqualNP.Outside.L_meta_19910 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (15737650488314554035 : ℕ).testBit (8 * u.val + v.val)) 35 := by
  exact ⟨PEqualNP.Outside.L_meta_19910.witness, by simp [PEqualNP.Outside.L_meta_19910.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
