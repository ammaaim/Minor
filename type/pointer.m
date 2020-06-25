// type/pointer


/*type TypePointer = record {to : *Type}*/


let type_new_pointer = func (to : *Type) -> *Type {
  let t = type_new(TypePointer)
  t.pointer.to = to
  t.size = get("pointerSize") to Nat32
  return t
}


let type_pointer_eq = func (a, b : *TypePointer) -> Bool {
  return type_eq(a.to, b.to)
}


