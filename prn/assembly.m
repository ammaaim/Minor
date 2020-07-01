// m2/prn/assembly

/*
  Сборка - результат работы компилятора.
  Включает в себя определения типов
  и три типа машинных сущностей (константы переменные и функции)
*/

// id должно идти первым полем! Грязный хак для asm_rename2!
type TypeDef  = record {id : Str, type : *Type}
type ConstDef = record {id : Str, value : *Value}
type VarDef   = record {id : Str, type : *Type, init_value : *Value}
type FuncDef  = record {id : Str, type : *Type, block : *Block}

type StringDef = record {id : Str, data : Str, len : Nat}
type ArrayDef = record {id : Str, type : *Type, len : Nat, values : *List}

// структура описывающая модуль для принтера
type Assembly = record {
  name : Str

  types,         // of *TypeDef
  consts,        // of *ConstDef
  arrays,        // of *ArrayDef
  strings,       // of *StringDef
  vars,          // of *VarDef
  funcs : *List  // of *FuncDef
}


let asm_init = func (a : *Assembly, name : Str) -> Unit {
  a.name = name
  a.types = list_new()
  a.consts = list_new()
  a.arrays = list_new()
  a.vars = list_new()
  a.funcs = list_new()
  a.strings = list_new()
}


let asmTypedefAdd = func (a : *Assembly, id : Str, t : *Type) -> *TypeDef {
  let td = malloc(sizeof TypeDef) to *TypeDef
  assert(td != Nil, "asm_typedef_add")
  td.id = id
  td.type = t
  list_append(a.types, td)
  return td
}


let asmStringAdd = func (a : *Assembly, id : Str, s : Str, len : Nat) -> Unit {
  let x = malloc(sizeof StringDef) to *StringDef
  assert(x != Nil, "asmStringAdd")
  x.id = id
  x.data = s
  x.len = len
  list_append(a.strings, x)
}


let asmArrayAdd = func (a : *Assembly, id : Str, t : *Type, values : *List) -> Unit {
  let x = malloc(sizeof ArrayDef) to *ArrayDef
  assert(x != Nil, "asmArrayAdd")
  x.id = id
  x.type = t
  x.values = values
  list_append(a.arrays, x)
}


let asmFuncAdd = func (a : *Assembly, id : Str, t : *Type, b : *Block) -> Unit {
  let fd = malloc(sizeof FuncDef) to *FuncDef
  assert(fd != Nil, "asm_funcdef_add")
  fd.id = id
  fd.type = t
  fd.block = b
  list_append(a.funcs, fd)
}


let asmVarAdd = func (a : *Assembly, id : Str, t : *Type, init_value : *Value) -> *VarDef {
  let va = malloc(sizeof VarDef) to *VarDef
  assert(va != Nil, "asm_vardef_add")
  va.id = id
  va.init_value = init_value
  va.type = t
  list_append(a.vars, va)
  return va
}


// rename entity in assembly
let asmRename = func (a : *Assembly, id_from, id_to : Str) -> Unit {
  // rename any entity (string, array, struct) in assembly
  let xrename = func (list : *List, id_from, id_to : Str) -> Unit {
    let search = func ListSearchHandler {
      let id = data to *Str
      let id_from = ctx to Str
      if strcmp(*id, id_from) == 0 {return data}
      return Nil
    }
    let c = list_search(list, search, id_from) to *ConstDef

    if c != Nil {
      c.id = id_to
    }
  }

  xrename(a.funcs, id_from, id_to)
  xrename(a.consts, id_from, id_to)
  xrename(a.strings, id_from, id_to)
}


