// m2/parser/main


import "index"
import "define"
import "data"
import "type"

import "expr"
import "stmt"
import "prn/assembly"

import "value"




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


var mctx : ModuleContext     // current module context
var fctx : FuncContext       // current function context

var asm0 : Assembly          // сущности идущие на печать попадают сюда

let PATH_BUF_LEN = 512


var comments : Bool


let comment = func (c : Str) -> Unit {
  //printf("COM: %s\n", c)
}


let parse = func (src : *Source) -> Unit {
  // save module context
  let old_src = mctx.src

  mctx.src = src

  comments = True

  // do imports
  while True {
    skip_nl()

    let tk = ctok()
    if tk.type == TokenComment {
      comment(&tk.text[0] to Str)
      skip()
    } else if match("import") {
      parseImport()
    } else {
      break
    }
  }

  comments = False


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

      error("unexpected token2", &ctok().ti)
      printf("+++ %d\n", ctok().type)

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

  let t = parse_type(True)
  if t == Nil {return}

  if t.kind != TypeBasic {
    // если псеводним уже есть, не станем его перезатирать
    if t.aka == Nil {
      t.aka = id  // alias; необходим для принтера
    }
  }

  //printf("TYPEDEF: %s\n", id)
  // bind type пока не умеет local
  add_type(&mctx.type_index, id, t)

  // creating data for printer
  asmTypedefAdd(&asm0, id, t)
}


let parseLet = func (local : Bool) -> *Stmt {
  let ti = &ctok().ti
  let id = parseId()

  need("=")
  let v = expr()

  if id == Nil or v == Nil {return Nil}

  rename(v, id)

  v.defined_at = ti

  if not local {
    def_global(id, v, ti)
    return Nil
  }

  // let Local
  // важно чтобы undef переменные попадали сюда так как иначе
  // происходит просто связывание id с переменной а не с ее значением по месту
  // это слабое место, Саня, придумай как переделать let
  if not valueIsConst(v) or v.storage.class == StorageUndefined {
    // v0 - значение сопряженное с результатом вычисления v
    // то есть он получит тот же регистр что и результат вычисления v
    // регистр он получит в принтере тк только там они проясняются
    let v0 = valueNew(ValueId, StorageRegister, ti)
    v0.storage.id = id
    bind_value_local(id, v0)
    let xxx = stmt_new_let(v, v0, ti)
    return xxx
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
      create_local_var(id, type, Nil, f.ti)
    } else {
      create_global_var(id, type, Nil, f.ti)
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

  // set #type field for all Field object in fieldlist
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






/****************************************************************************/
/*                               UTILS                                      */
/****************************************************************************/


// возвращает ноду текущего токена
let gett = func () -> *Node {return mctx.src.token_node}
// устанавливает ноду текущего токена
let sett = func (tn : *Node) -> Unit {mctx.src.token_node = tn}

// skip current token
let skip = func () -> Unit {mctx.src.token_node = mctx.src.token_node.next}

// skip while NL
let skip_nl = func () -> Unit {while match("\n") {/* skip */}}



let ctok = func () -> *Token {
  let token = gett().data to *Token
  if not comments {
    if token.type == TokenComment {
      skip()
      return ctok()
    }
  }
  return token
}


let eof = func () -> Bool {return ctok().type == TokenEOF}

// дает ссылку на следующий токен НЕ сдвигая курсор с текущего
let nextok = func () -> *Token {
  if gett().next != Nil {
    return gett().next.data to *Token
  }
  return Nil
}


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


let skipto = func (s : Str) -> Unit {
  error("lex::skipto not implemented\n", Nil)
  printf("tok = '%s'\n", &ctok().text)
  printf("skip_target = %s\n", s)
  exit(1)
}


let match = func (s : Str) -> Bool {
  let tok = ctok()
  let tt = tok.type
  if tt == TokenString or tt == TokenEOF {
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

    let t = ctok()
    error("unexpected symbol", &t.ti)
    printf("expected %s instead %s\n", s, &t.text[0])  //
    printf("ctok.type = %d\n", t.type)
    exit(0)
  }
  return rc
}


