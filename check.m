// m2/check



let checkModule = func (m : *Module) -> Unit {

  // check module imports before
  let mcheck = func MapForeachHandler {
    let module = v to *Module
    checkModule(module)
  }
  map_foreach(&m.imports, mcheck, Nil)

  printf("checkModule %s\n", m.src.info.path)

  // check module types
  let tchk = func MapForeachHandler {
    let type = v to *Type
    typeCheck(type)
  }
  map_foreach(&m.index.types, tchk, Nil)


  // check module values
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
  map_foreach(&m.index.values, vchk, Nil)

  printf("end-checkModule %s\n", m.src.info.path)
}



let checkFunc = func (f : *Value) -> Unit {
  // set context
  let old_cfunc = fctx.cfunc
  fctx.cfunc = f

  let block = f.def.funcdef.block

  // extern function doesn't have the block
  if block != Nil {
    stmtBlockCheck(block)
  }

  // reset context
  fctx.cfunc = old_cfunc
}


