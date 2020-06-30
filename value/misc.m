// m2/value/misc


import "storage"
import "value"


let valueNew = func (k : ValueKind, sc : StorageClass) -> *Value {
  let v = malloc(sizeof Value) to *Value
  assert(v != Nil, "value_new")
  memset(v, 0, sizeof Value)
  v.kind = k
  v.storage.class = sc
  return v
}


let valueNewImm = func (t : *Type, dx : Int64) -> *Value {
  let v = valueNew(ValueId, StorageImmediate)
  v.type = t
  v.storage.val = dx
  return v
}



let valueIsConst = func (v : *Value) -> Bool {return storageIsConst(&v.storage)}
let valueIsReadonly = func (v : *Value) -> Bool {return not storageIsMutable(&v.storage)}



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
    error("unknown value", v.ti)
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


