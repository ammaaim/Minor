// type/eq


let type_eq = func (a, b : *Type) -> Bool {
  if a.kind != b.kind {return False}

  if a.aka != Nil and b.aka != Nil {
    // если псевдонимы равны, значит это гарантированно один тип
    // (!) Это в том числе используется для исключения бесконечной рекурсии
    // при сравнении типов содержащих ссылку на самих себя (!)
    if strcmp(a.aka, b.aka) == 0 {return True}
  }

  let k = a.kind
  if k == TypeBasic {
    return type_basic_eq(&a.basic, &b.basic)
  } else if k == TypePointer {
    return type_pointer_eq(&a.pointer, &b.pointer)
  } else if k == TypeArray {
    return type_array_eq(&a.array, &b.array)
  } else if k == TypeFunction {
    return type_function_eq(&a.function, &b.function)
  } else if k == TypeRecord {
    return type_record_eq(&a.record, &b.record)
  } else if k == TypeEnum {
    return type_enum_eq(&a.enum, &b.enum)
  } else if k == TypeGenericNum {
    return b.kind == TypeGenericNum
  }

  //printf("kind = %d\n", k)
  //rem("at", &ctok().ti)
  assert(False, "type_eq unknown type kind")
  return False
}


