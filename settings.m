// settings


var settings : *Map



let set = func (id : Str, v : Nat64) -> Unit {
  let vx = malloc(sizeof Nat64) to *Nat64
  *vx = v

  let oldv = map_get(settings, id)
  if oldv == Nil {
    free(oldv)
    map_append(settings, id, vx)
  } else {
    map_reset(settings, id, vx)
  }
}


let get = func (id : Str) -> Nat64 {
  let vx = map_get(settings, id) to *Nat64
  return *vx
}


