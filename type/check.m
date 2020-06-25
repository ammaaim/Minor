


// проверяем тип на наличие в нем TypeUndefined
// TypeUndefined допустим лишь для указателя на
// во всех остальных случаях TypeUndefined недопустим
let type_check = func (t : *Type) -> Unit {
  if type_is_basic(t) {
  } else if type_is_pointer(t) {
    if t.pointer.to.kind == TypeUndefined {
      // it's ok.
    } else {
      type_check(t.pointer.to)
    }
  } else if type_is_array(t) {
    type_check(t.array.of)
  } else if type_is_function(t) {
    type_check(t.function.to)

    // чекаем параметры: параметр не может иметь неопределенный тип!
    // (но может быть указателем или неопр массивом undef-типа)
    let foreach_func_param = func ListForeachHandler {
      let p = data to *Field
      type_check(p.type)
    }
    list_foreach(t.function.params, foreach_func_param, Nil)

  } else if type_is_record(t) {
    // чекаем поля: поле не может имет ь неопределенный тип!
    // (но может быть указателем или неопр массивом undef-типа)
    let foreach_struct_field = func ListForeachHandler {
      let f = data to *Field
      if f.type.kind == TypeUndefined {
        error("undefined type", f.type.ti)
      }
    }
    list_foreach(t.record.fields, foreach_struct_field, Nil)

  } else if type_is_enum(t) {
  } else if t.kind == TypeUndefined {
    error("type_check undefined type", t.ti)
  }
}

