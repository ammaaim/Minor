// m2/prn/assembly

/*
  Сборка - результат работы компилятора.
  Включает в себя определения типов
  и три типа машинных сущностей (константы переменные и функции)
*/

/*
 * Тип объекта из сборки
 */
type AssemblyItemKind = enum {
  TypeDef,
  ConstDef,
  StringDef,
  ArrayDef,
  FuncDef,
  VarDef
}


type Pad = [3]Nat8  //опять какая то херня с выравниванием у тебя

type AssemblyItem = record {
  kind : AssemblyItemKind
  id   : Str     // идентификатор который идет на печать

  // признак того что этот элемент уже получил свой id
  // и его не нужно переименовывать (for rename)
  marked : Bool

//enum {
  _         : Pad
  stringdef : StringDef
  _         : Pad
  typedef   : TypeDef
  _         : Pad
  constdef  : ConstDef
  _         : Pad
  arraydef  : ArrayDef
  _         : Pad
  funcdef   : FuncDef
  _         : Pad
  vardef    : AssemblyVarDef
//}
}


// id должно идти первым полем! Грязный хак для asm_rename2!
type TypeDef  = record {type : *Type}
type ConstDef = record {value : *Value}
type StringDef = record {data : Str, len : Nat}
type ArrayDef = record {type : *Type, len : Nat, values : *List}
type FuncDef  = record {type : *Type, block : *Block}
type AssemblyVarDef   = record {type : *Type, init_value : *Value}


type Assembly = record {
  name : Str

  // sections
  types,         // of *TypeDef
  arrays,        // of *ArrayDef
  strings,       // of *StringDef
  vars,          // of *AssemblyVarDef
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


let asmTypedefAdd = func (a : *Assembly, id : Str, t : *Type) -> *AssemblyItem {
  let x = malloc(sizeof AssemblyItem) to *AssemblyItem
  assert(x != Nil, "asmTypedefAdd")
  memset(x, 0, sizeof AssemblyItem)
  x.kind = TypeDef
  x.id = id
  x.typedef.type = t
  list_append(a.types, x)
  return x
}


let asmStringAdd = func (a : *Assembly, id : Str, s : Str, len : Nat) -> *AssemblyItem {
  let x = malloc(sizeof AssemblyItem) to *AssemblyItem
  assert(x != Nil, "asmStringAdd")
  memset(x, 0, sizeof AssemblyItem)
  x.kind = StringDef
  x.id = id
  x.stringdef.data = s
  x.stringdef.len = len
  list_append(a.strings, x)
  return x
}


let asmArrayAdd = func (a : *Assembly, id : Str, t : *Type, values : *List) -> *AssemblyItem {
  let x = malloc(sizeof AssemblyItem) to *AssemblyItem
  assert(x != Nil, "asmArrayAdd")
  memset(x, 0, sizeof AssemblyItem)
  x.kind = ArrayDef
  x.id = id
  x.arraydef.type = t
  x.arraydef.values = values
  list_append(a.arrays, x)
  return x
}


let asmFuncAdd = func (a : *Assembly, id : Str, t : *Type, b : *Block) -> *AssemblyItem {
  let x = malloc(sizeof AssemblyItem) to *AssemblyItem
  assert(x != Nil, "asmFuncAdd")
  memset(x, 0, sizeof AssemblyItem)
  x.kind = FuncDef
  x.id = id
  x.funcdef.type = t
  x.funcdef.block = b
  list_append(a.funcs, x)
  return x
}


let asmVarAdd = func (a : *Assembly, id : Str, t : *Type, init_value : *Value) -> *AssemblyItem {
  //printf("asmVarAdd\n")
  let x = malloc(sizeof AssemblyItem) to *AssemblyItem
  assert(x != Nil, "asmVarAdd")
  x.kind = VarDef
  x.id = id
  x.vardef.init_value = init_value
  x.vardef.type = t
  list_append(a.vars, x)
  return x
}

// кандидат на выбывание - убери если не понадобится близжайшее время
// rename entity in assembly
/*let asmRename = func (a : *Assembly, id_from, id_to : Str) -> Unit {
  // rename entity in assembly section list
  let ren = func (list : *List, id_from, id_to : Str) -> Bool {
    let search = func ListSearchHandler {
      let ai = data to *AssemblyItem
      let id_from = ctx to Str
      return strcmp(ai.id, id_from) == 0
    }
    let c = list_search(list, search, id_from) to *AssemblyItem

    if c != Nil {
      c.id = id_to
      return True
    }
    return False
  }

  if ren(a.funcs, id_from, id_to) {return}
  if ren(a.strings, id_from, id_to) {return}
  if ren(a.arrays, id_from, id_to) {return}
}*/


