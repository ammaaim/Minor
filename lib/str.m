// lib/str


let STR_TERM = 0


let str_new = func (len : Nat) -> Str {
  return malloc(len) to Str
}


// create copy of string
let dup = func (s : Str) -> Str {
  let len = strlen(s) + (1 /* for STR_TERM */)
  let new_s = str_new(len)
  strcpy(new_s, s)
  return new_s
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

  let s = malloc (len12 + (1 /* for STR_TERM */)) to Str

  strcpy(&s[0] to Str, s1)
  strcpy(&s[len1] to Str, s2)
  s[len12] = STR_TERM

  return s
}


// concat three strings to one new
let cat3 = func (s1, s2, s3 : Str) -> Str {
  let len1 = strlen(s1)
  let len2 = strlen(s2)
  let len3 = strlen(s3)

  let len12 = len1 + len2
  let len123 = len12 + len3

  let s = malloc(len123 + (1 /* for STR_TERM */)) to Str

  strcpy(&s[0] to Str, s1)
  strcpy(&s[len1] to Str, s2)
  strcpy(&s[len12] to Str, s3)
  s[len123] = STR_TERM

  return s
}


// concat four strings to one new
let cat4 = func (s1, s2, s3, s4 : Str) -> Str {
  let len1 = strlen(s1)
  let len2 = strlen(s2)
  let len3 = strlen(s3)
  let len4 = strlen(s4)

  let len12 = len1 + len2
  let len123 = len12 + len3
  let len1234 = len123 + len4

  let s = malloc(len1234 + (1 /* for STR_TERM */)) to Str

  strcpy(&s[0] to Str, s1)
  strcpy(&s[len1] to Str, s2)
  strcpy(&s[len12] to Str, s3)
  strcpy(&s[len123] to Str, s4)
  s[len1234] = STR_TERM

  return s
}


// concat five strings to one new
let cat5 = func (s1, s2, s3, s4, s5 : Str) -> Str {
  let len1 = strlen(s1)
  let len2 = strlen(s2)
  let len3 = strlen(s3)
  let len4 = strlen(s4)
  let len5 = strlen(s5)

  let len12 = len1 + len2
  let len123 = len12 + len3
  let len1234 = len123 + len4
  let len12345 = len1234 + len5

  let s = malloc(len12345 + (1 /* for STR_TERM */)) to Str

  strcpy(&s[0] to Str, s1)
  strcpy(&s[len1] to Str, s2)
  strcpy(&s[len12] to Str, s3)
  strcpy(&s[len123] to Str, s4)
  strcpy(&s[len1234] to Str, s5)
  s[len12345] = STR_TERM

  return s
}


