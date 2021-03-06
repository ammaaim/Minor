// m2/type/print

//import "lib/C"
//import "lib/data/list"


let prttype = func (t : *Type) -> Unit {
  if t.aka != Nil {
    printf("%s", t.aka)
    return
  }

  let k = t.kind
  if k == TypeBasic {
    printf("%s", t.basic.id)
  } else if k == TypePointer {
    printf("*"); prttype(t.pointer.to)
  } else if k == TypeArray {
    print_type_array(t)
  } else if k == TypeRecord {
    print_type_record(t)
  } else if k == TypeEnum {
    print_type_enum(t)
  } else if k == TypeFunction {
    print_type_func(&t.function)
  } else if k == TypeUnknown {
    printf("<TypeUnknown>")
  } else if k == TypeNumeric {
    printf("<TypeNumeric>")
  } else {
    printf("unkn type kind %d, maybe func?", k)
    exit(1)
  }
}


let print_type_record = func (t : *Type) -> Unit {
  printf("(")
  let print_field = func ListForeachHandler {
    printf("%s : ", (data to *Field).id); prttype((data to *Field).type); printf(", ")
  }
  list_foreach(t.record.fields, print_field, Nil)
  printf(")")
  printf("<record:0x%02x>", t.record.uid)
}


let print_type_enum = func (t : *Type) -> Unit {
  printf("{")
    let print_cons = func ListForeachHandler {
      printf("<%%s> ")
    }
    list_foreach(t.enum.cons, print_cons, Nil)
    printf("}")
}


let print_type_array = func (t : *Type) -> Unit {
  if t.array.undefined {
    printf("[]")
  } else {
    printf("[%d]", t.array.volume)
  }
  prttype(t.array.of)
}


// print TypeFunc
var needs : Bool // need comma?
let print_type_func = func (t : *TypeFunc) -> Unit {
  printf("(")
  needs = False
  let print_params = func ListForeachHandler {
    let param = data to *Field
    if needs {printf(", ")} else {needs = True}
    printf("%s : ", param.id); prttype(param.type);
  }
  list_foreach(t.params, print_params, Nil)
  printf(") -> "); prttype(t.to);
}


