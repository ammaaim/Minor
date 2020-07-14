// m2/src/main


import "lexer"


// функция source_open получает строку импорта и возвращает *Source or Nil
type Source = record {
  abs_path,              // Resource full path
  int_path,               // Resource path inside root package
  filename   : Str        // реальное имя файла в фс

  tokens     : *List      // список токенов этого модуля
  token_node : *Node      // нода текущего токена
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
  src.abs_path = fullpath
  src.tokens = tokens
  src.token_node = src.tokens.first
  return src
}



type ResourceType = enum {
  ResourceUnknown,  // we cannot found the resource
  ResourceLocal     // this resource is a local file
}


type Resource = record {
  type : ResourceType
  imported_as : Str    // import string
  path : Str           // fullpath
}


let getres = func (dir, resource : Str) -> Resource {
  let path = cat3(dir, "/", resource)

  var r : Resource
  r.type = ResourceUnknown
  r.imported_as = resource
  r.path = Nil

  // Is it a module?

  let path_mod = cat(path, ".m")

  if exists(path_mod) {
    // it's a module
    chdir(getprefix(path_mod))
    r.type = ResourceLocal
    r.path = path_mod
    return r
  }

  // Maybe it's a package?

  let path_pkg = cat(path, "/main.m")

  if exists(path_pkg) {
    // it's a package
    chdir(getprefix(path_pkg))
    r.type = ResourceLocal
    r.path = path_pkg
    return r
  }

  return r  // ResourceUnknown
}


let res2src = func (r : Resource) -> *Source {
  let tokens = tokenize(r.path)
  return src_new(r.path, tokens)
}


let source_open = func (import_string : Str) -> *Source {
  // search import local
  var cdir : [512]Nat8
  getcwd(&cdir[0] to Str, 512)

  let csrc = getres(&cdir[0] to Str, import_string)
  if csrc.type != ResourceUnknown {
    return res2src(csrc)
  }

  // search import root
  let psrc = getres(pdir, import_string)
  if psrc.type != ResourceUnknown {
    return res2src(psrc)
  }

  // search import in libraries
  let search_in_lib = func ListSearchHandler {
    let lib_path = data to Str
    let import_string = ctx to Str
    let res = getres(lib_path, import_string)
    return res.type != ResourceUnknown
  }
  let lib_path = list_search(&liblist, search_in_lib, import_string) to Str

  if lib_path != Nil {
    return res2src(getres(lib_path, import_string))
  }

  return Nil
}


