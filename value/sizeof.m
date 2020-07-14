// m2/value/sizeof


let size_of = func (t : *Type, ti : *TokenInfo) -> *Value {
  let vx = valueNew(ValueSizeof, ti)
  //let vx = valueNewImm(Nil, 0, ti)  // gives nat error! why nat workd in first phase?
  vx.szof = t
  return vx
}


let checkValueSizeof = func (v : *Value) -> *Type {
  let t = v.szof

  if t.kind == TypeUnknown {
    error("sizeof unknown type", v.ti)
  }

  v.kind = ValueImmediate  // turn ValueSizeof to ValueImmediate (only here!)
  v.type = typeNumeric

  v.imm = t.nsize to Int64

  return v.type
}


