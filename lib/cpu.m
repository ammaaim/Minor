
// обратный код (первое дополнение)
let ones_complement32 = func (x : Int32) -> Int32 {
  return (not (x to Nat32)) to Int32
}

// дополнительный код (второе дополнение)
let twos_complement32 = func (x : Int32) -> Int32 {
  return ((not (x to Nat32)) + 1) to Int32
}


// обратный код (первое дополнение)
let ones_complement64 = func (x : Int64) -> Int64 {
  return (not (x to Nat64)) to Int64
}

// дополнительный код (второе дополнение)
let twos_complement64 = func (x : Int64) -> Int64 {
  return ((not (x to Nat64)) + 1) to Int64
}

