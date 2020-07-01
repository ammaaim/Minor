// m2/parser/stmt/expr


let stmtExpr = func () -> *Stmt {
  let expr_ti = &ctok().ti
  let e = expr()

  if e == Nil {goto fail_with_restore}

  let assign_ti = &ctok().ti
  if not match("=") {
    // Just expression without assignation (e.g. call())
    let s = stmtNew(StmtExpr, expr_ti)
    s.a[0] = e
    s.ti = e.ti
    return s
  }

  /* It's assignation */

  let rx = expr()
  return assign(e, rx, assign_ti)

fail_with_restore:
  printf("stmt::fail_with_restore\n")
  printf("YYY = %s\n", &ctok().text[0])
  return Nil

fail:
  return Nil
}


