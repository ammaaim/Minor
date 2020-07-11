// m2/value/main


import "2str"
import "nat"
import "un"
import "bin"
import "shift"
import "index"
import "access"
import "call"
import "cast"
import "sizeof"
import "alignof"
import "storage"
import "init"



// Dont change the order!
// see isUnaryOpValue, etc.
type ValueKind = enum {
  ValueInvalid,

  /* value used by id */
  ValueId,


  ValueImmediate,
  ValueGlobalConst,  // by id

  ValueGlobalVar,    // by id
  ValueLocalVar,     // by id

  ValueRegister,     // by reg  // let a = 1


  /* unary */
  ValueRef,
  ValueDeref,
  ValueNot,
  ValueMinus,

  /* binary */
  ValueAdd, ValueSub,
  ValueMul, ValueDiv, ValueMod,
  ValueOr, ValueXor, ValueAnd,

  ValueEq, ValueNe,
  ValueLt, ValueGt,
  ValueLe, ValueGe,

  /* special */
  ValueShl, ValueShr,
  ValueCall,
  ValueIndex,
  ValueAccess,
  ValueCast,
  ValueSizeof,
  ValueAlignof
}

type Value = record {
  kind : ValueKind

  type : *Type

  //storage : Storage

  class : StorageClass


  // ссылка на блок, если это функция
  block : *Block  // ссылка на блок функции - при чеке он будет обработан отсюда


  bound_with : *AssemblyItem


//union {
  imm    : Int64
  reg    : Nat32 // for StorageRegister (let)
  id     : Str   // вместо id нужна ссылка на объект в сборке
  un     : ValueUn
  bin    : ValueBin
  index  : ValueIndex
  access : ValueAccess
  cast   : ValueCast
  call   : ValueCall
  szof   : *Type
//}

  declared_at,     // place in code where value was mentioned first time
  defined_at,      // place in code where value was defined
  ti : *TokenInfo  // place in code where value was mentioned
}



let valueNew = func (k : ValueKind, ti : *TokenInfo) -> *Value {
  let v = malloc(sizeof Value) to *Value
  assert(v != Nil, "value_new")
  memset(v, 0, sizeof Value)
  v.kind = k
  v.ti = ti
  return v
}


let valueNewImm = func (t : *Type, dx : Int64, ti : *TokenInfo) -> *Value {
  let v = valueNew(ValueImmediate, ti)
  v.type = t
  v.imm = dx
  return v
}


let valueIsConst = func (v : *Value) -> Bool {
  return classIsConst(v.class) or v.kind == ValueImmediate
}

let valueIsReadonly = func (v : *Value) -> Bool {return not classIsMutable(v.class)}


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


