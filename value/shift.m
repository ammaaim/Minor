// m2/value/shift


// shl, shr слишком отличны чтобы входить в bin
let shift = func (k : ValueKind, l, r : *Value, ti : *TokenInfo) -> *Value {
  if l == Nil or r == Nil {goto fail}

  let v = valueNew(k, ti)
  v.bin.l = l
  v.bin.r = r

  return v

fail:
  return Nil
}



let checkValueShift = func (v : *Value) -> *Type {
  let l = v.bin.l
  let r = v.bin.r

  checkValue(l)
  checkValue(r)

  // свертка констант
  if l.kind == ValueImmediate and
     r.kind == ValueImmediate {

    let k = v.kind
    v.kind = ValueImmediate

    if k == ValueShl {
      v.imm = l.imm << r.imm
    } else if k == ValueShr {
      v.imm = l.imm >> r.imm
    }
    return typeNumeric
  }

  v.bin.l = castIfNumericTo(l, typeBaseInt)

  // (!) LLVM требует чтобы типы левого и правого в шифтах были одинаковы,
  // что глупо но.. поэтому приводим правое к левому
  v.bin.r = cast(v.bin.r, v.bin.l.type, r.ti)

  checkValue(v.bin.r)

  return l.type
}


