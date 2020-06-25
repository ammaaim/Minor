


let assign = func (l, r : *Value, ti : *TokenInfo) -> *Stmt {
  if l == Nil or r == Nil {return Nil}
  return stmt_new_assign(l, r, ti)
}


let checkStmtAssign = func (s : *Stmt) -> Unit {
  let lv = s.a[0]
  let rv = s.a[1]

  let lt = getType(lv)
  let rt = getType(rv)

  //if lt == Nil or rt == Nil {return}

  if not storageIsMutable(&lv.storage) {
    error("invalid lval", lv.ti)
    return
  }

  let r = nat(rv, lv.type)

  if not type_eq(lt, r.type) {
    error("type error", s.ti)
    printf("LTYPE = "); prttype(lt); printf("\n")
    printf("RTYPE = "); prttype(r.type); printf("\n")
  }

  s.a[1] = r
}


