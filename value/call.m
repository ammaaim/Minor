// value/call


let call = func (f : *Value, a : *List, ti : *TokenInfo) -> *Value {
  if f == Nil or a == Nil {return Nil}

  let ret_type = Nil

  let v = value_new_register(ValueCall, ret_type, f, Nil)
  v.arguments = a

  return v

fail:
  return Nil
}


let getTypeCall = func (v : *Value) -> *Type {
  let f = v.a[0]

  let tf = getType(f)

  if tf.kind != TypeFunction {
    error("expected function", v.ti)
    return Nil
  }

  // вычисляем типы аргументов
  checkParams(f, v.arguments, v.ti)

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

    let new_a = nat(arg, par.type)

    //printf("YU2: %p, %p\n", par.type, arg.type)

    // проверяем соответствие типа аргумента типу параметра
    if not type_eq(par.type, new_a.type) {
      error("argument type not match param type: ", ti)//, f.storage.id)
      printf("arg = "); prttype(new_a.type); printf("\n")
      printf("par = "); prttype(par.type); printf("\n")
      goto nextarg
    }

    // добавляем runtime каст аргумента к параметру
    //let new_arg = value_new(ValueCast, par.type, a, Nil)
    list_subst(a, arg, new_a)


  nextarg:
    // проверяем дальше
    aln = aln.next
    pln = pln.next
  }


  // параметров больше нет, но есть еще аргументы
  while aln != Nil {
    // тк у нас кончились параметры, мы мало что можем сделать
    // но мы должны преобразовать Generic:Numeric аргументы к typeBaseInt
    let arg = aln.data to *Value

    getType(arg)

    let new_a = castIfNumericTo(arg, typeBaseInt)

    // заменяем аргумент в списке на приведенный
    list_subst(a, arg, new_a)

    aln = aln.next  // we carry on
  }

  return True
}


