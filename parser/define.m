// m2/parser/define


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
  let v = valueNew(ValueId, StorageUndefined, ti)
  v.type = type
  v.storage.id = id
  v.type = type
  v.declared_at = ti

  if type.kind == TypeFunction {
    v.storage.class = StorageGlobalConst
    asmFuncAdd(&asm0, id, type, Nil)
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
  // имя которое значение получило от автоматического генератора
  let default_name = v.storage.id

  if default_name != Nil {
    // переименовываем как само значение
    v.storage.id = id
    // так и соответствующую ему сущность в сборке
    asmRename(&asm0, default_name, id)
  }
}


