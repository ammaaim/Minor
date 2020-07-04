// m2/value/storage


type StorageClass = enum {
  // default class
  StorageUndefined,  // used by undefined value

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

//union {
  reg : Nat32  // StorageRegister, StorageAddress
  id  : Str    // StorageLocal, StorageGlobal, StorageGlobalConst
//}
}



let storageIsConst = func (s : *Storage) -> Bool {
  let cl = s.class
  return cl == StorageGlobalConst or cl == StorageUndefined
}


let storageIsMutable = func (s : *Storage) -> Bool {
  let cl = s.class
  return cl == StorageLocal or cl == StorageGlobal or cl == StorageAddress or cl == StorageUndefined
}


let storageIsRegister = func (s : *Storage) -> Bool {
  return s.class == StorageRegister
}


