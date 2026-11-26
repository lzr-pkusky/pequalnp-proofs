import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19764

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 11]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [9, 12]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [17, 20]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [18, 19]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [8, 12]⟩,
    ⟨.or, [17, 25]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [9, 10]⟩,
    ⟨.or, [16, 30]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [12, 13]⟩,
    ⟨.or, [16, 33]⟩,
    ⟨.and, [5, 34]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [19, 36]⟩,
    ⟨.and, [6, 37]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [27, 41]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [32, 43]⟩,
    ⟨.or, [35, 44]⟩,
    ⟨.or, [38, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19764

theorem PEqualNP.Outside.L_meta_19764 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (16472541325419705030 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19764.witness, by simp [PEqualNP.Outside.L_meta_19764.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
