// m2/parser/main


import "index"
import "name"
import "expr"
import "stmt"
import "prn/assembly"
import "type"
import "value"
import "import"



type ModuleContext = record {
  src   : *Source
  index : Index
}


type Module = ModuleContext


// parsing function context
type FuncContext = record {
  id     : Str     // for local strings prefix
  cfunc  : *Value  // current function
  cblock : *Block  // current block
  loop   : Nat32   // `we're in cycle` semaphore (used by break/continue)

  // генераторы уникальных имен идентификаторов
  locno,           // for local var unical reg
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
    } else if match("export") {
      parseExport()
    } else {
      break
    }
  }

  comments = False

  // parse_type_func needs this attributes!
  set("flagArghack", 0)

  // do definitions
  while True {

    skip_nl()

    let tk = ctok()

    if match("let") {
      parseLet()
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


let parseExport  = func () -> Unit {
  if ctok().type != TokenString {
    error("expected export string", &ctok().ti)
    skip()
    return
  }

  // get import string
  let exp_str = dup(&ctok().text[0] to Str)
  skip()

  printf("export: %s\n", exp_str)

  return

fail:
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

  import(imp_str)

  return

fail:
}


// syntax: type <Id> = <Type>
let parseTypedef = func () -> Unit {
  let id = parseId()
  if id == Nil {return}

  need("=")

  let t = parse_type()
  if t == Nil {return}

  if t.kind != TypeBasic {
    // если псеводним уже есть, не станем его перезатирать
    if t.aka == Nil {
      t.aka = id  // alias; необходим для принтера
    }
  }

  // bind type пока не умеет local
  add_type(&mctx.index.types, id, t)

  // creating data for printer
  asmTypedefAdd(&asm0, id, t)
}



/*
  1. Функция создается анонимно
  2. Возвращается значение ValueGlobalConst со ссылкой на функцию def
  3. В случае let к этому значению привязывается <id> и таких <id> может быть много.
  4. При этом в модуль добавляется alias <id> <org>
*/
let parseLet = func () -> *Stmt {
  let ti = &ctok().ti
  let id = parseId()

  need("=")

  let v = expr()

  if id == Nil or v == Nil {return Nil}

  v.defined_at = ti

  // global?
  if fctx.cfunc == Nil {
    globalLet(id, v, ti)
    return Nil
  }

  // let Local
  // важно чтобы undef переменные попадали сюда так как иначе
  // происходит просто связывание id с переменной а не с ее значением по месту
  // это слабое место, Саня, придумай как переделать let
  let k = v.kind
  if k != ValueGlobalConst and
     k != ValueImmediate or
     k == ValueUndefined {

    let v0 = valueNew(ValueLocalConst, ti)
    bind_value_local(id, v0)

    let se = stmt_expr_new(v, ti)
    v0.expr = se.e
    return se
  }

  bind_value_in_block(fctx.cblock, id, v)
  return Nil
}



let globalLet = func (id : Str, v : *Value, ti : *TokenInfo) -> Unit {
  // это уйдет отсюда когда сдклаю export_name, пока так #TODO
  if strcmp(id, "main") == 0 {
    let ai = v.def
    if ai != Nil {
      // Да потому что нету никаих имен! Нету ваще!
      // Minor - язык в котором и типы и значения анонимны.
      // let не создает новое значение - он просто привязывает к АНОНИМНОМУ значению
      // еще один идентификатор. Это просто Map. У функции или строки например
      // нет никакого имени! Если нужно привязать экспортируемые символы к значению
      // нужно юзать прагмы. Тут это сделано по умолчанию лишь для "main".
      asmAliasAdd(&asm0, id, v.type, ai.id)
    }
  }

  // Тут мы могли бы просто связать id со значением но есть маленький нюанс:
  // Если идентификатор использовался раньше чем был определен
  // (а такое часто бывает с функциями) то нам не нужно создавать новое значение,
  // а нужно определить существующее ValueUndefined переписав его поля
  // (кроме поля declared_at)
  let ae = get_value_global(id)

  if ae == Nil {
    // not exists, creating new
    bind_value_global(id, v)
    return
  }

  // exist

  if ae.kind != ValueUndefined {
    error("attempt to redefinition", ti)
    return
  }

  // скопируем в ae все из v кроме поля declared_at
  let declared_at = ae.declared_at
  *ae = *v
  ae.declared_at = declared_at
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
    declare(f.id, f.type, f.ti)
  }
  list_foreach(fl, extern_decl, Nil)
}

// used only by doextern
// глобально декларируем новую сущность о которой не известно ничего кроме типа и id
let declare = func (id : Str, type : *Type, ti : *TokenInfo) -> Unit {
  if id == Nil or type == Nil {return}

  // already exist?
  let ae = get_value_global(id)
  if ae != Nil {
    error("attempt to redeclaration", ti)
    rem("declared at: ", ae.declared_at)
    return
  }

  // Создаем знчение и добавляем его в индекс
  let v = valueNew(ValueUndefined, ti)
  v.type = type
  v.type = type
  v.declared_at = ti

  if type.kind == TypeFunction {
    v.kind = ValueGlobalConst
    v.def = asmFuncAdd(&asm0, id, type, Nil)
  }

  bind_value_global(id, v)
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

  let t = parse_type()
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





let create_local_var = func (id : Str, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value {
  // создадим фейковый value который будет занесен в индекс
  // и будет ссылаться на переменную (просто нести тот же id)
  let v = valueNew(ValueLocalVar, ti)
  v.type = t

  bind_value_local(id, v)

  // добавляем в код функции стейтмент с определением этой переменной
  let vd = stmt_new_vardef(id, t, init_value, Nil)
  stmtAdd(vd)
  v.vardef = vd.v

  if init_value != Nil {
    // добавляем в код функции стейтмент
    // с инициализацией этой переменной
    stmtAdd(stmt_new_assign(v, init_value, Nil))
  }

  return v
}


let create_global_var = func (id : Str, t : *Type, init_value : *Value, ti : *TokenInfo) -> Unit {
  // создадим фейковый value который будет занесен в индекс
  // и будет ссылаться на переменную (просто нести тот же id)
  let v = valueNew(ValueGlobalVar, ti)
  v.def = asmVarAdd(&asm0, id, t, init_value)
  v.type = t
  bind_value_global(id, v)
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
    skip()
  }
  return rc
}


