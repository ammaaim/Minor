// m2/parser/stmt/continue


let stmtContinue = func StmtParser {
  sep()
  if fctx.loop == 0 {
    error("`continue` outside any loop operator", Nil)
  }
  return stmtNew(StmtContinue, ti)
}


