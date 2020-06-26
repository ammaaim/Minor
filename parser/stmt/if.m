// parser/stmt/if


let stmtIf = func StmtParser {
  let i = malloc(sizeof If) to *If
  i.cond = expr()
  match("\n")
  let ti_then_block = &ctok().ti
  need("{")
  i.then = stmtBlock(ti_then_block)
  if match("else") {
    match("\n")
    let ti_else_branch = &ctok().ti
    if match("if") {
      i.else = stmtIf(ti_else_branch)
    } else {
      need("{")
      i.else = stmtBlock(ti_else_branch)
    }
  } else {
    i.else = Nil
  }

  if i.cond == Nil or i.then == Nil {goto fail}

  let s = stmt_new(StmtIf)
  s.i = i
  s.ti = ti
  return s

fail:
  return Nil
}


let stmtIfCheck = func (s : *Stmt) -> Unit {
  let i = s.i
  let ct = getType(i.cond)

  if ct != Nil {
    if not type_eq(ct, typeBool) {
      error("expected Bool expression", ct.ti)
    }
  }

  checkStmt(i.then)
  checkStmt(i.else)
}


