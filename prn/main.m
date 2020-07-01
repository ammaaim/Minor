// m2/prn/main


import "common"
import "debug"
import "type"
import "stmt"
import "expr"
import "def"



let foreach_typedef = func ListForeachHandler {
  let td = data to *TypeDef
  typedef(td.id, td.type)
}


let foreach_constdef = func ListForeachHandler {
  let cd = data to *ConstDef

  // It can be StorageString or StorageArray or StorageRecord
  let storageClass = cd.value.storage.class

  if storageClass == StorageArray {
    arraydef(cd.id, cd.value.type.array.of, cd.value.storage.arr_data)
  } else if storageClass == StorageRecord {
    error("print::StorageRecord not implemented", Nil)
  }
}


let foreach_vardef = func ListForeachHandler {
  let vd = data to *VarDef
  vardef(vd.id, vd.type, vd.init_value)
}


let foreach_funcdef = func ListForeachHandler {
  let fd = data to *FuncDef
  funcdef(fd.id, fd.type, fd.block)
}


let foreach_stringdef = func ListForeachHandler {
  let sd = data to *StringDef
  stringdef(sd)
}


let print_assembly = func (a: *Assembly) -> Unit {
  printf("print_assembly: %s\n", a.name)

  list_init(&md_list)

  fprintf(fout, "\n; assembly: %s\n", a.name)

  o("\n\n;types:\n")
  list_foreach(a.types, foreach_typedef, Nil)
  o("\n\n;strings:\n")
  list_foreach(a.strings, foreach_stringdef, Nil)
  o("\n\n;consts:\n")
  list_foreach(a.consts, foreach_constdef, Nil)
  o("\n\n;vars:\n")
  list_foreach(a.vars, foreach_vardef, Nil)
  o("\n\n;funcs:\n")
  list_foreach(a.funcs, foreach_funcdef, Nil)

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
    fprintf(fout, "\n;  v.storage.class = %s", print_storage_class(vv.storage.class))
    fprintf(fout, "\n;  v.storage.reg = %d", vv.storage.reg)
    fprintf(fout, "\n;}\n")
  }
  map_foreach(index, vshow, Nil)
}


