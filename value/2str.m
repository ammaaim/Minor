// m2/value/2str


let print_value_kind = func (k : ValueKind) -> Str {
  if k == ValueId {
    return "ValueId"
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


let print_storage_class = func (c : StorageClass) -> Str {
  if c == StorageUndefined {
    return "StorageUndefined"
  } else if c == StorageImmediate {
    return "StorageImmediate"
  } else if c == StorageGlobalConst {
    return "StorageGlobalConst"
  /*} else if c == StorageFunction {
    return "StorageFunction"*/
  } else if c == StorageRegister {
    return "StorageRegister"
  } else if c == StorageAddress {
    return "StorageAddress"
  } else if c == StorageLocal {
    return "StorageLocal"
  } else if c == StorageGlobal {
    return "StorageGlobal"
  }
  return "StorageClassUnknown"
}


let value_show = func (v : *Value) -> Unit {
  printf("value: %p {\n", v)
  printf("  kind: %s\n", print_value_kind(v.kind))
  printf("  type: "); prttype(v.type); printf("\n")
  printf("  storage.class: %s\n", print_storage_class(v.storage.class))
  printf("  storage.id: %s\n", v.storage.id)
  printf("  storage.reg: %d\n", v.storage.reg)
  printf("  storage.val: %d\n", v.storage.val)
  printf("}\n")
}


