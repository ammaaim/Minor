// m2/value/main


import "nat"
import "un"
import "bin"
import "shift"
import "index"
import "access"
import "call"
import "cast"
import "storage"
import "value"



let valueNew = func (k : ValueKind, sc : StorageClass, ti : *TokenInfo) -> *Value {
  let v = malloc(sizeof Value) to *Value
  assert(v != Nil, "value_new")
  memset(v, 0, sizeof Value)
  v.kind = k
  v.storage.class = sc
  v.ti = ti
  return v
}


let valueNewImm = func (t : *Type, dx : Int64, ti : *TokenInfo) -> *Value {
  let v = valueNew(ValueId, StorageImmediate, ti)
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
let checkValue = func (v : *Value) -> *Type {
  if v == Nil {goto fail}

  // если тип уже известен - просто вернем его
  if v.type != Nil {
    return v.type
  }

  var t : *Type
  t = Nil

  let k = v.kind

  if k == ValueId {
    error("unknown value", v.ti)
  } else if isBinaryOpKind(k) {
    t = checkValueBinary(v)
  } else if isUnaryOpKind(k) {
    t = checkValueUnary(v)
  } else if k == ValueCall {
    t = checkValueCall(v)
  } else if k == ValueIndex {
    t = checkValueIndex(v)
  } else if k == ValueAccess {
    t = checkValueAccess(v)
  } else if k == ValueCast {
    t = checkValueCast(v)
  } else if k == ValueShl or k == ValueShr {
    t = checkValueShift(v)
  }

  v.type = t
  return t

fail:
  assert(False, "checkValue:: unknown v.kind")
  return Nil
}


