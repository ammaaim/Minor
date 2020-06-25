// prn/expr


// ino = item number
let print_getelementptr_inline = func (v : *Value, ino : Nat32) -> Unit {
  // getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)
  fprintf(fout, "getelementptr inbounds (")
  print_type(v.type.pointer.to, True, True)
  comma()
  print_type(v.type, True, True)
  space()
  print_value(v)
  fprintf(fout, ", i32 0, i32 %d)", ino)
}


// печатает терм
let print_value = func (v : *Value) -> Unit {
  let cl = v.storage.class
  if cl == StorageImmediate {
    fprintf(fout, "%d", v.storage.val)
  } else if cl == StorageRegister or cl == StorageAddress {
    fprintf(fout, "%%%d", v.storage.reg)
  } else if cl == StorageGlobal {
    fprintf(fout, "@%s", v.storage.id)
  } else if cl == StorageLocal {
    fprintf(fout, "%%%s", v.storage.id)
  } else if cl == StorageFunction or cl == StorageArray or cl == StorageString {
    fprintf(fout, "@%s", v.storage.id)
  } else if cl == StorageUndefined {
    fprintf(fout, "<StorageUndefined>")
  }
}


let eval = func Eval {
  let k = v.kind
  if k == ValueId {
    return v
  } else if k == ValueCall {
    return eval_call(v)
  } else if k == ValueIndex {
    return eval_index(v)
  } else if k == ValueAccess {
    return eval_access(v)
  } else if k == ValueRef {
    return eval_ref(v)
  } else if k == ValueDeref {
    return eval_deref(v)
  } else if k == ValueMinus {
    return eval_minus(v)
  } else if k == ValueNot {
    return eval_not(v)
  } else if k == ValueCast {
    return eval_cast(v)
  }

  return eval_bin(v)

  return v
}


let load = func Eval {
  // в загрузке нуждаются только значения с изменяемым классом памяти
  // это StorageGlobal, StorageLocal & StorageAddress;
  // остальные вернем просто так
  if not storageIsMutable(&v.storage) {
    return v
  }

  let reg = lab_get()
  fprintf(fout, "\n  %%%d = load ", reg)
  print_type(v.type, True, True)
  comma()
  print_type(v.type, True, True)
  o("* ")

  print_value(v)
  return nv(v.type, StorageRegister, reg)
}


let eval_call = func Eval {
  /*"%retval = call i32 @test(i32 %argc)"*/
  let ee = eval(v.a[0])
  let f = load(ee)

  /* вычисляем аргументы перед печатью вызова */
  let args = list_new()
  let eval_args = func ListForeachHandler {
    let arg = data to *Value
    let evaluated_args = ctx to *List
    list_append(evaluated_args, load(eval(arg)))
  }
  list_foreach(v.arguments, eval_args, args)

  /* печатаем вызов */
  var retval_reg : Nat32
  if type_eq(f.type.function.to, typeUnit) {
    fprintf(fout, "\n  call ")
  } else {
    retval_reg = lab_get()
    fprintf(fout, "\n  %%%d = call ", retval_reg)
  }

  print_type(f.type, False, False)
  space()

  print_value(f)

  /* печатаем список аргументов */
  o(" (")
  need_comma = False

  // типы аргументов будем брать из параметров
  // тк тип некоторых аргументов может оказаться Intager
  var param_ln : *Node
  param_ln = f.type.function.params.first

  let print_args = func ListForeachHandler {
    if need_comma {comma()}

    let a = data to *Value
    let param_ln = ctx to **Node

    // пока есть параметры типы даем из параметров
    // когда параметры кончатся пойдут типы аргументов
    // это сделано изза того что аргумент может оказаться Intager
    // (см. выведение типа функции из контекста вызова)
    if *param_ln != Nil {
      print_type(((*param_ln).data to *Field).type, True, True)
      *param_ln = (*param_ln).next
    } else {
      print_type(a.type, True, True)
    }

    space()
    print_value(a)
    need_comma = True
  }
  list_foreach(args, print_args, &param_ln)
  o(")")

  /* возвращаем результат (регистр) */
  return nv(v.type, StorageRegister, retval_reg)
}


let eval_index = func Eval {
  var a : *Value
  a = eval(v.a[0])

  let i = load(eval(v.a[1]))

  if a.type.array.undefined {
    a = load(a)
  }

  //%1 = getelementptr inbounds [10 x i32], [10 x i32]* @a, i64 0, i64 1

  let reg = lab_get()
  fprintf(fout, "\n  %%%d = getelementptr inbounds ", reg)

  if a.type.array.undefined {
    print_type(v.type, True, True)
  } else {
    print_type(a.type, True, True)
  }

  comma()
  print_type(a.type, True, True)

  if a.type.array.undefined {
    space()
  } else {
    o("* ")
  }

  print_value(a)
  if not a.type.array.undefined {
    o(", i32 0")
  }
  comma()
  print_type(i.type, True, True)
  space()
  print_value(i)
  o(" ; eval_index")
  return nv(v.type, StorageAddress, reg)
}


let eval_access = func Eval {
  var s : *Value
  var record_type : *Type

  s = eval(v.a[0])

  if s.type.kind == TypePointer {
    record_type = s.type.pointer.to
    s = load(s)
  } else {
    record_type = s.type
  }

  assert(v.field != Nil, "print/expr:: v.field == Nil\n")

  let fieldno = type_record_get_field(record_type, v.field).offset

  // todo: совмести это с index - там в сущность такой же алгоритм
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = getelementptr inbounds ", reg)
  print_type(record_type, True, True)
  comma()
  print_type(record_type, True, True)
  o("* ")
  print_value(s)
  fprintf(fout, ", i32 0, i32 %u ; eval_access", fieldno)

  return nv(v.type, StorageAddress, reg)
}


let eval_ref = func Eval {
  let vx = eval(v.a[0])
  if vx.storage.class == StorageAddress {
    // если это адрес - вернем его в регистре, а тип обернем в указатель
    return nv(v.type, StorageRegister, vx.storage.reg)
  }

  //%7 = getelementptr inbounds %Int32, %Int32* @a, i32 0
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = getelementptr inbounds ", reg)
  print_type(vx.type, True, True)
  comma()
  print_type(vx.type, True, True)
  o("* ")
  print_value(vx)
  comma()
  o("i32 0 ; ref")

  return nv(v.type, StorageRegister, reg)
}


let eval_deref = func Eval {
  let vx = load(eval(v.a[0]))  // загружаем указатель

  // возвращаем загруженный указатель как #Address
  return nv(v.type, StorageAddress, vx.storage.reg)
}


let eval_not = func Eval {
  let vx = load(eval(v.a[0]))

  //"%s = xor %s, -1"
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = xor ", reg)
  print_type(vx.type, True, True)
  space()
  print_value(vx)

  if (type_eq(vx.type, typeBool)) {o(", 1")} else {o(", -1")}

  return nv(vx.type, StorageRegister, reg)
}


let eval_minus = func Eval {
  //%4 = sub nsw i32 0, %3
  //nuw and nsw stand for "No Unsigned Wrap" and "No Signed Wrap", respectively. If the nuw and/or
  //nsw keywords are present, the result value of the add is undefined if unsigned and/or signed
  //overflow, respectively, occurs.
  let vx = load(eval(v.a[0]))
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = sub nsw ", reg)
  print_type(vx.type, True, True)
  fprintf(fout, " 0")
  comma()
  print_value(vx)
  return nv(vx.type, StorageRegister, reg)
}


let eval_cast = func Eval {
  /* Общий вид:
    <op> <ltype> <lvalue> to <type>
    op:
      sext - signed extend int
      zext - zero-extended int
      trunc
      bitcast - ptr . ptr
      inttoptr
      ptrtoint
  */

  var xx : Nat32
  xx = 0
  let to = v.cast_to
  let eee = eval(v.a[0])

  let ee = load(eee)


  // преиведение значения к собственному типу бессмыслено
  // поэтому просто возвращаем загруженное значение
  if type_eq(ee.type, to) {return ee}

  let reg = lab_get()
  fprintf(fout, "\n  %%%d = ", reg)

  let k = ee.type.kind

  if to.kind == TypeArray {
    if k == TypeBasic {
      fprintf(fout, "inttoptr ") // int -> arr
    } else {
      fprintf(fout, "bitcast ") // x -> arr
    }
  } else if to.kind == TypePointer or to.kind == TypeFunction {
    /* x -> Pointer */
    if k == TypePointer or
       k == TypeArray or
       k == TypeFunction {
      fprintf(fout, "bitcast ")  // ptr -> ptr
    } else {
      fprintf(fout, "inttoptr ") // int -> ptr
    }
  } else if to.kind == TypeBasic {
    /* X -> Basic */
    if k == TypeBasic {
      /* Basic -> Basic */

      if ee.type.basic.p > to.basic.p {
        /* power(v) > power(t) */
        fprintf(fout, "trunc ")
      } else if ee.type.basic.p < to.basic.p {
        /* power(v) < power(t) */
        if to.basic.s {
          fprintf(fout, "s") // ext Int -> Signed Int
        } else {
          fprintf(fout, "z") // ext Int -> Unsigned Int
        }
        fprintf(fout, "ext ")
      } else {
        /* power(v) == power(t) */
        fprintf(fout, "bitcast ")
      }
    } else if k == TypePointer {
      /* Pointer -> Basic */
      fprintf(fout, "ptrtoint ")
    } else if k == TypeEnum {
      // Enum -> Basic
      let esz = get("enumSize") to Nat * 8

      if esz > to.basic.p {
        /* power(v) > power(t) */
        fprintf(fout, "trunc ")
      } else if esz < to.basic.p {
        /* power(v) < power(t) */
        fprintf(fout, "zext ")
      } else {
        /* power(v) == power(t) */
        fprintf(fout, "bitcast ")
      }

    } else if k == TypeArray {

    } else {
      /**/
      printf("e.type.kind = %d\n", k)
      fatal("printer/expr/cast :: e.type.kind")
    }
  }

  print_type(ee.type, True, True)
  space()
  print_value(ee)
  o(" to ")
  print_type(to, True, True)

  //fprintf(fout, " ; k = %d, x = %d\n", k, xx)

  return nv(v.type, StorageRegister, reg)
}


let eval_bin = func Eval {
  var o : Str
  o = "<oper>"

  // берем тип левого а не тип v тк у v может быть Bool тип!
  let signed = v.a[0].type.basic.s

  let k = v.kind
  if k == ValueAdd {
    o = "add"
  } else if k == ValueSub {
    o = "sub"
  } else if k == ValueMul {
    o = "mul"
  } else if k == ValueDiv {
    if signed {o = "sdiv"} else {o = "udiv"}
  } else if k == ValueMod {
    if signed {o = "srem"} else {o = "urem"}
  } else if k == ValueOr {
    o = "or"
  } else if k == ValueXor {
    o = "xor"
  } else if k == ValueAnd {
    o = "and"
  } else if k == ValueEq {
    o = "icmp eq"
  } else if k == ValueNe {
    o = "icmp ne"
  } else if k == ValueLt {
    if signed {o = "icmp slt"} else {o = "icmp ult"}
  } else if k == ValueGt {
    if signed {o = "icmp sgt"} else {o = "icmp ugt"}
  } else if k == ValueLe {
    if signed {o = "icmp sle"} else {o = "icmp ule"}
  } else if k == ValueGe {
    if signed {o = "icmp sge"} else {o = "icmp uge"}
  } else if k == ValueShl {
    o = "shl"
  } else if k == ValueShr {
    if signed {o = "ashr"} else {o = "lshr"}
  }

  let l = load(eval(v.a[0]))
  let r = load(eval(v.a[1]))

  let reg = lab_get()
  fprintf(fout, "\n  %%%d = %s ", reg, o)
  print_type(l.type, True, True)
  space()
  print_value(l)
  comma()
  print_value(r)

  return nv(v.type, StorageRegister, reg)
}


let print_st = func (l, r : *Value) -> Unit {
  let lx = eval(l)
  let rx = load(eval(r))
  fprintf(fout, "\n  store ")
  print_type(rx.type, True, True)
  space()
  print_value(rx)
  comma()
  print_type(rx.type, True, True)
  o("* ")
  print_value(lx)
}


// new value object
let nv = func (t : *Type, c : StorageClass, reg : Nat32) -> *Value {
  let v = malloc(sizeof Value) to *Value
  assert(v != Nil, "printer::nv")
  memset(v, 0, sizeof Value)
  v.type = t
  v.storage.class = c
  v.storage.reg = reg
  return v
}


