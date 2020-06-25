// main


import "C"
import "str"
import "assert"
import "sys/path"
import "sys/fs"
import "data/list"
import "data/map"
import "src"
import "error"
import "type"
import "value/misc"
import "value/nat"
import "stmt"
import "prn/assembly"
import "value/2str"
import "type/print"
import "parser"
import "prn"
import "prn/init"
import "init"


let ARCH_DEFAULT = Arch_x64


let VERSION_MAJOR = 0
let VERSION_MINOR = 5



let main = func (argc : Int, argv : []Str) -> Int {
  printf("m2 v%d.%d\n", VERSION_MAJOR, VERSION_MINOR)
  /*if argv[1] == Nil {
    usage()
    exit(1)
  }*/

  init()

  // let's start!
  parse(source_open("main"))

  printf("lines: %d\n", lines)

  checkMain()

  //showValues()
  //showTypes()

  if errcnt > 0 {
    printf("error : %d\n", errcnt)
    return errcnt to Int
  }

  var arch : Arch
  arch = ARCH_DEFAULT  // set default architecture

  if argc > 1 {
    if strcmp(argv[1], "arch=cortex-m3") == 0 {
      printf("arch=cortex-m3\n")
      arch = Arch_ARM_CM3
    }
  }

  printer_init(arch, "main.ll")
  print_assembly(&asm0)

  return (errcnt != 0) to Int
}


let usage = func () -> Unit {
  printf("usage:\n")
  printf("  m2 <target>\n\n")
}



/* m2 Minor Compiler */
