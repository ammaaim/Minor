// type/new


let type_new = func (k : TypeKind) -> *Type {
  let t = malloc(sizeof Type) to *Type
  assert(t != Nil, "type_new")
  memset(t, 0, sizeof Type)

  t.kind = k
  t.align = get("dataAlignment") to Nat8
  return t
}


