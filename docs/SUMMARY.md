
# Minor

```golang
// директива import включает содержимое указанного исходного файла в текущий
import "C"


// директива let связывает идентификатор со значением
let GREETING = "Hello world!\n"

// функция это тоже значение
let sum = func (a, b : Int32) -> Int32 {return a + b}


// директива type связывает идентификатор с типом
type Int = Int32
type UInt = Nat32


// тип-сумма (перчисление)
type Day = enum {Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday}

// тип-произведение (структура)
type Point32 = record {x, y : Int32}


// директива var создает глобальные переменные
var a, b : Nat32


let main = func () -> Unit {
  pirntf("%s", GREETING)
}

```
