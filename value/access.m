// m2/value/access


let access = func (r : *Value, fid : Str, ti : *TokenInfo) -> *Value {
  if r == Nil or fid == Nil {goto fail}

  let v = valueNew(ValueAccess, StorageAddress, ti)

  v.access.value = r
  v.access.field = fid
  return v

fail:
  return Nil
}


let checkValueAccess = func (v : *Value) -> *Type {
  let a = v.access.value
  let tx = checkValue(a)

  var record_type : *Type
  if tx.kind == TypePointer {
    record_type = tx.pointer.to
  } else {
    record_type = tx
  }

  if record_type.kind != TypeRecord {
    error("expected record / pointer to record type", v.ti)
    return Nil
  }

  let field = type_record_get_field(record_type, v.access.field)

  if field == Nil {
    error("undefined field", v.ti)
    return Nil
  }

  return field.type
}


