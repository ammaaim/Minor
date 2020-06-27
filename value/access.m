// value/access


let access = func (r : *Value, fid : Str, ti : *TokenInfo) -> *Value {
  if r == Nil or fid == Nil {goto fail}

  let field_type = Nil

  let v = value_new_address(ValueAccess, field_type, r, Nil)
  v.access.field = fid
  return v

fail:
  return Nil
}


let getTypeAccess = func (v : *Value) -> *Type {
  let a = v.a[0]
  let tx = getType(a)

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


