// value/value


// Dont change the order!
// see isUnaryOpValue, etc.
type ValueKind = enum {
  ValueInvalid,

  /* id */
  ValueId,

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
  ValueCast
}


type Value = record {
  kind : ValueKind

  type : *Type

  storage : Storage


  // ссылка на блок, если это функция
  block : *Block  // ссылка на блок функции - при чеке он будет обработан отсюда


  /*
   * Ссылка на операнд(ы) для un, bin,
   */
  a : [2]*Value

//union{
  access : record {field : Str}
  call   : record {arguments : *List}
  cast   : record {to : *Type}
//}

  // ti - место упоминания значения в конкретном случае
  // declared_at - место декларации
  // defined_at - место определения
  ti, declared_at, defined_at : *TokenInfo
}


