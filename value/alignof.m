// m2/value/alignof


let align_of = func (t : *Type, ti : *TokenInfo) -> *Value {
  let vx = valueNew(ValueAlignof, ti)
  vx.szof = t
  return vx
}


let checkValueAlignof = func (v : *Value) -> *Type {
  let t = v.szof

  if t.kind == TypeUnknown {
    error("alignof unknown type", v.ti)
  }

  v.kind = ValueImmediate  // turn ValueAlignof to ValueImmediate (only here!)
  v.imm = t.align to Int64

  return typeNumeric
}


