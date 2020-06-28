// value/shift


// shl, shr слишком отличны чтобы входить в bin
let shift_op = func (k : ValueKind, l, r : *Value, ti : *TokenInfo) -> *Value {
  if l == Nil or r == Nil {goto fail}

  var retv : *Value
  retv = Nil

  /* const folding */
  if l.storage.class == StorageImmediate and
     r.storage.class == StorageImmediate {

    var v : Int64
    if k == ValueShl {
      v = l.storage.val << r.storage.val
    } else if k == ValueShr {
      v = l.storage.val >> r.storage.val
    }
    // возвращаем константу с Numeric типом (!)
    retv = value_new_imm_const(l.type, v)
  } else {
    retv = value_new_register(k, Nil, Nil, Nil)
    retv.bin.l = l
    retv.bin.r = r
  }

  retv.ti = ti
  return retv

fail:
  return Nil
}



let getTypeShift = func (v : *Value) -> *Type {
  let l = v.bin.l
  let r = v.bin.r
  getType(l)
  getType(r)

  // приводим GenericTypeInt к typeBaseInt если надо
  let t = castIfNumericTo(l, typeBaseInt).type
  castIfNumericTo(r, typeBaseInt)
  return l.type
}


