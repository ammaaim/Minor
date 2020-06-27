// parser/parser


type StmtParser = (ti : *TokenInfo) -> *Stmt


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



let PATH_BUF_LEN = 512



let showTypes = func () -> Unit {
  let shwt = func MapForeachHandler {
    let len = strlen(k)
    printf("* %s", k)

    let maxnamelen = 40

    var i : Nat32
    i = 0
    while i < (maxnamelen - len) {
      printf(" ")
      i = i + 1
    }

    let t = v to *Type
    prttype(t)
    printf("\n")
  }
  map_foreach(&mctx.type_index, shwt, Nil)
}


let showValues = func () -> Unit {
  let shwv = func MapForeachHandler {
    let len = strlen(k)
    printf("VAL: %s", k)

    let maxnamelen = 40

    var i : Nat32
    i = 0
    while i < (maxnamelen - len) {
      printf(" ")
      i = i + 1
    }

    prttype((v to *Value).type)
    printf("\n")
  }
  map_foreach(&mctx.value_index, shwv, Nil)
}


let checkMain = func () -> Unit {
  let chk = func MapForeachHandler {

    let val = v to *Value

    getType(val)

    // проверяем все функции
    if val.type.kind == TypeFunction {
      checkFunc(val)
    }
  }
  map_foreach(&mctx.value_index, chk, Nil)
}


let checkFunc = func (f : *Value) -> Unit {
  // set context
  let old_cfunc = fctx.cfunc
  fctx.cfunc = f

  let b = f.block
  // extern function doesn't have the block
  if b != Nil {
    stmtBlockCheck(b)
  }

  // reset context
  fctx.cfunc = old_cfunc
}



// парсит модуль
let parse = func (src : *Source) -> Unit {
  // save module context
  let old_src = mctx.src

  mctx.src = src

  // do imports
  while True {
    skip_nl()
    if match("import") {
      parseImport()
    } else {
      break
    }
  }

  // do definitions
  while True {
    skip_nl()

    let tk = ctok()

    if match("let") {
      parseLet(False)
    } else if match("type") {
      parseTypedef()
    } else if match("extern") {
      parseExtern()
    } else if match("var") {
      parseVardef()
    } else {
      /* check flags */
      if match("arghack") {set("flagArghack", 1); continue}
      if match("nodecorate") {/*set("flagNoDecorate", 1);*/ continue}
      if eof() {break}

      error("unexpected token", &ctok().ti)

      // top-level sync strategy
      while True {
        let tk = ctok()
        if tk.type == TokenId {
          if strcmp("let", &tk.text to Str) == 0 or
             strcmp("var", &tk.text to Str) == 0 or
             strcmp("type", &tk.text to Str) == 0 {
            break
          }
        } else if tk.type == TokenEOF {
          break
        }
        skip()
      }
    }

    /* clear flags */
    set("flagArghack", 0)
    /*set("flagNoDecorate", 0)*/
  }

  // restore module context
  mctx.src = old_src
}


let parseImport = func () -> Unit {
  if ctok().type != TokenString {
    error("expected import string", &ctok().ti)
    skip()
    return
  }

  // get import string
  let imp_str = dup(&ctok().text[0] to Str)
  skip()

  // get current dir (for go back)
  let old_cdir = str_new(PATH_BUF_LEN)
  getcwd(old_cdir, PATH_BUF_LEN)

  let src = source_open(imp_str)

  if src == Nil {
    printf("when import = %s\n", imp_str)
    fatal("cannot import")
  }

  parse(src)

  chdir(old_cdir)  // go back
  free(imp_str)
  free(old_cdir)

  return

fail:
  free(imp_str)
  free(old_cdir)
}


// syntax: type <Id> = <Type>
let parseTypedef = func () -> Unit {
  let id = parseId()
  if id == Nil {return}

  need("=")

  var t : *Type
  t = parse_type(True)
  if t == Nil {return}

  if t.kind != TypeBasic {
    // если псеводним уже есть, не станем его перезатирать
    if t.aka == Nil {
      t.aka = id  // alias; необходим для принтера
    }
  }

  var tt : *Type
  tt = get_type(id)
  if tt != Nil {
    // define already declared type (TypeUndefined)
    if tt.kind == TypeUndefined {
      memcpy(tt, t, sizeof Type)
      asm_typedef_add(&asm0, id, t)
      return
    }
  }

  // bind type пока не умеет local
  bind_type_global(id, t)

  // creating data for printer
  asm_typedef_add(&asm0, id, t)
}

let parseLet = func (local : Bool) -> *Stmt {
  let ti = &ctok().ti
  let id = parseId()

  need("=")
  let v = expr()

  if id == Nil or v == Nil {return Nil}

  /*let ae = get_value_from_block(fctx.cblock, id)
  if ae != Nil {
    error("attempt to value redefinition", ti)
    rem("defined at: ", ae.defined_at)
    return Nil
  }*/

  rename(v, id)

  v.defined_at = ti

  ///getType(v)  // САНЯ ТЫ ДУРАК????? ЧТоЭТО ТУТ ДЕЛАеТ!!???

  if not local {
    def_global(id, v, ti)
    return Nil
  }

  // let Local

  if not value_is_const(v) {
    // v0 - значение сопряженное с результатом вычисления v
    // то есть он получит тот же регистр что и результат вычисления v
    // регистр он получит в принтере тк только там они проясняются

    let v0 = value_new_register(ValueId, Nil, Nil, Nil)
    v0.storage.id = id
    let s_pre = stmt_new_let(v, v0)
    s_pre.ti = ti
    bind_value_local(id, v0)
    return s_pre
  }

  bind_value_in_block(fctx.cblock, id, v)

  return Nil
}


let parseVardef = func () -> Unit {
  let fieldlist = parseField()

  let handle_fields = func ListForeachHandler {
    let f = data to *Field
    let id = f.id
    let type = f.type
    if fctx.cfunc != Nil {
      create_local_var(id, type, Nil)
    } else {
      create_global_var(id, type, Nil)
    }
  }
  list_foreach(fieldlist, handle_fields, Nil)
}


let parseExtern = func () -> Unit {
  let fl = parseField()
  let extern_decl = func ListForeachHandler {
    let f = data to *Field
    declare(f.id, f.type, f.ti)  // False = not local
  }
  list_foreach(fl, extern_decl, Nil)
}


// returns Str or Nil
let parseId = func () -> Str {
  let t = ctok()
  if t.type != TokenId {
    error("expected id", &t.ti)
    printf("tt = %d\n", t.type)
    printf("tx = %d\n", t.text[0])
    printf("instead '%s'\n", &t.text to Str)
    return Nil
  }

  // вообще использование данных из ti тут - наверно плохая идея
  // думаю это стоит убрать и делать str::dup()
  let s = str_new(t.ti.length to Nat32 + 1)
  strcpy(s, &t.text to Str)
  skip()
  return s
}


// returns List of Field
// syntax: <id> [,<id>] ':' <type>
let parseField = func () -> *List {
  let fieldlist = list_new()
  while True {
    let ti = &ctok().ti
    let id = parseId()
    let f = field_new(id, Nil, ti)
    list_append(fieldlist, f)
    if not match(",") {break}
    skip_nl()
  }

  need(":")

  let t = parse_type(True)
  if t == Nil {goto fail}

  // set #type field for all Field object in fieldlist list
  let set_type = func ListForeachHandler {
    let f = data to *Field
    let t = ctx to *Type
    f.type = t
  }
  list_foreach(fieldlist, set_type, t)

  return fieldlist

fail:
  return Nil
}


let module_context_init = func (ctx : *ModuleContext) -> Unit {
  map_init(&mctx.type_index)
  map_init(&mctx.value_index)
}


