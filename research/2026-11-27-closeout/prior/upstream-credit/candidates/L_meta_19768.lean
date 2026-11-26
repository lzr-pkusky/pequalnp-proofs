import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19768

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 10]⟩,
    ⟨.or, [11, 12]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.or, [13, 21]⟩,
    ⟨.and, [0, 22]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.or, [19, 24]⟩,
    ⟨.and, [1, 25]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [17, 27]⟩,
    ⟨.and, [2, 28]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.or, [19, 30]⟩,
    ⟨.and, [3, 31]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.or, [19, 33]⟩,
    ⟨.and, [4, 34]⟩,
    ⟨.or, [8, 21]⟩,
    ⟨.and, [5, 36]⟩,
    ⟨.or, [18, 20]⟩,
    ⟨.and, [6, 38]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [20, 40]⟩,
    ⟨.and, [7, 41]⟩,
    ⟨.or, [23, 26]⟩,
    ⟨.or, [29, 43]⟩,
    ⟨.or, [32, 44]⟩,
    ⟨.or, [35, 45]⟩,
    ⟨.or, [37, 46]⟩,
    ⟨.or, [39, 47]⟩,
    ⟨.or, [42, 48]⟩], 49⟩

end PEqualNP.Outside.L_meta_19768

theorem PEqualNP.Outside.L_meta_19768 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (5748802764708593400 : ℕ).testBit (8 * u.val + v.val)) 34 := by
  exact ⟨PEqualNP.Outside.L_meta_19768.witness, by simp [PEqualNP.Outside.L_meta_19768.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
