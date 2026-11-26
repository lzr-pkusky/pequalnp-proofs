import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19755

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 15]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.or, [19, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [17, 21]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [13, 26]⟩,
    ⟨.or, [16, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [9, 17]⟩,
    ⟨.or, [18, 30]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [4, 33]⟩,
    ⟨.or, [8, 17]⟩,
    ⟨.or, [19, 35]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [15, 38]⟩,
    ⟨.or, [19, 39]⟩,
    ⟨.and, [6, 40]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [7, 42]⟩,
    ⟨.or, [23, 25]⟩,
    ⟨.or, [29, 44]⟩,
    ⟨.or, [32, 45]⟩,
    ⟨.or, [34, 46]⟩,
    ⟨.or, [37, 47]⟩,
    ⟨.or, [41, 48]⟩,
    ⟨.or, [43, 49]⟩], 50⟩

end PEqualNP.Outside.L_meta_19755

theorem PEqualNP.Outside.L_meta_19755 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (14833295300162729415 : ℕ).testBit (8 * u.val + v.val)) 35 := by
  exact ⟨PEqualNP.Outside.L_meta_19755.witness, by simp [PEqualNP.Outside.L_meta_19755.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
