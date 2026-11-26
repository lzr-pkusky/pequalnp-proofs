import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19856

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 12]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [15, 22]⟩,
    ⟨.or, [19, 23]⟩,
    ⟨.and, [0, 24]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [19, 26]⟩,
    ⟨.and, [1, 27]⟩,
    ⟨.or, [9, 20]⟩,
    ⟨.and, [2, 29]⟩,
    ⟨.or, [8, 18]⟩,
    ⟨.or, [19, 31]⟩,
    ⟨.and, [3, 32]⟩,
    ⟨.or, [10, 21]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [11, 21]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [11, 20]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [18, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [25, 28]⟩,
    ⟨.or, [30, 43]⟩,
    ⟨.or, [33, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19856

theorem PEqualNP.Outside.L_meta_19856 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8547244839380926170 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19856.witness, by simp [PEqualNP.Outside.L_meta_19856.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
