// prn/assembly

/*
  Сборка - результат работы компилятора.
  Включает в себя определения типов
  и три типа машинных сущностей (константы переменные и функции)
*/


type TypeDef  = record {id : Str, type : *Type}
type ConstDef = record {id : Str, value : *Value}
type VarDef   = record {id : Str, type : *Type, init_value : *Value}
type FuncDef  = record {id : Str, type : *Type, block : *Block}

// структура описывающая модуль для принтера
type Assembly = record {
  name : Str

  types,         // of *TypeDef
  consts,        // of *ConstDef
  vars,          // of *VarDef
  funcs : *List  // of *FuncDef
}



let asm_init = func (a : *Assembly, name : Str) -> Unit {
  a.name = name
  a.types = list_new()
  a.consts = list_new()
  a.vars = list_new()
  a.funcs = list_new()
}


let asm_typedef_add = func (a : *Assembly, id : Str, t : *Type) -> *TypeDef {
  let td = malloc(sizeof TypeDef) to *TypeDef
  assert(td != Nil, "asm_typedef_add")
  td.id = id
  td.type = t
  list_append(a.types, td)
  return td
}


let asm_constdef_add = func (a : *Assembly, id : Str, v : *Value) -> *ConstDef {
  let cd = malloc(sizeof ConstDef) to *ConstDef
  assert(cd != Nil, "asm_constdef_add")
  cd.id = id
  cd.value = v
  list_append(a.consts, cd)
  return cd
}


let asm_vardef_add = func (a : *Assembly, id : Str, t : *Type, init_value : *Value) -> *VarDef {
  let va = malloc(sizeof VarDef) to *VarDef
  assert(va != Nil, "asm_vardef_add")
  va.id = id
  va.init_value = init_value
  va.type = t
  list_append(a.vars, va)
  return va
}


let asm_funcdef_add = func (a : *Assembly, id : Str, t : *Type, b : *Block) -> *FuncDef {
  let fd = malloc(sizeof FuncDef) to *FuncDef
  assert(fd != Nil, "asm_funcdef_add")
  fd.id = id
  fd.type = t
  fd.block = b
  list_append(a.funcs, fd)
  return fd
}


let asm_func_rename = func (a : *Assembly, id_from, id_to : Str) -> Unit {
  // ищем в сборке эту функцию
  let search_func_by_id = func ListSearchHandler {
    let f = data to *FuncDef
    if strcmp(f.id, ctx to Str) == 0 {return f}
    return Nil
  }
  let f = list_search(a.funcs, search_func_by_id, id_from) to *FuncDef
  assert(f != Nil, "asm_func_rename: func not found")

  // нашли, подменяем id
  f.id = id_to
}


let asm_const_rename = func (a : *Assembly, id_from, id_to : Str) -> Unit {
  // ищем в сборке эту константу
  let search_const_by_id = func ListSearchHandler {
    let f = data to *ConstDef
    if strcmp(f.id, ctx to Str) == 0 {return f}
    return Nil
  }
  let c = list_search(a.consts, search_const_by_id, id_from) to *ConstDef
  assert(c != Nil, "asm_const_rename: const not found")

  // нашли, подменяем id
  c.id = id_to
}



