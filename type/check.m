// m2/type/check

// здесь есть проблема с бесконечной рекурсией, см typeCheckRecord


// встретили неизвестный тип
// создали TypeUnknown
// встретили typedef - проверили если ae то copy
// check сперва проверяет типы если есть TypeUnknown - ошибка
// еще check должен рекурсивно проверить типы на внутреннюю рекурсию но это потом


// проверяем тип на наличие в нем TypeUnknown
// TypeUnknown недопустим
let typeCheck = func (t : *Type) -> Unit {
  if type_is_pointer(t) {
    typeCheckPointer(&t.pointer)
  } else if type_is_array(t) {
    typeCheck(t.array.of)
  } else if type_is_function(t) {
    typeCheckFunc(&t.function)
  } else if type_is_record(t) {
    typeCheckRecord(&t.record)
  } else if t.kind == TypeUnknown {
    error("unknown type", t.ti)
  }
}


let typeCheckPointer = func (p : *TypePointer) -> Unit {
  let to = p.to
  if to.kind == TypeUnknown {
    error("unknown type", to.ti)
  } else {
    typeCheck(to)
  }
}


let typeCheckFunc = func (f : *TypeFunc) -> Unit {
  // check return type
  typeCheck(f.to)

  // check params
  let foreach_func_param = func ListForeachHandler {
    let p = data to *Field
    typeCheck(p.type)
  }
  list_foreach(f.params, foreach_func_param, Nil)
}


let typeCheckRecord = func (r : *TypeRecord) -> Unit {
  // чекаем поля: поле не может имет ь неопределенный тип!
  // (но может быть указателем или неопр массивом undef-типа)
  let foreach_struct_field = func ListForeachHandler {
    let f = data to *Field
    //typeCheck(f.type)  // должно быть так но возн беск рекурсия! исправь это
    if f.type.kind == TypeUnknown {
      error("unknown type", f.type.ti)
    }
  }
  list_foreach(r.fields, foreach_struct_field, Nil)
}


