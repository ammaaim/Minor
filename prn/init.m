// prn/init


let printer_init = func (a : Arch, fname : Str) -> Unit {
  fout = fopen(fname, "w")

  if fout == Nil {
    fatal("cannot create output file")
  }

  fprintf(fout, "; clang out2.ll && ./a.out\n\n")
  fprintf(fout, "; llc out2.ll ; for create .s file from .ll\n")

  print_head(a)

  fprintf(fout, "%%Enum = type i32\n")
  fprintf(fout, "%%Bool = type i1\n")
  fprintf(fout, "%%Unit = type i1\n")
  fprintf(fout, "%%Str = type i8*\n")

  let prt_itype = func MapForeachHandler {
    let tid = k to Str
    let t = v to *Type
    if t.basic.i {
      fprintf(fout, "%%%s = type i%d\n", tid, t.basic.p)
    }
  }
  map_foreach(&globalTypeIndex, prt_itype, Nil)

  fprintf(fout, "\n")
}


