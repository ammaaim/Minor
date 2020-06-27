// lib/ascii


let isalpha = func (c : Nat8) -> Bool {
  return ((c >= "A"[0]) and (c <= "Z"[0])) or
         ((c >= "a"[0]) and (c <= "z"[0]))
}

let isdigit = func (c : Nat8) -> Bool {return (c >= "0"[0]) and (c <= "9"[0])}
let isalnum = func (c : Nat8) -> Bool {return isalpha(c) or isdigit(c)}


