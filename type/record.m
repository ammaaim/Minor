// type/record


/*
type TypeRecord = record {
  fields : *List  // of Field
  uid    : Nat32  //
}
*/


var offset : Nat16  // смещение (порядковый номер) поля в структуре
var size   : Nat32  // размер структуры
var talign : Nat8   // выравнивание заданное для структуры
let type_new_record = func (fields : *List) -> *Type {
  let t = type_new(TypeRecord)
  t.record.uid = get_uid()
  t.record.fields = fields

  // последовательно обрабатываем все поля
  // проверяем их типы на валидность
  // прописываем им offset

  size = 0
  offset = 0
  talign = t.align
  let fpost = func ListForeachHandler {
    let f = data to *Field
    let t = f.type
    type_check(t)
    f.offset = offset
    offset = offset + 1
    size = size + alignment(t.size, talign)
  }
  list_foreach(t.record.fields, fpost, &size)
  t.size = size
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


