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


  /*
   * Ссылка на операнд(ы)
   */
  a : [2]*Value

  /*
   * ValueAccess property
   */
  field : Str

  /*
   * ValueCall property
   */
  arguments : *List  // список *Value для ValueCall
  block : *Block     // ссылка на блок функции - при чеке он будет обработан отсюда

  /*
   * ValueCast property
   */
  cast_to : *Type

  // ti - место упоминания значения в конкретном случае
  // declared_at - место декларации
  // defined_at - место определения
  ti, declared_at, defined_at : *TokenInfo
}


