// m2/parser/stmt/return


let stmtReturn = func StmtParser {
  let s = stmtNew(StmtReturn, ti)
  s.ti = ti

  if separator() {
    return s
  }


  let ti = &ctok().ti
  let v = expr()
  if v == Nil {
    error("expected return expression", ti)
  }
  s.a[0] = v

  return s

fail:
  return Nil
}


let stmtReturnCheck = func (s : *Stmt) -> Unit {
  let rv = s.a[0]
  if rv != Nil {
    let rt = getType(rv)
    let ftype = fctx.cfunc.type.function.to
    s.a[0] = nat(rv, ftype)
  }
}


