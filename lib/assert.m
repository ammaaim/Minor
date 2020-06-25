// lib/assert


let assert = func (cond : Bool, text : Str) -> Unit {
  if not cond {
    printf("assert failed: %s\n", text)
    exit(1)
  }
}


