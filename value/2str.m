// m2/value/2str


let print_value_kind = func (k : ValueKind) -> Str {
  if k == ValueUndefined {
    return "ValueUndefined"
  } else if k == ValueRef {
    return "ValueRef"
  } else if k == ValueDeref {
    return "ValueDeref"
  } else if k == ValueNot {
    return "ValueNot"
  } else if k == ValueMinus {
    return "ValueMinus"
  } else if k == ValueShl {
    return "ValueShl"
  } else if k == ValueShr {
    return "ValueShr"
  } else if k == ValueAdd {
    return "ValueAdd"
  } else if k == ValueSub {
    return "ValueSub"
  } else if k == ValueMul {
    return "ValueMul"
  } else if k == ValueDiv {
    return "ValueDiv"
  } else if k == ValueMod {
    return "ValueMod"
  } else if k == ValueOr {
    return "ValueOr"
  } else if k == ValueXor {
    return "ValueXor"
  } else if k == ValueAnd {
    return "ValueAnd"
  } else if k == ValueEq {
    return "ValueEq"
  } else if k == ValueNe {
    return "ValueNe"
  } else if k == ValueLt {
    return "ValueLt"
  } else if k == ValueGt {
    return "ValueGt"
  } else if k == ValueLe {
    return "ValueLe"
  } else if k == ValueGe {
    return "ValueGe"
  } else if k == ValueCall {
    return "ValueCall"
  } else if k == ValueIndex {
    return "ValueIndex"
  } else if k == ValueAccess {
    return "ValueAccess"
  } else if k == ValueCast {
    return "ValueCast"
  } else if k == ValueInvalid {
    return "ValueInvalid"
  }

  return "ValueUnknown"
}



let value_show = func (v : *Value) -> Unit {
  printf("value: %p {\n", v)
  printf("  kind: %s\n", print_value_kind(v.kind))
  printf("  type: "); prttype(v.type); printf("\n")
  printf("  imm: %d\n", v.imm)
  printf("}\n")
}


