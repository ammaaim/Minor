// m2/prn/stmt


var global_if_id,
    global_while_id,
    while_id : Nat32


var blockno, stmtno : Nat32  // just number of statement in function (for comment ;stmt%d)



let reset_local_labels = func () -> Unit {
  global_if_id = 0
  global_while_id = 0
  while_id = 0
  stmtno = 0
  blockno = 0
}


let print_stmt = func (s : *Stmt) -> Unit {
  fprintf(fout, "\n\n;stmt%d:", stmtno);
  stmtno = stmtno + 1

  let k = s.kind
  if k == StmtBlock {
    print_block(s.b)
  } else if k == StmtLet {
    print_stmt_let(s.a[0], s.a[1])
  } else if k == StmtExpr {
    print_stmt_expr(s.e)
  } else if k == StmtVarDef {
    print_stmt_var(s.v)
  } else if k == StmtAssign {
    print_st(s.a[0], s.a[1])
  } else if k == StmtIf {
    print_stmt_if(s.i)
  } else if k == StmtWhile {
    print_stmt_while(s.w)
  } else if k == StmtReturn {
    print_stmt_return(s.a[0])
  } else if k == StmtBreak {
    print_stmt_break()
  } else if k == StmtContinue {
    print_stmt_continue()
  } else if k == StmtGoto {
    print_stmt_goto(s.l)
  } else if k == StmtLabel {
    print_stmt_label(s.l)
  } else {
    fprintf(fout, "print::StmtUnknown")
    exit(1)
  }
}


// Печать значения происходит в два этапа
// 1. eval - распечатывается алгоритм вычисления значения
// 2. print_operand - печатается регистр в котором находится значение (уже вычисленное)
//                  или непосредственная константа (которая никак не вычисляется в LLVM)





let print_stmt_var = func (v : *VarDef) -> Unit {
  let reg = lab_get()
  v.reg = reg
  fprintf(fout, "\n  %%%d = alloca ", reg)
  printType(v.type, True, True)
}


let print_stmt_expr = func (e : *Expr) -> Unit {
  eval(e.v)
}


let print_stmt_let = func (e, x : *Value) -> Unit {
  let ee = load(eval(e))
  // сопрягаем
  x.reg = ee.reg
}


let print_stmt_if = func (i : *If) -> Unit {
  let if_id = global_if_id
  global_if_id = global_if_id + 1
  let c = load(eval(i.cond))
  fprintf(fout, "\n  br i1 ")
  print_operand(c)
  fprintf(fout, ", label %%then_%d, label %%else_%d", if_id, if_id)
  fprintf(fout, "\nthen_%d:", if_id)
  print_stmt(i.then)
  fprintf(fout, "\n  br label %%endif_%d", if_id)
  fprintf(fout, "\nelse_%d:", if_id)
  if i.else != Nil {print_stmt(i.else)}
  fprintf(fout, "\n  br label %%endif_%d", if_id)
  fprintf(fout, "\nendif_%d:", if_id)
}


let print_stmt_while = func (w : *While) -> Unit {
  let old_while_id = while_id
  while_id = global_while_id
  global_while_id = global_while_id + 1
  fprintf(fout, "\n  br label %%continue_%d", while_id)
  fprintf(fout, "\ncontinue_%d:", while_id)
  let c =  load(eval(w.cond))
  fprintf(fout, "\n  br i1 ")
  print_operand(c)
  fprintf(fout, ", label %%body_%d, label %%break_%d", while_id, while_id)
  fprintf(fout, "\nbody_%d:", while_id)
  print_stmt(w.stmt)
  fprintf(fout, "\n  br label %%continue_%d", while_id)
  fprintf(fout, "\nbreak_%d:", while_id)
  while_id = old_while_id
}


let print_stmt_return = func (rv : *Value) -> Unit {
  if rv == Nil {
    lab_get()  // for LLVM
    o("\nret void")
    return
  }
  let v = load(eval(rv))
  fprintf(fout, "\n  ret ")
  printType(v.type, True, True)
  space()
  print_operand(v)
  lab_get()  // for LLVM
}


let print_stmt_break = func () -> Unit {
  lab_get()  // for LLVM
  fprintf(fout, "\n  br label %%break_%d", while_id)
}


let print_stmt_continue = func () -> Unit {
  lab_get()  // for LLVM
  fprintf(fout, "\n  br label %%continue_%d", while_id)
}


let print_stmt_goto = func (l : Str) -> Unit {
  lab_get()  // for LLVM
  fprintf(fout, "\n  br label %%%s", l)
}


let print_stmt_label = func (l : Str) -> Unit {
  fprintf(fout, "\n  br label %%%s", l)
  fprintf(fout, "\n%s:", l)
}


let print_block = func (b : *Block) -> Unit {
  let for_stmt = func ListForeachHandler {
    blockno = blockno + 1
    print_stmt(data to *Stmt)
  }
  list_foreach(b.stmts, for_stmt, Nil)
}


