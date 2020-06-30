// m2/type/type


type TypeUndefined = record {
  id : Str  // We know only identifier
}


type TypeBasic = record {
  id   : Str   //
  p    : Nat   // power (bit depth)
  i, s : Bool  // flags: i - integer, s - signed
}


type TypeFunc = record {
  params  : *List  // List of Field
  to      : *Type  // return type
  arghack : Bool   // , ...
}


type TypePointer = record {to : *Type}


type TypeArray = record {
  of        : *Type  // item type
  volume    : Nat    // property of defined array
  undefined : Bool   // undefined array - array without defined volume
}


type TypeRecord = record {
  fields : *List  // of Field
  uid    : Nat32  // unical id
}


type TypeEnum = record {
  cons : *List  // of Entity (EntityConst)
  uid  : Nat32  // unical id
}



/*
 * Type Kind
 */
type TypeKind = enum {
  TypeInvalid,    // Forbidden kind; used ony for debug
  TypeNumeric,    // Any number without specific type
  TypeUndefined,  // Type used by id, but still not defined
  TypeBasic,      // Any builtin type (Unit, Bool, IntXX, NatXX)
  TypeFunction,   // Callable type
  TypeEnum,       // Type sum
  TypeRecord,     // Composite type
  TypePointer,    // Just Pointer
  TypeArray       // Defined & Undefined array type
}


/*
 * Type Structure
 */
type Type = record {
  kind  : TypeKind

  aka   : Str    // type alias (!need for printer)

  size  : Nat32  // размер типа в байтах (с учетом выравнивания)
  align : Nat8   // заданное значение выравнивания [ЭТО АТТРИБУТ НЕ ТИПА А ЗНАЧЕНИЯ!]

//union {
    undefined : TypeUndefined
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


