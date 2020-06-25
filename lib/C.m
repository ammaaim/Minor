

type Int = Int32
type Off_T = Int64
type Nat = Nat32
type Size_T = Nat


type FILE = Unit

nodecorate extern malloc : (size : Nat32) -> *Unit
nodecorate extern memset : (mem : *Unit, c : Nat8, n : Size_T) -> *Unit
nodecorate extern memcpy : (dst, src : *Unit, len : Size_T) -> *Unit
nodecorate extern memcmp : (ptr1, ptr2 : *Unit, num : Size_T) -> Int
nodecorate extern free   : (mem : *Unit) -> Unit

nodecorate extern putchar : (char : Int8) -> Int32

nodecorate extern strcmp : (s1, s2 : Str) -> Int
nodecorate extern strcpy : (dst, src : Str) -> *Nat8
nodecorate extern strlen : (s : Str) -> Size_T


let SEEK_SET = 0
let SEEK_CUR = 1
let SEEK_END = 2


/*
 * На самом деле этот модуль создавался ради этой функции
 */
nodecorate arghack extern printf  : (s : Str) -> Int32
nodecorate arghack extern scanf   : (format : Str) -> Int

nodecorate arghack extern sscanf  : (buf : *Unit, format : Str) -> Int
nodecorate arghack extern sprintf : (buf : *Unit, format : Str) -> Int

nodecorate extern chdir  : (dir : Str) -> Int

nodecorate extern fopen  : (fname : Str, mode : Str) -> *FILE
nodecorate arghack extern fprintf : (stream : *FILE, format : Str) -> Int
nodecorate extern fseek  : (stream : *FILE, offset : Int64, whence : Int) -> Int
nodecorate extern fclose : (fp : *FILE) -> Int



let O_RDONLY = 0x0000  // open for reading only
let O_WRONLY = 0x0001  // open for writing only
let O_RDWR = 0x0002    // open for reading and writing


nodecorate extern open  : (path : Str, oflags : Int) -> Int
nodecorate extern read, write : (handle : Int, buf : *Nat8, len : Nat32) -> Int
nodecorate extern lseek : (fd : Int, offset : Off_T, whence : Int) -> Off_T
nodecorate extern close : (fd : Int) -> Int
nodecorate extern exit  : (rc : Int) -> Unit


type DIR = Unit

nodecorate extern opendir  : (name : Str) -> *DIR
nodecorate extern closedir : (dirp : *DIR) -> Int

nodecorate extern getcwd : (buf : Str, size : Size_T) -> Str

nodecorate extern getenv : (name : Str) -> Str


