import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_19835

def witness : PEqualNP.CircuitLowerBounds.Circuit :=
  ⟨[⟨.or, [8, 12]⟩,
    ⟨.or, [11, 13]⟩,
    ⟨.or, [10, 15]⟩,
    ⟨.or, [14, 17]⟩,
    ⟨.or, [9, 18]⟩,
    ⟨.or, [9, 19]⟩,
    ⟨.and, [0, 21]⟩,
    ⟨.or, [15, 19]⟩,
    ⟨.and, [1, 23]⟩,
    ⟨.or, [8, 20]⟩,
    ⟨.and, [2, 25]⟩,
    ⟨.or, [14, 20]⟩,
    ⟨.and, [3, 27]⟩,
    ⟨.or, [10, 12]⟩,
    ⟨.or, [17, 29]⟩,
    ⟨.and, [4, 30]⟩,
    ⟨.or, [9, 11]⟩,
    ⟨.or, [16, 32]⟩,
    ⟨.and, [5, 33]⟩,
    ⟨.or, [13, 14]⟩,
    ⟨.or, [16, 35]⟩,
    ⟨.and, [6, 36]⟩,
    ⟨.or, [16, 18]⟩,
    ⟨.and, [7, 38]⟩,
    ⟨.or, [22, 24]⟩,
    ⟨.or, [26, 40]⟩,
    ⟨.or, [28, 41]⟩,
    ⟨.or, [31, 42]⟩,
    ⟨.or, [34, 43]⟩,
    ⟨.or, [37, 44]⟩,
    ⟨.or, [39, 45]⟩], 46⟩

end PEqualNP.Outside.L_meta_19835

theorem PEqualNP.Outside.L_meta_19835 :
    PEqualNP.Represents.RepSizeAtMost (fun u v : Fin 8 => (10768418131862349930 : ℕ).testBit (8 * u.val + v.val)) 32 := by
  exact ⟨PEqualNP.Outside.L_meta_19835.witness, by simp [PEqualNP.Outside.L_meta_19835.witness, PEqualNP.MetaComplexity.Monotone2],
    by decide, by decide +kernel⟩
