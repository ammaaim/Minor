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

    let new_a = nat(arg, typeBaseInt)

    // заменяем аргумент в списке на приведенный
    list_subst(a, arg, new_a)

    aln = aln.next  // we carry on
  }

  return True
}


/*
let checkParams = func (f : *Value, a : *List, ti : *TokenInfo) -> Bool {
  var param_list : *List

  if f.type.kind == TypeFunction {
    param_list = f.type.function.params
  } else if f.type.kind == TypeGeneric {
    param_list = f.type.generic.fields
  } else {
    printf("checkParams:error: %d\n", f.type.kind)
    return False
  }



  var pln, aln : *Node
  pln = param_list.first
  aln = a.first

  // пока есть параметр
  // аргументов тут точно достаточно
  while pln != Nil {
    let par = pln.data to *Field
    let arg = aln.data to *Value

    // Natural
    let new_a = nat(arg, par.type)

    // проверяем соответствие типа аргумента типу параметра
    if not check(par.type, new_a.type) {
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
    let argx = aln.data to *Value

    // ПРОБЛЕМНОЕ МЕСТО - ЧТО ЗДЕСЬ делвть с check() ??
    // вроде с ним работает но что будет если ??
    check(argx.type, typeBaseInt)

    let new_a2 = nat(argx, typeBaseInt)

    // заменяем аргумент в списке на приведенный
    list_subst(a, argx, new_a2)

    aln = aln.next  // we carry on
  }

  return True
}*/


// получает список параметров функции из списка ее аргументов
// имена параметров будут Nil тк получить их здесь нет никакой возможности
// а типы будут соответствовать типам аргументов
// что так же не является стопроцентно точной инфой тк
// аргументом может быть Nil (*Unit) а реальный параметр при этом быть *SomeType

/*
let getParamsFromArglist = func (arglist : *List) -> *List {
  let paramlist = list_new()
  let parFromArg = func ListForeachHandler {
    let arg = data to *Value
    let paramlist = ctx to *List
    let param = field_new(Nil, arg.type, Nil)
    list_append(paramlist, param)
  }
  list_foreach(arglist, parFromArg, paramlist to *Unit)
  return paramlist
}
*/






