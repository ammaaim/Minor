// lib/sys/path


// возвращает длину части пути предшествующей последнему /, плюс его позиция
// "/" -> 1
// "/usr/alex" -> 5
// "" -> 0
let prepart = func (path : Str) -> Nat {
  var len, c : Nat
  len = 0
  c = 0
  while path[c] != 0 {
    if path[c] == "/"[0] {len = c + 1}
    c = c + 1
  }
  return len
}


// получает путь к файлу, возвращает новую строку с его директорией
// "/usr/alex/home/p/m2/main.m" -> "/usr/alex/home/p/m2"
// "/usr" -> "/"
let getprefix = func (path : Str) -> Str {
  let pre = prepart(path)
  let s = malloc(pre + 1) to Str
  memcpy(s to *Unit, path to *Unit, pre)
  s[pre] = 0
  return s
}


// получает путь к файлу, возвращает новую строку с последним именем в пути
// "/usr/alex/home/p/m2/main.m" -> "main.m"
// "/usr/alex/home/p/m2/lib" -> "lib"
let get_last = func (path : Str) -> Str {
  let pre = prepart(path)
  let len0 = strlen(path) - pre
  let str = malloc(len0 + 1) to Str
  memcpy(str to *Unit, &path[pre] to *Unit, len0)
  str[len0] = 0
  return str
}


