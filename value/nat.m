// value/nat


// Натуральное преобразование
// Вызывается в фазе проверки типов
// 1. [0] -> []
// 2. *Unit -> * && * -> *Unit
// 3. *Unit -> [] && [] -> *Unit


/*let isArrayReference = func (t : *Type) -> Bool {
  if t.kind != TypeArray {return False}
  return t.array.undefined
}*/


// даем тип t значению v с типом #TypeNumeric (index, shift, call)
let castIfNumericTo = func (v : *Value, t : *Type) -> *Value {
  if v.type.kind == TypeNumeric {
    v.type = t
  }
  return v
}


// производит натуральное преобразование значения к заданному типу
// или полсто возвращает значение без преобразования (если оно невозможно)
let nat = func (v : *Value, t : *Type) -> *Value {
  let vtype = v.type
  assert(vtype != Nil, "nat:: v.type == Nil")
  assert(t != Nil, "nat:: t == Nil")

  // TypeNumeric -> Basic:Integer
  if vtype.kind == TypeNumeric {
    if type_is_basic_integer(t) {
      return valueNewImm(t, v.storage.val)
    }
  }

  if naturalConversionIsPossible(v.type, t) {
    // поскольку этот каст производится в фазе вывода/проверки типов
    // мы должны его вывести через getType
    let res = cast(v, t, v.ti)
    getType(res)
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


