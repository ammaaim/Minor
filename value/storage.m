// m2/value/storage


type StorageClass = enum {
  // default class
  StorageUndefined,  // used by undefined value

  StorageImmediate,  // For Obj in printer
  /*
   * Global Immutable Object used by name
   * such as funcs, strings, literal arrays & records
   */
  StorageGlobalConst,

  // variables
  StorageLocal,      // local var
  StorageGlobal,     // global var

  // register
  StorageAddress,    // address of value in register
  StorageRegister    // value in LLVM register
}




let classIsConst = func (cl : StorageClass) -> Bool {
  return cl == StorageGlobalConst
}


let classIsMutable = func (cl : StorageClass) -> Bool {
  return cl == StorageLocal or cl == StorageGlobal or cl == StorageAddress
}



let storageIsRegister = func (cl : StorageClass) -> Bool {
  return cl == StorageRegister
}


