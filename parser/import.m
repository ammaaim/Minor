

var imports : Map



let importAdd = func (s : Str, m : *Module) -> Unit {
  map_append(&imports, s, m)
}


let importGet = func (s : Str) -> *Module {
  let m = map_get(&imports, s)
  if m != Nil {return m}

  return Nil
}


