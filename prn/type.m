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
    fprintf(fout, "{")
    need_comma = False
    let print_struct_field = func ListForeachHandler {
      if need_comma {
        fprintf(fout, ", ")
      }
      print_type((data to *Field).type, True, True)
      need_comma = True
    }
    list_foreach(t.record.fields, print_struct_field, Nil)
    fprintf(fout, "}")
  } else if k == TypeArray {
    if t.array.undefined {
      print_type(t.array.of, True, True); o("*")
    } else {
      fprintf(fout, "[%d x ", t.array.volume)
      print_type(t.array.of, True, True)
      fprintf(fout, "]")
    }
  } else if k == TypePointer {
    print_type(t.pointer.to, True, True); fprintf(fout, "*")
  } else if k == TypeFunction {
    if type_eq(t.function.to, typeUnit) {
      fprintf(fout, "void")
    } else {
      print_type(t.function.to, True, True);
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
    list_foreach(t.function.params, pt_print_param, Nil)
    if t.function.arghack {o(", ...")}
    fprintf(fout, ")");
    if func_as_ptr {
      fprintf(fout, "*")
    }
  } else if k == TypeEnum {
    fprintf(fout, "<UNDEFINED::%s>", t.undefined.id)
  }
}


