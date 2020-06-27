// value/call


let call = func (f : *Value, a : *List, ti : *TokenInfo) -> *Value {
  if f == Nil or a == Nil {goto fail}

  let ret_type = Nil

  let v = value_new_register(ValueCall, ret_type, f, Nil)
  v.call.arguments = a

  return v

fail:
  return Nil
}


let getTypeCall = func (v : *Value) -> *Type {
  let f = v.a[0]

  let tf = getType(f)

  if tf == Nil {
    error("undefined function", f.ti)
    return Nil
  }

  if tf.kind != TypeFunction {
    error("expected function", v.ti)
    return Nil
  }

  // вычисляем типы аргументов
  checkParams(f, v.call.arguments, v.ti)

  let t = tf.function.to

  return t
}


let checkParams = func (f : *Value, a : *List, ti : *TokenInfo) -> Bool {
  let param_list = f.type.function.params

  if a.volume < param_list.volume {
    error("not enough arguments", ti)
    return False
  } else if param_list.volume < a.volume {
    if not f.type.function.arghack {
      error("too many arguments", ti)
    }
  }

  var pln, aln : *Node
  pln = param_list.first
  aln = a.first

  // пока есть параметр
  // аргументов тут точно достаточно
  while pln != Nil {
    let par = pln.data to *Field
    let arg = aln.data to *Value

    getType(arg)

    let new_arg = nat(arg, par.type)

    // проверяем соответствие типа аргумента типу параметра
    if not type_eq(par.type, new_arg.type) {
      error("argument type not match param type: ", ti)//, f.storage.id)
      printf("arg = "); prttype(new_arg.type); printf("\n")
      printf("par = "); prttype(par.type); printf("\n")
      goto nextarg
    }

    list_subst(a, arg, new_arg)

  nextarg:
    aln = aln.next
    pln = pln.next
  }


  // параметров больше нет, но возможно есть еще аргументы
  while aln != Nil {
    // тк у нас кончились параметры, мы мало что можем сделать
    // но мы должны преобразовать Generic:Numeric аргументы к typeBaseInt
    let arg = aln.data to *Value

    getType(arg)

    let new_arg = castIfNumericTo(arg, typeBaseInt)

    // заменяем аргумент в списке на приведенный
    list_subst(a, arg, new_arg)

    aln = aln.next
  }

  return True
}


