

// сейчас при таком раскладе sizeof XX + 0 дает ошибку!!!
// TODO решение - вынести свертку констант на этап тайпчека TODO

// сделай такое же для ALignof!!

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
  v.type = type_new(TypeNumeric)
  v.imm = t.size to Int64

  return v.type
}


