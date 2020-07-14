// m2/src/main


import "lexer"


type SourceType = enum {
  SourceUnknown,  // we cannot found the resource
  SourceLocal     // this resource is a local file
}


type SourceInfo = record {
  type : SourceType  //
  imported_as : Str  // import string
  path : Str         // fullpath
}


// функция source_open получает строку импорта и возвращает *Source or Nil
type Source = record {
  info       : SourceInfo  //
  tokens     : *List       // список токенов этого модуля
  token_node : *Node       // нода текущего токена
}



var pdir : Str      // cures2srcent, project & lib dir paths

var liblist : List  // list of additional libraries paths

let maxlen = 512
let cwd = func () -> Str {

  let buf = malloc(maxlen)
  let x = getcwd(buf, maxlen)
  return x
}


let liblist_add = func (path : Str) -> Unit {
  //printf("+lib=%s\n", path)
  list_append(&liblist, path)
}


let domain = func (path : Str) -> Str {
  var i, j : Nat
  i = 0; j = 0
  let s = malloc(512) to Str
  while path[i] != 0 {
    if path[i] != pdir[i] {
      s[j] = path[i]
      j = j + 1
    }
    i = i + 1
  }

  s[j] = 0
  return s
}


let src_new = func (name : Str, tokens : *List) -> *Source {
  var fullpath : Str
  fullpath = name
  if name[0] == "."[0] {
    let cd = cwd()
    fullpath = cat(cd, &name[1] to Str)
    //free(name)
  }

  let src = malloc(sizeof Source) to *Source
  //src.abs_path = fullpath
  src.tokens = tokens
  src.token_node = src.tokens.first
  return src
}



// получает каталог dir (где искать)
// и строку импорта ресурса resource
// возвращает дескриптор ресурса SourceInfo
let getSourceInfo = func (dir, resource : Str) -> SourceInfo {
  let path = cat3(dir, "/", resource)

  var info : SourceInfo
  info.type = SourceUnknown
  info.imported_as = resource
  info.path = Nil

  // Is it a module?

  let path_mod = cat(path, ".m")

  if exists(path_mod) {
    // it's a module
    chdir(getprefix(path_mod))
    info.type = SourceLocal
    info.path = path_mod
    return info
  }

  // Maybe it's a package?

  let path_pkg = cat(path, "/main.m")

  if exists(path_pkg) {
    // it's a package
    chdir(getprefix(path_pkg))
    info.type = SourceLocal
    info.path = path_pkg
    return info
  }

  return info  // SourceUnknown
}


let res2src = func (r : SourceInfo) -> *Source {
  let tokens = tokenize(r.path)
  let s = src_new(r.path, tokens)
  s.info = r
  return s
}


let source_open = func (import_string : Str) -> *Source {
  // search import local
  var cdir : [512]Nat8
  getcwd(&cdir[0] to Str, 512)

  let csrc = getSourceInfo(&cdir[0] to Str, import_string)
  if csrc.type != SourceUnknown {
    return res2src(csrc)
  }

  // search import root
  let psrc = getSourceInfo(pdir, import_string)
  if psrc.type != SourceUnknown {
    return res2src(psrc)
  }

  // search import in libraries
  let search_in_lib = func ListSearchHandler {
    let lib_path = data to Str
    let import_string = ctx to Str
    let res = getSourceInfo(lib_path, import_string)
    return res.type != SourceUnknown
  }
  let lib_path = list_search(&liblist, search_in_lib, import_string) to Str

  if lib_path != Nil {
    return res2src(getSourceInfo(lib_path, import_string))
  }

  return Nil
}


