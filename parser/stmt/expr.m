// m2/parser/stmt/expr


type Expr = record {
  v : *Value
  reg : Nat32
}


let expr_new = func (v : *Value) -> *Expr {
  let e = malloc(sizeof Expr) to *Expr
  assert(e != Nil, "expr_new::malloc")
  memset(e, 0, sizeof Expr)
  e.v = v
  return e
}


let stmt_expr_new = func (v : *Value, ti : *TokenInfo) -> *Stmt {
  let s = stmtNew(StmtExpr, ti)
  s.e = expr_new(v)
  s.ti = v.ti
  return s
}


let stmtExpr = func () -> *Stmt {
  let expr_ti = &ctok().ti
  let e = expr()

  if e == Nil {goto fail_with_restore}

  let assign_ti = &ctok().ti
  if not match("=") {
    // Just expression without assignation (e.g. call())
    // or let statement
    return stmt_expr_new(e, expr_ti)
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


