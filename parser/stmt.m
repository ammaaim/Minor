

import "stmt/assign"



type StmtParser = (ti : *TokenInfo) -> *Stmt




let checkStmtIf = func (s : *Stmt) -> Unit {
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


let checkStmtWhile = func (s : *Stmt) -> Unit {
  let w = s.w
  let ct = getType(w.cond)
  if ct != Nil {
    if not type_eq(ct, typeBool) {
      error("expected Bool expression", ct.ti)
    }
  }

  checkStmt(w.stmt)
}


let checkStmtReturn = func (s : *Stmt) -> Unit {
  let rv = s.a[0]
  if rv != Nil {
    let rt = getType(rv)
    let ftype = fctx.cfunc.type.function.to
    s.a[0] = nat(rv, ftype)
  }
}


let checkStmtLet = func (s : *Stmt) -> Unit {
  let v = s.a[0]   // выражение
  let vx = s.a[1]  // сопряженное значения (ид)

  let value_id = vx.storage.id

  let t = getType(v)
  vx.type = t
}


// проверка типов для всех выражений входящих в состав стейтмента
let checkStmt = func (s : *Stmt) -> Unit {
  if s == Nil {return}
  let k = s.kind
  if k == StmtLet {
    checkStmtLet(s)
  } else if k == StmtExpr {
    getType(s.a[0])
  } else if k == StmtAssign {
    checkStmtAssign(s)
  } else if k == StmtBlock {
    checkBlock(s.b)
  } else if k == StmtIf {
    checkStmtIf(s)
  } else if k == StmtWhile {
    checkStmtWhile(s)
  } else if k == StmtReturn {
    checkStmtReturn(s)
  }
}


let checkBlock = func (b : *Block) -> Unit {
  let old_cblock = fctx.cblock
  fctx.cblock = b  // ! for

  // сперва чекаем все локальные функции
  let chkf = func ListForeachHandler {
    let fv = data to *Value
    checkFunc(fv)
  }
  list_foreach(b.local_functions, chkf, Nil)

  // затем чекаем собственно сам блок
  let chkb = func ListForeachHandler {
    let stmt = data to *Stmt
    checkStmt(stmt)
  }
  list_foreach(b.stmts, chkb, Nil)

  fctx.cblock = old_cblock  //!
}



let stmtBlock = func (b : *Block) -> *Stmt {
  let s = stmt_new(StmtBlock)
  s.b = b
  //s.ti = ti
  return s
}

let stmt_block = func StmtParser {
  let b = doblock()
  if b == Nil {return Nil}
  let s = stmtBlock(b)
  //s.b = b
  s.ti = ti
  return s
}


let stmt = func () -> *Stmt {
  let ti = &ctok().ti
  //printf("stmt\n")
  if match("let") {
    return dolet(True); sep()
  } else if match("{") {
    return stmt_block(ti)
  } else if match("if") {
    return stmt_if(ti)
  } else if match("while") {
    return stmt_while(ti)
  } else if match("return") {
    return stmt_ret(ti)
  } else if match("break") {
    return stmt_break(ti)
  } else if match("continue") {
    return stmt_cont(ti)
  } else if match("var") {
    dovardef(); sep()
    return Nil
  } else if match("type") {
    dotypedef(); sep()
    return Nil
  } else if match("goto") {
    return stmt_goto(ti)
  }

  // Maybe Label?
  // ставим точку восстановления
  // для того чтобы заглянуть наперед
  // пытаясь понять не label ли это
  let tkn = gett()
  if ctok().type == TokenId {
    let id = parse_id()
    let ti = &ctok().ti
    if match(":") {
      // yes, it's label
      setlab(id, ti)
      return Nil
    } else {
      sett(tkn)  // put token back
    }
  }

  // Maybe Expr?
  let sx = doexpr()
  if sx == Nil {
    stmt_restore()
  }
  return sx
}


let stmt_restore = func () -> Unit {
  skip()
}


let stmt_if = func StmtParser {
  let i = malloc(sizeof If) to *If
  i.cond = expr()
  match("\n")
  let ti_then_block = &ctok().ti
  need("{")
  i.then = stmt_block(ti_then_block)
  if match("else") {
    match("\n")
    let ti_else_branch = &ctok().ti
    if match("if") {
      i.else = stmt_if(ti_else_branch)
    } else {
      need("{")
      i.else = stmt_block(ti_else_branch)
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


let stmt_while = func StmtParser {
  fctx.loop = fctx.loop + 1
  let w = malloc(sizeof While) to *While
  w.cond = expr()
  match("\n")
  let ti_block = &ctok().ti
  need("{")
  w.stmt = stmt_block(ti_block)
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


let stmt_ret = func StmtParser {

  var v : *Value
  if separator() {
    v = Nil
  } else {
    let ti = &ctok().ti
    v = expr()
    if v == Nil {
      error("expected return expression", ti)
    }
  }

  let s = stmt_new(StmtReturn)
  s.a[0] = v
  s.ti = ti
  return s

fail:
  return Nil
}


let stmt_break = func StmtParser {
  sep()
  if fctx.loop == 0 {
    error("`break` outside any loop operator", Nil)
  }
  return stmt_new(StmtBreak)
}


let stmt_cont = func StmtParser {
  sep()
  if fctx.loop == 0 {
    error("`continue` outside any loop operator", Nil)
  }

  return stmt_new(StmtContinue)
}


let setlab = func (lab : Str, ti : *TokenInfo) -> Unit {
  let st = stmt_new(StmtLabel)
  st.l = lab
  st.ti = ti
  add_stmt(st)
}


let stmt_goto = func StmtParser {
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


let doexpr = func () -> *Stmt {
  let e = expr()

  if e == Nil {goto fail_with_restore}

  let assign_ti = &ctok().ti
  if not match("=") {
    // Just expression without assignation (e.g. call())
    let s = stmt_new(StmtExpr)
    s.a[0] = e
    s.ti = e.ti
    return s
  }

  /* It's assignation */

  let rx = expr()
  return assign(e, rx, assign_ti)

fail_with_restore:
  printf("stmt::fail_with_restore\n")
  printf("YYY = %s\n", &ctok().text[0])
  return Nil

fail:
  return Nil
}



// добавляет стейтмент в текущий блок
let add_stmt = func (s : *Stmt) -> Unit {
  if s != Nil {
    list_append(fctx.cblock.stmts, s)
  }
}


