// value/nat


// Натуральное преобразование
// 1. [0] -> []
// 2. *Unit -> * && * -> *Unit
// 3. *Unit -> [] && [] -> *Unit


let isArrayReference = func (t : *Type) -> Bool {
  if t.kind != TypeArray {return False}
  return t.array.undefined
}


// постпроцессинг значения перед тем как упаковать его в операцию
// дженерики если и выжили раньше здесь заменяются на базовые для архитектуры типы
let post = func (v : *Value) -> *Value {
  if v.type.kind == TypeGenericNum {
    v.type = typeBaseInt
  } else if v.type.kind == TypeGenericRef {
    v.type = typeFreePtr
  }
  return v
}


// производит натуральное преобразование значения к заданному типу
// или полсто возвращает значение без преобразования (если оно невозможно)
let nat = func (v : *Value, t : *Type) -> *Value {
  //printf("? "); prttype(v.type); printf("\n")
  let vtype = v.type
  assert(vtype != Nil, "nat:: v.type == Nil")
  assert(t != Nil, "nat:: t == Nil")

  //printf("NAT!\n")
  // TypeGenericNum -> Basic:Integer
  if vtype.kind == TypeGenericNum {
    if type_is_basic_integer(t) {
      return value_new_imm_const(t, v.storage.val)
    }
  }


  if naturalConversionIsPossible(v.type, t) {
    /*printf("NAT3\n")
    printf("v.type = "); prttype(v.type); printf("\n");
    printf("t = "); prttype(t); printf("\n");*/
    let res = cast(v, t, v.ti)
    getType(res)  //!
    return res
  }

  return v
}


// возможно ли натуральное преобразование из типа a в nbg b?
let naturalConversionIsPossible = func (a, b : *Type) -> Bool {
  let bkind = b.kind
  let akind = a.kind

  // cast for: [0] -> []
  if bkind == TypeArray and akind == TypeArray {
    if b.array.undefined and not a.array.undefined {return True}
  }

  // *Unit -> * && * -> *Unit
  if bkind == TypePointer and akind == TypePointer {
    // auto cast for: *Unit -> *
    if type_eq(a, typeFreePtr) {return True}

    // auto cast for: * -> *Unit
    if type_eq(b, typeFreePtr) {return True}
  }

  // *Unit -> [] (todo: need change to: Nil -> [] !)
  if bkind == TypeArray and akind == TypePointer {
    if b.array.undefined and type_eq(a, typeFreePtr) {return True}
  }

  // [] -> *Unit
  if akind == TypeArray and bkind == TypePointer {
    if a.array.undefined and type_eq(b, typeFreePtr) {return True}
  }

  return False
}


