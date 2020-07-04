// m2/value/shift


// shl, shr слишком отличны чтобы входить в bin
let shift = func (k : ValueKind, l, r : *Value, ti : *TokenInfo) -> *Value {
  if l == Nil or r == Nil {goto fail}

  var retv : *Value
  retv = Nil

  // const folding
  if l.kind == ValueImmediate and
     r.kind == ValueImmediate {

    var v : Int64
    if k == ValueShl {
      v = l.imm << r.imm
    } else if k == ValueShr {
      v = l.imm >> r.imm
    }
    // возвращаем константу с Numeric типом (!)
    retv = valueNewImm(l.type, v, ti)
  } else {
    retv = valueNew(k, ti)
    retv.bin.l = l
    retv.bin.r = r
  }

  return retv

fail:
  return Nil
}



let checkValueShift = func (v : *Value) -> *Type {
  let l = v.bin.l
  let r = v.bin.r
  checkValue(l)
  checkValue(r)

  // (!) LLVM требует чтобы типы левого и правого в шифтах были одинаковы, что глупо но..
  // поэтому приводим правое к левому
  v.bin.r = cast(r, l.type, r.ti)
  let r2 = v.bin.r
  checkValue(r2)

  // приводим GenericTypeInt к typeBaseInt если надо
  castIfNumericTo(l, typeBaseInt)
  castIfNumericTo(r2, typeBaseInt)

  return l.type
}


