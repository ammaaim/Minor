// value/bin


// тип пригоден для бинарной операции?
let binTypeOk = func (k : ValueKind, t : *Type) -> Bool {
  if k == ValueEq or k == ValueNe {return True}

  if type_is_basic_integer(t) or t.kind == TypeNumeric {return True}

  if type_eq(t, typeBool) {
    return k == ValueAnd or k == ValueOr or k == ValueXor
  }

  return False
}


// это операция требующая только #Numeric аргументов
let isNumericOperation = func (k : ValueKind) -> Bool {
  return k == ValueAdd or k == ValueSub or
         k == ValueSub or k == ValueMul or k == ValueDiv or
         k == ValueLt or k == ValueGt or k == ValueLe or k == ValueGe
}


// это операция требующая только #Numeric или #Logic аргументов
let isLogicNumericOperation = func (k : ValueKind) -> Bool {
  return k == ValueOr or k == ValueXor or k == ValueAnd
}


let bin = func (k : ValueKind, l, r : *Value, ti : *TokenInfo) -> *Value {
  if l == Nil or r == Nil {goto fail}

  let t = Nil

  var v : *Value
  if l.storage.class == StorageImmediate and
     r.storage.class == StorageImmediate {
    v = binImm(k, l, r)  // const folding
  } else {
    v = value_new_register(k, t, l, r)
    v.bin.l = l
    v.bin.r = r
  }

  v.ti = ti
  return v

fail:
  return Nil
}


let binImm = func (k : ValueKind, l, r : *Value) -> *Value {
  var v : Int64
  var t : *Type

  let lv = l.storage.val
  let rv = r.storage.val

  t = type_new(TypeNumeric)

  if k == ValueAdd {
    v = lv + rv
  } else if k == ValueSub {
    v = lv - rv
  } else if k == ValueMul {
    v = lv * rv
  } else if k == ValueDiv {
    v = lv / rv
  } else if k == ValueMod {
    v = lv % rv
  } else if k == ValueOr {
    v = lv or rv
  } else if k == ValueXor {
    v = lv xor rv
  } else if k == ValueAnd {
    v = lv and rv
  } else {
    t = typeBool
    if k == ValueEq {
      v = (lv == rv) to Int64
    } else if k == ValueNe {
      v = (lv != rv) to Int64
    } else if k == ValueLt {
      v = (lv < rv) to Int64
    } else if k == ValueGt {
      v = (lv > rv) to Int64
    } else if k == ValueLe {
      v = (lv <= rv) to Int64
    } else if k == ValueGe {
      v = (lv >= rv) to Int64
    } else {
      assert(False, "binImm :: unknown bin operation")
    }
  }

  return value_new_imm_const(t, v)
}


let getTypeBinary = func (v : *Value) -> *Type {
  let lv = v.bin.l
  let rv = v.bin.r

  let lt0 = getType(lv)
  let rt0 = getType(rv)

  if lt0 == Nil or rt0 == Nil {goto fail}

  let l = nat(lv, rv.type)
  let r = nat(rv, l.type)

  let lt = l.type
  let rt = r.type

  if not type_eq(lt, rt) {
    error("type error", v.ti)
    printf("LTYPE = "); prttype(lt); printf("\n")
    printf("RTYPE = "); prttype(rt); printf("\n")
    goto fail
  }

  let op_kind = v.kind

  if not binTypeOk(op_kind, lt) {
    error("binary type error", v.ti)
    return Nil
  }

  v.bin.l = l
  v.bin.r = r

  if isReletionOpKind(op_kind) {
    return typeBool
  } else {
    return lt
  }

fail:
  return Nil
}


