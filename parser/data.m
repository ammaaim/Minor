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
    // мы работаем в контексте функции -> ее id будет префиксом
    return dup(fctx.cfunc.storage.id)
  } else {
    // временно вырубил декорацию
    //return mctx.src.name
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

  return cat3(pre, "_", id)
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




