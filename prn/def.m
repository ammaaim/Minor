// m2/prn/def


let typedef = func (id : Str, t : *Type) -> Unit {
  fprintf(fout, "\n%%%s = type ", id); printType(t, False, True)
}


let arraydef = func (id : Str, t : *Type, items : *List) -> Unit {
  /*let id = ad.id
  let t = ad.type
  let items = ad.values*/
  //@arr = global [4 x i32] [i32 1, i32 2, i32 3, i32 4], align 16
  fprintf(fout, "\n@%s = private unnamed_addr constant [%d x ", id, items.volume)
  printType(t, True, True)
  fprintf(fout, "] [")

  var need_comma : Bool
  need_comma = False
  let print_array_item = func ListForeachHandler {
    let v = data to *Value
    let need_comma = ctx to *Bool

    if *need_comma {comma()}
    printType(v.type, True, True)
    space()
//    print_value(v)
    *need_comma = True
  }
  list_foreach(items, print_array_item, &need_comma)

  fprintf(fout, "], align 16")
}


/*
@.str = private unnamed_addr constant [4 x i8] c"XXX\00", align 1
@s = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
*/
let stringdef = func (id : Str, len : Nat, s : Str) -> Unit {
  /*let id = sd.id
  let len = sd.len
  let s = sd.data*/
  //@str_108 = private unnamed_addr constant [7 x i8] c"Nat32\00", align 1
  fprintf(fout, "\n@.str.%s = private unnamed_addr constant [%d x i8] c\"", id, len)

  var i : Nat32
  i = 0

  while True {
    let c = s[i]
    i = i + 1
    if c == 0 {break}
    if c == "\n"[0] or  // line feed
       c == "\r"[0] or  // carriage return
       c == "\t"[0] or  // horizontal tab
       c == "\v"[0] or  // vertical tab
       c == "\a"[0] or  // bell
       c == "\b"[0] or  // backspace
       c == "\\"[0] or  // backslash
       c == "\""[0] {
      fprintf(fout, "\\%02X", c)
    } else {
      fprintf(fout, "%c", c)
    }
  }
  fprintf(fout, "\\%02d\", align 1", 0)

  //@s = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0)
  fprintf(fout, "\n@%s = constant i8* getelementptr inbounds ([%d x i8], [%d x i8]* @.str.%s, i32 0, i32 0), align 8", id, len, len, id)
}


let vardef = func (id : Str, t : *Type, v : *Value) -> Unit {
  fprintf(fout, "\n@%s = global ", id)
  printType(t, True, True); space()
  /*if v != Nil {print_value(v)} else {o("zeroinitializer")}*/
  o("zeroinitializer")
  //if DEBUG {comma(); dbg(0)}
}


let funcdef = func (id : Str, t : *Type, b : *Block) -> Unit {
  // 0, 1, 2 - params; 3 - entry label, 4 - first free register
  let firstlab = t.function.params.volume + (1 /*entry label*/)

  lab_reset(firstlab to Nat32)
  //lab_get()

  assert(t != Nil, "prn/funcdef t = Nil")

  if b == Nil {
    o("\ndeclare")
    //if DEBUG {dbg(0)}
  } else {
    o("\n\ndefine")
  }

  space()

  let isvoid = type_eq(t.function.to, typeUnit)

  if isvoid {
    o("void")
  } else {
    printType(t.function.to, True, True)
  }

  fprintf(fout, " @%s (", id)

  var need_comma : Bool
  need_comma = False
  let vf_print_param = func ListForeachHandler {
    let f = data to *Field
    let need_comma = ctx to *Bool
    if *need_comma {fprintf(fout, ", ")}
    printType(f.type, True, True)
    *need_comma = True
  }
  list_foreach(t.function.params, vf_print_param, &need_comma)

  if t.function.arghack {o(", ...")}

  o(")")

  if b != Nil {
    //if DEBUG {dbg(0); space()}
  }

  if b != Nil {
    o(" {")
    reset_local_labels()
    print_block(b)
    if isvoid {o("\n  ret void")}
    o("\n}")
  }
}


let aliasdef = func (id : Str, t : *Type, org : Str) -> Unit {
  //@sss = alias i8*, i8** @_func4_str6
  //@main = alias void (), void ()* @xxx
  fprintf(fout, "\n@%s = alias ", id)
  printType(t, False, False)
  comma()
  printType(t, False, False)
  fprintf(fout, "* @%s", org)
}

