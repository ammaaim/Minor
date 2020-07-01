// m2/prn/assembly

/*
  Сборка - результат работы компилятора.
  Включает в себя определения типов
  и три типа машинных сущностей (константы переменные и функции)
*/

// id должно идти первым полем! Грязный хак для asm_rename2!
type TypeDef  = record {id : Str, type : *Type}
type ConstDef = record {id : Str, value : *Value}
type StringDef = record {id : Str, data : Str, len : Nat}
type ArrayDef = record {id : Str, type : *Type, len : Nat, values : *List}
type FuncDef  = record {id : Str, type : *Type, block : *Block}
type VarDef   = record {id : Str, type : *Type, init_value : *Value}


type Assembly = record {
  name : Str

  // sections
  types,         // of *TypeDef
  arrays,        // of *ArrayDef
  strings,       // of *StringDef
  vars,          // of *VarDef
  funcs : *List  // of *FuncDef
}


let asmInit = func (a : *Assembly, name : Str) -> Unit {
  a.name = name

  a.types = list_new()
  a.arrays = list_new()
  a.strings = list_new()
  a.funcs = list_new()
  a.vars = list_new()
}


let asmTypedefAdd = func (a : *Assembly, id : Str, t : *Type) -> Unit {
  let x = malloc(sizeof TypeDef) to *TypeDef
  assert(x != Nil, "asmTypedefAdd")
  x.id = id
  x.type = t
  list_append(a.types, x)
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
  let x = malloc(sizeof FuncDef) to *FuncDef
  assert(x != Nil, "asmFuncAdd")
  x.id = id
  x.type = t
  x.block = b
  list_append(a.funcs, x)
}


let asmVarAdd = func (a : *Assembly, id : Str, t : *Type, init_value : *Value) -> Unit {
  let x = malloc(sizeof VarDef) to *VarDef
  assert(x != Nil, "asmVarAdd")
  x.id = id
  x.init_value = init_value
  x.type = t
  list_append(a.vars, x)
}


// rename entity in assembly
let asmRename = func (a : *Assembly, id_from, id_to : Str) -> Unit {
  // rename entity in assembly section list
  let ren = func (list : *List, id_from, id_to : Str) -> Bool {
    let search = func ListSearchHandler {
      let id = data to *Str
      let id_from = ctx to Str
      if strcmp(*id, id_from) == 0 {return data}
      return Nil
    }
    let c = list_search(list, search, id_from) to *ConstDef

    if c != Nil {
      c.id = id_to
      return True
    }
    return False
  }

  if ren(a.funcs, id_from, id_to) {return}
  if ren(a.strings, id_from, id_to) {return}
  if ren(a.arrays, id_from, id_to) {return}
}


