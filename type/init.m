// m2/type/init


let type_init = func () -> Unit {

  // Special builtin types
  typeUnit = type_basic_new("Unit", 1, 0, False, False)
  typeBool = type_basic_new("Bool", 1, 1, False, False)
  map_append(&builtinIndex.types, "Unit", typeUnit)
  map_append(&builtinIndex.types, "Bool", typeBool)


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
  map_append(&builtinIndex.types, "Int64", typeInt64)
  map_append(&builtinIndex.types, "Nat64", typeNat64)

  map_append(&builtinIndex.types, "Int32", typeInt32)
  map_append(&builtinIndex.types, "Nat32", typeNat32)

  map_append(&builtinIndex.types, "Int8", typeInt8)
  map_append(&builtinIndex.types, "Nat8", typeNat8)

  map_append(&builtinIndex.types, "Int16", typeInt16)
  map_append(&builtinIndex.types, "Nat16", typeNat16)


  // Add builtin type Str
  typeChar = typeNat8
  typeStr = type_array_new(typeChar, 0, True)
  typeStr.aka = "Str"
  map_append(&builtinIndex.types, "Str", typeStr)


  // Add heavy types
  map_append(&builtinIndex.types, "Int128", typeInt128)
  map_append(&builtinIndex.types, "Int256", typeInt256)
  map_append(&builtinIndex.types, "Int512", typeInt512)
  map_append(&builtinIndex.types, "Int1024", typeInt1024)

  map_append(&builtinIndex.types, "Nat128", typeNat128)
  map_append(&builtinIndex.types, "Nat256", typeNat256)
  map_append(&builtinIndex.types, "Nat512", typeNat512)
  map_append(&builtinIndex.types, "Nat1024", typeNat1024)


  // main types shortcuts
  typeUnknown = type_new(TypeUnknown)
  typeFreePtr = type_pointer_new(typeUnit)
  typeNumeric = type_new(TypeNumeric)
  typeBaseInt = typeInt32
  //typeBaseNat = typeNat32
  typeEnum = typeInt16
}


