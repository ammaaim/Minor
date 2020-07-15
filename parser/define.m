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
  let v = valueNew(ValueUndefined, ti)
  v.type = type
  v.id = id
  v.type = type
  v.declared_at = ti

  if type.kind == TypeFunction {
    v.kind = ValueGlobalConst
    v.assembly_item = asmFuncAdd(&asm0, id, type, Nil)
  }

  bind_value_global(id, v)
}


let def_global = func (id : Str, v : *Value, ti : *TokenInfo) -> Unit {
  assert(id != Nil, "define: id == Nil")
  assert(v != Nil, "define: v == Nil")

  v.defined_at = ti

  // alerady exists?
  let ae = get_value_global(id)

  if ae == Nil {
    // not exists, creating new
    bind_value_global(id, v)
    return
  }

  // exist

  if ae.kind != ValueUndefined {
    error("attempt to redefinition", ti)
    return
  }

  ae.kind = v.kind
  ae.type = v.type
  ae.id = v.id
  ae.assembly_item = v.assembly_item
}


// получает значение имя которого выданное генератором
// и меняет его на норм id в assembly.
let rename = func (v : *Value, id : Str) -> Unit {
  // имя которое значение получило от автоматического генератора
  let default_name = v.id

  if default_name != Nil {
    if v.assembly_item != Nil {
      v.assembly_item.id = id
    }
  }
}


