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



type ValueKind = enum {
  ValueInvalid,

  ValueUndefined,    // Value was used but not defined


  /* Terminals */

  ValueImmediate,    // by imm
  ValueGlobalConst,  // by id

  ValueGlobalVar,    // by id
  ValueLocalVar,     // by id

  ValueRegister,     // by reg  // `let c = a * b`


  /* Operations */

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

//type ValueClass = record {ValueTerm, ValueOperation}  // ?

type Value = record {
  kind : ValueKind

  type : *Type


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

  // ссылка на связанную со значением запись в сборке
  // в случае функции (константной) через это поле checkFunc получит ссылку на блок
  // для его проверки
  assembly_item : *AssemblyItem


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



let valueIsReadonly = func (v : *Value) -> Bool {
  let k = v.kind
  // это неправильно - тк операции тоже readonly!
  return k == ValueGlobalConst or k == ValueImmediate or k == ValueRegister
  //return not valueIsMutable(v)
}


let valueIsMutable = func (v : *Value) -> Bool {
  let k = v.kind
  return k == ValueLocalVar or k == ValueGlobalVar
}


