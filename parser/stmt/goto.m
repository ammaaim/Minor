// m2/parser/stmt/goto


let stmtGoto = func StmtParser {
  let lab = parseId()
  if lab == Nil {
    error("expected label", Nil)
    return Nil
  }

  let s = stmt_new(StmtGoto)
  s.l = lab
  s.ti = ti
  return s
}


