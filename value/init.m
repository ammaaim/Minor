// value/init


/* create global values: True, False, Nil */
let value_init = func () -> Unit {
  // Create False constant
  let false = valueNewImm(typeBool, 0)
  bind_value_builtin("False", false)

  // Create True constant
  let true = valueNewImm(typeBool, 1)
  bind_value_builtin("True", true)

  // Unit value. What for?
  let unit = valueNewImm(typeUnit, 1)
  bind_value_builtin("Unit", unit)

  // Nil reference
  let nil = valueNewImm(typeFreePtr, 0)
  bind_value_builtin("Nil", nil)
}


