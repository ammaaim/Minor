// m2/value/storage


type StorageClass = enum {
  // default value
  StorageUndefined,  // used by undefined value

  // consants, use is_const_storage
  StorageImmediate,  // integer const (in storage#val)

  StorageFunction,   // literal func

  StorageGlobalConst,  // глобальный неизменяемый объект (строка, массив, запись)

//  StorageArray,      // literal array
  StorageRecord,     // literal record

  // variables
  StorageLocal,      // local var
  StorageGlobal,     // global var

  // register
  StorageAddress,    // address of value in register
  StorageRegister    // value in register
}


type String = record {
  data   : Str
  length : Nat32
}


type Storage = record {
  class : StorageClass

//union {
  val : Int64  // StorageImmediate
  reg : Nat32  // StorageRegister, StorageAddress
  id  : Str    // StorageLocal, StorageGlobal, StorageString, StorageArray, StorageFunc
//}

  str      : String  // StorageString
  arr_data : *List   // StorageArray
}



let storageIsConst = func (s : *Storage) -> Bool {
  let cl = s.class
  let is_const = cl == StorageImmediate or
                 cl == StorageFunction or
                 cl == StorageGlobalConst or
//                 cl == StorageArray or
                 cl == StorageRecord
  return is_const
}


let storageIsMutable = func (s : *Storage) -> Bool {
  let cl = s.class
  return cl == StorageLocal or cl == StorageGlobal or cl == StorageAddress
}


let storageIsRegister = func (s : *Storage) -> Bool {
  return s.class == StorageRegister
}


