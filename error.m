
// счетчики ошибок и предупреждений
var warncnt, errcnt : Nat


/*
 * Console Text Color Codes
 */
let CRED  = 31
let CGREEN = 32
let CYELLOW = 33
let CBLUE = 34
let CMAGENTA = 35
let CCYAN = 36


let CINFO = CCYAN
let CWARNING = CBLUE
let CERROR = CMAGENTA
let CFATAL = CRED


let MAXERR = 20


let info = func (s : Str) -> Unit {
  printf("\n%c[0;%dminfo:%c[0m %s", 27, CINFO, 27, s)
}


let warning = func (s : Str, ti : *TokenInfo) -> Unit {
  if ti != Nil {
    printf("\n%c[0;%dmwarning%c[0m (%s:%d) : %s", 27, CWARNING, 27, ti.file, ti.line/*, ti.start*/, s)
    show(ti)
    printf("\n")
  } else {
    printf("\n%c[0;%dmwarning:%c[0m %s", 27, CWARNING, 27, s)
  }

  warncnt = warncnt + 1
}


let error = func (s : Str, ti : *TokenInfo) -> Unit {
  if ti == Nil {
    printf("\n%c[0;%dmerror:%c[0m %s", 27, CERROR, 27, s)
  } else {
    printf("\n%c[0;%dmerror%c[0m (%s:%d) : %s", 27, CERROR, 27, ti.file, ti.line/*, ti.start*/, s)
    show(ti)
    printf("\n")
  }

  errcnt = errcnt + 1

  if errcnt > MAXERR {
    printf("*** STOP ***\n")
    exit(-1)
  }
}

let rem = func (s : Str, ti : *TokenInfo) -> Unit {
  printf("\n%c[0;%dm%s%c[0m", 27, CYELLOW, s, 27)
  if ti != Nil {
    show(ti)
    printf("\n")
  }
}



// get line from source file (for error displaying)
let gline = func (line : []Nat8, ti : *TokenInfo) -> Unit {
  let fd = open(ti.file, O_RDONLY)
  if fd < 0 {
    return
  }

  let lineno = ti.line

  var c : Nat8
  var linecnt, pos : Nat32
  linecnt = 1
  pos = 0
  while True {
    if linecnt == lineno {
      while True {
        if read(fd, &c, 1) == 0 {goto exitt}
        line[pos] = c
        pos = pos + 1
        if c == "\n"[0] {
          goto exitt
        }
      }
    } else {
      read(fd, &c, 1)
      if c == "\n"[0] {
        linecnt = linecnt + 1
      }
    }
  }

exitt:
  close(fd)
  line[pos] = 0
  return
}


let show = func (ti : *TokenInfo) -> Unit {
  printf("\n")
  var line : [512]Nat8
  memset(&line[0], 0, 512)
  gline(&line[0] to []Nat8, ti)
  printf("%s", &line[0])
  var vpos : Nat16
  vpos = 1
  while vpos < ti.start {
    printf(" ")
    vpos = vpos + 1
  }
  printf("%c[0;%dm^%c[0m", 27, CGREEN, 27)
}


let fatal = func (s : Str) -> Unit {
  printf("%c[0;%dmfatal:%c[0m %s\n", 27, CFATAL, 27, s)
  exit(1)
}


