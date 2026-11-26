import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19857

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 11]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [13, 15]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [16, 25]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [16, 30]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [18, 33]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [17, 38]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [27, 41]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19857

theorem PEqualNP.Outside.L_meta_19857 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (6650604754610151990 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19857.witness, by simp [PEqualNP.Outside.L_meta_19857.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
