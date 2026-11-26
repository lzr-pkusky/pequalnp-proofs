import Mathlib
import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_18649

open PEqualNP.CircuitLowerBounds PEqualNP.MetaComplexity

def step (w : List Bool) (g : Gate) : List Bool :=
  w ++ [g.op.eval (g.inputs.map fun i => w.getD i false)]

def wires {n : ℕ} (gs : List Gate) (x : Fin n → Bool) : List Bool :=
  gs.foldl step (List.ofFn x)

theorem run_length (gs : List Gate) (w : List Bool) : (gs.foldl step w).length = w.length + gs.length := by
  induction gs generalizing w with
  | nil => simp
  | cons g gs ih => simp [step, ih, Nat.add_comm, Nat.add_left_comm]

theorem wires_length {n : ℕ} (gs : List Gate) (x : Fin n → Bool) : (wires gs x).length = n + gs.length := by
  simp [wires, run_length]

theorem run_prefix (gs : List Gate) (w : List Bool) : ∃ tail, gs.foldl step w = w ++ tail := by
  induction gs generalizing w with
  | nil => exact ⟨[], by simp⟩
  | cons g gs ih =>
    obtain ⟨tail, eq⟩ := ih (step w g)
    exact ⟨[g.op.eval (g.inputs.map fun i => w.getD i false)] ++ tail,
      by simpa [step, List.append_assoc] using eq⟩

theorem prefix_read {n : ℕ} (gs tail : List Gate) (x : Fin n → Bool) (i : ℕ)
    (hi : i < n + gs.length) : (wires (gs ++ tail) x).getD i false = (wires gs x).getD i false := by
  obtain ⟨last, eq⟩ := run_prefix tail (wires gs x)
  have run : wires (gs ++ tail) x = tail.foldl step (wires gs x) := by
    simp [wires, List.foldl_append]
  rw [run]
  rw [eq, List.getD_append _ _ _ _ (by simpa [wires_length] using hi)]

theorem take_read {n : ℕ} (gs : List Gate) (j : ℕ) (x : Fin n → Bool) (i : ℕ)
    (hi : i < n + (gs.take j).length) : (wires gs x).getD i false = (wires (gs.take j) x).getD i false := by
  have e := prefix_read (gs.take j) (gs.drop j) x i hi
  simpa only [List.take_append_drop] using e

theorem last_read {n : ℕ} (gs : List Gate) (g : Gate) (x : Fin n → Bool) :
    (wires (gs ++ [g]) x).getD (n + gs.length) false =
      g.op.eval (g.inputs.map fun i => (wires gs x).getD i false) := by
  have run : wires (gs ++ [g]) x = step (wires gs x) g := by
    simp [wires, List.foldl_append]
  rw [run]
  unfold step
  rw [List.getD_append_right _ _ _ _ (by simp [wires_length])]
  simp [wires_length]

abbrev Signal := Bool ⊕ ℕ

def valid (n : ℕ) (gs : List Gate) : Signal → Prop
  | .inl _ => True
  | .inr w => w < n + gs.length

def read {n : ℕ} (gs : List Gate) (x : Fin n → Bool) : Signal → Bool
  | .inl value => value
  | .inr w => (wires gs x).getD w false

theorem valid_append {n : ℕ} {gs : List Gate} {s : Signal} (h : valid n gs s) (ext : List Gate) :
    valid n (gs ++ ext) s := by
  cases s with
  | inl _ => trivial
  | inr i => unfold valid at *; simp only [List.length_append]; omega

theorem read_append {n : ℕ} {gs : List Gate} {s : Signal} (h : valid n gs s) (ext : List Gate)
    (x : Fin n → Bool) : read (gs ++ ext) x s = read gs x s := by
  cases s with
  | inl _ => rfl
  | inr i => exact prefix_read gs ext x i h

def allowed (g : Gate) : Prop :=
  (g.op = .and ∨ g.op = .or ∨ g.op = .not) ∧ g.inputs.length ≤ 2

def Realize {n : ℕ} (gs : List Gate) (free : Prop) (f : (Fin n → Bool) → Bool) : Prop :=
  ∃ (ext : List Gate) (s : Signal),
    (∀ g ∈ ext, allowed g) ∧ ext.length ≤ 1 ∧ (free → ext = []) ∧
    valid n (gs ++ ext) s ∧ ∀ x : Fin n → Bool, read (gs ++ ext) x s = f x

theorem no_gate {n : ℕ} (gs : List Gate) (free : Prop) (f : (Fin n → Bool) → Bool)
    (s : Signal) (h : valid n gs s) (eq : ∀ x : Fin n → Bool, read gs x s = f x) : Realize gs free f := by
  refine ⟨[], s, by simp, by simp, fun _ => rfl, ?_, ?_⟩ <;> simpa using ‹_›

theorem one_gate (n : ℕ) (gs : List Gate) (g : Gate) (hg : allowed g) (free : Prop) (nf : ¬ free) :
    Realize gs free (fun x : Fin n → Bool => g.op.eval (g.inputs.map fun i => (wires gs x).getD i false)) := by
  refine ⟨[g], .inr (n + gs.length), ?_, by simp, fun h => (nf h).elim, ?_, last_read gs g⟩
  · simpa using hg
  · unfold valid; simp

def hasConstant (ss : List Signal) : Prop := ∃ b : Bool, Sum.inl b ∈ ss

theorem and_pair (n : ℕ) (gs : List Gate) (a b : Signal) (va : valid n gs a) (vb : valid n gs b) :
    Realize gs (hasConstant [a,b]) (fun x : Fin n → Bool => (read gs x a && read gs x b)) := by
  cases a with
  | inl ca =>
    cases ca
    · exact no_gate gs _ _ (.inl false) trivial (by intro x; simp [read])
    · exact no_gate gs _ _ b vb (by intro x; simp [read])
  | inr i =>
    cases b with
    | inl cb =>
      cases cb
      · exact no_gate gs _ _ (.inl false) trivial (by intro x; simp [read])
      · exact no_gate gs _ _ (.inr i) va (by intro x; simp [read])
    | inr j =>
      simpa [read, GateOp.eval] using one_gate n gs ⟨.and, [i,j]⟩ (by simp [allowed])
        (hasConstant [.inr i, .inr j]) (by simp [hasConstant])

theorem or_pair (n : ℕ) (gs : List Gate) (a b : Signal) (va : valid n gs a) (vb : valid n gs b) :
    Realize gs (hasConstant [a,b]) (fun x : Fin n → Bool => (read gs x a || read gs x b)) := by
  cases a with
  | inl ca =>
    cases ca
    · exact no_gate gs _ _ b vb (by intro x; simp [read])
    · exact no_gate gs _ _ (.inl true) trivial (by intro x; simp [read])
  | inr i =>
    cases b with
    | inl cb =>
      cases cb
      · exact no_gate gs _ _ (.inr i) va (by intro x; simp [read])
      · exact no_gate gs _ _ (.inl true) trivial (by intro x; simp [read])
    | inr j =>
      simpa [read, GateOp.eval] using one_gate n gs ⟨.or, [i,j]⟩ (by simp [allowed])
        (hasConstant [.inr i, .inr j]) (by simp [hasConstant])

theorem realize (n : ℕ) (gs : List Gate) (op : GateOp) (args : List Signal)
    (hop : op = .and ∨ op = .or ∨ op = .not) (arity : args.length ≤ 2)
    (notarity : op = .not → args.length = 1) (bounds : ∀ s ∈ args, valid n gs s) :
    Realize gs (hasConstant args) (fun x : Fin n → Bool => op.eval (args.map (read gs x))) := by
  rcases hop with rfl | rfl | rfl
  · rcases args with _ | ⟨a, _ | ⟨b, tail⟩⟩
    · exact no_gate gs _ _ (.inl true) trivial (by intro x; rfl)
    · exact no_gate gs _ _ a (bounds a (by simp)) (by intro x; simp [GateOp.eval])
    · have h : tail = [] := by simpa using arity
      subst tail
      simpa [GateOp.eval] using and_pair n gs a b (bounds a (by simp)) (bounds b (by simp))
  · rcases args with _ | ⟨a, _ | ⟨b, tail⟩⟩
    · exact no_gate gs _ _ (.inl false) trivial (by intro x; rfl)
    · exact no_gate gs _ _ a (bounds a (by simp)) (by intro x; simp [GateOp.eval])
    · have h : tail = [] := by simpa using arity
      subst tail
      simpa [GateOp.eval] using or_pair n gs a b (bounds a (by simp)) (bounds b (by simp))
  · obtain ⟨a, rfl⟩ := List.length_eq_one_iff.mp (notarity rfl)
    cases a with
    | inl c => exact no_gate gs _ _ (.inl (!c)) trivial (by intro x; rfl)
    | inr i =>
      exact one_gate n gs ⟨.not, [i]⟩ (by simp [allowed])
        (hasConstant [.inr i]) (by simp [hasConstant])

theorem input_lookup {n : ℕ} (x : Fin n → Bool) (i : Fin n) :
    (List.ofFn x).getD i.val false = x i := by
  rw [List.getD_eq_getElem _ _ (by simp)]
  simp

theorem count_step (excluded : Finset ℕ) (j : ℕ) :
    ((Finset.range (j+1)).filter fun i => i ∉ excluded).card =
      ((Finset.range j).filter fun i => i ∉ excluded).card + (if j ∈ excluded then 0 else 1) := by
  have step_range : Finset.range (j+1) = insert j (Finset.range j) := by
    ext i
    simp
    omega
  rw [step_range, Finset.filter_insert]
  by_cases h : j ∈ excluded
  · simp [h]
  · have mem : j ∉ (Finset.range j).filter (fun i => i ∉ excluded) := by simp
    simp [h, Finset.card_insert_of_notMem mem]

theorem solve (n : ℕ) (C : Circuit) (v : Fin n) (b : Bool)
    (K P : Finset (Fin C.gates.length)) (legal : FanInTwo C)
    (notarity : ∀ g ∈ C.gates, g.op = .not → g.inputs.length = 1)
    (some_false : ∃ y : Fin n → Bool, C.eval (List.ofFn (Function.update y v b)) = false)
    (disjoint : Disjoint K P)
    (compressible : ∀ j ∈ K,
      (∃ c : Bool, ∀ x : Fin n → Bool, (wires C.gates (Function.update x v b)).getD (n+j.val) false = c) ∨
      ∃ w ∈ (C.gates.get j).inputs, ∃ c : Bool, ∀ x : Fin n → Bool,
        (wires C.gates (Function.update x v b)).getD w false = c)
    (dead : ∀ p ∈ P, n+p.val ≠ C.output ∧ ∀ k : Fin C.gates.length,
      n+p.val ∈ (C.gates.get k).inputs → k ∈ P ∨
        (k ∈ K ∧ ∃ c : Bool, ∀ x : Fin n → Bool,
          (wires C.gates (Function.update x v b)).getD (n+k.val) false = c)) :
    ∃ D : Circuit, FanInTwo D ∧ D.size + K.card + P.card ≤ C.size ∧ ∀ x : Fin n → Bool,
      D.eval (List.ofFn x) = C.eval (List.ofFn (Function.update x v b)) := by
  classical
  let omitted := (K ∪ P).image Fin.val
  let unavailable := P.image fun p => n+p.val
  let value (j : ℕ) (x : Fin n → Bool) (i : ℕ) :=
    (wires (C.gates.take j) (Function.update x v b)).getD i false
  let keepCount (j : ℕ) := ((Finset.range j).filter fun i => i ∉ omitted).card
  have stages : ∀ j ≤ C.gates.length, ∃ ds : List Gate,
      (∀ g ∈ ds, allowed g) ∧ ds.length ≤ keepCount j ∧
      ∀ i < n+j, i ∉ unavailable → ∃ s : Signal, valid n ds s ∧
        ∀ x : Fin n → Bool, read ds x s = value j x i := by
    intro j
    induction j with
    | zero =>
      intro _
      refine ⟨[], by simp, by simp, ?_⟩
      intro i hi _
      have hfin : i < n := by omega
      let u : Fin n := ⟨i,hfin⟩
      by_cases h : u = v
      · refine ⟨.inl b, trivial, ?_⟩
        intro x
        change b = (List.ofFn (Function.update x v b)).getD u.val false
        rw [input_lookup, h, Function.update_self]
      · refine ⟨.inr i, by simpa [valid], ?_⟩
        intro x
        change (List.ofFn x).getD u.val false = (List.ofFn (Function.update x v b)).getD u.val false
        rw [input_lookup, input_lookup, Function.update_of_ne h]
    | succ j ih =>
      intro hj
      have hjlt : j < C.gates.length := by omega
      let k : Fin C.gates.length := ⟨j,hjlt⟩
      let g := C.gates.get k
      have hg : g ∈ C.gates := List.get_mem _ _
      obtain ⟨ds, ds_ok, ds_count, represent⟩ := ih (by omega)
      have plen : (C.gates.take j).length = j := by simp [Nat.min_eq_left (Nat.le_of_lt hjlt)]
      have nlen : (C.gates.take (j+1)).length = j+1 := by simp [Nat.min_eq_left hj]
      have step_take : C.gates.take (j+1) = C.gates.take j ++ [g] :=
        List.take_succ_eq_append_getElem hjlt
      have old_read (i : ℕ) (hi : i < n+j) (x : Fin n → Bool) :
          value (j+1) x i = value j x i := by
        unfold value
        rw [step_take]
        exact prefix_read _ _ _ _ (by simpa [plen] using hi)
      have new_read (x : Fin n → Bool) : value (j+1) x (n+j) =
          g.op.eval (g.inputs.map fun w => value j x w) := by
        unfold value
        rw [step_take]
        simpa only [plen] using last_read (C.gates.take j) g (Function.update x v b)
      have new_final (x : Fin n → Bool) :
          (wires C.gates (Function.update x v b)).getD (n+j) false = value (j+1) x (n+j) :=
        take_read _ _ _ _ (by rw [nlen]; omega)
      have count_eq : keepCount (j+1) = keepCount j + (if j ∈ omitted then 0 else 1) := count_step _ _
      have saved (h : k ∈ K ∨ k ∈ P) : j ∈ omitted :=
        Finset.mem_image.mpr ⟨k, Finset.mem_union.mpr h, rfl⟩
      have unavailable_if (hp : k ∈ P) : n+j ∈ unavailable :=
        Finset.mem_image.mpr ⟨k, hp, rfl⟩
      have extend (ext : List Gate) (ext_ok : ∀ e ∈ ext, allowed e)
          (ext_cost : ext.length ≤ if j ∈ omitted then 0 else 1)
          (next : n+j ∉ unavailable → ∃ s : Signal, valid n (ds++ext) s ∧
            ∀ x : Fin n → Bool, read (ds++ext) x s = value (j+1) x (n+j)) :
          ∃ es : List Gate, (∀ g ∈ es, allowed g) ∧ es.length ≤ keepCount (j+1) ∧
            ∀ i < n+(j+1), i ∉ unavailable → ∃ s : Signal, valid n es s ∧
              ∀ x : Fin n → Bool, read es x s = value (j+1) x i := by
        refine ⟨ds++ext, ?_, ?_, ?_⟩
        · intro gate mem
          rcases List.mem_append.mp mem with h | h
          · exact ds_ok gate h
          · exact ext_ok gate h
        · rw [List.length_append, count_eq]
          omega
        · intro i hi live
          by_cases lt : i < n+j
          · obtain ⟨s, hs, eq⟩ := represent i lt live
            exact ⟨s, valid_append hs ext, fun x => (read_append hs ext x).trans ((eq x).trans (old_read i lt x).symm)⟩
          · have e : i = n+j := by omega
            subst i
            exact next live
      by_cases hp : k ∈ P
      · exact extend [] (by simp) (by simp) (fun live => (live (unavailable_if hp)).elim)
      by_cases constant : ∃ c : Bool, ∀ x : Fin n → Bool,
          (wires C.gates (Function.update x v b)).getD (n+j) false = c
      · obtain ⟨c, eq⟩ := constant
        apply extend [] (by simp) (by simp)
        intro _
        refine ⟨.inl c, trivial, ?_⟩
        intro x
        exact (eq x).symm.trans (new_final x)
      have safe_arg (w : ℕ) (mem : w ∈ g.inputs) : w ∉ unavailable := by
        intro h
        obtain ⟨p, pp, eq⟩ := Finset.mem_image.mp h
        have readsp : n+p.val ∈ (C.gates.get k).inputs := eq ▸ mem
        rcases (dead p pp).2 k readsp with busy | ⟨_, hc⟩
        · exact hp busy
        · exact constant hc
      have representatives (w : ℕ) (mem : w ∈ g.inputs) :
          ∃ s : Signal, valid n ds s ∧ (∀ x : Fin n → Bool, read ds x s = value j x w) ∧
            ((∃ c : Bool, ∀ x : Fin n → Bool, value j x w = c) → ∃ c : Bool, s = .inl c) := by
        by_cases hc : ∃ c : Bool, ∀ x : Fin n → Bool, value j x w = c
        · obtain ⟨c, eq⟩ := hc
          exact ⟨.inl c, trivial, fun x => (eq x).symm, fun _ => ⟨c,rfl⟩⟩
        · have lt : w < n+j := by
            by_contra! ge
            apply hc
            refine ⟨false, fun x => List.getD_eq_default _ _ ?_⟩
            simpa [wires_length, plen] using ge
          obtain ⟨s, hs, eq⟩ := represent w lt (safe_arg w mem)
          exact ⟨s, hs, eq, fun h => (hc h).elim⟩
      let arg (w : ℕ) : Signal :=
        if h : w ∈ g.inputs then (representatives w h).choose else .inl false
      have arg_spec (w : ℕ) (mem : w ∈ g.inputs) :
          valid n ds (arg w) ∧ (∀ x : Fin n → Bool, read ds x (arg w) = value j x w) ∧
            ((∃ c : Bool, ∀ x : Fin n → Bool, value j x w = c) → ∃ c : Bool, arg w = .inl c) := by
        simpa only [arg, dite_eq_left mem] using (representatives w mem).choose_spec
      let signals := g.inputs.map arg
      have arg_bounds (s : Signal) (mem : s ∈ signals) : valid n ds s := by
        obtain ⟨w, hw, rfl⟩ := List.mem_map.mp mem
        exact (arg_spec w hw).1
      have hgate : allowed g := by
        simpa [allowed] using legal g hg
      obtain ⟨ext, s, ext_ok, ext_len, no_gate_needed, hs, eq⟩ :=
        realize n ds g.op signals hgate.1 (by simpa [signals] using hgate.2)
          (by simpa [signals] using notarity g hg) arg_bounds
      have arg_eq (x : Fin n → Bool) : signals.map (read ds x) = g.inputs.map (value j x) := by
        simp only [signals, List.map_map]
        apply List.map_congr_left
        intro w hw
        exact (arg_spec w hw).2.1 x
      have noextra (ho : j ∈ omitted) : ext = [] := by
        apply no_gate_needed
        obtain ⟨t, ht, eq⟩ := Finset.mem_image.mp ho
        have same : t = k := Fin.ext eq
        subst t
        have hk : k ∈ K := (Finset.mem_union.mp ht).resolve_right hp
        rcases compressible k hk with hc | ⟨w, hw, c, hwc⟩
        · exact (constant hc).elim
        · have cw : ∃ c, ∀ x : Fin n → Bool, value j x w = c := by
            by_cases lt : w < n+j
            · refine ⟨c, fun x => ?_⟩
              exact (take_read _ _ _ _ (by simpa [plen] using lt)).symm.trans (hwc x)
            · refine ⟨false, fun x => List.getD_eq_default _ _ ?_⟩
              simpa [wires_length, plen] using Nat.le_of_not_gt lt
          obtain ⟨d, hd⟩ := (arg_spec w hw).2.2 cw
          exact ⟨d, List.mem_map.mpr ⟨w, hw, hd⟩⟩
      apply extend ext ext_ok
      · by_cases ho : j ∈ omitted
        · simp [ho, noextra ho]
        · simpa [ho] using ext_len
      · intro _
        refine ⟨s, hs, fun x => (eq x).trans ?_⟩
        exact (congrArg g.op.eval (arg_eq x)).trans (new_read x).symm
  obtain ⟨ds, ds_ok, ds_count, represent⟩ := stages C.gates.length le_rfl
  have sizeOm : omitted.card = K.card + P.card := by
    rw [Finset.card_image_of_injective _ Fin.val_injective, Finset.card_union_of_disjoint disjoint]
  have subset : omitted ⊆ Finset.range C.gates.length := by
    intro w hw
    obtain ⟨p, _, rfl⟩ := Finset.mem_image.mp hw
    exact Finset.mem_range.mpr p.isLt
  have counts : keepCount C.gates.length + omitted.card = C.gates.length := by
    have eq : ((Finset.range C.gates.length).filter fun i => i ∉ omitted) = Finset.range C.gates.length \ omitted := by
      ext i; simp
    simpa only [keepCount, eq, Finset.card_range] using Finset.card_sdiff_add_card_eq_card subset
  have ds_size : ds.length + K.card + P.card ≤ C.gates.length := by omega
  have fit (out : ℕ) : FanInTwo ⟨ds, out⟩ := by
    intro g mem
    simpa [allowed] using ds_ok g mem
  have target (x : Fin n → Bool) : value C.gates.length x C.output =
      C.eval (List.ofFn (Function.update x v b)) := by
    simp only [value, List.take_length] <;> rfl
  have false_D (h : ∀ x : Fin n → Bool, C.eval (List.ofFn (Function.update x v b)) = false) :
      ∃ D : Circuit, FanInTwo D ∧ D.size + K.card + P.card ≤ C.size ∧ ∀ x : Fin n → Bool,
        D.eval (List.ofFn x) = C.eval (List.ofFn (Function.update x v b)) := by
    refine ⟨⟨ds, n+ds.length⟩, fit _, ds_size, fun x => ?_⟩
    rw [h]
    change (wires ds x).getD (n+ds.length) false = false
    exact List.getD_eq_default _ _ (by rw [wires_length])
  by_cases hout : C.output < n+C.gates.length
  · have alive : C.output ∉ unavailable := by
      rintro mem
      obtain ⟨p, hp, eq⟩ := Finset.mem_image.mp mem
      exact (dead p hp).1 eq
    obtain ⟨s, hs, eq⟩ := represent C.output hout alive
    cases s with
    | inr out => exact ⟨⟨ds,out⟩, fit out, ds_size, fun x => (eq x).trans (target x)⟩
    | inl c =>
      obtain ⟨y, hy⟩ := some_false
      have e : c = false := (eq y).trans ((target y).trans hy)
      exact false_D (fun x => (target x).symm.trans ((eq x).symm.trans e))
  · apply false_D
    intro x
    exact List.getD_eq_default _ _ (by
      change (wires C.gates (Function.update x v b)).length ≤ C.output
      rw [wires_length]
      exact Nat.le_of_not_gt hout)

end PEqualNP.Outside.L_meta_18649
