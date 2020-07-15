

import "data/map"


var imports : Map



let importAdd = func (s : Str, m : *Module) -> Unit {
  map_append(&imports, s, m)
}


let importGet = func (s : Str) -> *Module {
  let m = map_get(&imports, s)
  if m != Nil {return m}

  return Nil
}


let import = func (imp_str : Str) -> *Module {
  // get current dir (for go back)
  let old_cdir = str_new(512)
  getcwd(old_cdir, 512)


  let info = getSourceInfo(imp_str)

  let ae = importGet(info.path)
  if ae != Nil {
    return ae
  }

  if info.type == SourceUnknown {
    printf("when import = %s\n", imp_str)
    fatal("cannot import")
  }

  let src = openSource(info)

  if src == Nil {
    printf("when import = %s\n", imp_str)
    fatal("cannot import")
  }

  importAdd(info.path, &mctx)

  parse(src)


  chdir(old_cdir)  // go back.

  return &mctx
}


