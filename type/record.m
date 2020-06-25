// type/record


/*
type TypeRecord = record {
  fields : *List  // of Field
  uid    : Nat32  //
}
*/

type Field = record {
  id     : Str
  type   : *Type
  offset : Nat16  // record field offset
  ti     : *TokenInfo
}



let field_new = func (id : Str, t : *Type, ti : *TokenInfo) -> *Field {
  let f = malloc(sizeof Field) to *Field
  assert(f != Nil, "field_new")
  f.id = id
  f.type = t
  f.offset = 0
  f.ti = ti
  return f
}


let type_record_new = func (fields : *List) -> *Type {
  let t = type_new(TypeRecord)
  t.record.uid = get_uid()
  t.record.fields = fields

  // Check fields, set offsets

  type FieldHandleContext = record {
    offset : Nat16  // смещение (порядковый номер) поля в структуре
    size   : Nat32  // размер структуры
    talign : Nat8   // выравнивание заданное для структуры
  }

  var fhc : FieldHandleContext
  fhc.size = 0
  fhc.offset = 0
  fhc.talign = t.align

  let fpost = func ListForeachHandler {
    let f = data to *Field
    let t = f.type
    let fhc = ctx to *FieldHandleContext
    type_check(t)
    f.offset = fhc.offset
    fhc.offset = fhc.offset + 1
    fhc.size = fhc.size + alignment(t.size, fhc.talign)
  }
  list_foreach(t.record.fields, fpost, &fhc)

  t.size = fhc.size

  return t
}


let type_record_get_field = func (r : *Type, fid : Str) -> *Field {
  let fsearch2 = func ListSearchHandler {
    let field = data to *Field
    let id = ctx to Str
    if strcmp(field.id, id) == 0 {return field}
    return Nil
  }
  return list_search(r.record.fields, fsearch2, fid to *Unit) to *Field
}


let type_record_eq = func (a, b : *TypeRecord) -> Bool {
  let check_fields = func ListCompareHandler {
    let f1 = data1 to *Field
    let f2 = data2 to *Field
    if strcmp(f1.id, f2.id) != 0 {return False}
    return type_eq(f1.type, f2.type)
  }
  return list_compare(a.fields, b.fields, check_fields, Nil)
}


