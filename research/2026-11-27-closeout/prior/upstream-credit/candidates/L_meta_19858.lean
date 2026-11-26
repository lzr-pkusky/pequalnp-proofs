import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19858

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 10]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [0, 18]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [1, 20]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.and, [2, 22]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [14, 24]⟩,
    ⟨.and, [3, 25]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [12, 27]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [14, 30]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [15, 33]⟩,
    ⟨.and, [6, 34]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.and, [7, 36]⟩,
    ⟨.or, [19, 21]⟩,
    ⟨.or, [23, 38]⟩,
    ⟨.or, [26, 39]⟩,
    ⟨.or, [29, 40]⟩,
    ⟨.or, [32, 41]⟩,
    ⟨.or, [35, 42]⟩,
    ⟨.or, [37, 43]⟩], 44⟩

end PEqualNP.Outside.L_meta_19858

theorem PEqualNP.Outside.L_meta_19858 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (9917578511873611425 : ℕ).testBit (8 * u.val + v.val)) 29 := by
  exact ⟨PEqualNP.Outside.L_meta_19858.witness, by simp [PEqualNP.Outside.L_meta_19858.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
