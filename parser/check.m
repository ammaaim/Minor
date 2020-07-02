// m2/parser/check


let checkMain = func () -> Unit {
  let chk = func MapForeachHandler {

    let val = v to *Value

    checkValue(val)

    // проверяем все функции
    if val.type.kind == TypeFunction {
      checkFunc(val)
    }
  }
  map_foreach(&mctx.value_index, chk, Nil)
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


