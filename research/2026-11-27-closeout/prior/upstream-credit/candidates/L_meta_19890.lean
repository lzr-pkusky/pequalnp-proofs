import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19890

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [9, 12]⟩,
    ⟨.or, [8, 10]⟩,
    ⟨.or, [13, 16]⟩,
    ⟨.or, [11, 15]⟩,
    ⟨.or, [14, 19]⟩,
    ⟨.or, [11, 18]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [12, 15]⟩,
    ⟨.or, [17, 23]⟩,
    ⟨.and, [1, 24]⟩,
    ⟨.or, [8, 20]⟩,
    ⟨.and, [2, 26]⟩,
    ⟨.or, [10, 18]⟩,
    ⟨.and, [3, 28]⟩,
    ⟨.or, [9, 14]⟩,
    ⟨.or, [17, 30]⟩,
    ⟨.and, [4, 31]⟩,
    ⟨.or, [17, 19]⟩,
    ⟨.and, [5, 33]⟩,
    ⟨.or, [13, 20]⟩,
    ⟨.and, [6, 35]⟩,
    ⟨.or, [14, 18]⟩,
    ⟨.and, [7, 37]⟩,
    ⟨.or, [22, 25]⟩,
    ⟨.or, [27, 39]⟩,
    ⟨.or, [29, 40]⟩,
    ⟨.or, [32, 41]⟩,
    ⟨.or, [34, 42]⟩,
    ⟨.or, [36, 43]⟩,
    ⟨.or, [38, 44]⟩], 45⟩

end PEqualNP.Outside.L_meta_19890

theorem PEqualNP.Outside.L_meta_19890 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (8280023251922031930 : ℕ).testBit (8 * u.val + v.val)) 30 := by
  exact ⟨PEqualNP.Outside.L_meta_19890.witness, by simp [PEqualNP.Outside.L_meta_19890.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
