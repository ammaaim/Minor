// m2/type/func


type TypeFunc = record {
  params  : *List  // List of Field
  to      : *Type  // return type
  arghack : Bool   // , ...
}



let type_func_new = func (params : *List, rettype : *Type, arghack : Bool) -> *Type {
  let t = type_new(TypeFunction)
  t.size = cfg.pointerSize to Nat32
  t.function.params = params
  t.function.to = rettype
  t.function.arghack = arghack
  return t
}


let type_function_eq = func (a, b : *TypeFunc) -> Bool {
  // firstly check ret type
  if not type_eq(a.to, b.to) {return False}

  // ok, now we need to check param lists
  let check_param = func ListCompareHandler {
    let f1 = data1 to *Field
    let f2 = data2 to *Field

    // id может быть Nil (в случае задекларированной в контексте вызова функции)
    if f1.id != Nil and f2.id != Nil {
      if strcmp(f1.id, f2.id) != 0 {return False}
    }

    return type_eq(f1.type, f2.type)
  }

  return list_compare(a.params, b.params, check_param, Nil)
}


