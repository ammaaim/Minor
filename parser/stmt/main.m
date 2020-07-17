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


type VarDef = record {
  id : Str  // оставил тут для отладки
  lab : Nat32  // локальная переменная юзается через lab
  type : *Type
  init_value : *Value
  ti : *TokenInfo
}


/*
 * Statement Kind
 */
type StmtKind = enum {
  StmtExpr,
  StmtBlock,
  StmtVarDef,
  StmtAssign,
  StmtIf,
  StmtWhile,
  StmtReturn,
  StmtBreak,
  StmtContinue,
  StmtGoto,
  StmtLabel
}


/*
 * Statement
 */
type Stmt = record {
  kind : StmtKind

//union {
    a : [2]*Value  // assign & return statements
    b : *Block     // block statement
    e : *Expr      // StmtExpr
    v : *VarDef    // var definition
    w : *While     // while statement
    i : *If        // if statement
    l : Str        // goto & label statement
//}

  ti : *TokenInfo
}


//type StmtParser = (ti : *TokenInfo) -> *Stmt


// add statement to current block
let stmtAdd = func (s : *Stmt) -> Unit {
  if s != Nil {
    list_append(&fctx.cblock.stmts, s)
  }
}


let stmtNew = func (kind : StmtKind, ti : *TokenInfo) -> *Stmt {
  let s = malloc(sizeof Stmt) to *Stmt
  assert(s != Nil, "stmt_new")
  memset(s, 0, sizeof Stmt)
  s.kind = kind
  s.ti = ti
  return s
}


let stmtLabelNew = func (lab : Str, ti : *TokenInfo) -> *Stmt {
  let st = stmtNew(StmtLabel, ti)
  st.l = lab
  return st
}


let stmtParse = func () -> *Stmt {
  let ti = &ctok().ti
  if match("let") {
    return parseLet(); sep()
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
      return stmtLabelNew(id, ti)
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



let stmt_new_vardef = func (id : Str, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Stmt {
  let va = malloc(sizeof VarDef) to *VarDef
  va.id = id
  va.init_value = init_value
  va.type = t

  let s = stmtNew(StmtVarDef, ti)
  s.v = va
  s.ti = ti
  return s
}


let stmt_new_assign = func (l, r : *Value, ti : *TokenInfo) -> *Stmt {
  let s = stmtNew(StmtAssign, ti)
  s.a[0] = l
  s.a[1] = r
  s.ti = ti
  return s
}



// проверка типов для всех выражений входящих в состав стейтмента
let stmtCheck = func (s : *Stmt) -> Unit {
  if s == Nil {return}
  let k = s.kind
  if k == StmtExpr {
    stmtExprCheck(s.e)
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



