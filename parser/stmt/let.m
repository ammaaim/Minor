// parser/stmt/let




let stmtLetCheck = func (s : *Stmt) -> Unit {
  let v = s.a[0]   // выражение
  let vx = s.a[1]  // сопряженное с ним значение (ид)

  let value_id = vx.storage.id

  let t = getType(v)
  vx.type = t
}


