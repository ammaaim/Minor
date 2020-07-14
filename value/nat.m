// m2/value/nat


// Естественное преобразование
// Вызывается в фазе проверки типов
// 1. [0] -> []
// 2. *Unit -> * && * -> *Unit
// 3. *Unit -> [] && [] -> *Unit



// даем тип t значению v с типом #TypeNumeric (index, shift, call)
// used in index, call, shift, expr
let castIfNumericTo = func (v : *Value, t : *Type) -> *Value {
  if v.type.kind == TypeNumeric {
    return valueNewImm(t, v.imm, v.ti)
  }
  return v
}


// производит натуральное преобразование значения к заданному типу
// или просто возвращает значение без преобразования (когда оно невозможно)
let nat = func (v : *Value, t : *Type) -> *Value {
  let vtype = v.type
  assert(vtype != Nil, "nat:: v.type == Nil")
  assert(t != Nil, "nat:: t == Nil")

  // TypeNumeric -> Basic:Integer
  if vtype.kind == TypeNumeric {
    if type_is_basic_integer(t) {
      return valueNewImm(t, v.imm, v.ti)
    }
  }

  if naturalConversionIsPossible(v.type, t) {
    // поскольку этот каст производится в фазе вывода/проверки типов
    // (в отличие от каста в операции `to`)
    // мы должны его вывести через checkValue
    let res = cast(v, t, v.ti)
    checkValue(res)
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


