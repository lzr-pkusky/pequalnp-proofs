import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19766

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 12]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.or, [16, 22]⟩,
    ⟨.and, [0, 23]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [15, 25]⟩,
    ⟨.or, [16, 26]⟩,
    ⟨.and, [1, 27]⟩,
    ⟨.or, [12, 21]⟩,
    ⟨.and, [2, 29]⟩,
    ⟨.or, [15, 21]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [22, 33]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [19, 20]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [18, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [24, 28]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19766

theorem PEqualNP.Outside.L_meta_19766 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (17030148307327572375 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19766.witness, by simp [PEqualNP.Outside.L_meta_19766.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
