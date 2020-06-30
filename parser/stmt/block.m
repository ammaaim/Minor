// m2/parser/stmt/block



let stmtBlock = func StmtParser {
  let b = doblock()
  if b == Nil {return Nil}
  let s = stmt_new(StmtBlock)
  s.b = b
  s.ti = ti
  return s
}


let doblock = func () -> *Block {
  let slist = list_new()

  let b = malloc(sizeof Block) to *Block
  b.stmts = list_new()

  b.local_functions = list_new()

  map_init(&b.type_index)
  map_init(&b.value_index)

  b.parent = fctx.cblock
  fctx.cblock = b

  while not match("}") {
    skip_nl()

    if eof() {
      fatal("unexpected end-of-file")
      break
    }

    if match("}") {break}

    let s = stmt()
    if s != Nil {
      sep()
      add_stmt(s)
    }
  }

  // restore cblock
  fctx.cblock = b.parent
  return b
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


