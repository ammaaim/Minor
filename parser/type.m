// m2/parser/type


type TypeParser = () -> *Type



let parse_type = func () -> *Type {
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
      t = parse_type_named()
    }
  } else {
    if match("*") {
      let to = parse_type()
      if to == Nil {return Nil}
      t = type_pointer_new(to)
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

    // вообще выравнивание должно быть не тут а в array и record
    // а вот это вот все - косяк! переделай! #TODO
    if t.kind == TypeRecord or t.kind == TypeArray {
      t.nsize = t.size
    }

    t.size = alignment(t.size, cfg.dataAlignment to Nat8)
    t.defined_at = ti
    t.ti = ti
  }

  return t
}


let parse_type_named = func TypeParser {
  let ti = &ctok().ti
  let id = parseId()

  if id == Nil {
    error("expected id", ti)
    return Nil
  }

  let t = get_type(id)
  if t != Nil {return t}

  let nt = type_new(TypeUnknown)
  nt.declared_at = ti
  add_type(&mctx.type_index, id, nt)
  return nt
}


// парсит поля: a : A, b : B, ...
// term - одидаемый символ заверщающий цепочку полей
let parse_fields = func (term : Str) -> *List {
  let fl = list_new()

  skip_nl()

  while not match(term) {
    skip_nl()
    let ti = &ctok().ti
    let fl2 = parseField()
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
  return type_record_new(fields)
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

    let ti = &ctok().ti
    ec.id = parseId()
    ec.d = num
    ec.ti = ti

    list_append(constructors, ec)

    num = num + 1

    if not match(",") {
      skip_nl()
      need("}")
      break
    }
  }

  skip_nl()

  return type_enum_new(constructors)
}


let parse_type_array = func TypeParser {
  if match("]") {
    // Undefined Array
    let item_type = parse_type()
    if item_type == Nil {
      goto fail
    }
    return type_array_new(item_type, 0, True)
  }

  // Defined Array
  let size = cexpr()
  if size == Nil {goto fail}
  need("]")
  let item_type = parse_type()
  if item_type == Nil {goto fail}
  return type_array_new(item_type, size.imm to Nat32, False)

fail:
  return Nil
}


let parse_type_func = func TypeParser {
  let params = parse_fields(")")
  need ("->")
  let rettype = parse_type()
  if params == Nil or rettype == Nil {return Nil}
  let arghack = get("flagArghack") == 1
  return type_func_new(params, rettype, arghack)
}


