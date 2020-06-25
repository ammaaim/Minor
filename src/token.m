// src/token


type TokenType = enum {
  TokenEOF,
  TokenId,
  TokenNum,
  TokenSym,
  TokenString,
  TokenHash,
  TokenNL
}


type TokenInfo = record {
  file   : Str
  line   : Nat32
  start  : Nat16
  length : Nat16
}


type Token = record {
  type   : TokenType
  ti     : TokenInfo

  /* data tail */
  text   : [0]Nat8
}


