// m2/prn/2str


let print_ObjKind = func (k : ObjKind) -> Str {
  if k == ObjKindUndefined {
    return "ObjKindUndefined"
  } else if k == ObjKindGlobalConst {
    return "ObjKindGlobalConst"
  } else if k == ObjKindRegister {
    return "ObjKindRegister"
  } else if k == ObjKindAddress {
    return "ObjKindAddress"
  } else if k == ObjKindLocal {
    return "ObjKindLocal"
  } else if k == ObjKindGlobal {
    return "ObjKindGlobal"
  }
  return "ObjKindClassUnknown"
}


