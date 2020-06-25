// type/type



type Field = record {
  id     : Str
  type   : *Type
  offset : Nat16  // record field offset
  ti     : *TokenInfo
}


/*type TypeUnknown = record {
  id : Str  // об этом типе ничего не известно, кроме связанного с ним имени
}*/


// неопределенный тип - тот тип что был упомянут
// но еще не был определен. Содержит в себе список указателей на поля
// ссылающиеся на этот тип. КОгда будем определять го по настоящему
// эта запись будет удалена и все ссылки будут переведены на настоящий тип

type TypeUndefined = record {
  id : Str  // об этом типе ничего не известно, кроме связанного с ним имени
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


type TypeVar = record {of : *Type}
type TypePointer = record {to : *Type}


type TypeArray = record {
  of        : *Type  // item type
  volume    : Nat    // property of defined array
  undefined : Bool   // undefined array - array without defined volume
}


type TypeRecord = record {
  fields : *List  // of Field
  uid    : Nat32  //
}


type TypeEnum = record {
  cons : *List  // of Entity (EntityConst)
  uid  : Nat32  //
}



type TypeKind = enum {
  TypeInvalid,
  TypeNumeric,
  TypeGenericRef,
  TypeUndefined,
  TypeBasic,
  TypeFunction,
  TypeEnum,
  TypeRecord,
  TypePointer,
  TypeArray
}


/*
 * Type это просто тип-сумма типов (обертка)
 */
type Type = record {
  kind  : TypeKind

  aka   : Str    // псевдоним типа (для определенных) нужно для принтера

  size  : Nat32  // размер типа в байтах (с учетом выравнивания)
  align : Nat8   // заданное значение выравнивания [ЭТО АТТРИБУТ НЕ ТИПА А ЗНАЧЕНИЯ!]

  //union {
  undefined : TypeUndefined
  var       : TypeVar
  basic     : TypeBasic
  function  : TypeFunc
  pointer   : TypePointer
  array     : TypeArray
  record    : TypeRecord
  enum      : TypeEnum
  //}

  declared_at,      // место в коде где тип был упомянут впервые
  defined_at,       // место в коде где тип был определен
  ti : *TokenInfo   // место в коде где тип был упомянут
}


