

// сейчас при таком раскладе sizeof XX + 0 дает ошибку!!!
// сделай такое же для ALignof!!

let size_of = func (t : *Type, ti : *TokenInfo) -> *Value {
  let vx = valueNew(ValueSizeof, StorageUndefined, ti)
  vx.szof = t
  return vx
}


let checkValueSizeof = func (v : *Value) -> *Type {
  let t = v.szof

  if t.kind == TypeUnknown {
    error("sizeof unknown type", v.ti)
  }

  v.type = type_new(TypeNumeric)
  v.storage.class = StorageImmediate
  v.storage.val = t.size to Int64

  return v.type
}


