import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20126

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 15]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [8, 14]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [18, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [13, 26]⟩,
    ⟨.or, [15, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [9, 20]⟩,
    ⟨.and, [3, 30]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [16, 34]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [10, 20]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [29, 41]⟩,
    ⟨.or, [31, 42]⟩,
    ⟨.or, [33, 43]⟩,
    ⟨.or, [36, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_20126

theorem PEqualNP.Outside.L_meta_20126 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (14516395958052687435 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_20126.witness, by simp [PEqualNP.Outside.L_meta_20126.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
