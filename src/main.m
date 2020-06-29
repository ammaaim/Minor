// src/main


import "lexer"


// функция source_open получает строку импорта и возвращает *Source or Nil
type Source = record {
  abs_path,              // Resource full path
  int_path,               // Resource path inside root package
  filename   : Str        // реальное имя файла в фс

  tokens     : *List      // список токенов этого модуля
  token_node : *Node      // нода текущего токена
}



var pdir : Str      // current, project & lib dir paths

var liblist : List  // list of additional libraries paths


let cwd = func () -> Str {
  let maxlen = 512
  let buf = malloc(maxlen)
  return getcwd(buf, maxlen)
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


let src_open = func (dir, resource : Str) -> *Source {
  let path = cat3(dir, "/", resource)

  var tokens : *List
  tokens = Nil

  var fname : Str

  let path_mod = cat(path, ".m")
  if exists(path_mod) {
    // it's module
    chdir(getprefix(path_mod))
    tokens = tokenize(get_last(path_mod))
    fname = path_mod
  } else {
    let path_pkg = cat(path, "/main.m")
    if exists(path_pkg) {
      // it's package
      chdir(getprefix(path_pkg))
      tokens = tokenize("main.m")
      fname = path_pkg
    } else {
      free(path_pkg)
    }
  }

  if tokens == Nil {
    return Nil
  }

  return src_new(fname, tokens)
}


let source_open = func (import_string : Str) -> *Source {
  // search import local
  let csrc = src_open(".", import_string)
  if csrc != Nil {return csrc}

  // search import root
  let psrc = src_open(pdir, import_string)
  if psrc != Nil {return psrc}

  // search import in libraries
  let search_in_lib = func ListSearchHandler {
    let lib_path = data to Str
    let import_string = ctx to Str
    return src_open(lib_path, import_string)
  }
  let lsrc = list_search(&liblist, search_in_lib, import_string) to *Source

  return lsrc
}


