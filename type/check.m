// m2/type/check

// здесь есть проблема с бесконечной рекурсией, см typeCheckRecord


// неизвестный тип недопустим
// агрегатный тип не может включать в себя самого себя

// проверяем тип на наличие в нем TypeUnknown
// TypeUnknown недопустим
let typeCheck = func (t : *Type) -> Unit {
  //printf("typeCheck\n")
  let k = t.kind
  if k == TypePointer {
    typePointerCheck(&t.pointer)
  } else if k == TypeArray {
    typeArrayCheck(&t.array)
  } else if k == TypeFunction {
    typeFuncCheck(&t.function)
  } else if k == TypeRecord {
    typeRecordCheck(&t.record)
  } else if k == TypeUnknown {
    error("unknown type", t.ti)
  }
}


