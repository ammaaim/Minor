// parser/type


type TypeParser = () -> *Type



let parse_type = func (add_new_type : Bool) -> *Type {
  var t : *Type
  t = Nil

  let tk = ctok()
  let ti = &tk.ti

  if ctok().type == TokenId {
    if match("record") {
      t = parse_type_record()
    } else if match("enum") {
      t = parse_type_enum()
    } else {
      t = parse_type_base()
    }
  } else {
    if match("*") {
      let to = parse_type(True)
      if to == Nil {return Nil}
      t = type_new_pointer(to)
    } else if match("[") {
      t = parse_type_array()
    } else if match("(") {
      t = parse_type_func()
    }
  }

  if t == Nil {
    error("expected type", ti)
    printf("tok=%s\n", ctok().text)
  } else {
    t.size = alignment(t.size, get("dataAlignment") to Nat8)
    t.defined_at = ti
    t.ti = ti
  }

  return t
}


let parse_type_base = func TypeParser {
  let ti = &ctok().ti
  let id = parse_id()

  if id == Nil {
    error("expected id", ti)
    return Nil
  }

  let t = get_type(id)
  if t != Nil {return t}
  return type_new_undefined(id)
}


// парсит поля: a : A, b : B, ...
// term - одидаемый символ заверщающий цепочку полей
let parse_fields = func (term : Str) -> *List {
  let fl = list_new()

  skip_nl()

  while not match(term) {
    skip_nl()
    let ti = &ctok().ti
    let fl2 = parse_field()
    if fl2 == Nil {
      error("dofield error", ti)
      goto fail
    }

    match(",")
    skip_nl()
    list_extend(fl, fl2)
  }

  return fl

fail:
  return Nil
}


let parse_type_record = func TypeParser {
  need("{")
  let fields = parse_fields("}")
  return type_new_record(fields)
}


let parse_type_enum = func TypeParser {
  let constructors = list_new()

  var num : Int64
  num = 0

  need("{")
  skip_nl()
  while not match("}") {
    skip_nl()

    let ec = malloc(sizeof EnumConstructor) to *EnumConstructor

    ec.id = parse_id()
    ec.d = num

    list_append(constructors, ec)

    num = num + 1

    if not match(",") {
      skip_nl()
      need("}")
      break
    }
  }

  skip_nl()

  return type_new_enum(constructors)
}


let parse_type_array = func TypeParser {

  if match("]") {
    // Undefined Array
    let item_type = parse_type(True)
    if item_type == Nil {
      goto fail
    }
    return type_new_array(item_type, 0, True)
  }

  // Defined Array

  let xsize = cexpr()
  if xsize == Nil {
    goto fail
  }

  need("]")

  let item_type = parse_type(True)
  if item_type == Nil {
    goto fail
  }

  return type_new_array(item_type, xsize.storage.val to Nat32, False)

fail:
  return Nil
}


let parse_type_func = func TypeParser {
  let params = parse_fields(")")
  need ("->")
  let rettype = parse_type(True)
  if params == Nil or rettype == Nil {return Nil}
  let arghack = get("flagArghack") == 1
  return type_new_func(params, rettype, arghack)
}


