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
  ValueInvalid,      // Forbidden value kind (for debug)

  ValueUndefined,    // Value was used but not defined

  /* Terminals */

  ValueImmediate,    // Value#imm

  ValueGlobalConst,  // Value#assembly_item (id)
  ValueGlobalVar,    // Value#assembly_item (id)

  ValueParam,        // Value#reg

  ValueLocalConst,   // Value#expr (reg)
  ValueLocalVar,     // Value#vardef (reg)

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


type Value = record {
  kind : ValueKind

  type : *Type


//union {
  // term info
  imm    : Int64  // ValueImmediate
  reg    : Nat32  // ValueParam, ValueLocalConst, ValueLocalVar

  // пока не могу выпилить это - юзается для enum ...
  id     : Str    // вместо id нужна ссылка на объект в сборке


  // operation info
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
  // для его проверки; Так же юзается для ValueGlobalVar & ValueGlobalConst
  assembly_item : *AssemblyItem  // ValueGlobalVar & ValueGlobalConst
  vardef : *VarDef  // ValueLocalVar
  field  : *Field   // ValueParam
  expr   : *Expr    // ValueLocalConst


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

  if isBinaryOpKind(k) {
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
  } else if k == ValueSizeof {
    t = checkValueSizeof(v)
  } else if k == ValueAlignof {
    t = checkValueAlignof(v)

  } else if k == ValueLocalConst {
    t = checkValue(v.expr.v)
  }

  v.type = t
  return t

fail:
  assert(False, "checkValue:: unknown v.kind")
  return Nil
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


let isSpecialOpKind = func (k : ValueKind) -> Bool {
  return k == ValueShl or
         k == ValueShr or
         k == ValueCall or
         k == ValueIndex or
         k == ValueAccess or
         k == ValueCall or
         k == ValueCast or
         k == ValueSizeof or
         k == ValueAlignof
}


let valueIsTerm = func (v : *Value) -> Bool {
  let k = v.kind
  return isUnaryOpKind(k) or isBinaryOpKind(k) or isSpecialOpKind(k)
}


// испольуется в assign
let valueIsReadonly = func (v : *Value) -> Bool {
  let k = v.kind

  if k == ValueIndex {
    let def_arr = typeIsDefinedArray(v.index.array.type)
    return valueIsReadonly(v.index.array) and def_arr
  }

  if k == ValueAccess {
    return valueIsReadonly(v.access.value) and v.access.value.type.kind != TypePointer
  }

  // это неправильно - тк операции тоже readonly!
  return k == ValueGlobalConst or
         k == ValueImmediate or
         k == ValueLocalConst or
         k == ValueParam
}



let valueIsMutable = func (v : *Value) -> Bool {
  let k = v.kind
  return k == ValueLocalVar or k == ValueGlobalVar
}


