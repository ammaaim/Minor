// parser/stmt/while


let stmtWhile = func StmtParser {
  fctx.loop = fctx.loop + 1
  let w = malloc(sizeof While) to *While
  w.cond = expr()
  match("\n")
  let ti_block = &ctok().ti
  need("{")
  w.stmt = stmtBlock(ti_block)
  fctx.loop = fctx.loop - 1

  if w.cond == Nil or w.stmt == Nil {goto fail}

  let s = stmt_new(StmtWhile)
  s.w = w
  s.ti = ti
  return s

fail:
  fctx.loop = fctx.loop - 1
  return Nil
}


let stmtWhileCheck = func (s : *Stmt) -> Unit {
  let w = s.w
  let ct = getType(w.cond)
  if ct != Nil {
    if not type_eq(ct, typeBool) {
      error("expected Bool expression", ct.ti)
    }
  }

  checkStmt(w.stmt)
}


