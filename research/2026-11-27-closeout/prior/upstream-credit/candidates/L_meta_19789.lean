import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19789

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [12, 15]⟩,
    ⟨.or, [10, 14]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [16, 24]⟩,
    ⟨.and, [2, 25]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [19, 27]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [10, 13]⟩,
    ⟨.or, [18, 30]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [18, 33]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [16, 38]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [26, 41]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19789

theorem PEqualNP.Outside.L_meta_19789 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (12886077434404292460 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19789.witness, by simp [PEqualNP.Outside.L_meta_19789.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
