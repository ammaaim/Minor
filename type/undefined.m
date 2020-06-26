// type/undefined

// здесь есть проблема с бесконечной рекурсией, см typeUndefinedCheckRecord


// проверяем тип на наличие в нем TypeUndefined
// TypeUndefined допустим лишь для указателя на
// во всех остальных случаях TypeUndefined недопустим
let typeUndefinedCheck = func (t : *Type) -> Unit {
  if type_is_pointer(t) {
    typeUndefinedCheckPointer(&t.pointer)
  } else if type_is_array(t) {
    typeUndefinedCheck(t.array.of)
  } else if type_is_function(t) {
    typeUndefinedCheckFunc(&t.function)
  } else if type_is_record(t) {
    typeUndefinedCheckRecord(&t.record)
  } else if t.kind == TypeUndefined {
    error("undefined type", t.ti)
  }
}


let typeUndefinedCheckPointer = func (p : *TypePointer) -> Unit {
  let to = p.to
  if to.kind == TypeUndefined {
    // it's ok.
  } else {
    typeUndefinedCheck(to)
  }
}


let typeUndefinedCheckFunc = func (f : *TypeFunc) -> Unit {
  // check return type
  typeUndefinedCheck(f.to)

  // check params
  let foreach_func_param = func ListForeachHandler {
    let p = data to *Field
    typeUndefinedCheck(p.type)
  }
  list_foreach(f.params, foreach_func_param, Nil)
}


let typeUndefinedCheckRecord = func (r : *TypeRecord) -> Unit {
  // чекаем поля: поле не может имет ь неопределенный тип!
  // (но может быть указателем или неопр массивом undef-типа)
  let foreach_struct_field = func ListForeachHandler {
    let f = data to *Field
    //typeUndefinedCheck(f.type)  // должно быть так но возн беск рекурсия! исправь это
    if f.type.kind == TypeUndefined {
      error("undefined type", f.type.ti)
    }
  }
  list_foreach(r.fields, foreach_struct_field, Nil)
}


