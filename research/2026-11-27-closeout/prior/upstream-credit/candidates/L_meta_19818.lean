import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19818

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [12, 14]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [2, 25]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [16, 27]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [9, 15]⟩,
    ⟨.or, [17, 30]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [19, 33]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [18, 38]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [26, 41]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19818

theorem PEqualNP.Outside.L_meta_19818 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (11949254508291828630 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19818.witness, by simp [PEqualNP.Outside.L_meta_19818.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
