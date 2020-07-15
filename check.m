// m2/check


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

    // у неопределенных значений (ошибочных)
    // тип останется Nil
    if val.type != Nil {
      // проверяем все константные функции (не переменные с -> типом)
      if val.type.kind == TypeFunction and val.kind == ValueGlobalConst {
        checkFunc(val)
      }
    }
  }
  map_foreach(&mctx.value_index, vchk, Nil)
}


let checkFunc = func (f : *Value) -> Unit {
  // set context
  let old_cfunc = fctx.cfunc
  fctx.cfunc = f

  let block = f.assembly_item.funcdef.block

  // extern function doesn't have the block
  if block != Nil {
    stmtBlockCheck(block)
  }

  // reset context
  fctx.cfunc = old_cfunc
}


