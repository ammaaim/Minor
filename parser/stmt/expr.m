// m2/parser/stmt/expr

type Expr = record {
  v : *Value
  reg : Nat32
}


let stmtExpr = func () -> *Stmt {
  let expr_ti = &ctok().ti
  let e = expr()

  if e == Nil {goto fail_with_restore}

  let assign_ti = &ctok().ti
  if not match("=") {
    // Just expression without assignation (e.g. call())
    let s = stmtNew(StmtExpr, expr_ti)
    s.e = malloc(sizeof Expr) to *Expr
    assert(s.e != Nil, "stmtExpr::malloc(sizeof Expr)")
    memset(s.e, 0, sizeof Expr)
    s.e.v = e
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


let stmtExprCheck = func (e : *Expr) -> Unit {
  checkValue(e.v)
}


