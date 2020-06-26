


let stmtGoto = func StmtParser {
  let lab = parse_id()
  if lab == Nil {
    error("expected label", Nil)
    return Nil
  }

  let s = stmt_new(StmtGoto)
  s.l = lab
  s.ti = ti
  return s
}

