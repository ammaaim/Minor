// m2/parser/stmt

import "type"
import "let"
import "block"
import "expr"
import "assign"
import "if"
import "while"
import "return"
import "break"
import "continue"
import "goto"



// проверка типов для всех выражений входящих в состав стейтмента
let stmtCheck = func (s : *Stmt) -> Unit {
  if s == Nil {return}
  let k = s.kind
  if k == StmtLet {
    stmtLetCheck(s)
  } else if k == StmtExpr {
    getType(s.a[0])
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


let stmt = func () -> *Stmt {
  let ti = &ctok().ti
  if match("let") {
    return parseLet(True); sep()
  } else if match("{") {
    return stmtBlock(ti)
  } else if match("if") {
    return stmtIf(ti)
  } else if match("while") {
    return stmtWhile(ti)
  } else if match("return") {
    return stmtReturn(ti)
  } else if match("break") {
    return stmtBreak(ti)
  } else if match("continue") {
    return stmtContinue(ti)
  } else if match("var") {
    parseVardef(); sep()
    return Nil
  } else if match("type") {
    parseTypedef(); sep()
    return Nil
  } else if match("goto") {
    return stmtGoto(ti)
  }

  // Maybe Label?
  // ставим точку восстановления
  // для того чтобы заглянуть наперед
  // пытаясь понять не label ли это
  let tkn = gett()
  if ctok().type == TokenId {
    let id = parseId()
    let ti = &ctok().ti
    if match(":") {
      // yes, it's label
      setlab(id, ti)
      return Nil
    } else {
      sett(tkn)  // `put token back`
    }
  }

  // Maybe Expr?
  let sx = stmtExpr()
  if sx == Nil {
    stmt_restore()
  }
  return sx
}


let stmt_restore = func () -> Unit {
  skip()
}


let setlab = func (lab : Str, ti : *TokenInfo) -> Unit {
  let st = stmt_new(StmtLabel)
  st.l = lab
  st.ti = ti
  add_stmt(st)
}


