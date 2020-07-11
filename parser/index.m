
// base indexes (for builtin entities)
var globalTypeIndex,
    globalValueIndex : Map


let add_type = func (index : *Map, id : Str, t : *Type) -> Unit {
  /*if map_get(index, id) != Nil {
    error("type bind error: attempt to id redefinition", t.ti)
    return
  }*/

  let ae = get_type(id)
  if ae != Nil {
    // define already declared type (TypeUndefined)
    if ae.kind != TypeUnknown {
      error("type bind error: attempt to id redefinition", t.ti)
      return
    }

    //printf("add_type unk: %s\n", id)
    memcpy(ae, t, sizeof Type)
    return
  }

  //printf("add_type: %s\n", id)
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
  if fctx.cblock != Nil {
    bind_value_in_block(fctx.cblock, id, v)  // bind local
  } else {
    bind_value_global(id, v)  // bind global
  }
}


// Add bind into a block
let bind_value_in_block = func (b : *Block, id : Str, v : *Value) -> Unit {
  add_value(&b.value_index, id, v)
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
  let ae = map_get(index, id) to *Value
  if ae != Nil {
    // если значение уже есть но не определено
    /*if ae.kind != ValueUndefined {
      error("value bind error: attempt to id redefinition", v.ti)
      return
    }*/

    // это позволяет юзать глобальные значения до того как они будут объявлены
    memcpy(ae, v, sizeof Value)
    return
  }
  map_append(index, id, v)
}


let get_value = func (id : Str) -> *Value {
  let local = get_value_local(id)
  if local != Nil {return local}

  let global = get_value_global(id)
  if global != Nil {return global}

  return get_value_builtin(id)
}


let get_value_local = func (id : Str) -> *Value {
  // ищем сперва во всех блоках, затем в параметрах
  var b : *Block
  b = fctx.cblock
  while b != Nil {
    // ищем значение в индексе блока b
    let v = map_get(&b.value_index, id) to *Value
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
    if strcmp(id, "self") == 0 {return fctx.cfunc}
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
  let v = valueNew(ValueId, param.ti)
  v.type = param.type
  v.kind = ValueLocalVar
  v.id = param.id
  return v
}


