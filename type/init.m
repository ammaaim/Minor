


let type_init = func () -> Unit {

  // Signed Numeric
  let typeInt8  = type_new_basic("Int8",  1,  8, True, True)
  let typeInt16 = type_new_basic("Int16", 2, 16, True, True)
  let typeInt32 = type_new_basic("Int32", 4, 32, True, True)
  let typeInt64 = type_new_basic("Int64", 8, 64, True, True)

  let typeInt128 = type_new_basic("Int128", 16, 128, True, True)
  let typeInt256 = type_new_basic("Int256", 32, 256, True, True)
  let typeInt512 = type_new_basic("Int512", 64, 512, True, True)
  let typeInt1024 = type_new_basic("Int1024", 128, 1024, True, True)

  // Unsigned Numeric
  let typeNat8  = type_new_basic("Nat8",  1,  8, True, False)
  let typeNat16 = type_new_basic("Nat16", 2, 16, True, False)
  let typeNat32 = type_new_basic("Nat32", 4, 32, True, False)
  let typeNat64 = type_new_basic("Nat64", 8, 64, True, False)

  let typeNat128 = type_new_basic("Nat128", 16, 128, True, False)
  let typeNat256 = type_new_basic("Nat256", 32, 256, True, False)
  let typeNat512 = type_new_basic("Nat512", 64, 512, True, False)
  let typeNat1024 = type_new_basic("Nat1024", 128, 1024, True, False)


  // сперва добавляем наиболее популярные типы

  bind_type_builtin("Int64", typeInt64)
  bind_type_builtin("Nat64", typeNat64)

  bind_type_builtin("Int32", typeInt32)
  bind_type_builtin("Nat32", typeNat32)

  bind_type_builtin("Int8", typeInt8)
  bind_type_builtin("Nat8", typeNat8)

  bind_type_builtin("Int16", typeInt16)
  bind_type_builtin("Nat16", typeNat16)

  // тяжелая артиллерия идет сзади
  bind_type_builtin("Int128", typeInt128)
  bind_type_builtin("Int256", typeInt256)
  bind_type_builtin("Int512", typeInt512)
  bind_type_builtin("Int1024", typeInt1024)

  bind_type_builtin("Nat128", typeNat128)
  bind_type_builtin("Nat256", typeNat256)
  bind_type_builtin("Nat512", typeNat512)
  bind_type_builtin("Nat1024", typeNat1024)


  // Special builtin types
  typeUnit = type_new_basic("Unit", 1, 0, False, False)
  typeBool = type_new_basic("Bool", 1, 1, False, False)

  typeChar = typeNat8
  typeStr = type_new_array(typeChar, 0, True)
  typeStr.aka = "Str"

  bind_type_builtin("Unit", typeUnit)
  bind_type_builtin("Bool", typeBool)
  bind_type_builtin("Str", typeStr)

  // main types shortcuts
  typeFreePtr = type_new_pointer(typeUnit)
  typeBaseInt = typeInt32
  typeBaseNat = typeNat32
  typeSizeof = typeNat32
  typeAlignof = typeInt16
  typeEnum = typeInt16
}


