// type/check


// проверяем тип на наличие в нем TypeUndefined
// TypeUndefined допустим лишь для указателя на
// во всех остальных случаях TypeUndefined недопустим
let typeUndefinedCheck = func (t : *Type) -> Unit {
  if type_is_basic(t) {
  } else if type_is_pointer(t) {
    typeUndefinedPointerCheck(&t.pointer)
  } else if type_is_array(t) {
    typeUndefinedCheck(t.array.of)
  } else if type_is_function(t) {
    typeUndefinedFuncCheck(&t.function)
  } else if type_is_record(t) {
    typeUndefinedRecordCheck(&t.record)
  } else if type_is_enum(t) {
  } else if t.kind == TypeUndefined {
    error("typeUndefinedCheck undefined type", t.ti)
  }
}


let typeUndefinedPointerCheck = func (p : *TypePointer) -> Unit {
  let to = p.to
  if to.kind == TypeUndefined {
    // it's ok.
  } else {
    typeUndefinedCheck(to)
  }
}


let typeUndefinedFuncCheck = func (f : *TypeFunc) -> Unit {
  typeUndefinedCheck(f.to)

  // чекаем параметры: параметр не может иметь неопределенный тип!
  // (но может быть указателем или неопр массивом undef-типа)
  let foreach_func_param = func ListForeachHandler {
    let p = data to *Field
    typeUndefinedCheck(p.type)
  }
  list_foreach(f.params, foreach_func_param, Nil)
}


let typeUndefinedRecordCheck = func (r : *TypeRecord) -> Unit {
  // чекаем поля: поле не может имет ь неопределенный тип!
  // (но может быть указателем или неопр массивом undef-типа)
  let foreach_struct_field = func ListForeachHandler {
    let f = data to *Field
    if f.type.kind == TypeUndefined {
      error("undefined type", f.type.ti)
    }
  }
  list_foreach(r.fields, foreach_struct_field, Nil)
}
