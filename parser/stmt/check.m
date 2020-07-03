// m2/parser/stmt/check


// проверка типов для всех выражений входящих в состав стейтмента
let stmtCheck = func (s : *Stmt) -> Unit {
  if s == Nil {return}
  let k = s.kind
  if k == StmtLet {
    stmtLetCheck(s)
  } else if k == StmtExpr {
    checkValue(s.a[0])
  } else if k == StmtAssign {
    stmtAssignCheck(s)
  } else if k == StmtBlock {
    stmtBlockCheck(s.b)
  } else if k == StmtIf {
    stmtIfCheck(s)
  } else if k == StmtWhile {
    stmtWhileCheck(s)
  } else if k == StmtReturn {
    stmtReturnCheck(s)
  }
}


