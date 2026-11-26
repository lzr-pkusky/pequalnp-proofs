import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19843

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 11]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.or, [15, 20]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [13, 24]⟩,
    ⟨.or, [16, 25]⟩,
    ⟨.and, [1, 26]⟩,
    ⟨.or, [19, 21]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [14, 30]⟩,
    ⟨.or, [19, 31]⟩,
    ⟨.and, [3, 32]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.or, [18, 34]⟩,
    ⟨.and, [4, 35]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.or, [19, 37]⟩,
    ⟨.and, [5, 38]⟩,
    ⟨.or, [17, 21]⟩,
    ⟨.and, [6, 40]⟩,
    ⟨.or, [10, 20]⟩,
    ⟨.and, [7, 42]⟩,
    ⟨.or, [23, 27]⟩,
    ⟨.or, [29, 44]⟩,
    ⟨.or, [33, 45]⟩,
    ⟨.or, [36, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [41, 48]⟩,
    ⟨.or, [43, 49]⟩], 50⟩

end PEqualNP.Outside.L_meta_19843

theorem PEqualNP.Outside.L_meta_19843 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8465338603409387505 : ℕ).testBit (8 * u.val + v.val)) 35 := by
  exact ⟨PEqualNP.Outside.L_meta_19843.witness, by simp [PEqualNP.Outside.L_meta_19843.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
