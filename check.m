// m2/check

import "type/check"

type Fx = record {
  fx : *Fx
}

let checkMain = func () -> Unit {

  // check types
  let tchk = func MapForeachHandler {
    let type = v to *Type
    typeCheck(type)
  }
  map_foreach(&mctx.type_index, tchk, Nil)


  // check values
  let vchk = func MapForeachHandler {
    let val = v to *Value

    checkValue(val)

    // проверяем все функции
    if val.type.kind == TypeFunction {
      checkFunc(val)
    }
  }
  map_foreach(&mctx.value_index, vchk, Nil)



}


let checkFunc = func (f : *Value) -> Unit {
  // set context
  let old_cfunc = fctx.cfunc
  fctx.cfunc = f

  // extern function doesn't have the block
  let b = f.block
  if b != Nil {
    stmtBlockCheck(b)
  }

  // reset context
  fctx.cfunc = old_cfunc
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

  if k == ValueId {
    error("unknown value", v.ti)
  } else if isBinaryOpKind(k) {
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
  }

  v.type = t
  return t

fail:
  assert(False, "checkValue:: unknown v.kind")
  return Nil
}


