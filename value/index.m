// m2/value/index


type ValueIndex = record {array, index : *Value}



let indx = func (a, i : *Value, ti : *TokenInfo) -> *Value {
  if a == Nil or i == Nil {goto fail}
  let v = valueNew(ValueIndex, ti)
  v.index.array = a
  v.index.index = i
  return v

fail:
  return Nil
}


let checkValueIndex = func (v : *Value) -> *Type {

  let a = v.index.array
  let i = v.index.index

  checkValue(a)
  checkValue(i)

  // приводим GenericTypeInt к typeBaseInt если надо
  v.index.array = castIfNumericTo(a, typeBaseInt)
  v.index.index = castIfNumericTo(i, typeBaseInt)

  checkValue(v.index.array)
  checkValue(v.index.index)

  // тип операции индексирования - тип элемента ее массива
  return v.index.array.type.array.of
}


