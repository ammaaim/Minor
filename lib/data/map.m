// lib/data/map

import "lib/C"
//import "lib/data/node"
//import "lib/data/list"


type Map = List

type MapForeachHandler = (k, v : *Unit, ctx : *Unit) -> Unit



let map_new = list_new
let map_init = list_init


let map_append = func (m : *Map, k : Str, v : *Unit) -> Bool {
  if m == Nil or k == Nil or v == Nil {return False}

  let new_node = node_new()

  new_node.key = k
  new_node.data = v

  if m.first == Nil {
    m.first = new_node
  } else {
    node_append(m.last, new_node)
  }

  m.last = new_node

  m.volume = m.volume + 1
  return True
}


let map_list_node_get = func (m : *Map, k : Str) -> *Node {
  let f = func NodeSearchHandler {
    return strcmp(n.key to Str, ctx to Str) == 0
  }
  return node_search(m.first, f, k)
}


let map_reset = func (m : *Map, k : Str, v : *Unit) -> Unit {
  let n = map_list_node_get(m, k)
  n.data = v
}


// возвращает ссылку на данные из изъятой ноды
let map_remove = func (m : *Map, k : Str) -> *Unit {
  let n = map_list_node_get(m, k)
  if n == Nil {return Nil}
  let data = n.data
  list_node_remove(m, n)
  return data
}


let map_get = func (m : *Map, k : Str) -> *Unit {
  let n = map_list_node_get(m, k)
  if n != Nil {return n.data}
  return Nil
}


let map_foreach = func (m : *Map, f : MapForeachHandler, ctx : *Unit) -> Unit {
  var n : *Node
  n = m.first
  while n != Nil {
    f(n.key, n.data, ctx)
    n = n.next
  }
}


let map_extend = list_extend




