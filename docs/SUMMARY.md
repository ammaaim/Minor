
# Minor

```c
import "C"

// let связывает идентификатор со значением
let GREETING = "Hello world!\n"

// функция это тоже значение
let sum = (a, b : Int32) -> Int32 {return a + b}


// type связывает идентификатор с типом
type Int = Int32

// тип-сумма
type Day = enum {Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday}

// тип-произведение
type Point32 = record {x, y : Int32}


// var создает глобальные переменные
var a, b : Nat32


let main = () -> Unit {
  pirntf("%s", GREETING)
}

```