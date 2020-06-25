// value/index


let indx = func (a, i : *Value, ti : *TokenInfo) -> *Value {
  if a == Nil or i == Nil {goto fail}
  return value_new_address(ValueIndex, Nil, a, i)

fail:
  return Nil
}


let getTypeIndex = func (v : *Value) -> *Type {
  let a = v.a[0]
  let i = v.a[1]
  getType(a)
  getType(i)

  // приводим GenericTypeInt к typeBaseInt если надо
  castIfNumericTo(a, typeBaseInt)
  castIfNumericTo(i, typeBaseInt)

  return a.type.array.of
}


