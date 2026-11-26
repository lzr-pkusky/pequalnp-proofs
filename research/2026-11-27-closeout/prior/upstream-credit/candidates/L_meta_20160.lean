import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20160

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [13, 15]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [14, 20]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [12, 20]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [2, 25]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [11, 27]⟩,
    ⟨.or, [13, 28]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [17, 31]⟩,
    ⟨.and, [4, 32]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [17, 34]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [26, 41]⟩,
    ⟨.or, [30, 42]⟩,
    ⟨.or, [33, 43]⟩,
    ⟨.or, [36, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_20160

theorem PEqualNP.Outside.L_meta_20160 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (16436895475263517410 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_20160.witness, by simp [PEqualNP.Outside.L_meta_20160.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
