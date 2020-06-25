// type/basic


/*
type TypeBasic = record {
  id   : Str   //
  p    : Nat   // power (bit depth)
  i, s : Bool  // flags: i - integer, s - signed
}
*/


let type_basic_new = func (id : Str, size, p : Nat, i, s : Bool) -> *Type {
  let t = type_new(TypeBasic)
  t.size = size
  t.aka = id
  t.basic.id = id
  t.basic.p = p
  t.basic.i = i
  t.basic.s = s
  return t
}


let type_basic_eq = func (a, b : *TypeBasic) -> Bool {
  return strcmp(a.id, b.id) == 0
}


