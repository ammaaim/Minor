// m2/parser/main

import "index"
import "static"
import "check"
import "parser"
import "define"
import "data"
import "type"
import "expr"
import "stmt"




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


