// value/cast


let WARNING0 = False  // "casting bigger to smaller"


// можем ли мы приводить непосредственно значение v к типу t ?
let immCastIsPossible = func (v : *Value, t : *Type) -> Bool {
  if v.storage.class == StorageImmediate {return True}
  return False
}


let cast = func (v : *Value, t : *Type, ti : *TokenInfo) -> *Value {
  if v == Nil or t == Nil {goto fail}

  if immCastIsPossible(v, t) {
    return valueNewImm(t, v.storage.val, ti)
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
  let vc = valueNew(ValueCast, StorageRegister, ti)
  vc.cast.value = v
  vc.cast.to = t
  return vc

fail:
  return Nil
}


let getTypeCast = func (v : *Value) -> *Type {
  let t = getType(v.cast.value)
  let rt = v.cast.to
  return rt
}


