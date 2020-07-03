// m2/parser/stmt/block


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


let stmtBlock = func StmtParser {
  let b = doblock()
  if b == Nil {return Nil}
  let s = stmtNew(StmtBlock, ti)
  s.b = b
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
      stmtAdd(s)
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


