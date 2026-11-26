import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19915

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [13, 14]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [10, 11]⟩,
    ⟨.or, [12, 16]⟩,
    ⟨.and, [0, 19]⟩,
    ⟨.or, [9, 16]⟩,
    ⟨.and, [1, 21]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [15, 23]⟩,
    ⟨.and, [2, 24]⟩,
    ⟨.or, [12, 18]⟩,
    ⟨.and, [3, 26]⟩,
    ⟨.or, [11, 17]⟩,
    ⟨.and, [4, 28]⟩,
    ⟨.or, [13, 17]⟩,
    ⟨.and, [5, 30]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [14, 32]⟩,
    ⟨.and, [6, 33]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.and, [7, 35]⟩,
    ⟨.or, [20, 22]⟩,
    ⟨.or, [25, 37]⟩,
    ⟨.or, [27, 38]⟩,
    ⟨.or, [29, 39]⟩,
    ⟨.or, [31, 40]⟩,
    ⟨.or, [34, 41]⟩,
    ⟨.or, [36, 42]⟩], 43⟩

end PEqualNP.Outside.L_meta_19915

theorem PEqualNP.Outside.L_meta_19915 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (1028405700185973360 : ℕ).testBit (8 * u.val + v.val)) 28 := by
  exact ⟨PEqualNP.Outside.L_meta_19915.witness, by simp [PEqualNP.Outside.L_meta_19915.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
