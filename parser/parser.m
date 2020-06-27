// parser/parser


type StmtParser = (ti : *TokenInfo) -> *Stmt


type ModuleContext = record {
  src : *Source      // current source

  type_index,
  value_index : Map  // индексы модуля
}


type FuncContext = record {
  cfunc  : *Value  // current function
  cblock : *Block  // current block
  loop   : Nat32   // `we're in cycle` semaphore (for break/continue)

  // генераторы идентификаторов
  locno,           // для локальной переменной
  strno,           // для локальной строки
  arrno,           // для локального массива
  recno  : Nat32   // для локальной записи
}


var asm0 : Assembly          // сущности идущие на печать попадают сюда

var globalTypeIndex,
    globalValueIndex : *Map  // base indexes (for builtin entities)

var mctx : ModuleContext     // current module context
var fctx : FuncContext       // current function context


var settings : *Map


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
    //prttype(getType(v to *Value))
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
  fctx.cfunc = f  // for get_value

  let b = f.block
  // extern function cannot have the block
  if b != Nil {
    stmtBlockCheck(b)
  }

  // reset context
  fctx.cfunc = old_cfunc
}



let set = func (id : Str, v : Nat64) -> Unit {
  let vx = malloc(sizeof Nat64) to *Nat64
  *vx = v

  let oldv = map_get(settings, id)
  if oldv == Nil {
    free(oldv)
    map_append(settings, id, vx)
  } else {
    map_reset(settings, id, vx)
  }
}

let get = func (id : Str) -> Nat64 {
  let vx = map_get(settings, id) to *Nat64
  return *vx
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
      doimport()
    } else {
      break
    }
  }

  // do definitions
  while True {
    skip_nl()

    let tk = ctok()

    if match("let") {
      dolet(False)
    } else if match("type") {
      dotypedef()
    } else if match("extern") {
      doextern()
    } else if match("var") {
      dovardef()
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


let doimport = func () -> Unit {
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
let dotypedef = func () -> Unit {
  let id = parse_id()
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


let dovardef = func () -> Unit {
  let fieldlist = parse_field()

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


let dolet = func (local : Bool) -> *Stmt {
  let ti = &ctok().ti
  let id = parse_id()

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


let doextern = func () -> Unit {
  let fl = parse_field()
  let extern_decl = func ListForeachHandler {
    let f = data to *Field
    declare(f.id, f.type, f.ti)  // False = not local
  }
  list_foreach(fl, extern_decl, Nil)
}



// returns Str or Nil
let parse_id = func () -> Str {
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
// syntax: <id> ':' <type>
let parse_field = func () -> *List {
  let fieldlist = list_new()
  while True {
    let ti = &ctok().ti
    let id = parse_id()
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


// возвращает ноду текущего токена
let gett = func () -> *Node {return mctx.src.token_node}
// устанавливает ноду текущего токена
let sett = func (tn : *Node) -> Unit {mctx.src.token_node = tn}
let ctok = func () -> *Token {return gett().data to *Token}
let eof = func () -> Bool {return ctok().type == TokenEOF}
/*let nextok = func () -> *Token {
  if gett().next != Nil {
    return gett().next.data to *Token
  }
  return Nil
}*/


/*
 * Вызывается тогда, когда ожидаем обнаружить символ-разделитель.
 * Если все ок и разделитель присутствует - возвращает 1
 * Если разделителя нет - выводит ошибку и возвращает 0
 */
let sep = func () -> Bool {
  let ct = ctok()
  let s = separator()

  if s == False {
    error("expected separator", &ct.ti)
  }

  return s
}


let separator = func () -> Bool {
  let ct = ctok().text[0]
  if ct == "\n"[0] or ct == ";"[0] {skip(); return True}
  // если за нами закрывается скобка - сепаратор не нужен
  if ct == "}"[0] or ct == ")"[0] {return True}
  return False
}


// skip current token
let skip = func () -> Unit {mctx.src.token_node = mctx.src.token_node.next}

// skip while NL
let skip_nl = func () -> Unit {while match("\n") {/* skip */}}


let skipto = func (s : Str) -> Unit {
  error("lex::skipto not implemented\n", Nil)
  printf("tok = '%s'\n", &ctok().text)
  printf("skip_target = %s\n", s)
  exit(1)
}


let match = func (s : Str) -> Bool {
  let tok = ctok()

  if tok.type == TokenString or tok.type == TokenEOF {
    return False
  }

  let rc = strcmp(s, &tok.text to Str) == 0

  if rc {skip()}

  return rc
}


let need = func (s : Str) -> Bool {
  let rc = match(s)
  if rc == False {
    /*if t[0] == "\n"[0] {
      t = "NL";
    }*/

    var t : *Token
    t = ctok()
    error("unexpected symbol", &t.ti)
    printf("expected %s instead %s\n", s, &t.text[0])  //
    printf("ctok.type = %d\n", t.type)
    exit(0)
  }
  return rc
}


let module_context_init = func (ctx : *ModuleContext) -> Unit {
  map_init(&mctx.type_index)
  map_init(&mctx.value_index)
}


