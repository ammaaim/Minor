// инициализация базовых структур компилятора
// производится лишь единожды перед запуском компиляции
// путем вызова функции init


import "type/init"
import "value/init"



let MINOR_LIB_ENV_VAR = "MINOR_LIB"


type Settings = record {
  cpuBitDepth,
  dataAlignment,
  charSize,
  enumSize,
  integerSize,
  pointerSize : Nat32
}



let init = func () -> Unit {
  // set project directory
  pdir = malloc(PATH_BUF_LEN)
  getcwd(pdir, PATH_BUF_LEN)

  liblist = list_new()

  let syslib_path = getenv(MINOR_LIB_ENV_VAR)
  if syslib_path to *Unit == Nil {
    fatal("enviroment variable MINOR_LIB not defined")
  }
  liblist_add(syslib_path)

  asm_init(&asm0, "<asm0>")

  globalTypeIndex = map_new()
  globalValueIndex = map_new()

  settings = map_new()

  // default values (64-bit target)
  set("cpuBitDepth", 64)
  set("dataAlignment", 8)
  set("charSize", 1)
  set("enumSize", 2)
  set("integerSize", 8)
  set("pointerSize", 8)

  set("flagArghack", 0)

  //handle_ini("cfg/sys64.cfg")

  // create built-in types
  type_init()

  // create built-in values (True, False, Nil)
  value_init()
}


// not used
let handle_ini = func (fname : Str) -> Unit {
  let tokens = tokenize(fname)
  sett(tokens.first)

  if tokens == Nil {
    error("parsing ini", Nil)
    return
  }

  while True {
    var d : Nat64

    skip_nl()

    if eof() {break}

    let key = parse_id()

    need("=")

    let tk = ctok()

    if tk.type == TokenNum {
      sscanf(&tk.text, "%lld", &d)
      skip()
    }

    printf("%s = %lld\n", key, d)

    set(key, d)
  }
}


