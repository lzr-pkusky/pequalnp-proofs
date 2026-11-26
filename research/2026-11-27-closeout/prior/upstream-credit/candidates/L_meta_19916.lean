import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19916

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [10, 12]⟩,
    ⟨.or, [8, 13]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [14, 15]⟩,
    ⟨.or, [11, 14]⟩,
    ⟨.or, [16, 20]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [16, 19]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [9, 13]⟩,
    ⟨.or, [19, 25]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [17, 18]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [16, 17]⟩,
    ⟨.and, [4, 30]⟩,
    ⟨.or, [8, 15]⟩,
    ⟨.or, [18, 32]⟩,
    ⟨.and, [5, 33]⟩,
    ⟨.or, [12, 14]⟩,
    ⟨.or, [18, 35]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [17, 38]⟩,
    ⟨.and, [7, 39]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [27, 41]⟩,
    ⟨.or, [29, 42]⟩,
    ⟨.or, [31, 43]⟩,
    ⟨.or, [34, 44]⟩,
    ⟨.or, [37, 45]⟩,
    ⟨.or, [40, 46]⟩], 47⟩

end PEqualNP.Outside.L_meta_19916

theorem PEqualNP.Outside.L_meta_19916 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (11914988824647881820 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19916.witness, by simp [PEqualNP.Outside.L_meta_19916.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
