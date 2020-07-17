// m2/parser/index


type Index = record {types, values : Map}



let index_init = func (index : *Index) -> Unit {
  map_init(&index.types)
  map_init(&index.values)
}


let index_type_append = func (index : *Index, id : Str, t : *Type) -> Unit {
  map_append(&index.types, id, t)
}


let index_value_append = func (index : *Index, id : Str, v : *Value) -> Unit {
  map_append(&index.values, id, v)
}


let index_get_type = func (index : *Index, id : Str) -> *Type {
  return map_get(&index.types, id) to *Type
}


let index_get_value = func (index : *Index, id : Str) -> *Value {
  return map_get(&index.values, id) to *Value
}


var builtinIndex : Index



let add_type = func (index : *Index, id : Str, t : *Type) -> Unit {
  /*if map_get(index, id) != Nil {
    error("type bind error: attempt to id redefinition", t.ti)
    return
  }*/

  let ae = index_get_type(index, id)
  if ae != Nil {
    // define already declared type (TypeUndefined)
    if ae.kind != TypeUnknown {
      error("type bind error: attempt to id redefinition", t.ti)
      return
    }

    memcpy(ae, t, sizeof Type)
    return
  }

  index_type_append(index, id, t)
}




let get_type = func (id : Str) -> *Type {
  // firstly search in globalTypeIndex тк наибольшая вероятность что тип там
  // тк встроенные типы чаще всего встречаются в коде
  let builtin_t = index_get_type(&builtinIndex, id)
  if builtin_t != Nil {return builtin_t}

  // local searching
  var b : *Block
  b = fctx.cblock
  while b != Nil {
    let local_t = index_get_type(&b.index, id) // map_get(&b.index.types, id) to *Type
    if local_t != Nil {return local_t}
    b = b.parent
  }

  // searching in current module
  let m = index_get_type(&mctx.index, id)
  if m != Nil {return m}

  //printf("SRCHT: %s\n", id)

  // searching in imports
  let search_type_in_import = func ListSearchHandler {
    let module = data to *ModuleContext
    let id = ctx to Str
    return index_get_type(&module.index, id) != Nil
  }
  let module = list_search(&mctx.imports, search_type_in_import, id)

  if module != Nil {
    return index_get_type(&mctx.index, id)
  }

  return Nil
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
  add_value(&b.index, id, v)
}


// Add bind into current block
let bind_value_local = func (id : Str, v : *Value) -> Unit {
  add_value(&fctx.cblock.index, id, v)
}


// Add bind to global namespace
let bind_value_global = func (id : Str, v : *Value) -> Unit {
  add_value(&mctx.index, id, v)
}




let add_value = func (index : *Index, id : Str, v : *Value) -> Unit {
  let ae = index_get_value(index, id)
  if ae != Nil {
    // если значение уже есть но не определено
    if ae.kind != ValueUndefined {
      error("value bind error: attempt to id redefinition", v.ti)
      return
    }

    // это позволяет юзать глобальные значения до того как они будут объявлены
    memcpy(ae, v, sizeof Value)
    return
  }
  index_value_append(index, id, v)
}


let get_value = func (id : Str) -> *Value {
  let local = get_value_local(id)
  if local != Nil {return local}

  let global = get_value_global(id)
  if global != Nil {return global}

  let builtin = get_value_builtin(id)
  if builtin != Nil {return builtin}

  //printf("SRCHV: %s\n", id)

  // searching in imports
  let search_value_in_import = func ListSearchHandler {
    let module = data to *ModuleContext
    let id = ctx to Str
    return index_get_value(&module.index, id) != Nil
  }
  let module = list_search(&mctx.imports, search_value_in_import, id)

  if module != Nil {
    return index_get_value(&mctx.index, id)
  }

  return Nil
}


let get_value_local = func (id : Str) -> *Value {
  // ищем сперва во всех блоках, затем в параметрах
  var b : *Block
  b = fctx.cblock
  while b != Nil {
    // ищем значение в индексе блока b
    let v = index_get_value(&b.index, id)
    if v != Nil {return v}
    b = b.parent

    if b == Nil {
      // если не нашли в иерархии блоков, ищем в параметрах функции
      return Nil
    }
  }
  return Nil
}


let get_value_global = func (id : Str) -> *Value {
  return index_get_value(&mctx.index, id)
}


let get_value_builtin = func (id : Str) -> *Value {
  let x = index_get_value(&builtinIndex, id)
  if x == Nil {
    if strcmp(id, "self") == 0 {return fctx.cfunc}
  }
  return x
}


