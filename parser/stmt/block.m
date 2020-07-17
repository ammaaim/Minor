// m2/parser/stmt/block


// Compound Statement
type Block = record {
  parent  : *Block   // block-parent or Nil
  stmts   : List    // list of statements

  type_index,
  value_index : Map  // local indexes

  // список в который попадают все локальные функции
  // для того чтобы их тела потом при check инге прочекать
  local_functions : List

  ti : *TokenInfo
}


let stmtBlock = func StmtParser {
  let b = doblock(fctx.cblock)
  if b == Nil {return Nil}
  b.ti = ti  // ti самого блока
  let s = stmtNew(StmtBlock, ti)
  s.b = b
  return s
}


let block_new = func (parent : *Block) -> *Block {
  let b = malloc(sizeof Block) to *Block
  assert(b != Nil, "block_new : b != Nil")
  memset(b, 0, sizeof Block)

  b.parent = parent

  map_init(&b.type_index)
  map_init(&b.value_index)
  map_init(&b.stmts)
  map_init(&b.local_functions)

  return b
}


let doblock = func (parent : *Block) -> *Block {
  let b = block_new(parent)

  // save cblock
  let _fctx_cblock_prev = fctx.cblock
  fctx.cblock = b

  while not match("}") {
    skip_nl()

    if eof() {
      fatal("unexpected end-of-file")
      break
    }

    if match("}") {break}

    let s = stmtParse()

    if s != Nil {
      sep()
      stmtAdd(s)
    }
  }

  // restore cblock
  fctx.cblock = _fctx_cblock_prev
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
  list_foreach(&b.local_functions, chkf, Nil)

  // secondly check the block statements
  let chkb = func ListForeachHandler {
    let stmt = data to *Stmt
    stmtCheck(stmt)
  }
  list_foreach(&b.stmts, chkb, Nil)

  // reset context
  fctx.cblock = old_cblock
}


