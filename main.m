// m2/main


import "C"
import "str"
import "assert"
import "sys/path"
import "sys/fs"
import "data/list"
import "data/map"
import "cfg"
import "settings"
import "src"
import "error"
import "type"
import "parser"
import "prn"
import "init"
import "check"


export "main"


let ARCH_DEFAULT = Arch_x64


let VERSION_MAJOR = 0
let VERSION_MINOR = 5



let main = func (argc : Int, argv : []Str) -> Int {
  printf("m2 v%d.%d\n", VERSION_MAJOR, VERSION_MINOR)

  init()

  parseArgs(argc, argv)

  let srcinfo = getSourceInfo("main")
  let src = openSource(srcinfo)

  if src == Nil {return -1}

  // let's start!
  let main_module = parse(src)

  printf("lines: %d\n", lines)

  checkModule(main_module)

  //showValues()
  //showTypes()

  if errcnt > 0 {
    printf("error : %d\n", errcnt)
    return errcnt to Int
  }

  printer_init(arch, "main.ll")
  print_assembly(&asm0)
  return (errcnt != 0) to Int
}


let parseArgs = func (argc : Int, argv : []Str) -> Unit {
  var argp : Int
  argp = 1
  while argp < argc {
    let arg = argv[argp]
    //printf("parse arg: %s\n", arg)
    if strncmp(arg, "-arch=", 6) == 0 {
      if strcmp(&arg[6] to Str, "cortex-m3") == 0 {
        arch = Arch_ARM_CM3
      } else if strcmp(&arg[6] to Str, "x64") == 0 {
        arch = Arch_x64
      } else {
        fatal("unknown architecture")
      }
    }

    if strncmp(arg, "-lib=", 5) == 0 {
      liblist_add(&arg[5] to Str)
    }

    if strncmp(arg, "-conf=", 6) == 0 {

      readConfig(&arg[6] to Str)
    }

    argp = argp + 1
  }
}


let usage = func () -> Unit {
  printf("usage:\n")
  printf("  -lib=/path/to/lib/dir\n")
  printf("  -arch=x86, cortex-m3\n")
  printf("  m2 <target>\n\n")
}



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
  map_foreach(&mctx.index.types, shwt, Nil)
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
  map_foreach(&mctx.index.values, shwv, Nil)
}


/* m2 Minor Compiler */
