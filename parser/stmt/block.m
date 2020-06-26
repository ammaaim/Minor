// parser/stmt/block


let stmtBlock = func StmtParser {
  let b = doblock()
  if b == Nil {return Nil}
  let s = stmt_new(StmtBlock)
  s.b = b
  s.ti = ti
  return s
}


let stmtBlockCheck = func (b : *Block) -> Unit {
  // set context
  let old_cblock = fctx.cblock
  fctx.cblock = b

  // firstly check the local functions
  let chkf = func ListForeachHandler {
    let fv = data to *Value
    checkFunc(fv)
  }
  list_foreach(b.local_functions, chkf, Nil)

  // secondly check the block statements
  let chkb = func ListForeachHandler {
    let stmt = data to *Stmt
    stmtCheck(stmt)
  }
  list_foreach(b.stmts, chkb, Nil)

  // reset context
  fctx.cblock = old_cblock
}


