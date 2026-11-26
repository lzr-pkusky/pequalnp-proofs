import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19836

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [14, 15]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [10, 17]⟩,
    ⟨.and, [0, 18]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [15, 20]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [13, 23]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [13, 26]⟩,
    ⟨.and, [3, 27]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [14, 29]⟩,
    ⟨.and, [4, 30]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [5, 32]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [6, 34]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.and, [7, 36]⟩,
    ⟨.or, [19, 22]⟩,
    ⟨.or, [25, 38]⟩,
    ⟨.or, [28, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [33, 41]⟩,
    ⟨.or, [35, 42]⟩,
    ⟨.or, [37, 43]⟩], 44⟩

end PEqualNP.Outside.L_meta_19836

theorem PEqualNP.Outside.L_meta_19836 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (16146478101879753735 : ℕ).testBit (8 * u.val + v.val)) 29 := by
  exact ⟨PEqualNP.Outside.L_meta_19836.witness, by simp [PEqualNP.Outside.L_meta_19836.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
