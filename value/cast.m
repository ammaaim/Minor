// value/cast


type ValueCast = record {value : *Value, to : *Type}



let WARNING0 = False  // "casting bigger to smaller"


// можем ли мы приводить непосредственно значение v к типу t ?
let immCastIsPossible = func (v : *Value, t : *Type) -> Bool {
  if v.kind == ValueImmediate {
    return True  // STUB
  }
  return False
}


let cast = func (v : *Value, t : *Type, ti : *TokenInfo) -> *Value {
  if v == Nil or t == Nil {goto fail}

  if immCastIsPossible(v, t) {
    // creating new imm value with target type
    return valueNewImm(t, v.imm, ti)
  }

  /*if v.type != Nil {
  if WARNING0 {
    if type_is_basic_integer(t) {
      if type_is_basic_integer(v.type) {
        if v.type.basic.p > t.basic.p {
          warning("casting bigger to smaller", ti)
        }
      }
    }
  }
  }*/

  // во всех остальных случаях выполняем runtime приведение
  let vc = valueNew(ValueCast, ti)
  vc.cast.value = v
  vc.cast.to = t
  return vc

fail:
  return Nil
}


let checkValueCast = func (v : *Value) -> *Type {
  let t = checkValue(v.cast.value)
  let rt = v.cast.to
  return rt
}


