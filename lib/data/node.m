// lib/data/node


type Node = record {
  prev, next : *Node
  key, data  : *Unit
}


// for node_search
type NodeForeachHandler = (n : *Node, ctx : *Unit, index : Nat) -> Unit
type NodeSearchHandler = (n : *Node, ctx : *Unit, index : Nat) -> Bool



let node_init = func (node : *Node) -> Unit {
  memset(node, 0, sizeof Node)
}


let node_new = func () -> *Node {
  let new_node = malloc(sizeof Node) to *Node
  node_init(new_node)
  return new_node
}


// добавляет ноду an после ноды n
// если после n были ноды, они добавляются после an (то есть это по сути вставка)
let node_append = func (n : *Node, an : *Node) -> Unit {
  // insert before?
  let nnext = n.next
  if nnext != Nil {
    an.next = nnext
    nnext.prev = an
  }

  n.next = an
  an.prev = n
}


// исключает ноду из цепочки в которой она участвует
let node_exclude = func (node : *Node) -> Unit {
  let prev = node.prev
  let next = node.next

  if prev != Nil {
    prev.next = next
  }

  if next != Nil {
    next.prev = prev
  }
}


let node_foreach = func (node_chain : *Node, f : NodeForeachHandler, ctx : *Unit) -> Unit {
  if node_chain == Nil {return}
  var n : *Node
  n = node_chain
  var index : Nat  // номер ноды в этой цепи
  index = 0
  while n != Nil {
    f(n, ctx, index)
    n = n.next
    index = index + 1
  }
}


// применяет f к каждой ноде в цепочке node_chain
let node_search = func (node_chain : *Node, f : NodeSearchHandler, ctx : *Unit) -> *Node {
  if node_chain == Nil {return Nil}
  var n : *Node
  n = node_chain
  var index : Nat  // номер ноды в этой цепи
  index = 0
  while n != Nil {
    if f(n, ctx, index) {return n}
    n = n.next
    index = index + 1
  }
  return Nil
}


// поиск ноды по ссылке на data
let node_search_by_data = func (node_chain : *Node, data : *Unit) -> *Node {
  return node_search(node_chain, func NodeSearchHandler {return n.data == ctx}, data)
}


