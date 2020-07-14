// m2/prn/expr


let MAXARG = 64


type OperandKind = enum {
  OperandInvalid,    // An error occurred while evaluation

  OperandImmediate,  // Numeric value in imm field

  /*
   * Global Immutable Operandect used by name
   * such as funcs, strings, literal arrays & records
   */
  OperandGlobalConst,

  // variables
  OperandLocal,      // local var
  OperandGlobal,     // global var

  // register
  OperandAddress,    // address of value in register
  OperandRegister    // value in register
}


// Объект принтера - содержит тип значения и его местоположение
type Operand = record {
  kind : OperandKind

  type : *Type

  imm  : Int64  // OperandImmediate
  id   : Str    // OperandGlobalConst, OperandLocal, OperandGlobal
  reg  : Nat32  // OperandRegister, OperandAddress
}


// new printer operand
let operand = func (t : *Type, k : OperandKind, reg : Nat32) -> Operand {
  var o : Operand
  o.type = t
  o.kind = k
  o.reg = reg
  o.id = Nil
  o.imm = 0
  return o
}


// evaluator type
type Eval = (v : *Value) -> Operand


// value evaluation
// Принимает на вход значение. Возвращает объект принтера
// Значения-операции вычисляются. Результатом может быть константа, имя, регистр или адрес.
// Имена и адреса нуждаются в дополнительной загрузке функцией load
// (только если это не lval)
let eval = func Eval {
  let k = v.kind

  var operand : Operand
  operand.type = v.type

  // terms
  if k == ValueImmediate {
    operand.kind = OperandImmediate
    operand.imm = v.imm
    return operand
  } else if k == ValueGlobalConst {
    operand.kind = OperandGlobalConst
    operand.id = v.id
    return operand
  } else if k == ValueLocalVar {
    operand.kind = OperandLocal
    operand.id = v.id
    return operand
  } else if k == ValueGlobalVar {
    operand.kind = OperandGlobal
    operand.id = v.id
    return operand
  } else if k == ValueRegister or k == ValueParam {
    operand.kind = OperandRegister
    operand.reg = v.reg
    return operand

  // operations
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

  // вычисляем аргументы перед печатью вызова

  // контекст в котором накапливаются вычисленные аргументы
  type Arguments = record {
    args : [MAXARG]Operand
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

  // печатаем вызов

  var retval_reg : Nat32
  if type_eq(f.type.function.to, typeUnit) {
    fprintf(fout, "\n  call ")
  } else {
    retval_reg = lab_get()
    fprintf(fout, "\n  %%%d = call ", retval_reg)
  }

  printType(f.type, False, False)
  space()

  print_operand(f)

  // печатаем список аргументов

  o(" (")

  var need_comma : Bool
  need_comma = False

  var c : Nat16
  c = 0

  while c < args.cnt {
    if need_comma {comma()}
    printType(args.args[c].type, True, True)
    space()
    print_operand(args.args[c])
    need_comma = True
    c = c + 1
  }

  o(")")

  return operand(v.type, OperandRegister, retval_reg)
}


let eval_index = func Eval {
  var a : Operand
  a = eval(v.index.array)

  let i = load(eval(v.index.index))

  if a.type.array.undefined {
    a = load(a)
  }

  let is_def_array_in_register = a.kind == OperandRegister and typeIsDefinedArray(a.type)
  let index_is_imm = True

  // работа именно со значением в регистре
  if is_def_array_in_register and index_is_imm {
    let reg = lab_get()
    //%7 = extractvalue { i8*, i8* } %4, 0
    fprintf(fout, "\n  %%%d = extractvalue ", reg)
    printType(a.type, True, True)
    space()
    print_operand(a)
    fprintf(fout, ", %u", i.imm)
    return operand(v.type, OperandRegister, reg)
  }

  // работа по ссылке на массив

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

  print_operand(a)
  if not a.type.array.undefined {
    o(", i32 0")
  }
  comma()
  printType(i.type, True, True)
  space()
  print_operand(i)
  return operand(v.type, OperandAddress, reg)
}


let eval_access = func Eval {
  var s : Operand
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

  let is_record_in_register = s.kind == OperandRegister and s.type.kind == TypeRecord

  // работа именно со значением в регистре
  if is_record_in_register {
    let reg = lab_get()
    //%7 = extractvalue { i8*, i8* } %4, 0
    fprintf(fout, "\n  %%%d = extractvalue ", reg)
    printType(record_type, True, True)
    space()
    print_operand(s)
    fprintf(fout, ", %u", fieldno)
    return operand(v.type, OperandRegister, reg)
  }

  // работа по ссылке на структуру

  // todo: совмести это с index - там в сущность такой же алгоритм
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = getelementptr inbounds ", reg)
  printType(record_type, True, True)
  comma()
  printType(record_type, True, True)
  o("* ")
  print_operand(s)
  fprintf(fout, ", i32 0, i32 %u", fieldno)
  return operand(v.type, OperandAddress, reg)
}


let eval_ref = func Eval {
  let vx = eval(v.un.x)
  if vx.kind == OperandAddress {
    // если это адрес - вернем его в регистре, а тип обернем в указатель
    return operand(v.type, OperandRegister, vx.reg)
  }

  //%7 = getelementptr inbounds %Int32, %Int32* @a, i32 0
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = getelementptr inbounds ", reg)
  printType(vx.type, True, True)
  comma()
  printType(vx.type, True, True)
  o("* ")
  print_operand(vx)
  comma()
  o("i32 0")

  return operand(v.type, OperandRegister, reg)
}


let eval_deref = func Eval {
  // load pointer
  let vx = load(eval(v.un.x))

  // returns loaded pointer as #Address
  return operand(v.type, OperandAddress, vx.reg)
}


let eval_not = func Eval {
  let vx = load(eval(v.un.x))

  //"%s = xor %s, -1"
  let reg = lab_get()
  fprintf(fout, "\n  %%%d = xor ", reg)
  printType(vx.type, True, True)
  space()
  print_operand(vx)
  if (type_eq(vx.type, typeBool)) {o(", 1")} else {o(", -1")}
  return operand(vx.type, OperandRegister, reg)
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
  print_operand(vx)
  return operand(vx.type, OperandRegister, reg)
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

  let e = load(eval(v.cast.value))

  // преиведение значения к собственному типу бессмыслено
  // поэтому просто возвращаем загруженное значение
  if type_eq(e.type, to) {return e}

  let reg = lab_get()
  fprintf(fout, "\n  %%%d = ", reg)

  let k = e.type.kind

  var opcode : Str
  opcode = "<cast>"

  if to.kind == TypeArray {
    if k == TypeBasic {
      opcode = "inttoptr"  // int -> arr
    } else {
      opcode = "bitcast"   // x -> arr
    }
  } else if to.kind == TypePointer or to.kind == TypeFunction {
    // x -> Pointer
    if k == TypePointer or
       k == TypeArray or
       k == TypeFunction {
      opcode = "bitcast"   // ptr -> ptr
    } else {
      opcode = "inttoptr"  // int -> ptr
    }
  } else if to.kind == TypeBasic {
    // X -> Basic
      if k == TypeBasic {
        // Basic -> Basic
      if e.type.basic.p > to.basic.p {
        // power(v) > power(t)
        opcode = "trunc"   // INT -> int
      } else if e.type.basic.p < to.basic.p {
        // power(v) < power(t)
        if to.basic.s {
          opcode = "sext"  // int -> SIGNED_INT
        } else {
          opcode = "zext"  // int -> UNSIGNED_INT
        }
      } else {
        // power(v) == power(t)
        opcode = "bitcast"  // type -> type
      }
    } else if k == TypePointer {
      // Pointer -> Basic
      opcode = "ptrtoint"
    } else if k == TypeEnum {
      // Enum -> Basic
      let esz = cfg.enumSize to Nat * 8

      if esz > to.basic.p {
        // power(v) > power(t)
        opcode = "trunc"
      } else if esz < to.basic.p {
        // power(v) < power(t)
        opcode = "zext"
      } else {
        // power(v) == power(t)
        opcode = "bitcast"
      }

    } else if k == TypeArray {

    } else {
      //*/
      printf("e.type.kind = %d\n", k)
      fatal("printer/expr/cast :: e.type.kind")
    }
  }

  fprintf(fout, "%s ", opcode)

  printType(e.type, True, True)
  space()
  print_operand(e)
  o(" to ")
  printType(to, True, True)

  return operand(v.type, OperandRegister, reg)
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
  print_operand(l)
  comma()
  print_operand(r)

  return operand(v.type, OperandRegister, reg)
}


let print_st = func (l, r : *Value) -> Unit {
  let lx = eval(l)
  let rx = load(eval(r))
  fprintf(fout, "\n  store ")
  printType(rx.type, True, True)
  space()
  print_operand(rx)
  comma()
  printType(rx.type, True, True)
  o("* ")
  print_operand(lx)
}



// загрузка (если она необходима) значения вычисленного выражения
let load = func (x : Operand) -> Operand {
  if x.kind == OperandInvalid {return x}

  let loadImmPtr = func (x : Operand) -> Operand {
    let t = x.type
    let reg = lab_get()
    fprintf(fout, "\n  %%%d = inttoptr i64 ", reg)
    print_operand(x)
    o(" to ")
    printType(t, True, True)
    return operand(t, OperandRegister, reg)
  }

  // LLVM не умеет так ... i32* 12233445 - нужно привести int значение к типу
  // явной операцией inttoptr. Поэтому если нам попался указатель вида ValueImmediate
  // то его нужно будет загрузить в регистр функцией inttoptr
  if x.kind == OperandImmediate {
    if typeIsReference(x.type) {
      return loadImmPtr(x)
    }
    return x
  }

  // в загрузке нуждаются только значения с изменяемым классом памяти
  // это OperandGlobal, OperandLocal & OperandAddress;
  // остальные вернем просто так
  if x.kind != OperandLocal and x.kind != OperandGlobal and x.kind != OperandAddress {
    return x
  }

  let reg = lab_get()
  fprintf(fout, "\n  %%%d = load ", reg)
  printType(x.type, True, True)
  comma()
  printType(x.type, True, True)
  o("* ")
  print_operand(x)

  return operand(x.type, OperandRegister, reg)
}


// печать значения вычисленного выражения
let print_operand = func (o : Operand) -> Unit {
  let k = o.kind
  if k == OperandImmediate {
    fprintf(fout, "%d", o.imm)
  } else if k == OperandRegister or k == OperandAddress {
    fprintf(fout, "%%%d", o.reg)
  } else if k == OperandGlobal or k == OperandGlobalConst {
    fprintf(fout, "@%s", o.id)
  } else if k == OperandLocal {
    fprintf(fout, "%%%s", o.id)
  } else if k == OperandInvalid {
    fprintf(fout, "<OperandInvalid>")
  }
}


