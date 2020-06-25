// type/init


let type_init = func () -> Unit {

  // Special builtin types
  typeUnit = type_basic_new("Unit", 1, 0, False, False)
  typeBool = type_basic_new("Bool", 1, 1, False, False)
  bind_type_builtin("Unit", typeUnit)
  bind_type_builtin("Bool", typeBool)


  // Signed Numeric
  let typeInt8  = type_basic_new("Int8",  1,  8, True, True)
  let typeInt16 = type_basic_new("Int16", 2, 16, True, True)
  let typeInt32 = type_basic_new("Int32", 4, 32, True, True)
  let typeInt64 = type_basic_new("Int64", 8, 64, True, True)

  let typeInt128 = type_basic_new("Int128", 16, 128, True, True)
  let typeInt256 = type_basic_new("Int256", 32, 256, True, True)
  let typeInt512 = type_basic_new("Int512", 64, 512, True, True)
  let typeInt1024 = type_basic_new("Int1024", 128, 1024, True, True)

  // Unsigned Numeric
  let typeNat8  = type_basic_new("Nat8",  1,  8, True, False)
  let typeNat16 = type_basic_new("Nat16", 2, 16, True, False)
  let typeNat32 = type_basic_new("Nat32", 4, 32, True, False)
  let typeNat64 = type_basic_new("Nat64", 8, 64, True, False)

  let typeNat128 = type_basic_new("Nat128", 16, 128, True, False)
  let typeNat256 = type_basic_new("Nat256", 32, 256, True, False)
  let typeNat512 = type_basic_new("Nat512", 64, 512, True, False)
  let typeNat1024 = type_basic_new("Nat1024", 128, 1024, True, False)


  // Add most popular types
  bind_type_builtin("Int64", typeInt64)
  bind_type_builtin("Nat64", typeNat64)

  bind_type_builtin("Int32", typeInt32)
  bind_type_builtin("Nat32", typeNat32)

  bind_type_builtin("Int8", typeInt8)
  bind_type_builtin("Nat8", typeNat8)

  bind_type_builtin("Int16", typeInt16)
  bind_type_builtin("Nat16", typeNat16)


  // Add builtin type Str
  typeChar = typeNat8
  typeStr = type_array_new(typeChar, 0, True)
  typeStr.aka = "Str"
  bind_type_builtin("Str", typeStr)


  // Add heavy types
  bind_type_builtin("Int128", typeInt128)
  bind_type_builtin("Int256", typeInt256)
  bind_type_builtin("Int512", typeInt512)
  bind_type_builtin("Int1024", typeInt1024)

  bind_type_builtin("Nat128", typeNat128)
  bind_type_builtin("Nat256", typeNat256)
  bind_type_builtin("Nat512", typeNat512)
  bind_type_builtin("Nat1024", typeNat1024)


  // main types shortcuts
  typeFreePtr = type_pointer_new(typeUnit)
  typeBaseInt = typeInt32
  typeBaseNat = typeNat32
  typeSizeof = typeNat32
  typeAlignof = typeInt16
  typeEnum = typeInt16
}


