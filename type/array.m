// m2/type/array


type TypeArray = record {
  of        : *Type  // item type
  volume    : Nat    // property of defined array
  undefined : Bool   // undefined array - array without defined volume
}



let type_array_new = func (of : *Type, volume : Nat32, undefined : Bool) -> *Type {
  let t = type_new(TypeArray)
  t.array.of = of
  t.array.volume = volume
  t.array.undefined = undefined

  if undefined {
    t.size = cfg.pointerSize to Nat32
  } else {
    t.size = volume * of.size
  }

  return t
}


let type_array_eq = func (a, b : *TypeArray) -> Bool {
  if not type_eq(a.of, b.of) {return False}
  if a.undefined and b.undefined {return True}
  if a.undefined or b.undefined {return False}
  if a.volume == b.volume {return True}
  return False
}


let typeArrayCheck = func (a : *TypeArray) -> Unit {
  typeCheck(a.of)
}


