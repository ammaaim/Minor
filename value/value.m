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


//union {
  un     : record {x : *Value}
  bin    : record {l, r : *Value}
  index  : record {array, index : *Value}
  access : record {value : *Value, field : Str}
  cast   : record {value : *Value, to : *Type}
  call   : record {function : *Value, arguments : *List}
//}

  // ti - место упоминания значения в конкретном случае
  // declared_at - место декларации
  // defined_at - место определения
  ti, declared_at, defined_at : *TokenInfo
}


