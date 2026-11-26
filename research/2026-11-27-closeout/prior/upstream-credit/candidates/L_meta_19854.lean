import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19854

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 15]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.or, [18, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [20, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [2, 27]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [3, 29]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.or, [18, 33]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [10, 36]⟩,
    ⟨.or, [12, 37]⟩,
    ⟨.or, [13, 38]⟩,
    ⟨.and, [6, 39]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [19, 41]⟩,
    ⟨.and, [7, 42]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [28, 44]⟩,
    ⟨.or, [30, 45]⟩,
    ⟨.or, [32, 46]⟩,
    ⟨.or, [35, 47]⟩,
    ⟨.or, [40, 48]⟩,
    ⟨.or, [43, 49]⟩], 50⟩

end PEqualNP.Outside.L_meta_19854

theorem PEqualNP.Outside.L_meta_19854 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (13418315418863193045 : ℕ).testBit (8 * u.val + v.val)) 35 := by
  exact ⟨PEqualNP.Outside.L_meta_19854.witness, by simp [PEqualNP.Outside.L_meta_19854.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
