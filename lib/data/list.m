// data/list


import "node"

/*
 * Типы функций-обработчиков для объектов списка
 * параметр data - указатель на элемент списка
 * параметр ctx - указатель на произвольные данные
 * параметр index - номер текущего элемента в списке
 */

// list_foreach
type ListForeachHandler = (data, ctx : *Unit, index : Nat) -> Unit

// list_foreach2
type ListForeachHandler2 = (data1, data2, ctx : *Unit, index : Nat) -> Unit

// list_compare
type ListCompareHandler = (data1, data2, ctx : *Unit, index : Nat) -> Bool

// list_search
type ListSearchHandler = (data, ctx : *Unit, index : Nat) -> *Unit

// list_map
type ListMapHandler = (data, ctx : *Unit, index : Nat) -> *Unit



type List = record {
  first, last : *Node
  volume      : Nat64
}



let list_init = func (list : *List) -> Unit {
  memset(list, 0, sizeof List)
}


let list_new = func () -> *List {
  let n = malloc(sizeof List) to *List
  list_init(n)
  return n
}


// добавляет объект в конец списка
let list_append = func (list : *List, obj : *Unit) -> Bool {
  if list == Nil or obj == Nil {return False}

  let new_node = node_new()

  new_node.data = obj

  if list.first == Nil {
    list.first = new_node
  } else {
    node_append(list.last, new_node)
  }

  list.last = new_node

  list.volume = list.volume + 1
  return True
}


let list_extend = func (list1, list2 : *List) -> Bool {
  if list1 == Nil or list2 == Nil {return False}

  let n = list1.last

  list1.volume = list1.volume + list2.volume

  if n == Nil {
    // первый список пуст - просто поместим второй в него
    list1.first = list2.first
    list1.last = list2.last

    return True
  }

  n.next = list2.first

  if list2.first != Nil and list2.last != Nil {
    list2.first.prev = n
    list1.last = list2.last
  }

  return True
}


// подменяем значение o1 в списке на значение o2
let list_subst = func (list : *List, o1 : *Unit, o2 : *Unit) -> Bool {
  let n = node_search_by_data(list.first, o1)
  if n == Nil {return False}
  n.data = o2
  return True
}


let list_node_remove = func (list : *List, n : *Node) -> Unit {

  let prev = n.prev
  let next = n.next

  node_exclude(n)

  if list.first == n {
    list.first = next
  }

  if list.last == n {
    list.last = prev
  }

  free(n)

  list.volume = list.volume - 1
}


let list_remove = func (list : *List, o : *Unit) -> Bool {
  let n = node_search_by_data(list.first, o)

  if n == Nil {
    return False
  }

  list_node_remove(list, n)

  return True
}


/*
 * Функция применяющая функцию f ко всем элементам списка list:
 * list - список
 * f - функция-обработчик с типом ListForeachHandler
 * param - свободный указатель, который будет передан функции f в качестве второго параметра (ctx)
 */
let list_foreach = func (list : *List, f : ListForeachHandler, ctx : *Unit) -> Unit {
  var index : Nat
  index = 0
  var n : *Node
  n = list.first
  while n != Nil {
    f(n.data, ctx, index)
    n = n.next
    index = index + 1
  }
}


let list_foreach2 = func (list1, list2 : *List, f : ListForeachHandler2, ctx : *Unit) -> Unit {
  var n1, n2 : *Node
  n1 = list1.first
  n2 = list2.first
  var index : Nat
  index = 0
  while n1 != Nil and n2 != Nil {
    f(n1.data, n2.data, ctx, index)
    n1 = n1.next
    n2 = n2.next
    index = index + 1
  }
}


let list_compare = func (list1, list2 : *List, f : ListCompareHandler, ctx : *Unit) -> Bool {
  if list1.volume != list2.volume {return False}
  var n1, n2 : *Node
  n1 = list1.first
  n2 = list2.first
  var index : Nat
  index = 0
  while n1 != Nil and n2 != Nil {
    if not f(n1.data, n2.data, ctx, index) {return False}
    n1 = n1.next
    n2 = n2.next
    index = index + 1
  }
  return True
}


let list_search = func (list : *List, f : ListSearchHandler, ctx : *Unit) -> *Unit {
  if list == Nil {return Nil}
  var n : *Node
  n = list.first
  var index : Nat
  index = 0
  while n != Nil {
    let data = f(n.data, ctx, index)
    if data != Nil {return data}
    n = n.next
    index = index + 1
  }
  return Nil
}


let list_map = func (list : *List, f : ListMapHandler, ctx : *Unit) -> *List {
  if list == Nil {return Nil}
  var index : Nat
  index = 0
  var n : *Node
  n = list.first
  let result = list_new()
  while n != Nil {
    let res = f(n.data, ctx, index)
    if res != Nil {
      list_append(result, res)
    }
    index = index + 1
    n = n.next
  }
  return result
}


