// m2/prn/common


var fout : *FILE       // output file

var clab : Nat32       // current label (lab_get, lab_reset)

let lab_reset = func (val : Nat32) -> Unit {clab = val}

let lab_get = func () -> Nat32 {
  let lab = clab
  clab = clab + 1
  return lab
}

let o = func (s : Str) -> Unit {fprintf(fout, "%s", s)}
let nl = func () -> Unit {o("\n")}
let space = func () -> Unit {o(" ")}
let comma = func () -> Unit {o(", ")}


