// value/shift


// shl, shr слишком отличны чтобы входить в bin
let shift_op = func (k : ValueKind, l, r : *Value, ti : *TokenInfo) -> *Value {
  if l == Nil or r == Nil {goto fail}

  let ltype = Nil

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

    retv = value_new_imm_const(ltype, v)
  } else {
    retv = value_new_register(k, ltype, l, r)
  }

  retv.ti = ti
  return retv

fail:
  return Nil
}



let getTypeShift = func (v : *Value) -> *Type {
  let a = v.a[0]
  let r = v.a[1]
  getType(a)
  getType(r)

  // приводим GenericTypeInt к typeBaseInt если надо
  let t = post(a).type
  post(r)

  return t
}


