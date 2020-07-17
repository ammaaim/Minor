// value/init


/* create global values: True, False, Nil */
let value_init = func () -> Unit {
  // False
  let false = valueNewImm(typeBool, 0, Nil)
  map_append(&builtinIndex.values, "False", false)

  // True
  let true = valueNewImm(typeBool, 1, Nil)
  map_append(&builtinIndex.values, "True", true)

  // Unit value. What for?
  let unit = valueNewImm(typeUnit, 1, Nil)
  map_append(&builtinIndex.values, "Unit", unit)

  // Nil
  let nil = valueNewImm(typeFreePtr, 0, Nil)
  map_append(&builtinIndex.values, "Nil", nil)
}


