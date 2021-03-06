// m2/src/lexer


import "lib/ascii"
import "token"


let EOF = 0  // getcc returns EOF when file is over

let TOKEN_MAX_LEN = 256


/*
 * Lexer state record
 */
type State = record {
  fd     : Int
  type   : TokenType
  token  : [TOKEN_MAX_LEN]Nat8

  pos    : Nat16  // position of current char in line
  length : Nat32  // token length
  line   : Nat32  // token line number
  start  : Nat16  // token start position in line
  file   : Str    // current source file
  ch     : Nat8   // 'putback' storage
}


/*
 * Global Lexer State
 */
var lstate : State


// счетчик количества отсканированных строк
// (!) для всех ресурсов сборки
var lines : Nat



let lex_init = func (fname : Str) -> Unit {
  if not exists(fname) {
    printf("module=%s\n", fname)
    fatal("module not exist")
  }

  lstate.fd = open(fname, O_RDONLY)
  lstate.file = fname
  lstate.line = 1
  lstate.pos = 1
}


let getcc = func () -> Nat8 {
  var c : Nat8
  if lstate.ch != 0 {
    c = lstate.ch
    lstate.ch = 0
  } else {
    let len = read(lstate.fd, &c, 1)
    if len == 0 {
      return EOF
    }
    lstate.pos = lstate.pos + 1
  }
  return c
}


type Rule = (c : Nat8) -> Bool


// fill token while `rule` is true
let fill = func (rule : Rule) -> Unit {
  while True {
    let c = getcc()
    if c == EOF {
      fatal("unexpected end-of-file")
      exit(1)
    }

    if rule(c) {
      lstate.token[lstate.length] = c
      if (lstate.length >= (TOKEN_MAX_LEN - 1)) {
        fatal("too long token\n")
      }
      lstate.length = lstate.length + 1
    } else {
      lex_putback(c)
      lstate.token[lstate.length] = 0
      break
    }
  }
}


// Rules
let blank = func Rule {return c == " "[0] or c == "\t"[0]}
let minus = func Rule {return c == ">"[0]}
let slash = func Rule {return c == "/"[0] or c == "*"[0]}
let rarrow = func Rule {return c == ">"[0] or c == "="[0]}
let larrow = func Rule {return c == "<"[0] or c == "="[0]}
let eq = func Rule {return c == "="[0]}
let bang = func Rule {return c == "="[0]}
let id = func Rule {return isalnum(c) or c == "_"[0]}
let digit = func Rule {return isalnum(c)}
let cpp_com = func Rule {return c != "\n"[0]}

/*let c_com = func Rule {
  printf("%c", c)
  if c == "*"[0] {
    //  WE CANNOT WRITE TO PARAM!
    c = getcc()
    if c == "/"[0] {
      //c = getcc()
      return False
    }
    lex_putback(c)
  }
  return True
}*/


/*
  Здесь я всегда выдаю комментарии
  а уже парсер при парсинге в телах включает skip_comment
  а так - комментарии это токены!
*/

let gettoken = func () -> TokenType {
  var c : Nat8

again:

  /* если ПРЕДЫДУЩИЙ токен был NL - инкрементим номер строки */
  if lstate.type == TokenNL {
    linecnt()
    lstate.pos = 0
  }

  lstate.type = TokenEOF
  lstate.length = 0

  /* skip blanks and get first char */
  while True {
    c = getcc()
    if not blank(c) {break}
  }

  // фиксируем стартовую позицию нового токена
  lstate.start = lstate.pos

  lstate.token[0] = c
  lstate.length = 1

  if isalpha(c) or c == "_"[0] {
    /*** IDENTIFIERS ***/
    lstate.type = TokenId
    fill(id)
  } else if isdigit(c) {
    /*** NUMBERS ***/
    lstate.type = TokenNum
    fill(digit)
  } else {
    /*** SYMBOLS, COMMENTS, STRINGS ***/
    lstate.type = TokenSym
    if c == "\n"[0] {
      lstate.type = TokenNL
    } else if c == "="[0] {
      fill(eq)
    } else if c == "-"[0] {
      fill(minus)
    } else if c == "/"[0] {
      xslash()
    } else if c == ">"[0] {
      fill(rarrow)
    } else if c == "<"[0] {
      fill(larrow)
    } else if c == "!"[0] {
      fill(bang)
    } else if c == "#"[0] {
      lstate.type = TokenHash
      fill(id)
    } else if c == "\""[0] {
      string()
    } else if c == EOF {
      lstate.type = TokenEOF
      lstate.token[0] = 0
      lstate.length = 0
      return TokenEOF
    } else {
      // Symbols like +, -, etc.
    }
  }

  lstate.token[lstate.length] = 0
  return lstate.type
}


/* xslash вернет False в том случае если он обработал C-style comment
   и ему нечего вернуть. => нам нужно опять сходить за токеном */
let xslash = func () -> Unit {
  var c : Nat8
  let nextok = getcc()  // maybe '/' or '*' ?
  if nextok == "/"[0] {
    lex_putback(nextok)
    fill(cpp_com)
    lstate.type = TokenComment

  } else if nextok == "*"[0] {
    /*c = getcc()
    //printf("T_C: %c\n", c)
    printf(">>\n")
    lstate.length = 0
    fill(c_com)
    lstate.type = TokenComment
    printf("<<\n")
    //printf("ET_C: %c\n", c)
    printf("COM = %s\n", &lstate.token[0])
*/
    lstate.type = TokenComment
    lstate.token[0] = 0
    while True {
      c = getcc()

      if c == EOF {
        fatal("unexpected end-of-file")
      } else if c == "*"[0] {
        c = getcc()
        if c == "/"[0] {
          // C-style comment ended
          lstate.token[lstate.length] = 0
          return
        } else {
          lex_putback(c)
        }
      } else if c == "\n"[0] {
        linecnt()
      }
      // эти комментарии бывают ООЧЕНь большими
      // и размещать их в токене просто так не получится.
      // нужно писать в буфер
      //printf("%c", c)
      //lstate.token[lstate.length] = c
      //lstate.length = lstate.length + 1
    }
  } else {
    lex_putback(nextok)  // this is not a comment
    fill(slash)
  }
}


let string = func () -> Unit {
  var c : Nat8
  lstate.type = TokenString
  lstate.length = 0  // skip first "

  while True {
    c = getcc()
    if c == "\""[0] {
      break
    } else if c == EOF {
      fatal("unexpected end-of-file")
    } else {
      if c == "\\"[0] {
        /* ESACPE-symbols */
        c = getcc()
        if c == "n"[0] {
          c = "\n"[0]
        } else if c == "r"[0] {
          c = "\r"[0]
        } else if c == "t"[0] {
          c = "\t"[0]
        } else if c == "\\"[0] {
          c = "\\"[0]
        } else if c == "\""[0] {
          c = "\""[0]
        } else if c == "a"[0] {
          c = "\a"[0]
        } else if c == "b"[0] {
          c = "\b"[0]
        } else if c == "v"[0] {
          c = "\v"[0]
        } else if c == "0"[0] {
          c = 0
        }
      }
    }

    if lstate.length >= (TOKEN_MAX_LEN - 1) {
      fatal("too long string\n")
    }

    lstate.token[lstate.length] = c
    lstate.length = lstate.length + 1
  }
}


// токенизируем файл в список (включая TokenEOF)
let tokenize = func (filename : Str) -> *List /*of Token*/ {
  let tokens = list_new()
  lex_init(filename)

  while True {
    let tt = gettoken()
    let len = lstate.length to Nat16 + 1
    let t = malloc(sizeof Token + len to Nat32) to *Token
    t.type = lstate.type
    t.ti.length = lstate.length to Nat16
    t.ti.file = lstate.file
    t.ti.line = lstate.line
    t.ti.start = lstate.start
    memcpy(&t.text, &lstate.token, len to Size_T)
    t.text[len + 1] = 0
    list_append(tokens, t)
    if tt == TokenEOF {break}
  }

  lines = lines + lstate.line

  return tokens
}


let linecnt = func () -> Unit {lstate.line = lstate.line + 1}
let lex_putback = func (c : Nat8) -> Unit {lstate.ch = c}


