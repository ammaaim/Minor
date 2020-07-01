// m2/value/storage


type StorageClass = enum {
  // default value
  StorageUndefined,  // used by undefined value

  // Immediate consants, use is_const_storage
  StorageImmediate,  // integer const (in storage#val)


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
  StorageRegister    // value in register
}


type Storage = record {
  class : StorageClass

//union {
  val : Int64  // StorageImmediate
  reg : Nat32  // StorageRegister, StorageAddress
  id  : Str    // StorageLocal, StorageGlobal, StorageString, StorageArray, StorageFunc
//}
}



let storageIsConst = func (s : *Storage) -> Bool {
  let cl = s.class
  return cl == StorageImmediate or cl == StorageGlobalConst
}


let storageIsMutable = func (s : *Storage) -> Bool {
  let cl = s.class
  return cl == StorageLocal or cl == StorageGlobal or cl == StorageAddress
}


let storageIsRegister = func (s : *Storage) -> Bool {
  return s.class == StorageRegister
}


