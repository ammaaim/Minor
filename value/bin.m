// m2/value/bin


type ValueBin = record {l, r : *Value}



// тип пригоден для бинарной операции?
let binTypeValid = func (k : ValueKind, t : *Type) -> Bool {
  if k == ValueEq or k == ValueNe {return True}

  if type_is_basic_integer(t) or t.kind == TypeNumeric {return True}

  if type_eq(t, typeBool) {
    return k == ValueAnd or k == ValueOr or k == ValueXor
  }

  return False
}


let bin = func (k : ValueKind, l, r : *Value, ti : *TokenInfo) -> *Value {
  if l == Nil or r == Nil {goto fail}

  let v = valueNew(k, ti)
  v.bin.l = l
  v.bin.r = r
  return v

fail:
  return Nil
}



let checkValueBinary = func (v : *Value) -> *Type {
  let lv = v.bin.l
  let rv = v.bin.r

  let lt0 = checkValue(lv)
  let rt0 = checkValue(rv)

  if lt0 == Nil or rt0 == Nil {goto fail}

  let l = nat(lv, rv.type)
  let r = nat(rv, l.type)

  let lt = l.type
  let rt = r.type

  if not type_eq(lt, rt) {
    error(E_TYPE_ERROR, v.ti)
    printf("LTYPE = "); prttype(lt); printf("\n")
    printf("RTYPE = "); prttype(rt); printf("\n")
    goto fail
  }

  let k = v.kind

  if not binTypeValid(k, lt) {
    error("binary type error", v.ti)
    return Nil
  }

  v.bin.l = l
  v.bin.r = r

  if l.kind == ValueImmediate and r.kind == ValueImmediate {
    binFold(v)
  }

  if isReletionOpKind(k) {
    return typeBool
  } else {
    return l.type
  }

fail:
  return Nil
}


let binFold = func (vx : *Value) -> Unit {
  var res : Int64
  var t : *Type

  let lv = vx.bin.l.imm
  let rv = vx.bin.r.imm

  let k = vx.kind

  // у левого может быть TypeNumeric, а может быть любо другой Int тип
  // то что он имеет StorageImmediate не значит что он не мог быть типизирован!
  t = vx.bin.l.type

  if k == ValueAdd {
    res = lv + rv
  } else if k == ValueSub {
    res = lv - rv
  } else if k == ValueMul {
    res = lv * rv
  } else if k == ValueDiv {
    res = lv / rv
  } else if k == ValueMod {
    res = lv % rv
  } else if k == ValueOr {
    res = lv or rv
  } else if k == ValueXor {
    res = lv xor rv
  } else if k == ValueAnd {
    res = lv and rv
  } else {
    t = typeBool
    if k == ValueEq {
      res = (lv == rv) to Int64
    } else if k == ValueNe {
      res = (lv != rv) to Int64
    } else if k == ValueLt {
      res = (lv < rv) to Int64
    } else if k == ValueGt {
      res = (lv > rv) to Int64
    } else if k == ValueLe {
      res = (lv <= rv) to Int64
    } else if k == ValueGe {
      res = (lv >= rv) to Int64
    } else {
      assert(False, "binImm :: unknown bin operation")
    }
  }

  vx.kind = ValueImmediate
  vx.imm = res
}


/*// это операция требующая только #Numeric аргументов
let isNumericOperation = func (k : ValueKind) -> Bool {
  return k == ValueAdd or k == ValueSub or
         k == ValueSub or k == ValueMul or k == ValueDiv or
         k == ValueLt or k == ValueGt or k == ValueLe or k == ValueGe
}


// это операция требующая только #Numeric или #Logic аргументов
let isLogicNumericOperation = func (k : ValueKind) -> Bool {
  return k == ValueOr or k == ValueXor or k == ValueAnd
}*/


