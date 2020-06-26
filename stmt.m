// stmt/main


// Compound Statement
type Block = record {
  parent  : *Block   // block-parent or Nil
  stmts   : *List    // list of statements

  type_index,
  value_index : Map  // local indexes

  // список в который попадают все локальные функции
  // для того чтобы их тела потом при check инге прочекать
  local_functions : *List
}


type If = record {
  cond : *Value
  then, else : *Stmt
}


type While = record {
  cond : *Value
  stmt : *Stmt
}



/*
 * Statement Kind
 */
type StmtKind = enum {
  StmtLet,
  StmtVarDef,
  StmtBlock,
  StmtExpr,
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
    a : [2]*Value  // expr, assign & return statements
    b : *Block     // block statement
    v : *VarDef    // var definition
    w : *While     // while statement
    i : *If        // if statement
    l : Str        // goto & label statement
//}

  ti : *TokenInfo
}



let stmt_new = func (kind : StmtKind) -> *Stmt {
  let s = malloc(sizeof Stmt) to *Stmt
  assert(s != Nil, "stmt_new")
  memset(s, 0, sizeof Stmt)
  s.kind = kind
  return s
}


let stmt_new_vardef = func (id : Str, t : *Type, init_value : *Value) -> *Stmt {
  let va = malloc(sizeof VarDef) to *VarDef
  va.id = id
  va.init_value = init_value
  va.type = t

  let s = stmt_new(StmtVarDef)
  s.v = va
//  s.ti = ti
  return s
}


// v - значение-выражение, xv - соппряженное значение с классом ClassPre
// когда мы говорим let x = a + b
// мы получаем вражение v = a + b - оно будет вычислено и загружено в регистр
// и выражение ValueId - vx у кторого класс Register и номер регистра = номеру
// регистра v. Сделано это так чтобы компилятор не печатал выражение снова
// а просто ставил регистр.
let stmt_new_let = func (v, xv : *Value) -> *Stmt {
  let s = stmt_new(StmtLet)
  s.a[0] = v
  s.a[1] = xv
  return s
}


let stmt_new_assign = func (l, r : *Value, ti : *TokenInfo) -> *Stmt {
  let s = stmt_new(StmtAssign)
  s.a[0] = l
  s.a[1] = r
  s.ti = ti
  return s
}


