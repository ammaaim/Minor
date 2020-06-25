
// used only by doextern
// глобально декларируем новую сущность о которой не известно ничего кроме типа и id
let declare = func (id : Str, type : *Type, ti : *TokenInfo) -> Unit {
  if id == Nil or type == Nil {return}

  // already exist?
  let ae = get_value_global(id)

  if ae != Nil {
    error("attempt to redeclaration", ti)
    rem("declared at: ", ae.declared_at)
    return
  }

  // Создаем знчение и добавляем его в индекс
  let v = value_new(ValueId, type, Nil, Nil)
  v.storage.id = decorate(id)
  v.type = type
  v.declared_at = ti

  if type.kind == TypeFunction {
    v.storage.class = StorageFunction
    asm_funcdef_add(&asm0, id, type, Nil)
  }

  bind_value_global(id, v)
}



let def_global = func (id : Str, v : *Value, ti : *TokenInfo) -> Unit {
  assert(id != Nil, "define: id == Nil")
  assert(v != Nil, "define: v == Nil")

  v.defined_at = ti

  // alerady exists
  let ae = get_value_global(id)
  if ae != Nil {
    //ae.arguments = v.arguments  // after allCalls  ????????? не нужно  ????
    ae.kind = v.kind
    ae.type = v.type
    ae.storage = v.storage
    ae.block = v.block

    rename(ae, id)
    return
  }

  rename(v, id)
  bind_value_global(id, v)
}



// получает значение имя которого выданное генератором
// и меняет его на норм id (и в Value и в сборке)
let rename = func (v : *Value, id : Str) -> Unit {
  // патчим имена

  let real_id = decorate(id)

  // если v - функция, то она как все функции поначалу получила default_name.
  // но тк мы располагаем id с которым она будет связана,
  // заменим ее default_name на нормальный идентификатор
  //if v.type.kind == TypeFunction {
  let cl = v.storage.class
  if cl == StorageFunction {
    // получаем то имя что значение получило от генератора
    let default_name = v.storage.id
    // переименовываем само значение
    v.storage.id = real_id
    // и функцию в сборке
    asm_func_rename(&asm0, default_name, real_id)
  } else if cl == StorageString {
    // v - строковой литерал
    // на самом деле нет - справа приведение типа включающее в себя строку
    // это связано с LLVM, пришлось каждое строковое значение упаковать
    // в приведение к типу Str
    // поэтому тут мы залазим в строку через (жопу) операцию приведения

    let default_name = v.a[0].storage.id
    // переименовываем само значение
    v.a[0].storage.id = real_id
    // и константу в сборке
    asm_const_rename(&asm0, default_name, real_id)
  }
}

