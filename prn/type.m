// prn/type


let print_type = func (t : *Type, print_alias, func_as_ptr : Bool) -> Unit {
  assert(t != Nil, "prn/print_type :: t = Nil\n")

  if print_alias and t.aka != Nil {
    fprintf(fout, "%%%s", t.aka)
    return
  }

  let k = t.kind
  if k == TypeBasic {
    fprintf(fout, "%%%s", t.basic.id)
  } else if k == TypeEnum {
    print_type(typeEnum, True, True);
  } else if k == TypeRecord {
    printTypeRecord(&t.record)
  } else if k == TypeArray {
    printTypeArray(&t.array)
  } else if k == TypePointer {
    print_type(t.pointer.to, True, True); fprintf(fout, "*")
  } else if k == TypeFunction {
    printTypeFunc(&t.function, func_as_ptr)
  } else if k == TypeEnum {
    fprintf(fout, "<UNDEFINED::%s>", t.undefined.id)
  }
}


let printTypeRecord = func (r : *TypeRecord) -> Unit {
  fprintf(fout, "{")
  need_comma = False
  let print_struct_field = func ListForeachHandler {
    if need_comma {
      fprintf(fout, ", ")
    }
    print_type((data to *Field).type, True, True)
    need_comma = True
  }
  list_foreach(r.fields, print_struct_field, Nil)
  fprintf(fout, "}")
}


let printTypeArray = func (a : *TypeArray) -> Unit {
  let of = a.of
  if a.undefined {
    print_type(of, True, True); o("*")
  } else {
    fprintf(fout, "[%d x ", a.volume)
    print_type(of, True, True)
    fprintf(fout, "]")
  }
}


let printTypeFunc = func (f : *TypeFunc, func_as_ptr : Bool) -> Unit {
  if type_eq(f.to, typeUnit) {
    fprintf(fout, "void")
  } else {
    print_type(f.to, True, True);
  }
  fprintf(fout, " (")
  need_comma = False
  let pt_print_param = func ListForeachHandler {
    if need_comma {
      fprintf(fout, ", ")
    }
    print_type((data to *Field).type, True, True)
    need_comma = True
  }
  list_foreach(f.params, pt_print_param, Nil)
  if f.arghack {o(", ...")}
  fprintf(fout, ")");
  if func_as_ptr {
    fprintf(fout, "*")
  }
}


