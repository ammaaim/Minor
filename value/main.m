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
import "init"



type StorageClass = enum {
  // default class
  StorageUndefined,  // used by undefined value

  StorageImmediate,  // For Obj in printer
  /*
   * Global Immutable Object used by name
   * such as funcs, strings, literal arrays & records
   */
  StorageGlobalConst,

  // variables
  StorageLocal,      // local var
  StorageGlobal,     // global var

  // register
  StorageAddress,    // address of value in register
  StorageRegister    // value in LLVM register
}



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

  class : StorageClass


  // ссылка на блок, если это функция
  block : *Block  // ссылка на блок функции - при чеке он будет обработан отсюда



//union {
  imm    : Int64  // ValueImmediate
  reg    : Nat32  // StorageRegister (let)
  id     : Str    // вместо id нужна ссылка на объект в сборке
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




let valueIsConst = func (v : *Value) -> Bool {
  return v.class == StorageGlobalConst or v.kind == ValueImmediate
}


let valueIsMutable = func (v : *Value) -> Bool {
  let cl = v.class
  return cl == StorageLocal or cl == StorageGlobal or cl == StorageAddress
}

let valueIsReadonly = func (v : *Value) -> Bool {return not valueIsMutable(v)}



