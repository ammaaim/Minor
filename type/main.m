// m2/type/main


import "type"
import "basic"
import "record"
import "enum"
import "array"
import "pointer"
import "func"
import "undefined"
import "eq"
import "std"


let type_new = func (k : TypeKind) -> *Type {
  let t = malloc(sizeof Type) to *Type
  assert(t != Nil, "type_new")
  memset(t, 0, sizeof Type)

  t.kind = k
  t.align = get("dataAlignment") to Nat8
  return t
}


let type_new_undefined = func (id : Str) -> *Type {
  let t = type_new(TypeUndefined)
  t.undefined.id = id
  bind_type_global(id, t)
  return t
}


// Это ссылка или ссылка на массив?
let typeIsReference = func (t : *Type) -> Bool {
  let k = t.kind
  if k == TypePointer {return True}
  if k == TypeArray {return t.array.undefined}
  return False
}


let type_is_basic = func (t : *Type) -> Bool {return t.kind == TypeBasic}
let type_is_function = func (t : *Type) -> Bool {return t.kind == TypeFunction}
let type_is_record = func (t : *Type) -> Bool {return t.kind == TypeRecord}
let type_is_enum = func (t : *Type) -> Bool {return t.kind == TypeEnum}
let type_is_pointer = func (t : *Type) -> Bool {return t.kind == TypePointer}
let type_is_array = func (t : *Type) -> Bool {return t.kind == TypeArray}


let type_is_basic_integer = func (t : *Type) -> Bool {
  if t.kind == TypeBasic {return t.basic.i}
  return False
}


var x_uid : Nat32
// for record & enum
// просто потому что записи и перечисления по совей природе анонимны
let get_uid = func () -> Nat32 {
  let uid = x_uid
  x_uid = x_uid + 1
  return uid
}


let alignment = func (req_sz : Nat32, align : Nat8) -> Nat32 {
  var sz : Nat32
  sz = req_sz
  while (sz % align to Nat32) != 0 {sz = sz + 1}
  return sz
}


