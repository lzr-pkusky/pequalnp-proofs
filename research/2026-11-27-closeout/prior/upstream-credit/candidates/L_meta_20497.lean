import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_20497

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [0, 3]⟩,
    ⟨.or, [1, 4]⟩,
    ⟨.and, [8, 9]⟩,
    ⟨.or, [8, 9]⟩,
    ⟨.or, [5, 10]⟩,
    ⟨.or, [2, 12]⟩,
    ⟨.and, [11, 13]⟩], 14⟩

end PEqualNP.Outside.L_meta_20497

theorem PEqualNP.Outside.L_meta_20497 :
    PEqualNP.Represents.RepSizeAtMost (fun (u : Fin 3) (v : Fin 5) => (3238 : ℕ).testBit (5 * u.val + v.val)) 7 := by
  exact ⟨PEqualNP.Outside.L_meta_20497.witness, by simp [PEqualNP.Outside.L_meta_20497.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
