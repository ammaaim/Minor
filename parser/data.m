// parser/data


// base indexes (for builtin entities)
var globalTypeIndex,
    globalValueIndex : Map



let bind_type_local = func (id : Str, t : *Type) -> Unit {
  add_type(&fctx.cblock.type_index, id, t)
}


let bind_type_global = func (id : Str, t : *Type) -> Unit {
  add_type(&mctx.type_index, id, t)
}


let bind_type_builtin = func (id : Str, t : *Type) -> Unit {
  map_append(&globalTypeIndex, id, t)
}


let add_type = func (index : *Map, id : Str, t : *Type) -> Unit {
  if map_get(index, id) != Nil {
    error("type bind error: attempt to id redefinition", t.ti)
    return
  }
  map_append(index, id, t)
}


let get_type = func (id : Str) -> *Type {
  // firstly search in globalTypeIndex тк наибольшая вероятность что тип там
  // тк встроенные типы чаще всего встречаются в коде
  let builtin_t = map_get(&globalTypeIndex, id)
  if builtin_t != Nil {return builtin_t}

  // local searching
  var b : *Block
  b = fctx.cblock
  while b != Nil {
    let local_t = map_get(&b.type_index, id) to *Type
    if local_t != Nil {return local_t}
    b = b.parent
  }

  // searching in current module
  return map_get(&mctx.type_index, id) to *Type
}



// used by type/enum тк тип может быть и глобальным и локальным
let bind_value = func (id : Str, v : *Value) -> Unit {
  let cblock = fctx.cblock
  if cblock != Nil {
    bind_value_in_block(cblock, id, v)  // bind local
  } else {
    bind_value_global(id, v)  // bind global
  }
}


// Add bind into a block
let bind_value_in_block = func (b : *Block, id : Str, v : *Value) -> Unit {
  map_append(&b.value_index, id, v) to *Value
}


// Add bind into current block
let bind_value_local = func (id : Str, v : *Value) -> Unit {
  add_value(&fctx.cblock.value_index, id, v)
}


// Add bind to global namespace
let bind_value_global = func (id : Str, v : *Value) -> Unit {
  add_value(&mctx.value_index, id, v)
}


let add_value = func (index : *Map, id : Str, v : *Value) -> Unit {
  if map_get(index, id) != Nil {
    error("value bind error: attempt to id redefinition", v.ti)
    return
  }
  map_append(index, id, v)
}


let bind_value_builtin = func (id : Str, v : *Value) -> Unit {
  map_append(&globalValueIndex, id, v)
}



let get_value = func (id : Str) -> *Value {
  let local = get_value_local(id)
  if local != Nil {return local}

  var global : *Value  // need let
  global = get_value_global(id)
  if global != Nil {return global}

  return get_value_builtin(id)
}


// Ищем значение в индексе указанного блока
let get_value_from_block = func (b : *Block, id : Str) -> *Value {
  return map_get(&b.value_index, id) to *Value
}


let get_value_local = func (id : Str) -> *Value {
  // ищем сперва во всех блоках, затем в параметрах
  var b : *Block
  b = fctx.cblock
  while b != Nil {
    let v = get_value_from_block(b, id)
    if v != Nil {return v}
    b = b.parent

    if b == Nil {
      // если не нашли в иерархии блоков, ищем в параметрах функции
      return get_value_from_params(fctx.cfunc.type.function.params, id)
    }
  }
  return Nil
}


let get_value_global = func (id : Str) -> *Value {
  return map_get(&mctx.value_index, id) to *Value
}


let get_value_builtin = func (id : Str) -> *Value {
  let x = map_get(&globalValueIndex, id)
  if x == Nil {
    if strcmp(id, "self") == 0 {
      return fctx.cfunc
    }
  }
  return x
}


// Ищем значение среди параметров функции
let get_value_from_params = func (params : *List, id : Str) -> *Value {
  let psearch = func ListSearchHandler {
    let param = data to *Field
    if strcmp(param.id, ctx to Str) == 0 {return data}
    return Nil
  }

  let param = list_search(params, psearch, id) to *Field
  if param == Nil {return Nil}

  // нашли параметр с таким именем
  // создадим для него 'Value' и вернем его
  let v = value_new(ValueId, param.type, Nil, Nil)
  v.storage.class = StorageLocal
  v.ti = param.ti
  v.storage.id = param.id
  return v
}



let decorate = func (id : Str) -> Str {
  return id
  //return cat3(mctx.src.abs_path, "_", id)
}


// принимает префикс ресурса (например str)
// и его номер, формируя строку вида str0
// формирует строку вида prefix#### - aka анонимной сущности
let get_suid = func (prefix : Str, uid : Nat32) -> Str {
  let suid = malloc(strlen(prefix) + 8 + 1) to Str
  sprintf(suid, "%s%u\0", prefix, uid)
  return suid
}


// функция возвращает строку-префикс
let get_prefix = func () -> Str {
  var s : Str
  s = ""
  if fctx.cfunc != Nil {
    // мы работаем в контексте функции -> добавим ее префикс
    // (а он УЖЕ содержит в себе глобальный префикс - namespace)
    s = malloc(strlen(fctx.cfunc.storage.id) + 2) /* 2 = "%s_\0" */
    sprintf(s, "%s_\0", fctx.cfunc.storage.id)
  } else {
// временно вырубил декорацию
//    s = malloc(strlen(mctx.src.name) + 2) /* 2 = "%s_\0" */
//    sprintf(s, "%s_\0", mctx.src.name)
  }

  return s
}


let get_name = func (res : Str, uid : *Nat32) -> Str {
  let pre = get_prefix()

  var id : Str
  /*if cid != Nil {
    //printf("CID = %s\n", cid)
    id = cid
    cid = Nil
  } else {*/
    *uid = *uid + 1
    id = get_suid(res, *uid)
  //}

  let s = malloc(strlen(pre) + strlen(id) + 1) to Str
  sprintf(s, "%s%s\0", pre, id)
  return s
}


var func_uid : Nat32
let get_name_func = func () -> Str {return get_name("func", &func_uid)}


var str_uid : Nat32
let get_name_str = func () -> Str {
  if fctx.cfunc != Nil {
    return get_name("str", &fctx.strno)  // local string
  }

  return get_name("str", &str_uid)  // global string
}



var arr_uid : Nat32
let get_name_arr = func () -> Str {return get_name("arr", &arr_uid)}

var var_uid : Nat32
let get_name_var = func () -> Str {return get_name("var", &var_uid)}

var type_uid : Nat32
let get_name_type = func () -> Str {return get_name("Type", &type_uid)}



let create_local_var = func (id : Str, t : *Type, init_value : *Value) -> *Value {
  // создадим фейковый value который будет занесен в индекс
  // и будет ссылаться на переменную (просто нести тот же id)
  let v = value_new(ValueId, t, Nil, Nil)
  v.storage.class = StorageLocal
  v.storage.id = id
  bind_value_local(id, v)

  // добавляем в код функции стейтмент с определением этой переменной
  add_stmt(stmt_new_vardef(id, t, init_value))

  if init_value != Nil {
    // добавляем в код функции стейтмент
    // с инициализацией этой переменной
    add_stmt(stmt_new_assign(v, init_value, Nil))
  }

  return v
}


let create_global_var = func (id : Str, t : *Type, init_value : *Value) -> Unit {
  asm_vardef_add(&asm0, id, t, init_value)

  // создадим фейковый value который будет занесен в индекс
  // и будет ссылаться на переменную (просто нести тот же id)
  let v = value_new(ValueId, t, Nil, Nil)
  v.storage.class = StorageGlobal
  v.storage.id = id
  bind_value_global(id, v)
}


// add statement to current block
let add_stmt = func (s : *Stmt) -> Unit {
  if s != Nil {
    list_append(fctx.cblock.stmts, s)
  }
}


