// value/init


/* create global values: True, False, Nil */
let value_init = func () -> Unit {
  // False
  let false = valueNewImm(typeBool, 0, Nil)
  bind_value_builtin("False", false)

  // True
  let true = valueNewImm(typeBool, 1, Nil)
  bind_value_builtin("True", true)

  // Unit value. What for?
  let unit = valueNewImm(typeUnit, 1, Nil)
  bind_value_builtin("Unit", unit)

  // Nil
  let nil = valueNewImm(typeFreePtr, 0, Nil)
  bind_value_builtin("Nil", nil)
}


