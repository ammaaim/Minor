// m2/parser/stmt/break


let stmtBreak = func StmtParser {
  sep()
  if fctx.loop == 0 {
    error("`break` outside any loop operator", Nil)
  }
  return stmt_new(StmtBreak)
}


