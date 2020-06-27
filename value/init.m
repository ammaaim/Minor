// value/init


/* create global values: True, False, Nil */
let value_init = func () -> Unit {
  // Create False constant
  let false = value_new_imm_const(typeBool, 0)
  bind_value_builtin("False", false)

  // Create True constant
  let true = value_new_imm_const(typeBool, 1)
  bind_value_builtin("True", true)

  // Unit value. What for?
  let unit = value_new_imm_const(typeUnit, 1)
  bind_value_builtin("Unit", unit)


  //let nat0 = value_new_imm_const(typeBaseNat, 0)
  //let nil = value_new_register(ValueCast, type_new(TypeGenericRef), nat0, Nil)
  //bind_value_builtin("Nil", nil)
}


