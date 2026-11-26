import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20108

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [12, 15]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [18, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [21, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [17, 30]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [20, 21]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [5, 35]⟩,
    ⟨.or, [11, 19]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [10, 19]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [24, 26]⟩,
    ⟨.or, [29, 41]⟩,
    ⟨.or, [32, 42]⟩,
    ⟨.or, [34, 43]⟩,
    ⟨.or, [36, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_20108

theorem PEqualNP.Outside.L_meta_20108 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10852103239182430665 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_20108.witness, by simp [PEqualNP.Outside.L_meta_20108.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
