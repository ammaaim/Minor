// parser/stmt/return




let stmtReturn = func StmtParser {
  var v : *Value
  if separator() {
    v = Nil
  } else {
    let ti = &ctok().ti
    v = expr()
    if v == Nil {
      error("expected return expression", ti)
    }
  }

  let s = stmt_new(StmtReturn)
  s.a[0] = v
  s.ti = ti
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


