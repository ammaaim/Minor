// m2/init


let MINOR_LIB_ENV_VAR = "MINOR_LIB"



let init = func () -> Unit {
  // set project directory
  pdir = malloc(PATH_BUF_LEN)
  getcwd(pdir, PATH_BUF_LEN)

  list_init(&liblist)

  let syslib_path = getenv(MINOR_LIB_ENV_VAR)

  if syslib_path to *Unit == Nil {
    fatal("enviroment variable MINOR_LIB not defined")
  }

  liblist_add(syslib_path)

  asmInit(&asm0, "<asm0>")

  map_init(&globalTypeIndex)
  map_init(&globalValueIndex)

  settings = map_new()

  // default values (for 64-bit target)
  cfg.cpuBitDepth = 64
  cfg.dataAlignment = 8
  cfg.charSize = 1
  cfg.enumSize = 2
  cfg.integerSize = 8
  cfg.pointerSize = 8

  //handle_ini("cfg/sys64.cfg")

  // create built-in types
  type_init()

  // create built-in values (True, False, Nil)
  value_init()

  arch = ARCH_DEFAULT
}


// not used
let readConfig = func (fname : Str) -> Unit {
  printf("readConfig = %s\n", fname)

  let tokens = tokenize(fname)
  let config_source = src_new("config", tokens)

  let old_src = mctx.src
  mctx.src = config_source

  while True {
    var d : Nat64

    skip_nl()

    if eof() {break}

    let key = parseId()

    need("=")

    let tk = ctok()

    if tk.type == TokenNum {
      sscanf(&tk.text, "%lld", &d)
      skip()
    }

    printf("%s = %lld\n", key, d)

    set(key, d)
  }

  mctx.src = old_src
}


