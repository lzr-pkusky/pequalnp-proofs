import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19934

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 9]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [10, 16]⟩,
    ⟨.and, [0, 18]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [13, 20]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [15, 23]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [14, 28]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [13, 35]⟩,
    ⟨.and, [7, 36]⟩,
    ⟨.or, [19, 22]⟩,
    ⟨.or, [25, 38]⟩,
    ⟨.or, [27, 39]⟩,
    ⟨.or, [30, 40]⟩,
    ⟨.or, [32, 41]⟩,
    ⟨.or, [34, 42]⟩,
    ⟨.or, [37, 43]⟩], 44⟩

end PEqualNP.Outside.L_meta_19934

theorem PEqualNP.Outside.L_meta_19934 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (3051417864780919815 : ℕ).testBit (8 * u.val + v.val)) 29 := by
  exact ⟨PEqualNP.Outside.L_meta_19934.witness, by simp [PEqualNP.Outside.L_meta_19934.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
