// value/index


let indx = func (a, i : *Value, ti : *TokenInfo) -> *Value {
  if a == Nil or i == Nil {goto fail}
  let v = value_new_address(ValueIndex, Nil, a, i)
  v.index.array = a
  v.index.index = i
  return v

fail:
  return Nil
}


let getTypeIndex = func (v : *Value) -> *Type {
  let a = v.index.array
  let i = v.index.index
  getType(a)
  getType(i)

  // приводим GenericTypeInt к typeBaseInt если надо
  castIfNumericTo(a, typeBaseInt)
  castIfNumericTo(i, typeBaseInt)

  return a.type.array.of
}


