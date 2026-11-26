import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19729

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [11, 13]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [14, 19]⟩,
    ⟨.and, [0, 20]⟩,
    ⟨.or, [14, 16]⟩,
    ⟨.and, [1, 22]⟩,
    ⟨.or, [15, 18]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [15, 16]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [8, 11]⟩,
    ⟨.or, [14, 28]⟩,
    ⟨.and, [4, 29]⟩,
    ⟨.or, [10, 18]⟩,
    ⟨.and, [5, 31]⟩,
    ⟨.or, [12, 17]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [15, 17]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [21, 23]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [30, 39]⟩,
    ⟨.or, [32, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19729

theorem PEqualNP.Outside.L_meta_19729 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (9589595487171930210 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19729.witness, by simp [PEqualNP.Outside.L_meta_19729.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
