// m2/type/pointer


type TypePointer = record {to : *Type}



let type_pointer_new = func (to : *Type) -> *Type {
  let t = type_new(TypePointer)
  t.pointer.to = to
  t.size = cfg.pointerSize to Nat32
  return t
}


let type_pointer_eq = func (a, b : *TypePointer) -> Bool {
  return type_eq(a.to, b.to)
}


let typePointerCheck = func (p : *TypePointer) -> Unit {
  let to = p.to
  if to.kind == TypeUnknown {
    error("unknown type", to.ti)
  } else {
    typeCheck(to)
  }
}

