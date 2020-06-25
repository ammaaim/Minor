// lib/str


let str_new = func (len : Nat) -> Str {
  return malloc(len) to Str
}


// create copy of string
let dup = func (s0 : Str) -> Str {
  let len = strlen(s0) + (1 /* for 0 */)
  let s1 = str_new(len)
  strcpy(s1, s0)
  return s1
}

// содает копию строки
// n - размер результирующей строки
// 0-терминатор гарантированно будет скопирован
/*
let dupn = func (s0 : Str, n : Nat) -> Str {
  if n == 0 {return Nil}
  let s1 = str_new(n)
  memcpy(s1, s0, )
  return s1
}
*/


// склеивает две строки формируя на выходе новую
let cat = func (s1, s2 : Str) -> Str {
  let len1 = strlen(s1)
  let len2 = strlen(s2)

  let len12 = len1 + len2

  let s = malloc (len12 + 1) to Str

  strcpy(&s[0] to Str, s1)
  strcpy(&s[len1] to Str, s2)
  s[len12] = 0
  return s
}


// concat three strings to one new
let cat3 = func (s1, s2, s3 : Str) -> Str {
  let len1 = strlen(s1)
  let len2 = strlen(s2)
  let len3 = strlen(s3)

  let len12x = len1 + len2
  let len123x = len12x + len3

  let s = malloc(len123x + 1) to Str

  strcpy(&s[0] to Str, s1)
  strcpy(&s[len1] to Str, s2)
  strcpy(&s[len12x] to Str, s3)
  s[len123x] = 0
  return s
}


// concat four strings to one new
let cat4 = func (s1, s2, s3, s4 : Str) -> Str {
  let len1 = strlen(s1)
  let len2 = strlen(s2)
  let len3 = strlen(s3)
  let len4 = strlen(s4)

  let len12y = len1 + len2
  let len123y = len12y + len3
  let len1234y = len123y + len4

  let s = malloc(len1234y + 1) to Str

  strcpy(&s[0] to Str, s1)
  strcpy(&s[len1] to Str, s2)
  strcpy(&s[len12y] to Str, s3)
  strcpy(&s[len123y] to Str, s4)
  s[len1234y] = 0
  return s
}


// concat five strings to one new
let cat5 = func (s1, s2, s3, s4, s5 : Str) -> Str {
  let len1 = strlen(s1)
  let len2 = strlen(s2)
  let len3 = strlen(s3)
  let len4 = strlen(s4)
  let len5 = strlen(s5)

  let len12z = len1 + len2
  let len123z = len12z + len3
  let len1234z = len123z + len4
  let len12345z = len1234z + len5

  let s = malloc(len12345z + 1) to Str

  strcpy(&s[0] to Str, s1)
  strcpy(&s[len1] to Str, s2)
  strcpy(&s[len12z] to Str, s3)
  strcpy(&s[len123z] to Str, s4)
  strcpy(&s[len1234z] to Str, s5)
  s[len12345z] = 0
  return s
}


