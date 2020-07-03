// m2/parser/data


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

  if fctx.cfunc != Nil {
    // мы работаем в контексте функции -> добавим ее префикс
    // (а он УЖЕ содержит в себе глобальный префикс - namespace)
    let s = malloc(strlen(fctx.cfunc.storage.id) + 2) /* 2 = "%s_\0" */
    sprintf(s, "%s_\0", fctx.cfunc.storage.id)
    return s
  } else {
// временно вырубил декорацию
//    s = malloc(strlen(mctx.src.name) + 2) /* 2 = "%s_\0" */
//    sprintf(s, "%s_\0", mctx.src.name)
  }

  return ""
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



let create_local_var = func (id : Str, t : *Type, init_value : *Value, ti : *TokenInfo) -> *Value {
  // создадим фейковый value который будет занесен в индекс
  // и будет ссылаться на переменную (просто нести тот же id)
  let v = valueNew(ValueId, StorageLocal, ti)
  v.type = t
  v.storage.id = id
  bind_value_local(id, v)

  // добавляем в код функции стейтмент с определением этой переменной
  stmtAdd(stmt_new_vardef(id, t, init_value, Nil))

  if init_value != Nil {
    // добавляем в код функции стейтмент
    // с инициализацией этой переменной
    stmtAdd(stmt_new_assign(v, init_value, Nil))
  }

  return v
}


let create_global_var = func (id : Str, t : *Type, init_value : *Value, ti : *TokenInfo) -> Unit {
  asmVarAdd(&asm0, id, t, init_value)

  // создадим фейковый value который будет занесен в индекс
  // и будет ссылаться на переменную (просто нести тот же id)
  let v = valueNew(ValueId, StorageGlobal, ti)
  v.type = t
  v.storage.id = id
  bind_value_global(id, v)
}


// add statement to current block
let stmtAdd = func (s : *Stmt) -> Unit {
  if s != Nil {
    list_append(fctx.cblock.stmts, s)
  }
}


