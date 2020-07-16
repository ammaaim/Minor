// m2/prn/main


import "common"
import "debug"
import "type"
import "stmt"
import "expr"
import "def"
import "init"



let print_assembly = func (a: *Assembly) -> Unit {
  printf("print_assembly: %s\n", a.name)

  list_init(&md_list)

  fprintf(fout, "\n; assembly: %s\n", a.name)

  // print Types
  o("\n\n;types:\n")
  let foreach_typedef = func ListForeachHandler {
    let ai = data to *Definition
    let td = &ai.typedef
    typedef(ai.id, td.type)
  }
  list_foreach(a.types, foreach_typedef, Nil)


  // print Strings
  o("\n\n;strings:\n")
  let foreach_stringdef = func ListForeachHandler {
    let ai = data to *Definition
    let sd = &ai.stringdef
    if sd.data == Nil {
      printf("NIL: %s\n", ai.id)
    }
    stringdef(ai.id, sd.len, sd.data)
  }
  list_foreach(a.strings, foreach_stringdef, Nil)

  // print Arrays
  o("\n\n;arrays:\n")
  let foreach_arraydef = func ListForeachHandler {
    let ai = data to *Definition
    let ad = &ai.arraydef
    arraydef(ai.id, ad.type, ad.values)
  }
  list_foreach(a.arrays, foreach_arraydef, Nil)

  // print Variables
  o("\n\n;vars:\n")
  let foreach_vardef = func ListForeachHandler {
    let ai = data to *Definition
    let vd = &ai.vardef
    vardef(ai.id, vd.type, vd.init_value)
  }
  list_foreach(a.vars, foreach_vardef, Nil)

  // print Functions
  o("\n\n;funcs:\n")
  let foreach_funcdef = func ListForeachHandler {
    let ai = data to *Definition
    let fd = &ai.funcdef
    funcdef(ai.id, fd.type, fd.block)
  }
  list_foreach(a.funcs, foreach_funcdef, Nil)

  // print Metadata
  o("\n\n;metadata:\n")
  print_metadata_list(&md_list)
}


type Arch = enum {Arch_x64, Arch_ARM_CM3}


let print_head = func (a : Arch) -> Unit {
  if a == Arch_x64 {
    fprintf(fout, "target datalayout = \"e-m:o-i64:64-f80:128-n8:16:32:64-S128\"\n")
    fprintf(fout, "target triple = \"x86_64-apple-macosx10.14.0\"\n")
  } else if a == Arch_ARM_CM3 {
    fprintf(fout, "target datalayout = \"e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\"\n")
    fprintf(fout, "target triple = \"thumbv7em-unknown-none-eabi\"\n")
  }
  fprintf(fout, "\n")
}


let print_type_index = func (index : *Map) -> Unit {
  fprintf(fout, "\n;type_index:\n")
  let tshow = func (k : *Unit, v : *Unit, ctx : *Unit) -> Unit {
    fprintf(fout, ";* %s -> %p\n", k to Str, v)
  }
  map_foreach(index, tshow, Nil)
}


// печатаем листинг локального индекса в комментах LLVM
let print_value_index = func (index : *Map) -> Unit {
  fprintf(fout, "\n;value_index:\n")
  let vshow = func (k : *Unit, v : *Unit, ctx : *Unit) -> Unit {
    let vv = v to *Value
    fprintf(fout, "\n;#%s -> %p {", k, vv);
    fprintf(fout, "\n;  v.kind = %s", print_value_kind(vv.kind))
    fprintf(fout, "\n;}\n")
  }
  map_foreach(index, vshow, Nil)
}


