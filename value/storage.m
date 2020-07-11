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


type Storage = record {
  class : StorageClass

  reg : Nat32  // StorageRegister, StorageAddress
}



let storageIsConst = func (s : *Storage) -> Bool {
  let cl = s.class
  return cl == StorageGlobalConst
}


let storageIsMutable = func (s : *Storage) -> Bool {
  let cl = s.class
  return cl == StorageLocal or cl == StorageGlobal or cl == StorageAddress
}



let storageIsRegister = func (s : *Storage) -> Bool {
  return s.class == StorageRegister
}


