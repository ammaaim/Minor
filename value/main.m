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
import "2str"
import "init"




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


