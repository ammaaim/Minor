// m2/type/main


import "2str"
import "basic"
import "record"
import "enum"
import "array"
import "pointer"
import "func"
import "eq"
import "init"



// встретили неизвестный тип
// создали TypeUnknown
// встретили typedef - проверили если ae то заполняем ae из nt
// check сперва проверяет типы если есть TypeUnknown - ошибка
// еще check должен рекурсивно проверить типы на внутреннюю рекурсию но это потом


/*
 * Type Kind
 */
type TypeKind = enum {
  TypeUnknown,   // We don't know anything about this type
  TypeNumeric,   // Any number without specific type
  TypeBasic,     // Any builtin type (Unit, Bool, IntXX, NatXX)
  TypeFunction,  // Callable type
  TypeEnum,      // Type sum
  TypeRecord,    // Composite type
  TypePointer,   // Just Pointer
  TypeArray      // Defined & Undefined array type
}


/*
 * Type Structure
 */
type Type = record {
  kind  : TypeKind

  aka   : Str    // type alias (!need for printer)

  nsize : Nat32  // размер типа в байтах
  size  : Nat32  // размер типа в байтах (с учетом выравнивания)
  align : Nat8   // значение выравнивания стандартное для этого типа


//union {
    basic     : TypeBasic
    function  : TypeFunc
    pointer   : TypePointer
    array     : TypeArray
    record    : TypeRecord
    enum      : TypeEnum
//}

  declared_at,     // place in code where type was mentioned first time
  defined_at,      // place in code where type was defined
  ti : *TokenInfo  // place in code where type was mentioned
}



// global links to builtin types
var typeUnit,
    typeBool,
    typeChar,
    typeStr,
    typeEnum,

    typeNumeric,

    typeSizeof,
    typeAlignof,

    typeFreePtr,

    typeBaseInt,
    typeBaseNat : *Type



let type_new = func (k : TypeKind) -> *Type {
  let t = malloc(sizeof Type) to *Type
  assert(t != Nil, "type_new")
  memset(t, 0, sizeof Type)

  t.kind = k
  t.align = cfg.dataAlignment to Nat8
  return t
}


let typeIsReference = func (t : *Type) -> Bool {
  let k = t.kind
  if k == TypePointer {return True}
  if k == TypeArray {return t.array.undefined}
  return False
}

let typeIsDefinedArray = func (t : *Type) -> Bool {
  if t.kind != TypeArray {return False}
  return not t.array.undefined
}

let type_is_basic_integer = func (t : *Type) -> Bool {
  if t.kind == TypeBasic {return t.basic.i}
  return False
}



var x_uid : Nat32
// for record & enum
// просто потому что записи и перечисления по совей природе анонимны
let get_uid = func () -> Nat32 {
  let uid = x_uid
  x_uid = x_uid + 1
  return uid
}


let alignment = func (req_sz : Nat32, align : Nat8) -> Nat32 {
  var sz : Nat32
  sz = req_sz
  while (sz % align to Nat32) != 0 {sz = sz + 1}
  return sz
}


