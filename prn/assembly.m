// m2/prn/assembly

/*
  Сборка - результат работы компилятора.
  Включает в себя определения типов
  и три типа машинных сущностей (константы переменные и функции)
*/

/*
 * Тип объекта из сборки
 */
type DefinitionKind = enum {
  TypeDef,
  ConstDef,
  StringDef,
  ArrayDef,
  FuncDef,
  VarDef,
  AliasDef
}


type Pad = [3]Nat8  //опять какая то херня с выравниванием у тебя

type Definition = record {
  kind : DefinitionKind

  id   : Str     // автоматически полученный идентификатор который идет на печать

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
  _         : Pad
  aliasdef  : AliasDef
//}
}


// id должно идти первым полем! Грязный хак для asm_rename2!
type TypeDef  = record {type : *Type}
type ConstDef = record {value : *Value}
type StringDef = record {data : Str, len : Nat}
type ArrayDef = record {type : *Type, len : Nat, values : *List}
type FuncDef  = record {type : *Type, block : *Block}
type AssemblyVarDef = record {type : *Type, init_value : *Value}
type AliasDef = record {id : Str, type : *Type, org : Str}


type Assembly = record {
  name : Str

  // sections
  types,         // of *TypeDef
  aliases,
  arrays,        // of *ArrayDef
  strings,       // of *StringDef
  vars,          // of *AssemblyVarDef
  funcs : *List  // of *FuncDef
}


let asmInit = func (a : *Assembly, name : Str) -> Unit {
  a.name = name

  a.types = list_new()
  a.aliases = list_new()
  a.arrays = list_new()
  a.strings = list_new()
  a.funcs = list_new()
  a.vars = list_new()
}


let asmTypedefAdd = func (a : *Assembly, id : Str, t : *Type) -> *Definition {
  let x = malloc(sizeof Definition) to *Definition
  assert(x != Nil, "asmTypedefAdd")
  memset(x, 0, sizeof Definition)
  x.kind = TypeDef
  x.id = id
  x.typedef.type = t
  list_append(a.types, x)
  return x
}


let asmStringAdd = func (a : *Assembly, id : Str, s : Str, len : Nat) -> *Definition {
  let x = malloc(sizeof Definition) to *Definition
  assert(x != Nil, "asmStringAdd")
  memset(x, 0, sizeof Definition)
  x.kind = StringDef
  x.id = id
  x.stringdef.data = s
  x.stringdef.len = len
  list_append(a.strings, x)
  return x
}


let asmArrayAdd = func (a : *Assembly, id : Str, t : *Type, values : *List) -> *Definition {
  let x = malloc(sizeof Definition) to *Definition
  assert(x != Nil, "asmArrayAdd")
  memset(x, 0, sizeof Definition)
  x.kind = ArrayDef
  x.id = id
  x.arraydef.type = t
  x.arraydef.values = values
  list_append(a.arrays, x)
  return x
}


let asmFuncAdd = func (a : *Assembly, id : Str, t : *Type, b : *Block) -> *Definition {
  let x = malloc(sizeof Definition) to *Definition
  assert(x != Nil, "asmFuncAdd")
  memset(x, 0, sizeof Definition)
  x.kind = FuncDef
  x.id = id
  x.funcdef.type = t
  x.funcdef.block = b
  list_append(a.funcs, x)
  return x
}


let asmVarAdd = func (a : *Assembly, id : Str, t : *Type, init_value : *Value) -> *Definition {
  //printf("asmVarAdd\n")
  let x = malloc(sizeof Definition) to *Definition
  assert(x != Nil, "asmVarAdd")
  x.kind = VarDef
  x.id = id
  x.vardef.init_value = init_value
  x.vardef.type = t
  list_append(a.vars, x)
  return x
}

let asmAliasAdd = func (a : *Assembly, id : Str, type : *Type, org : Str) -> *Definition {
  let x = malloc(sizeof Definition) to *Definition
  assert(x != Nil, "asmAdd")
  x.kind = AliasDef
  x.id = id
  x.aliasdef.id = id
  x.aliasdef.type = type
  x.aliasdef.org = org
  list_append(a.aliases, x)
  return x
}

// кандидат на выбывание - убери если не понадобится близжайшее время
// rename entity in assembly
/*let asmRename = func (a : *Assembly, id_from, id_to : Str) -> Unit {
  // rename entity in assembly section list
  let ren = func (list : *List, id_from, id_to : Str) -> Bool {
    let search = func ListSearchHandler {
      let ai = data to *Definition
      let id_from = ctx to Str
      return strcmp(ai.id, id_from) == 0
    }
    let c = list_search(list, search, id_from) to *Definition

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


