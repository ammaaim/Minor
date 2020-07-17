// m2/src/main

import "lexer"
//import "token"
//import "lib/C"
//import "lib/data/list"



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



var pdir : Str      // cuopenSourceent, project & lib dir paths

var liblist : List  // list of additional libraries paths


let maxlen = 512
let cwd = func () -> Str {
  let buf = malloc(maxlen)
  let x = getcwd(buf, maxlen)
  return x
}


let liblist_add = func (path : Str) -> Unit {
  list_append(&liblist, path)
}


/*
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
*/


// получает каталог dir (где искать)
// и строку импорта ресурса resource
// возвращает дескриптор ресурса SourceInfo
let getSourceInfoFrom = func (dir, resource : Str) -> SourceInfo {
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


// получает строку импорта, возвращает дескриптор ресурса
// самостоятельно ищет во всех директориях
let getSourceInfo = func (imp_str : Str) -> SourceInfo {
  // 1. search import in current package
  var cdir : [512]Nat8
  getcwd(&cdir[0] to Str, 512)

  let csrc = getSourceInfoFrom(&cdir[0] to Str, imp_str)
  if csrc.type != SourceUnknown {
    return (csrc)
  }

  // 2. search import in root package
  let psrc = getSourceInfoFrom(pdir, imp_str)
  if psrc.type != SourceUnknown {
    return (psrc)
  }

  // 3. search import in libraries
  let search_in_lib = func ListSearchHandler {
    let lib_path = data to Str
    let imp_str = ctx to Str
    let res = getSourceInfoFrom(lib_path, imp_str)
    return res.type != SourceUnknown
  }
  let lib_path = list_search(&liblist, search_in_lib, imp_str) to Str

  // found in a library?
  if lib_path != Nil {
    return (getSourceInfoFrom(lib_path, imp_str))
  }

  // Not found, return #SourceUnknown
  var info : SourceInfo
  info.type = SourceUnknown
  info.imported_as = imp_str
  info.path = Nil
  return info
}


let openSource = func (info : SourceInfo) -> *Source {
  if info.type == SourceUnknown {return Nil}
  let src = malloc(sizeof Source) to *Source
  let tokens = tokenize(info.path)
  src.tokens = tokens
  src.token_node = tokens.first
  src.info = info
  return src
}


