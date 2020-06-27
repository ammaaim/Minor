


type ModuleContext = record {
  src : *Source      // current source

  type_index,
  value_index : Map  // индексы модуля
}


// parsing function context
type FuncContext = record {
  cfunc  : *Value  // current function
  cblock : *Block  // current block
  loop   : Nat32   // `we're in cycle` semaphore (used by break/continue)

  // генераторы уникальных имен идентификаторов
  locno,           // for local var
  strno,           // for local string
  arrno,           // for local literal array
  recno  : Nat32   // for local literal record
}


var asm0 : Assembly          // сущности идущие на печать попадают сюда

var mctx : ModuleContext     // current module context
var fctx : FuncContext       // current function context


