// lib/str


let STR_TERM = 0



let str_new = func (len : Nat) -> Str {return malloc(len) to Str}


// create copy of string
let dup = func (s : Str) -> Str {
  let len = strlen(s)
  let new_s = str_new(len + 1)
  strcpy(new_s, s)
  return new_s
}


// склеивает две строки формируя на выходе новую
let cat = func (s1, s2 : Str) -> Str {
  let len1 = strlen(s1)
  let len2 = strlen(s2)

  let len12 = len1 + len2

  let s = str_new(len12 + 1)

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

  let s = str_new(len123 + 1)

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

  let s = str_new(len1234 + 1)

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

  let s = str_new(len12345 + 1)

  strcpy(&s[0] to Str, s1)
  strcpy(&s[len1] to Str, s2)
  strcpy(&s[len12] to Str, s3)
  strcpy(&s[len123] to Str, s4)
  strcpy(&s[len1234] to Str, s5)
  s[len12345] = STR_TERM

  return s
}


