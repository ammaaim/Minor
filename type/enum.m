// m2/type/enum


type TypeEnum = record {
  cons : *List  // of Entity (EntityConst)
  uid  : Nat32  // unical id
}


type EnumConstructor = record {id : Str, d : Int64, ti : *TokenInfo}


let type_enum_new = func (constructors : *List /* of EnumConstructor */) -> *Type {
  let t = type_new(TypeEnum)
  t.enum.uid = get_uid()  // UID чтобы отличать enum от другого enum'а на этапе трансляции
  t.size = cfg.enumSize to Nat32

  let create_constructor = func ListForeachHandler {
    let cons = data to *EnumConstructor
    let enum_type = ctx to *Type
    let v = valueNewImm(enum_type, cons.d, cons.ti)
    bind_value(cons.id, v)
  }
  list_foreach(constructors, create_constructor, t)
  //t.enum.cons = constructors
  return t
}


let type_enum_eq = func (a, b : *TypeEnum) -> Bool {
  return a.uid == b.uid
}


