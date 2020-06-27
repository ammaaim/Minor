// value/misc


import "storage"
import "value"


let value_new = func (k : ValueKind, t : *Type, l, r : *Value) -> *Value {
  let v = malloc(sizeof Value) to *Value
  assert(v != Nil, "value_new")
  memset(v, 0, sizeof Value)
  v.kind = k
  v.a[0] = l
  v.a[1] = r
  v.type = t
  v.storage.class = StorageUndefined
  return v
}


let value_is_const = func (v : *Value) -> Bool {
  return storage_is_const(&v.storage)
}


// Create new Nil constant
let valueFreePtr2 = func () -> *Value {
  let nat0 = value_new_imm_const(typeBaseNat, 0)
  let nil = value_new_register(ValueCast, typeFreePtr, nat0, Nil)
  nil.cast.to = typeFreePtr  //!
  return nil
}


let value_new_register = func (k : ValueKind, t : *Type, l, r : *Value) -> *Value {
  let v = value_new(k, t, l, r)
  v.storage.class = StorageRegister
  return v
}


let value_new_address = func (k : ValueKind, t : *Type, l, r : *Value) -> *Value {
  let v = value_new(k, t, l, r)
  v.storage.class = StorageAddress
  return v
}


let value_new_imm_const = func (t : *Type, dx : Int64) -> *Value {
  let v = value_new(ValueId, t, Nil, Nil)
  v.storage.class = StorageImmediate
  v.storage.val = dx
  return v
}


let valueIsReadonly = func (v : *Value) -> Bool {
  return not storageIsMutable(&v.storage)
}



let isUnaryOpKind = func (k : ValueKind) -> Bool {
  return k == ValueRef or k == ValueDeref or k == ValueMinus or k == ValueNot
}


let isBinaryOpKind = func (k : ValueKind) -> Bool {
  return k == ValueAdd or
         k == ValueSub or
         k == ValueMul or
         k == ValueDiv or
         k == ValueMod or
         k == ValueAnd or
         k == ValueOr or
         k == ValueXor or
         isReletionOpKind(k)
}


let isReletionOpKind = func (k : ValueKind) -> Bool {
  return k == ValueEq or
         k == ValueNe or
         k == ValueLt or
         k == ValueGt or
         k == ValueLe or
         k == ValueGe
}



// вычисляем тип для значения и всех его субзначений
// Если возникает ошибка она выводится и возвращается Nil
// возвращает тип значения
let getType = func (v : *Value) -> *Type {
  if v == Nil {goto fail}

  // если тип уже известен - просто вернем его
  let t0 = v.type

  if t0 != Nil {
    return t0
  }

  var t : *Type
  t = Nil

  let k = v.kind

  if k == ValueId {
    let id = v.storage.id
    var vx : *Value
    vx = get_value(id)
    if vx == Nil {
      error("unknown value", v.ti)
      return Nil
    }
    t = vx.type
  } else if isBinaryOpKind(k) {
    t = getTypeBinary(v)
  } else if isUnaryOpKind(k) {
    t = getTypeUnary(v)
  } else if k == ValueCall {
    t = getTypeCall(v)
  } else if k == ValueIndex {
    t = getTypeIndex(v)
  } else if k == ValueAccess {
    t = getTypeAccess(v)
  } else if k == ValueCast {
    t = getTypeCast(v)
  } else if k == ValueShl or k == ValueShr {
    t = getTypeShift(v)
  }

  v.type = t
  return t

fail:
  assert(False, "getType:: unknown v.kind")
  return Nil
}


