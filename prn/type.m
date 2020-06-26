// prn/type


let printType = func (t : *Type, print_alias, func_as_ptr : Bool) -> Unit {
  assert(t != Nil, "prn/printType :: t = Nil\n")

  if print_alias and t.aka != Nil {
    fprintf(fout, "%%%s", t.aka)
    return
  }

  let k = t.kind
  if k == TypeBasic {
    fprintf(fout, "%%%s", t.basic.id)
  } else if k == TypeEnum {
    printType(typeEnum, True, True);
  } else if k == TypeRecord {
    printTypeRecord(&t.record)
  } else if k == TypeArray {
    printTypeArray(&t.array)
  } else if k == TypePointer {
    printTypePointer(&t.pointer)
  } else if k == TypeFunction {
    printTypeFunc(&t.function, func_as_ptr)
  }
}


let printTypeRecord = func (r : *TypeRecord) -> Unit {
  fprintf(fout, "{")
  need_comma = False
  let print_struct_field = func ListForeachHandler {
    if need_comma {
      fprintf(fout, ", ")
    }
    printType((data to *Field).type, True, True)
    need_comma = True
  }
  list_foreach(r.fields, print_struct_field, Nil)
  fprintf(fout, "}")
}


let printTypeArray = func (a : *TypeArray) -> Unit {
  let of = a.of
  if a.undefined {
    printType(of, True, True); o("*")
  } else {
    fprintf(fout, "[%d x ", a.volume)
    printType(of, True, True)
    fprintf(fout, "]")
  }
}


let printTypePointer = func (p : *TypePointer) -> Unit {
  printType(p.to, True, True)
  fprintf(fout, "*")
}


let printTypeFunc = func (f : *TypeFunc, func_as_ptr : Bool) -> Unit {
  if type_eq(f.to, typeUnit) {
    fprintf(fout, "void")
  } else {
    printType(f.to, True, True);
  }
  fprintf(fout, " (")
  need_comma = False
  let pt_print_param = func ListForeachHandler {
    if need_comma {
      fprintf(fout, ", ")
    }
    printType((data to *Field).type, True, True)
    need_comma = True
  }
  list_foreach(f.params, pt_print_param, Nil)
  if f.arghack {o(", ...")}
  fprintf(fout, ")");
  if func_as_ptr {
    fprintf(fout, "*")
  }
}


