// m2/prn/expr


let MAXARG = 256


type ObjKind = enum {
  ObjInvalid,    // An error occurred while evaluation

  ObjImmediate,  // value in imm field

  /*
   * Global Immutable Object used by name
   * such as funcs, strings, literal arrays & records
   */
  ObjGlobalConst,

  // variables
  //ObjParam,      // func param
  ObjLocal,      // local var
  ObjGlobal,     // global var

  // register
  ObjAddress,    // address of value in register
  ObjRegister    // value in register
}


// Объект принтера - содержит тип значения и его местоположение
type Obj = record {
  kind : ObjKind

  type : *Type

  imm  : Int64  // ObjImmediate
  id   : Str    // ObjGlobalConst, ObjLocal, ObjGlobal
  reg  : Nat32  // ObjRegister, ObjAddress
}


// new printer object
let new_obj = func (t : *Type, k : ObjKind, reg : Nat32) -> Obj {
  var o : Obj
  o.type = t
  o.kind = k
  o.reg = reg
  o.id = Nil
  o.imm = 0
  return o
}


// evaluator type
type Eval = (v : *Value) -> Obj


// value evaluation
// Принимает на вход значение. Возвращает объект принтера
// Значения-операции вычисляются. Результатом может быть константа, имя, регистр или адрес.
// Имена и адреса нуждаются в дополнительной загрузке функцией load
// (только если это не lval)
let eval = func Eval {
  let k = v.kind

  var obj : Obj
  obj.type = v.type

  if k == ValueImmediate {
    obj.kind = ObjImmediate
    obj.imm = v.imm
    return obj
  } else if k == ValueGlobalConst {
    obj.kind = ObjGlobalConst
    obj.id = v.id
    return obj

  } else if k == ValueParam {
    obj.kind = ObjRegister
    obj.reg = v.reg // <-----
    return obj
  } else if k == ValueLocalVar {
    obj.kind = ObjLocal
    obj.id = v.id
    return obj
  } else if k == ValueGlobalVar {
    obj.kind = ObjGlobal
    obj.id = v.id
    return obj
  } else if k == ValueRegister {
    obj.kind = ObjRegister
    obj.reg = v.reg
    return obj

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
}


let eval_call = func Eval {
  /*"%retval = call i32 @test(i32 %argc)"*/
  let f = load(eval(v.call.function))

  /* вычисляем аргументы перед печатью вызова */

  // контекст в котором накапливаются вычисленные аргументы
  type Arguments = record {
    args : [MAXARG]Obj
    cnt  : Nat16
  }

  var args : Arguments
  args.cnt = 0

  let eval_args = func ListForeachHandler {
    let arg = data to *Value
    let args = ctx to *Arguments
    let argg = load(eval(arg))
    args.args[args.cnt] = argg
    args.cnt = args.cnt + 1
  }
  list_foreach(v.call.arguments, eval_args, &args)

  /* печатаем вызов */

  var retval_reg : Nat32
  if type_eq(f.type.function.to, typeUnit) {
    fprintf(fout, "\n  call ")
  } else {
    retval_reg = lab_get()
    fprintf(fout, "\n  %%%d = call ", retval_reg)
  }

  printType(f.type, False, False)
  space()

  print_obj(f)

  /* печатаем список аргументов */
  o(" (")

  var need_comma : Bool
  need_comma = False

  var c : Nat16
  c = 0

  while c < args.cnt {
    if need_comma {comma()}
    printType(args.args[c].type, True, True)
    space()
    print_obj(args.args[c])
    need_comma = True
    c = c + 1
  }

  o(")")

  return new_obj(v.type, ObjRegister, retval_reg)
}


let eval_index = func Eval {
  var a : Obj
  a = eval(v.index.array)

  let i = load(eval(v.index.index))

  if a.type.array.undefined {
    a = load(a)
  }

  let is_def_array_in_register = a.kind == ObjRegister and typeIsDefinedArray(a.type)
  let index_is_imm = True

  // работа именно со значением в регистре
  if is_def_array_in_register and index_is_imm {
    let reg = lab_get()
    //%7 = extractvalue { i8*, i8* } %4, 0
    fprintf(fout, "\n  %%%d = extractvalue ", reg)
    printType(a.type, True, True)
    space()
    print_obj(a)
    fprintf(fout, ", %u", i.imm)
    return new_obj(v.type, ObjRegister, reg)
  }



  //%1 = getelementptr inbounds [10 x i32], [10 x i32]* @a, i64 0, i64 1

  let reg = lab_get()
  fprintf(fout, "\n  %%%d = getelementptr inbounds ", reg)

  let at = a.type
  if at.array.undefined {
    printType(v.type, True, True)
  } else {
    printType(at, True, True)
  }

  comma()
  printType(a.type, True, True)

  if a.type.array.undefined {
    space()
  } else {
    o("* ")
  }

  print_obj(a)
  if not a.type.array.undefined {
    o(", i32 0")
  }
  comma()
  printType(i.type, True, True)
  space()
  print_obj(i)
  //o(" ; eval_index")
  return new_obj(v.type, ObjAddress, reg)
}


let eval_access = func Eval {
  var s : Obj
  var record_type : *Type

  s = eval(v.access.value)

  if s.type.kind == TypePointer {
    record_type = s.type.pointer.to
    s = load(s)
  } else {
    record_type = s.type
  }

  assert(v.access.field != Nil, "print/expr:: v.field == Nil\n")

  let fieldno = type_record_get_field(record_type, v.access.field).offset


  let is_record_in_register = s.kind == ObjRegister and s.type.kind == TypeRecord

  // работа именно со значением в регистре
  if is_record_in_register {
    let reg = lab_get()
    //%7 = extractvalue { i8*, i8* } %4, 0
    fprintf(fout, "\n  %%%d = extractvalue ", reg)
    printType(record_type, True, True)
    space()
    print_obj(s)
    fprintf(fout, ", %u", fieldno)
    return new_obj(v.type, ObjRegister, reg)
  }

  // todo: совмести это с index - там в сущность такой же алгоритм
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = getelementptr inbounds ", reg)
  printType(record_type, True, True)
  comma()
  printType(record_type, True, True)
  o("* ")
  print_obj(s)
  fprintf(fout, ", i32 0, i32 %u", fieldno)
  //o("; eval_access")

  return new_obj(v.type, ObjAddress, reg)
}


let eval_ref = func Eval {
  let vx = eval(v.un.x)
  if vx.kind == ObjAddress {
    // если это адрес - вернем его в регистре, а тип обернем в указатель
    return new_obj(v.type, ObjRegister, vx.reg)
  }

  //%7 = getelementptr inbounds %Int32, %Int32* @a, i32 0
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = getelementptr inbounds ", reg)
  printType(vx.type, True, True)
  comma()
  printType(vx.type, True, True)
  o("* ")
  print_obj(vx)
  comma()
  o("i32 0")
  //o("; ref")

  return new_obj(v.type, ObjRegister, reg)
}


let eval_deref = func Eval {
  // load pointer
  let vx = load(eval(v.un.x))

  // returns loaded pointer as #Address
  return new_obj(v.type, ObjAddress, vx.reg)
}


let eval_not = func Eval {
  let vx = load(eval(v.un.x))

  //"%s = xor %s, -1"
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = xor ", reg)
  printType(vx.type, True, True)
  space()
  print_obj(vx)
  if (type_eq(vx.type, typeBool)) {o(", 1")} else {o(", -1")}
  return new_obj(vx.type, ObjRegister, reg)
}


let eval_minus = func Eval {
  //%4 = sub nsw i32 0, %3
  //nuw and nsw stand for "No Unsigned Wrap" and "No Signed Wrap", respectively. If the nuw and/or
  //nsw keywords are present, the result value of the add is undefined if unsigned and/or signed
  //overflow, respectively, occurs.
  let vx = load(eval(v.un.x))
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = sub nsw ", reg)
  printType(vx.type, True, True)
  fprintf(fout, " 0")
  comma()
  print_obj(vx)
  return new_obj(vx.type, ObjRegister, reg)
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

  let to = v.cast.to

  let ee = load(eval(v.cast.value))

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
      let esz = cfg.enumSize to Nat * 8

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

  printType(ee.type, True, True)
  space()
  print_obj(ee)
  o(" to ")
  printType(to, True, True)

  return new_obj(v.type, ObjRegister, reg)
}


let eval_bin = func Eval {
  var o : Str
  o = "<oper>"

  // берем тип левого а не тип v тк у v может быть Bool тип!
  let signed = v.bin.l.type.basic.s

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

  let l = load(eval(v.bin.l))
  let r = load(eval(v.bin.r))

  let reg = lab_get()
  fprintf(fout, "\n  %%%d = %s ", reg, o)
  printType(l.type, True, True)
  space()
  print_obj(l)
  comma()
  print_obj(r)

  return new_obj(v.type, ObjRegister, reg)
}


let print_st = func (l, r : *Value) -> Unit {
  let lx = eval(l)
  let rx = load(eval(r))
  fprintf(fout, "\n  store ")
  printType(rx.type, True, True)
  space()
  print_obj(rx)
  comma()
  printType(rx.type, True, True)
  o("* ")
  print_obj(lx)
}



// загрузка (если она необходима) значения вычисленного выражения
let load = func (x : Obj) -> Obj {
  if x.kind == ObjInvalid {return x}

  let loadImmPtr = func (x : Obj) -> Obj {
    let t = x.type
    let reg = lab_get()
    fprintf(fout, "\n  %%%d = inttoptr i64 ", reg)
    print_obj(x)
    o(" to ")
    printType(t, True, True)

    return new_obj(t, ObjRegister, reg)
  }

  // LLVM не умеет так ... i32* 12233445 - нужно привести int значение к типу
  // явной операцией inttoptr. Поэтому если нам попался указатель вида ValueImmediate
  // то его нужно будет загрузить в регистр функцией inttoptr
  if x.kind == ObjImmediate {
    if typeIsReference(x.type) {
      return loadImmPtr(x)
    }
    return x
  }


  // в загрузке нуждаются только значения с изменяемым классом памяти
  // это ObjGlobal, ObjLocal & ObjAddress;
  // остальные вернем просто так
  if x.kind != ObjLocal and x.kind != ObjGlobal and x.kind != ObjAddress {
    return x
  }

  let reg = lab_get()
  fprintf(fout, "\n  %%%d = load ", reg)
  printType(x.type, True, True)
  comma()
  printType(x.type, True, True)
  o("* ")
  print_obj(x)

  return new_obj(x.type, ObjRegister, reg)
}


// печать значение вычисленного выражения
let print_obj = func (o : Obj) -> Unit {
  let k = o.kind
  if k == ObjImmediate {
    fprintf(fout, "%d", o.imm)
  } else if k == ObjRegister or k == ObjAddress {
    fprintf(fout, "%%%d", o.reg)
  } else if k == ObjGlobal or k == ObjGlobalConst {
    fprintf(fout, "@%s", o.id)
  } else if k == ObjLocal or k == ObjRegister {
    fprintf(fout, "%%%s", o.id)
  } else if k == ObjInvalid {
    fprintf(fout, "<ObjInvalid>")
  }
}


