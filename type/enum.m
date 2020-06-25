// type/enum


/*
type TypeEnum = record {
  cons : *List  // of Entity (EntityConst)
  uid  : Nat32  //
}
*/


type EnumConstructor = record {id : Str, d : Int64}



let type_new_enum = func (constructors : *List /* of EnumConstructor */) -> *Type {
  let t = type_new(TypeEnum)
  t.enum.uid = get_uid()  // UID чтобы отличать enum от другого enum'а на этапе трансляции
  t.size = get("enumSize") to Nat32

  let create_constructor = func ListForeachHandler {
    let cons = data to *EnumConstructor
    let enum_type = ctx to *Type
    let v = value_new_imm_const(enum_type, cons.d)
    bind_value(cons.id, v)
  }
  list_foreach(constructors, create_constructor, t)
  //t.enum.cons = constructors
  return t
}


let type_enum_eq = func (a, b : *TypeEnum) -> Bool {
  return a.uid == b.uid
}


