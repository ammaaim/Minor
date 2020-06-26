; clang out2.ll && ./a.out

; llc out2.ll ; for create .s file from .ll
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%Enum = type i32
%Bool = type i1
%Unit = type i1
%Str = type i8*
%Int64 = type i64
%Nat64 = type i64
%Int32 = type i32
%Nat32 = type i32
%Int8 = type i8
%Nat8 = type i8
%Int16 = type i16
%Nat16 = type i16
%Int128 = type i128
%Int256 = type i256
%Int512 = type i512
%Int1024 = type i1024
%Nat128 = type i128
%Nat256 = type i256
%Nat512 = type i512
%Nat1024 = type i1024


; assembly: <asm0>


;types:

%Int = type %Int32
%Off_T = type %Int64
%Nat = type %Nat32
%Size_T = type %Nat32
%FILE = type %Unit
%DIR = type %Unit
%Node = type {%Node*, %Node*, %Unit*, %Unit*}
%NodeForeachHandler = type void (%Node*, %Unit*, %Nat32)*
%NodeSearchHandler = type %Bool (%Node*, %Unit*, %Nat32)*
%ListForeachHandler = type void (%Unit*, %Unit*, %Nat32)*
%ListForeachHandler2 = type void (%Unit*, %Unit*, %Unit*, %Nat32)*
%ListCompareHandler = type %Bool (%Unit*, %Unit*, %Unit*, %Nat32)*
%ListSearchHandler = type %Unit* (%Unit*, %Unit*, %Nat32)*
%ListMapHandler = type %Unit* (%Unit*, %Unit*, %Nat32)*
%List = type {%Node*, %Node*, %Nat64}
%Map = type {%Node*, %Node*, %Nat64}
%MapForeachHandler = type void (%Unit*, %Unit*, %Unit*)*
%TokenType = type %Int16
%TokenInfo = type {%Str, %Nat32, %Nat16, %Nat16}
%Token = type {%TokenType, %TokenInfo, [0 x %Nat8]}
%State = type {%Int32, %TokenType, [256 x %Nat8], %Nat16, %Nat32, %Nat32, %Nat16, %Str, %Nat8}
%Rule = type %Bool (%Nat8)*
%Source = type {%Str, %Str, %Str, %List*, %Node*}
%TypeUndefined = type {%Str}
%TypeBasic = type {%Str, %Nat32, %Bool, %Bool}
%TypeFunc = type {%List*, %Type*, %Bool}
%TypePointer = type {%Type*}
%TypeArray = type {%Type*, %Nat32, %Bool}
%TypeRecord = type {%List*, %Nat32}
%TypeEnum = type {%List*, %Nat32}
%TypeKind = type %Int16
%Type = type {%TypeKind, %Str, %Nat32, %Nat8, %TypeUndefined, %TypeBasic, %TypeFunc, %TypePointer, %TypeArray, %TypeRecord, %TypeEnum, %TokenInfo*, %TokenInfo*, %TokenInfo*}
%Field = type {%Str, %Type*, %Nat16, %TokenInfo*}
%FieldHandleContext = type {%Nat16, %Nat32, %Nat8}
%EnumConstructor = type {%Str, %Int64}
%StorageClass = type %Int16
%String = type {%Str, %Nat32}
%Storage = type {%StorageClass, %Int64, %Nat32, %Str, %String, %List*}
%ValueKind = type %Int16
%Value = type {%ValueKind, %Type*, %Storage, [2 x %Value*], %Str, %List*, %Block*, %Type*, %TokenInfo*, %TokenInfo*, %TokenInfo*}
%Block = type {%Block*, %List*, %List, %List, %List*}
%If = type {%Value*, %Stmt*, %Stmt*}
%While = type {%Value*, %Stmt*}
%StmtKind = type %Int16
%Stmt = type {%StmtKind, [2 x %Value*], %Block*, %VarDef*, %While*, %If*, %Str, %TokenInfo*}
%TypeDef = type {%Str, %Type*}
%ConstDef = type {%Str, %Value*}
%VarDef = type {%Str, %Type*, %Value*}
%FuncDef = type {%Str, %Type*, %Block*}
%Assembly = type {%Str, %List*, %List*, %List*, %List*}
%ModuleContext = type {%Source*, %List, %List}
%FuncContext = type {%Value*, %Block*, %Nat32, %Nat32, %Nat32, %Nat32, %Nat32}
%TypeParser = type %Type* ()*
%ValueParser = type %Value* ()*
%StmtParser = type %Stmt* (%TokenInfo*)*
%Eval = type %Value* (%Value*)*
%Arch = type %Int16
%Settings = type {%Nat32, %Nat32, %Nat32, %Nat32, %Nat32, %Nat32}

;consts:

@func7_str1 = private unnamed_addr constant [19 x i8] c"assert failed: %s\0A\00", align 1
@func8_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func41_str1 = private unnamed_addr constant [11 x i8] c"module=%s\0A\00", align 1
@func41_str2 = private unnamed_addr constant [17 x i8] c"module not exist\00", align 1
@func41_str3 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func44_str1 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func44_str2 = private unnamed_addr constant [16 x i8] c"too long token\0A\00", align 1
@func45_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func45_str2 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func46_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func47_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func47_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func48_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func48_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func49_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func49_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func50_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func51_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func52_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func54_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func54_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func54_str3 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func54_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func54_str5 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func54_str6 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func54_str7 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func54_str8 = private unnamed_addr constant [2 x i8] c"!\00", align 1
@func54_str9 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@func54_str10 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func55_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func55_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func55_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func55_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func55_str5 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func55_str6 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func55_str7 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func55_str8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func56_str1 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func56_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func56_str3 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func56_str4 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@func56_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func56_str6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@func56_str7 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func56_str8 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@func56_str9 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func56_str10 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func56_str11 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func56_str12 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func56_str13 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func56_str14 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@func56_str15 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func56_str16 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@func56_str17 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func56_str18 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@func56_str19 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func56_str20 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func56_str21 = private unnamed_addr constant [17 x i8] c"too long string\0A\00", align 1
@func57_str1 = private unnamed_addr constant [18 x i8] c"unexpected symbol\00", align 1
@func57_str2 = private unnamed_addr constant [24 x i8] c"expected %s instead %s\0A\00", align 1
@func57_str3 = private unnamed_addr constant [16 x i8] c"ctok.type = %d\0A\00", align 1
@func58_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func59_str1 = private unnamed_addr constant [29 x i8] c"lex::skipto not implemented\0A\00", align 1
@func59_str2 = private unnamed_addr constant [12 x i8] c"tok = '%s'\0A\00", align 1
@func59_str3 = private unnamed_addr constant [18 x i8] c"skip_target = %s\0A\00", align 1
@func61_str1 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@func61_str2 = private unnamed_addr constant [2 x i8] c"Z\00", align 1
@func61_str3 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@func61_str4 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@func62_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func62_str2 = private unnamed_addr constant [2 x i8] c"9\00", align 1
@func67_str1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func68_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func68_str2 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@func68_str3 = private unnamed_addr constant [8 x i8] c"/main.m\00", align 1
@func68_str4 = private unnamed_addr constant [7 x i8] c"main.m\00", align 1
@func69_str1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func71_str1 = private unnamed_addr constant [23 x i8] c"\0A%c[0;%dminfo:%c[0m %s\00", align 1
@func72_str1 = private unnamed_addr constant [35 x i8] c"\0A%c[0;%dmwarning%c[0m (%s:%d) : %s\00", align 1
@func72_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func72_str3 = private unnamed_addr constant [26 x i8] c"\0A%c[0;%dmwarning:%c[0m %s\00", align 1
@func73_str1 = private unnamed_addr constant [24 x i8] c"\0A%c[0;%dmerror:%c[0m %s\00", align 1
@func73_str2 = private unnamed_addr constant [33 x i8] c"\0A%c[0;%dmerror%c[0m (%s:%d) : %s\00", align 1
@func73_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func73_str4 = private unnamed_addr constant [14 x i8] c"*** STOP ***\0A\00", align 1
@func74_str1 = private unnamed_addr constant [17 x i8] c"\0A%c[0;%dm%s%c[0m\00", align 1
@func74_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func75_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func75_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func76_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func76_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func76_str3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func76_str4 = private unnamed_addr constant [15 x i8] c"%c[0;%dm^%c[0m\00", align 1
@func77_str1 = private unnamed_addr constant [24 x i8] c"%c[0;%dmfatal:%c[0m %s\0A\00", align 1
@func78_str1 = private unnamed_addr constant [9 x i8] c"type_new\00", align 1
@func78_str2 = private unnamed_addr constant [14 x i8] c"dataAlignment\00", align 1
@func81_str1 = private unnamed_addr constant [10 x i8] c"field_new\00", align 1
@func88_str1 = private unnamed_addr constant [9 x i8] c"enumSize\00", align 1
@func91_str1 = private unnamed_addr constant [12 x i8] c"pointerSize\00", align 1
@func93_str1 = private unnamed_addr constant [12 x i8] c"pointerSize\00", align 1
@func95_str1 = private unnamed_addr constant [12 x i8] c"pointerSize\00", align 1
@func100_str1 = private unnamed_addr constant [15 x i8] c"undefined type\00", align 1
@func98_str1 = private unnamed_addr constant [36 x i8] c"type_undefined_check undefined type\00", align 1
@func101_str1 = private unnamed_addr constant [26 x i8] c"type_eq unknown type kind\00", align 1
@func115_str1 = private unnamed_addr constant [10 x i8] c"value_new\00", align 1
@func125_str1 = private unnamed_addr constant [14 x i8] c"unknown value\00", align 1
@func125_str2 = private unnamed_addr constant [25 x i8] c"getType:: unknown v.kind\00", align 1
@func128_str1 = private unnamed_addr constant [20 x i8] c"nat:: v.type == Nil\00", align 1
@func128_str2 = private unnamed_addr constant [15 x i8] c"nat:: t == Nil\00", align 1
@func130_str1 = private unnamed_addr constant [9 x i8] c"stmt_new\00", align 1
@func135_str1 = private unnamed_addr constant [16 x i8] c"asm_typedef_add\00", align 1
@func136_str1 = private unnamed_addr constant [17 x i8] c"asm_constdef_add\00", align 1
@func137_str1 = private unnamed_addr constant [15 x i8] c"asm_vardef_add\00", align 1
@func138_str1 = private unnamed_addr constant [16 x i8] c"asm_funcdef_add\00", align 1
@func141_str1 = private unnamed_addr constant [29 x i8] c"asm_rename: target not found\00", align 1
@func143_str1 = private unnamed_addr constant [8 x i8] c"ValueId\00", align 1
@func143_str2 = private unnamed_addr constant [9 x i8] c"ValueRef\00", align 1
@func143_str3 = private unnamed_addr constant [11 x i8] c"ValueDeref\00", align 1
@func143_str4 = private unnamed_addr constant [9 x i8] c"ValueNot\00", align 1
@func143_str5 = private unnamed_addr constant [11 x i8] c"ValueMinus\00", align 1
@func143_str6 = private unnamed_addr constant [9 x i8] c"ValueShl\00", align 1
@func143_str7 = private unnamed_addr constant [9 x i8] c"ValueShr\00", align 1
@func143_str8 = private unnamed_addr constant [9 x i8] c"ValueAdd\00", align 1
@func143_str9 = private unnamed_addr constant [9 x i8] c"ValueSub\00", align 1
@func143_str10 = private unnamed_addr constant [9 x i8] c"ValueMul\00", align 1
@func143_str11 = private unnamed_addr constant [9 x i8] c"ValueDiv\00", align 1
@func143_str12 = private unnamed_addr constant [9 x i8] c"ValueMod\00", align 1
@func143_str13 = private unnamed_addr constant [8 x i8] c"ValueOr\00", align 1
@func143_str14 = private unnamed_addr constant [9 x i8] c"ValueXor\00", align 1
@func143_str15 = private unnamed_addr constant [9 x i8] c"ValueAnd\00", align 1
@func143_str16 = private unnamed_addr constant [8 x i8] c"ValueEq\00", align 1
@func143_str17 = private unnamed_addr constant [8 x i8] c"ValueNe\00", align 1
@func143_str18 = private unnamed_addr constant [8 x i8] c"ValueLt\00", align 1
@func143_str19 = private unnamed_addr constant [8 x i8] c"ValueGt\00", align 1
@func143_str20 = private unnamed_addr constant [8 x i8] c"ValueLe\00", align 1
@func143_str21 = private unnamed_addr constant [8 x i8] c"ValueGe\00", align 1
@func143_str22 = private unnamed_addr constant [10 x i8] c"ValueCall\00", align 1
@func143_str23 = private unnamed_addr constant [11 x i8] c"ValueIndex\00", align 1
@func143_str24 = private unnamed_addr constant [12 x i8] c"ValueAccess\00", align 1
@func143_str25 = private unnamed_addr constant [10 x i8] c"ValueCast\00", align 1
@func143_str26 = private unnamed_addr constant [13 x i8] c"ValueInvalid\00", align 1
@func143_str27 = private unnamed_addr constant [13 x i8] c"ValueUnknown\00", align 1
@func144_str1 = private unnamed_addr constant [17 x i8] c"StorageUndefined\00", align 1
@func144_str2 = private unnamed_addr constant [17 x i8] c"StorageImmediate\00", align 1
@func144_str3 = private unnamed_addr constant [13 x i8] c"StorageArray\00", align 1
@func144_str4 = private unnamed_addr constant [16 x i8] c"StorageFunction\00", align 1
@func144_str5 = private unnamed_addr constant [16 x i8] c"StorageRegister\00", align 1
@func144_str6 = private unnamed_addr constant [15 x i8] c"StorageAddress\00", align 1
@func144_str7 = private unnamed_addr constant [13 x i8] c"StorageLocal\00", align 1
@func144_str8 = private unnamed_addr constant [14 x i8] c"StorageGlobal\00", align 1
@func144_str9 = private unnamed_addr constant [20 x i8] c"StorageClassUnknown\00", align 1
@func145_str1 = private unnamed_addr constant [13 x i8] c"value: %p {\0A\00", align 1
@func145_str2 = private unnamed_addr constant [12 x i8] c"  kind: %s\0A\00", align 1
@func145_str3 = private unnamed_addr constant [9 x i8] c"  type: \00", align 1
@func145_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func145_str5 = private unnamed_addr constant [21 x i8] c"  storage.class: %s\0A\00", align 1
@func145_str6 = private unnamed_addr constant [18 x i8] c"  storage.id: %s\0A\00", align 1
@func145_str7 = private unnamed_addr constant [19 x i8] c"  storage.reg: %d\0A\00", align 1
@func145_str8 = private unnamed_addr constant [19 x i8] c"  storage.val: %d\0A\00", align 1
@func145_str9 = private unnamed_addr constant [3 x i8] c"}\0A\00", align 1
@func146_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func146_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func146_str3 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func146_str4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func146_str5 = private unnamed_addr constant [14 x i8] c"<TypeNumeric>\00", align 1
@func146_str6 = private unnamed_addr constant [31 x i8] c"unkn type kind %d, maybe func?\00", align 1
@func147_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func148_str1 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@func148_str2 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func147_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func147_str3 = private unnamed_addr constant [16 x i8] c"<record:0x%02x>\00", align 1
@func149_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func150_str1 = private unnamed_addr constant [5 x i8] c"%s, \00", align 1
@func149_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func151_str1 = private unnamed_addr constant [3 x i8] c"[]\00", align 1
@func151_str2 = private unnamed_addr constant [5 x i8] c"[%d]\00", align 1
@func152_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func153_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func153_str2 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@func152_str2 = private unnamed_addr constant [6 x i8] c") -> \00", align 1
@func155_str1 = private unnamed_addr constant [5 x i8] c"* %s\00", align 1
@func155_str2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func155_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func157_str1 = private unnamed_addr constant [8 x i8] c"VAL: %s\00", align 1
@func157_str2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func157_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func163_str1 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@func163_str2 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@func163_str3 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@func163_str4 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func163_str5 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func163_str6 = private unnamed_addr constant [8 x i8] c"arghack\00", align 1
@func163_str7 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@func163_str8 = private unnamed_addr constant [11 x i8] c"nodecorate\00", align 1
@func163_str9 = private unnamed_addr constant [17 x i8] c"unexpected token\00", align 1
@func163_str10 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@func163_str11 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func163_str12 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@func163_str13 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@func164_str1 = private unnamed_addr constant [23 x i8] c"expected import string\00", align 1
@func164_str2 = private unnamed_addr constant [18 x i8] c"when import = %s\0A\00", align 1
@func164_str3 = private unnamed_addr constant [14 x i8] c"cannot import\00", align 1
@func165_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func168_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func171_str1 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func171_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func171_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func172_str1 = private unnamed_addr constant [12 x i8] c"expected id\00", align 1
@func172_str2 = private unnamed_addr constant [9 x i8] c"tt = %d\0A\00", align 1
@func172_str3 = private unnamed_addr constant [9 x i8] c"tx = %d\0A\00", align 1
@func172_str4 = private unnamed_addr constant [14 x i8] c"instead '%s'\0A\00", align 1
@func173_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func173_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func179_str1 = private unnamed_addr constant [19 x i8] c"expected separator\00", align 1
@func180_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func180_str2 = private unnamed_addr constant [2 x i8] c";\00", align 1
@func180_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func180_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func184_str1 = private unnamed_addr constant [25 x i8] c"attempt to redeclaration\00", align 1
@func184_str2 = private unnamed_addr constant [14 x i8] c"declared at: \00", align 1
@func185_str1 = private unnamed_addr constant [18 x i8] c"define: id == Nil\00", align 1
@func185_str2 = private unnamed_addr constant [17 x i8] c"define: v == Nil\00", align 1
@func190_str1 = private unnamed_addr constant [44 x i8] c"type bind error: attempt to id redefinition\00", align 1
@func196_str1 = private unnamed_addr constant [45 x i8] c"value bind error: attempt to id redefinition\00", align 1
@func202_str1 = private unnamed_addr constant [4 x i8] c"Nil\00", align 1
@func202_str2 = private unnamed_addr constant [5 x i8] c"self\00", align 1
@func206_str1 = private unnamed_addr constant [5 x i8] c"%s%u\00", align 1
@func207_str1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func207_str2 = private unnamed_addr constant [4 x i8] c"%s_\00", align 1
@func208_str1 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@func209_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func210_str1 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@func210_str2 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@func211_str1 = private unnamed_addr constant [4 x i8] c"arr\00", align 1
@func212_str1 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func213_str1 = private unnamed_addr constant [5 x i8] c"Type\00", align 1
@func217_str1 = private unnamed_addr constant [7 x i8] c"record\00", align 1
@func217_str2 = private unnamed_addr constant [5 x i8] c"enum\00", align 1
@func217_str3 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func217_str4 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func217_str5 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func217_str6 = private unnamed_addr constant [14 x i8] c"expected type\00", align 1
@func217_str7 = private unnamed_addr constant [8 x i8] c"tok=%s\0A\00", align 1
@func217_str8 = private unnamed_addr constant [14 x i8] c"dataAlignment\00", align 1
@func218_str1 = private unnamed_addr constant [12 x i8] c"expected id\00", align 1
@func219_str1 = private unnamed_addr constant [14 x i8] c"dofield error\00", align 1
@func219_str2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func220_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func220_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func221_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func221_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func221_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func221_str4 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func222_str1 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func222_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func223_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func223_str2 = private unnamed_addr constant [3 x i8] c"->\00", align 1
@func223_str3 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@func224_str1 = private unnamed_addr constant [40 x i8] c"value/un :: unknown value kind received\00", align 1
@func229_str1 = private unnamed_addr constant [18 x i8] c"expected pointer\0A\00", align 1
@func234_str1 = private unnamed_addr constant [32 x i8] c"binImm :: unknown bin operation\00", align 1
@func235_str1 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func235_str2 = private unnamed_addr constant [9 x i8] c"LTYPE = \00", align 1
@func235_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func235_str4 = private unnamed_addr constant [9 x i8] c"RTYPE = \00", align 1
@func235_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func235_str6 = private unnamed_addr constant [18 x i8] c"binary type error\00", align 1
@func241_str1 = private unnamed_addr constant [41 x i8] c"expected record / pointer to record type\00", align 1
@func241_str2 = private unnamed_addr constant [16 x i8] c"undefined field\00", align 1
@func243_str1 = private unnamed_addr constant [18 x i8] c"expected function\00", align 1
@func244_str1 = private unnamed_addr constant [21 x i8] c"not enough arguments\00", align 1
@func244_str2 = private unnamed_addr constant [19 x i8] c"too many arguments\00", align 1
@func244_str3 = private unnamed_addr constant [37 x i8] c"argument type not match param type: \00", align 1
@func244_str4 = private unnamed_addr constant [7 x i8] c"arg = \00", align 1
@func244_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func244_str6 = private unnamed_addr constant [7 x i8] c"par = \00", align 1
@func244_str7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func249_str1 = private unnamed_addr constant [24 x i8] c"expected constant value\00", align 1
@func250_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func251_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func252_str1 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func253_str1 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@func253_str2 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@func254_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func254_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func254_str3 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@func254_str4 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@func255_str1 = private unnamed_addr constant [3 x i8] c"<<\00", align 1
@func255_str2 = private unnamed_addr constant [3 x i8] c">>\00", align 1
@func256_str1 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@func256_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func257_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func257_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func257_str3 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@func258_str1 = private unnamed_addr constant [3 x i8] c"to\00", align 1
@func259_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func259_str2 = private unnamed_addr constant [2 x i8] c"&\00", align 1
@func259_str3 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@func259_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func259_str5 = private unnamed_addr constant [7 x i8] c"sizeof\00", align 1
@func259_str6 = private unnamed_addr constant [23 x i8] c"sizeof expected <type>\00", align 1
@func259_str7 = private unnamed_addr constant [8 x i8] c"alignof\00", align 1
@func259_str8 = private unnamed_addr constant [24 x i8] c"alignof expected <type>\00", align 1
@func260_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func260_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func260_str3 = private unnamed_addr constant [3 x i8] c",)\00", align 1
@func260_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func260_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func260_str6 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func260_str7 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func260_str8 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func260_str9 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func260_str10 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func261_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func261_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func262_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func262_str2 = private unnamed_addr constant [6 x i8] c"array\00", align 1
@func262_str3 = private unnamed_addr constant [24 x i8] c"term: unexpected token\0A\00", align 1
@func262_str4 = private unnamed_addr constant [12 x i8] c"token = %s\0A\00", align 1
@func264_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func264_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func264_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func264_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func265_str1 = private unnamed_addr constant [16 x i8] c"funcdef id fail\00", align 1
@func265_str2 = private unnamed_addr constant [18 x i8] c"funcdef type fail\00", align 1
@func265_str3 = private unnamed_addr constant [19 x i8] c"expected func type\00", align 1
@func265_str4 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func267_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func267_str2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@func267_str3 = private unnamed_addr constant [5 x i8] c"%llx\00", align 1
@func267_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@func270_str1 = private unnamed_addr constant [13 x i8] c"invalid lval\00", align 1
@func270_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func270_str3 = private unnamed_addr constant [9 x i8] c"LTYPE = \00", align 1
@func270_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func270_str5 = private unnamed_addr constant [9 x i8] c"RTYPE = \00", align 1
@func270_str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func271_str1 = private unnamed_addr constant [25 x i8] c"expected Bool expression\00", align 1
@func272_str1 = private unnamed_addr constant [25 x i8] c"expected Bool expression\00", align 1
@func280_str1 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@func280_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func280_str3 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func280_str4 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@func280_str5 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@func280_str6 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@func280_str7 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@func280_str8 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func280_str9 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@func280_str10 = private unnamed_addr constant [5 x i8] c"goto\00", align 1
@func280_str11 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func282_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func282_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func282_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func282_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func282_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func282_str6 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func283_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func283_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func284_str1 = private unnamed_addr constant [27 x i8] c"expected return expression\00", align 1
@func285_str1 = private unnamed_addr constant [34 x i8] c"`break` outside any loop operator\00", align 1
@func286_str1 = private unnamed_addr constant [37 x i8] c"`continue` outside any loop operator\00", align 1
@func288_str1 = private unnamed_addr constant [15 x i8] c"expected label\00", align 1
@func289_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func289_str2 = private unnamed_addr constant [25 x i8] c"stmt::fail_with_restore\0A\00", align 1
@func289_str3 = private unnamed_addr constant [10 x i8] c"YYY = %s\0A\00", align 1
@func292_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func293_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func294_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func295_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func296_str1 = private unnamed_addr constant [26 x i8] c"prn/printType :: t = Nil\0A\00", align 1
@func296_str2 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func296_str3 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func296_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func296_str5 = private unnamed_addr constant [16 x i8] c"<UNDEFINED::%s>\00", align 1
@func297_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func298_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func297_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func299_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func299_str2 = private unnamed_addr constant [7 x i8] c"[%d x \00", align 1
@func299_str3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func300_str1 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func300_str2 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func301_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func300_str3 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func300_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func300_str5 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func303_str1 = private unnamed_addr constant [11 x i8] c"\0A\0A;stmt%d:\00", align 1
@func303_str2 = private unnamed_addr constant [19 x i8] c"print::StmtUnknown\00", align 1
@func304_str1 = private unnamed_addr constant [18 x i8] c"\0A  %%%s = alloca \00", align 1
@func307_str1 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func307_str2 = private unnamed_addr constant [35 x i8] c", label %%then_%d, label %%else_%d\00", align 1
@func307_str3 = private unnamed_addr constant [10 x i8] c"\0Athen_%d:\00", align 1
@func307_str4 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func307_str5 = private unnamed_addr constant [10 x i8] c"\0Aelse_%d:\00", align 1
@func307_str6 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func307_str7 = private unnamed_addr constant [11 x i8] c"\0Aendif_%d:\00", align 1
@func308_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func308_str2 = private unnamed_addr constant [14 x i8] c"\0Acontinue_%d:\00", align 1
@func308_str3 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func308_str4 = private unnamed_addr constant [36 x i8] c", label %%body_%d, label %%break_%d\00", align 1
@func308_str5 = private unnamed_addr constant [10 x i8] c"\0Abody_%d:\00", align 1
@func308_str6 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func308_str7 = private unnamed_addr constant [11 x i8] c"\0Abreak_%d:\00", align 1
@func309_str1 = private unnamed_addr constant [10 x i8] c"\0Aret void\00", align 1
@func309_str2 = private unnamed_addr constant [8 x i8] c"\0A  ret \00", align 1
@func310_str1 = private unnamed_addr constant [23 x i8] c"\0A  br label %%break_%d\00", align 1
@func311_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func312_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func313_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func313_str2 = private unnamed_addr constant [5 x i8] c"\0A%s:\00", align 1
@func316_str1 = private unnamed_addr constant [25 x i8] c"getelementptr inbounds (\00", align 1
@func316_str2 = private unnamed_addr constant [17 x i8] c", i32 0, i32 %d)\00", align 1
@func317_str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@func317_str2 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func317_str3 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func317_str4 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func317_str5 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func317_str6 = private unnamed_addr constant [19 x i8] c"<StorageUndefined>\00", align 1
@func319_str1 = private unnamed_addr constant [16 x i8] c"\0A  %%%d = load \00", align 1
@func319_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func320_str1 = private unnamed_addr constant [9 x i8] c"\0A  call \00", align 1
@func320_str2 = private unnamed_addr constant [16 x i8] c"\0A  %%%d = call \00", align 1
@func320_str3 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func320_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func323_str1 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@func323_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func323_str3 = private unnamed_addr constant [8 x i8] c", i32 0\00", align 1
@func323_str4 = private unnamed_addr constant [14 x i8] c" ; eval_index\00", align 1
@func324_str1 = private unnamed_addr constant [29 x i8] c"print/expr:: v.field == Nil\0A\00", align 1
@func324_str2 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@func324_str3 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func324_str4 = private unnamed_addr constant [30 x i8] c", i32 0, i32 %u ; eval_access\00", align 1
@func325_str1 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@func325_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func325_str3 = private unnamed_addr constant [12 x i8] c"i32 0 ; ref\00", align 1
@func327_str1 = private unnamed_addr constant [15 x i8] c"\0A  %%%d = xor \00", align 1
@func327_str2 = private unnamed_addr constant [4 x i8] c", 1\00", align 1
@func327_str3 = private unnamed_addr constant [5 x i8] c", -1\00", align 1
@func328_str1 = private unnamed_addr constant [19 x i8] c"\0A  %%%d = sub nsw \00", align 1
@func328_str2 = private unnamed_addr constant [3 x i8] c" 0\00", align 1
@func329_str1 = private unnamed_addr constant [11 x i8] c"\0A  %%%d = \00", align 1
@func329_str2 = private unnamed_addr constant [10 x i8] c"inttoptr \00", align 1
@func329_str3 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@func329_str4 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@func329_str5 = private unnamed_addr constant [10 x i8] c"inttoptr \00", align 1
@func329_str6 = private unnamed_addr constant [7 x i8] c"trunc \00", align 1
@func329_str7 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@func329_str8 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@func329_str9 = private unnamed_addr constant [5 x i8] c"ext \00", align 1
@func329_str10 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@func329_str11 = private unnamed_addr constant [10 x i8] c"ptrtoint \00", align 1
@func329_str12 = private unnamed_addr constant [9 x i8] c"enumSize\00", align 1
@func329_str13 = private unnamed_addr constant [7 x i8] c"trunc \00", align 1
@func329_str14 = private unnamed_addr constant [6 x i8] c"zext \00", align 1
@func329_str15 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@func329_str16 = private unnamed_addr constant [18 x i8] c"e.type.kind = %d\0A\00", align 1
@func329_str17 = private unnamed_addr constant [33 x i8] c"printer/expr/cast :: e.type.kind\00", align 1
@func329_str18 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@func330_str1 = private unnamed_addr constant [7 x i8] c"<oper>\00", align 1
@func330_str2 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@func330_str3 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@func330_str4 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@func330_str5 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@func330_str6 = private unnamed_addr constant [5 x i8] c"udiv\00", align 1
@func330_str7 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@func330_str8 = private unnamed_addr constant [5 x i8] c"urem\00", align 1
@func330_str9 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func330_str10 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func330_str11 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func330_str12 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func330_str13 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@func330_str14 = private unnamed_addr constant [9 x i8] c"icmp slt\00", align 1
@func330_str15 = private unnamed_addr constant [9 x i8] c"icmp ult\00", align 1
@func330_str16 = private unnamed_addr constant [9 x i8] c"icmp sgt\00", align 1
@func330_str17 = private unnamed_addr constant [9 x i8] c"icmp ugt\00", align 1
@func330_str18 = private unnamed_addr constant [9 x i8] c"icmp sle\00", align 1
@func330_str19 = private unnamed_addr constant [9 x i8] c"icmp ule\00", align 1
@func330_str20 = private unnamed_addr constant [9 x i8] c"icmp sge\00", align 1
@func330_str21 = private unnamed_addr constant [9 x i8] c"icmp uge\00", align 1
@func330_str22 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@func330_str23 = private unnamed_addr constant [5 x i8] c"ashr\00", align 1
@func330_str24 = private unnamed_addr constant [5 x i8] c"lshr\00", align 1
@func330_str25 = private unnamed_addr constant [14 x i8] c"\0A  %%%d = %s \00", align 1
@func331_str1 = private unnamed_addr constant [10 x i8] c"\0A  store \00", align 1
@func331_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func332_str1 = private unnamed_addr constant [12 x i8] c"printer::nv\00", align 1
@func333_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func334_str1 = private unnamed_addr constant [44 x i8] c"\0A@%s = private unnamed_addr constant [%d x \00", align 1
@func334_str2 = private unnamed_addr constant [4 x i8] c"] [\00", align 1
@func334_str3 = private unnamed_addr constant [12 x i8] c"], align 16\00", align 1
@func336_str1 = private unnamed_addr constant [50 x i8] c"\0A@%s = private unnamed_addr constant [%d x i8] c\22\00", align 1
@func336_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func336_str3 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func336_str4 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func336_str5 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func336_str6 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func336_str7 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func336_str8 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func336_str9 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func336_str10 = private unnamed_addr constant [6 x i8] c"\5C%02X\00", align 1
@func336_str11 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@func336_str12 = private unnamed_addr constant [16 x i8] c"\5C%02d\22, align 1\00", align 1
@func337_str1 = private unnamed_addr constant [15 x i8] c"\0A@%s = global \00", align 1
@func337_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func338_str1 = private unnamed_addr constant [20 x i8] c"prn/funcdef t = Nil\00", align 1
@func338_str2 = private unnamed_addr constant [10 x i8] c"\0Adeclare \00", align 1
@func338_str3 = private unnamed_addr constant [10 x i8] c"\0A\0Adefine \00", align 1
@func338_str4 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func338_str5 = private unnamed_addr constant [7 x i8] c" @%s (\00", align 1
@func339_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func339_str2 = private unnamed_addr constant [7 x i8] c" %%_%s\00", align 1
@func338_str6 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func338_str7 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func338_str8 = private unnamed_addr constant [3 x i8] c" {\00", align 1
@func340_str1 = private unnamed_addr constant [18 x i8] c"\0A  %%%s = alloca \00", align 1
@func340_str2 = private unnamed_addr constant [10 x i8] c"\0A  store \00", align 1
@func340_str3 = private unnamed_addr constant [8 x i8] c"%%_%s, \00", align 1
@func340_str4 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func340_str5 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func338_str9 = private unnamed_addr constant [12 x i8] c"\0A  ret void\00", align 1
@func338_str10 = private unnamed_addr constant [3 x i8] c"\0A}\00", align 1
@func342_str1 = private unnamed_addr constant [37 x i8] c"print::StorageRecord not implemented\00", align 1
@func345_str1 = private unnamed_addr constant [20 x i8] c"print_assembly: %s\0A\00", align 1
@func345_str2 = private unnamed_addr constant [17 x i8] c"\0A; assembly: %s\0A\00", align 1
@func345_str3 = private unnamed_addr constant [11 x i8] c"\0A\0A;types:\0A\00", align 1
@func345_str4 = private unnamed_addr constant [12 x i8] c"\0A\0A;consts:\0A\00", align 1
@func345_str5 = private unnamed_addr constant [10 x i8] c"\0A\0A;vars:\0A\00", align 1
@func345_str6 = private unnamed_addr constant [11 x i8] c"\0A\0A;funcs:\0A\00", align 1
@func346_str1 = private unnamed_addr constant [61 x i8] c"target datalayout = \22e-m:o-i64:64-f80:128-n8:16:32:64-S128\22\0A\00", align 1
@func346_str2 = private unnamed_addr constant [46 x i8] c"target triple = \22x86_64-apple-macosx10.14.0\22\0A\00", align 1
@func346_str3 = private unnamed_addr constant [71 x i8] c"target datalayout = \22e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\22\0A\00", align 1
@func346_str4 = private unnamed_addr constant [47 x i8] c"target triple = \22thumbv7em-unknown-none-eabi\22\0A\00", align 1
@func346_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func347_str1 = private unnamed_addr constant [15 x i8] c"\0A;type_index:\0A\00", align 1
@func348_str1 = private unnamed_addr constant [13 x i8] c";* %s -> %p\0A\00", align 1
@func349_str1 = private unnamed_addr constant [16 x i8] c"\0A;value_index:\0A\00", align 1
@func350_str1 = private unnamed_addr constant [14 x i8] c"\0A;#%s -> %p {\00", align 1
@func350_str2 = private unnamed_addr constant [16 x i8] c"\0A;  v.kind = %s\00", align 1
@func350_str3 = private unnamed_addr constant [25 x i8] c"\0A;  v.storage.class = %s\00", align 1
@func350_str4 = private unnamed_addr constant [23 x i8] c"\0A;  v.storage.reg = %d\00", align 1
@func350_str5 = private unnamed_addr constant [5 x i8] c"\0A;}\0A\00", align 1
@func351_str1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@func351_str2 = private unnamed_addr constant [26 x i8] c"cannot create output file\00", align 1
@func351_str3 = private unnamed_addr constant [29 x i8] c"; clang out2.ll && ./a.out\0A\0A\00", align 1
@func351_str4 = private unnamed_addr constant [45 x i8] c"; llc out2.ll ; for create .s file from .ll\0A\00", align 1
@func351_str5 = private unnamed_addr constant [19 x i8] c"%%Enum = type i32\0A\00", align 1
@func351_str6 = private unnamed_addr constant [18 x i8] c"%%Bool = type i1\0A\00", align 1
@func351_str7 = private unnamed_addr constant [18 x i8] c"%%Unit = type i1\0A\00", align 1
@func351_str8 = private unnamed_addr constant [18 x i8] c"%%Str = type i8*\0A\00", align 1
@func352_str1 = private unnamed_addr constant [17 x i8] c"%%%s = type i%d\0A\00", align 1
@func351_str9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func353_str1 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func353_str2 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func353_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func353_str4 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func353_str5 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func353_str6 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func353_str7 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func353_str8 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func353_str9 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func353_str10 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func353_str11 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func353_str12 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func353_str13 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func353_str14 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func353_str15 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func353_str16 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func353_str17 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func353_str18 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func353_str19 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func353_str20 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func353_str21 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func353_str22 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func353_str23 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func353_str24 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func353_str25 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func353_str26 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func353_str27 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func353_str28 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func353_str29 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func353_str30 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func353_str31 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func353_str32 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func353_str33 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func353_str34 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func353_str35 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func353_str36 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func353_str37 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func353_str38 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func354_str1 = private unnamed_addr constant [6 x i8] c"False\00", align 1
@func354_str2 = private unnamed_addr constant [5 x i8] c"True\00", align 1
@MINOR_LIB_ENV_VAR = private unnamed_addr constant [10 x i8] c"MINOR_LIB\00", align 1
@func355_str1 = private unnamed_addr constant [42 x i8] c"enviroment variable MINOR_LIB not defined\00", align 1
@func355_str2 = private unnamed_addr constant [7 x i8] c"<asm0>\00", align 1
@func355_str3 = private unnamed_addr constant [12 x i8] c"cpuBitDepth\00", align 1
@func355_str4 = private unnamed_addr constant [14 x i8] c"dataAlignment\00", align 1
@func355_str5 = private unnamed_addr constant [9 x i8] c"charSize\00", align 1
@func355_str6 = private unnamed_addr constant [9 x i8] c"enumSize\00", align 1
@func355_str7 = private unnamed_addr constant [12 x i8] c"integerSize\00", align 1
@func355_str8 = private unnamed_addr constant [12 x i8] c"pointerSize\00", align 1
@func355_str9 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@func356_str1 = private unnamed_addr constant [12 x i8] c"parsing ini\00", align 1
@func356_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func356_str3 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@func356_str4 = private unnamed_addr constant [11 x i8] c"%s = %lld\0A\00", align 1
@func357_str1 = private unnamed_addr constant [11 x i8] c"m2 v%d.%d\0A\00", align 1
@func357_str2 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@func357_str3 = private unnamed_addr constant [11 x i8] c"lines: %d\0A\00", align 1
@func357_str4 = private unnamed_addr constant [12 x i8] c"error : %d\0A\00", align 1
@func357_str5 = private unnamed_addr constant [15 x i8] c"arch=cortex-m3\00", align 1
@func357_str6 = private unnamed_addr constant [16 x i8] c"arch=cortex-m3\0A\00", align 1
@func357_str7 = private unnamed_addr constant [8 x i8] c"main.ll\00", align 1
@func358_str1 = private unnamed_addr constant [8 x i8] c"usage:\0A\00", align 1
@func358_str2 = private unnamed_addr constant [16 x i8] c"  m2 <target>\0A\0A\00", align 1

;vars:

@lstate = global %State zeroinitializer
@lines = global %Nat32 zeroinitializer
@pdir = global %Str zeroinitializer
@liblist = global %List* zeroinitializer
@warncnt = global %Nat32 zeroinitializer
@errcnt = global %Nat32 zeroinitializer
@typeUnit = global %Type* zeroinitializer
@typeBool = global %Type* zeroinitializer
@typeChar = global %Type* zeroinitializer
@typeStr = global %Type* zeroinitializer
@typeEnum = global %Type* zeroinitializer
@typeSizeof = global %Type* zeroinitializer
@typeAlignof = global %Type* zeroinitializer
@typeFreePtr = global %Type* zeroinitializer
@typeBaseInt = global %Type* zeroinitializer
@typeBaseNat = global %Type* zeroinitializer
@x_uid = global %Nat32 zeroinitializer
@needs = global %Bool zeroinitializer
@asm0 = global %Assembly zeroinitializer
@globalTypeIndex = global %List* zeroinitializer
@globalValueIndex = global %List* zeroinitializer
@mctx = global %ModuleContext zeroinitializer
@fctx = global %FuncContext zeroinitializer
@settings = global %List* zeroinitializer
@func_uid = global %Nat32 zeroinitializer
@str_uid = global %Nat32 zeroinitializer
@arr_uid = global %Nat32 zeroinitializer
@var_uid = global %Nat32 zeroinitializer
@type_uid = global %Nat32 zeroinitializer
@fout = global %Unit* zeroinitializer
@need_comma = global %Bool zeroinitializer
@clab = global %Nat32 zeroinitializer
@global_if_id = global %Nat32 zeroinitializer
@global_while_id = global %Nat32 zeroinitializer
@while_id = global %Nat32 zeroinitializer
@blockno = global %Nat32 zeroinitializer
@stmtno = global %Nat32 zeroinitializer

;funcs:

declare %Unit* @malloc (%Nat32 %_size)
declare %Unit* @memset (%Unit* %_mem, %Nat8 %_c, %Nat32 %_n)
declare %Unit* @memcpy (%Unit* %_dst, %Unit* %_src, %Nat32 %_len)
declare %Int32 @memcmp (%Unit* %_ptr1, %Unit* %_ptr2, %Nat32 %_num)
declare void @free (%Unit* %_mem)
declare %Int32 @putchar (%Int8 %_char)
declare %Int32 @strcmp (%Str %_s1, %Str %_s2)
declare %Nat8* @strcpy (%Str %_dst, %Str %_src)
declare %Nat32 @strlen (%Str %_s)
declare %Int32 @printf (%Str %_s, ...)
declare %Int32 @scanf (%Str %_format, ...)
declare %Int32 @sscanf (%Unit* %_buf, %Str %_format, ...)
declare %Int32 @sprintf (%Unit* %_buf, %Str %_format, ...)
declare %Int32 @chdir (%Str %_dir)
declare %Unit* @fopen (%Str %_fname, %Str %_mode)
declare %Int32 @fprintf (%Unit* %_stream, %Str %_format, ...)
declare %Int32 @fseek (%Unit* %_stream, %Int64 %_offset, %Int32 %_whence)
declare %Int32 @fclose (%Unit* %_fp)
declare %Int32 @open (%Str %_path, %Int32 %_oflags)
declare %Int32 @read (%Int32 %_handle, %Nat8* %_buf, %Nat32 %_len)
declare %Int32 @write (%Int32 %_handle, %Nat8* %_buf, %Nat32 %_len)
declare %Int64 @lseek (%Int32 %_fd, %Int64 %_offset, %Int32 %_whence)
declare %Int32 @close (%Int32 %_fd)
declare void @exit (%Int32 %_rc)
declare %Unit* @opendir (%Str %_name)
declare %Int32 @closedir (%Unit* %_dirp)
declare %Str @getcwd (%Str %_buf, %Nat32 %_size)
declare %Str @getenv (%Str %_name)

define %Str @str_new (%Nat32 %_len) {
  %len = alloca %Nat32
  store %Nat32 %_len, %Nat32* %len

;stmt0:
  %1 = load %Nat32, %Nat32* %len
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 %1)
  %3 = bitcast %Unit* %2 to %Str
  ret %Str %3
}

define %Str @dup (%Str %_s) {
  %s = alloca %Str
  store %Str %_s, %Str* %s

;stmt0:
  %1 = load %Str, %Str* %s
  %2 = call %Nat32 (%Str) @strlen (%Str %1)
  %3 = add %Nat32 %2, 1

;stmt1:
  %4 = call %Str (%Nat32) @str_new (%Nat32 %3)

;stmt2:
  %5 = load %Str, %Str* %s
  %6 = call %Nat8* (%Str, %Str) @strcpy (%Str %4, %Str %5)

;stmt3:
  ret %Str %4
}

define %Str @cat (%Str %_s1, %Str %_s2) {
  %s1 = alloca %Str
  store %Str %_s1, %Str* %s1
  %s2 = alloca %Str
  store %Str %_s2, %Str* %s2

;stmt0:
  %1 = load %Str, %Str* %s1
  %2 = call %Nat32 (%Str) @strlen (%Str %1)

;stmt1:
  %3 = load %Str, %Str* %s2
  %4 = call %Nat32 (%Str) @strlen (%Str %3)

;stmt2:
  %5 = add %Nat32 %2, %4

;stmt3:
  %6 = add %Nat32 %5, 1
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 %6)
  %8 = bitcast %Unit* %7 to %Str

;stmt4:
  %9 = getelementptr inbounds %Nat8, %Str %8, %Int32 0 ; eval_index
  %10 = bitcast %Nat8* %9 to %Str
  %11 = load %Str, %Str* %s1
  %12 = call %Nat8* (%Str, %Str) @strcpy (%Str %10, %Str %11)

;stmt5:
  %13 = getelementptr inbounds %Nat8, %Str %8, %Nat32 %2 ; eval_index
  %14 = bitcast %Nat8* %13 to %Str
  %15 = load %Str, %Str* %s2
  %16 = call %Nat8* (%Str, %Str) @strcpy (%Str %14, %Str %15)

;stmt6:
  %17 = getelementptr inbounds %Nat8, %Str %8, %Nat32 %5 ; eval_index
  store %Nat8 0, %Nat8* %17

;stmt7:
  ret %Str %8
}

define %Str @cat3 (%Str %_s1, %Str %_s2, %Str %_s3) {
  %s1 = alloca %Str
  store %Str %_s1, %Str* %s1
  %s2 = alloca %Str
  store %Str %_s2, %Str* %s2
  %s3 = alloca %Str
  store %Str %_s3, %Str* %s3

;stmt0:
  %1 = load %Str, %Str* %s1
  %2 = call %Nat32 (%Str) @strlen (%Str %1)

;stmt1:
  %3 = load %Str, %Str* %s2
  %4 = call %Nat32 (%Str) @strlen (%Str %3)

;stmt2:
  %5 = load %Str, %Str* %s3
  %6 = call %Nat32 (%Str) @strlen (%Str %5)

;stmt3:
  %7 = add %Nat32 %2, %4

;stmt4:
  %8 = add %Nat32 %7, %6

;stmt5:
  %9 = add %Nat32 %8, 1
  %10 = call %Unit* (%Nat32) @malloc (%Nat32 %9)
  %11 = bitcast %Unit* %10 to %Str

;stmt6:
  %12 = getelementptr inbounds %Nat8, %Str %11, %Int32 0 ; eval_index
  %13 = bitcast %Nat8* %12 to %Str
  %14 = load %Str, %Str* %s1
  %15 = call %Nat8* (%Str, %Str) @strcpy (%Str %13, %Str %14)

;stmt7:
  %16 = getelementptr inbounds %Nat8, %Str %11, %Nat32 %2 ; eval_index
  %17 = bitcast %Nat8* %16 to %Str
  %18 = load %Str, %Str* %s2
  %19 = call %Nat8* (%Str, %Str) @strcpy (%Str %17, %Str %18)

;stmt8:
  %20 = getelementptr inbounds %Nat8, %Str %11, %Nat32 %7 ; eval_index
  %21 = bitcast %Nat8* %20 to %Str
  %22 = load %Str, %Str* %s3
  %23 = call %Nat8* (%Str, %Str) @strcpy (%Str %21, %Str %22)

;stmt9:
  %24 = getelementptr inbounds %Nat8, %Str %11, %Nat32 %8 ; eval_index
  store %Nat8 0, %Nat8* %24

;stmt10:
  ret %Str %11
}

define %Str @cat4 (%Str %_s1, %Str %_s2, %Str %_s3, %Str %_s4) {
  %s1 = alloca %Str
  store %Str %_s1, %Str* %s1
  %s2 = alloca %Str
  store %Str %_s2, %Str* %s2
  %s3 = alloca %Str
  store %Str %_s3, %Str* %s3
  %s4 = alloca %Str
  store %Str %_s4, %Str* %s4

;stmt0:
  %1 = load %Str, %Str* %s1
  %2 = call %Nat32 (%Str) @strlen (%Str %1)

;stmt1:
  %3 = load %Str, %Str* %s2
  %4 = call %Nat32 (%Str) @strlen (%Str %3)

;stmt2:
  %5 = load %Str, %Str* %s3
  %6 = call %Nat32 (%Str) @strlen (%Str %5)

;stmt3:
  %7 = load %Str, %Str* %s4
  %8 = call %Nat32 (%Str) @strlen (%Str %7)

;stmt4:
  %9 = add %Nat32 %2, %4

;stmt5:
  %10 = add %Nat32 %9, %6

;stmt6:
  %11 = add %Nat32 %10, %8

;stmt7:
  %12 = add %Nat32 %11, 1
  %13 = call %Unit* (%Nat32) @malloc (%Nat32 %12)
  %14 = bitcast %Unit* %13 to %Str

;stmt8:
  %15 = getelementptr inbounds %Nat8, %Str %14, %Int32 0 ; eval_index
  %16 = bitcast %Nat8* %15 to %Str
  %17 = load %Str, %Str* %s1
  %18 = call %Nat8* (%Str, %Str) @strcpy (%Str %16, %Str %17)

;stmt9:
  %19 = getelementptr inbounds %Nat8, %Str %14, %Nat32 %2 ; eval_index
  %20 = bitcast %Nat8* %19 to %Str
  %21 = load %Str, %Str* %s2
  %22 = call %Nat8* (%Str, %Str) @strcpy (%Str %20, %Str %21)

;stmt10:
  %23 = getelementptr inbounds %Nat8, %Str %14, %Nat32 %9 ; eval_index
  %24 = bitcast %Nat8* %23 to %Str
  %25 = load %Str, %Str* %s3
  %26 = call %Nat8* (%Str, %Str) @strcpy (%Str %24, %Str %25)

;stmt11:
  %27 = getelementptr inbounds %Nat8, %Str %14, %Nat32 %10 ; eval_index
  %28 = bitcast %Nat8* %27 to %Str
  %29 = load %Str, %Str* %s4
  %30 = call %Nat8* (%Str, %Str) @strcpy (%Str %28, %Str %29)

;stmt12:
  %31 = getelementptr inbounds %Nat8, %Str %14, %Nat32 %11 ; eval_index
  store %Nat8 0, %Nat8* %31

;stmt13:
  ret %Str %14
}

define %Str @cat5 (%Str %_s1, %Str %_s2, %Str %_s3, %Str %_s4, %Str %_s5) {
  %s1 = alloca %Str
  store %Str %_s1, %Str* %s1
  %s2 = alloca %Str
  store %Str %_s2, %Str* %s2
  %s3 = alloca %Str
  store %Str %_s3, %Str* %s3
  %s4 = alloca %Str
  store %Str %_s4, %Str* %s4
  %s5 = alloca %Str
  store %Str %_s5, %Str* %s5

;stmt0:
  %1 = load %Str, %Str* %s1
  %2 = call %Nat32 (%Str) @strlen (%Str %1)

;stmt1:
  %3 = load %Str, %Str* %s2
  %4 = call %Nat32 (%Str) @strlen (%Str %3)

;stmt2:
  %5 = load %Str, %Str* %s3
  %6 = call %Nat32 (%Str) @strlen (%Str %5)

;stmt3:
  %7 = load %Str, %Str* %s4
  %8 = call %Nat32 (%Str) @strlen (%Str %7)

;stmt4:
  %9 = load %Str, %Str* %s5
  %10 = call %Nat32 (%Str) @strlen (%Str %9)

;stmt5:
  %11 = add %Nat32 %2, %4

;stmt6:
  %12 = add %Nat32 %11, %6

;stmt7:
  %13 = add %Nat32 %12, %8

;stmt8:
  %14 = add %Nat32 %13, %10

;stmt9:
  %15 = add %Nat32 %14, 1
  %16 = call %Unit* (%Nat32) @malloc (%Nat32 %15)
  %17 = bitcast %Unit* %16 to %Str

;stmt10:
  %18 = getelementptr inbounds %Nat8, %Str %17, %Int32 0 ; eval_index
  %19 = bitcast %Nat8* %18 to %Str
  %20 = load %Str, %Str* %s1
  %21 = call %Nat8* (%Str, %Str) @strcpy (%Str %19, %Str %20)

;stmt11:
  %22 = getelementptr inbounds %Nat8, %Str %17, %Nat32 %2 ; eval_index
  %23 = bitcast %Nat8* %22 to %Str
  %24 = load %Str, %Str* %s2
  %25 = call %Nat8* (%Str, %Str) @strcpy (%Str %23, %Str %24)

;stmt12:
  %26 = getelementptr inbounds %Nat8, %Str %17, %Nat32 %11 ; eval_index
  %27 = bitcast %Nat8* %26 to %Str
  %28 = load %Str, %Str* %s3
  %29 = call %Nat8* (%Str, %Str) @strcpy (%Str %27, %Str %28)

;stmt13:
  %30 = getelementptr inbounds %Nat8, %Str %17, %Nat32 %12 ; eval_index
  %31 = bitcast %Nat8* %30 to %Str
  %32 = load %Str, %Str* %s4
  %33 = call %Nat8* (%Str, %Str) @strcpy (%Str %31, %Str %32)

;stmt14:
  %34 = getelementptr inbounds %Nat8, %Str %17, %Nat32 %13 ; eval_index
  %35 = bitcast %Nat8* %34 to %Str
  %36 = load %Str, %Str* %s5
  %37 = call %Nat8* (%Str, %Str) @strcpy (%Str %35, %Str %36)

;stmt15:
  %38 = getelementptr inbounds %Nat8, %Str %17, %Nat32 %14 ; eval_index
  store %Nat8 0, %Nat8* %38

;stmt16:
  ret %Str %17
}

define void @assert (%Bool %_cond, %Str %_text) {
  %cond = alloca %Bool
  store %Bool %_cond, %Bool* %cond
  %text = alloca %Str
  store %Str %_text, %Str* %text

;stmt0:
  %1 = load %Bool, %Bool* %cond
  %2 = xor %Bool %1, 1
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %3 = bitcast [19 x %Nat8]* @func7_str1 to %Str
  %4 = load %Str, %Str* %text
  %5 = call %Int32 (%Str, ...) @printf (%Str %3, %Str %4)

;stmt3:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Nat32 @prepart (%Str %_path) {
  %path = alloca %Str
  store %Str %_path, %Str* %path

;stmt0:
  %len = alloca %Nat32

;stmt1:
  %c = alloca %Nat32

;stmt2:
  store %Nat32 0, %Nat32* %len

;stmt3:
  store %Nat32 0, %Nat32* %c

;stmt4:
  br label %continue_0
continue_0:
  %1 = load %Nat32, %Nat32* %c
  %2 = load %Str, %Str* %path
  %3 = getelementptr inbounds %Nat8, %Str %2, %Nat32 %1 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp ne %Nat8 %4, 0
  br i1 %5, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %6 = load %Nat32, %Nat32* %c
  %7 = load %Str, %Str* %path
  %8 = getelementptr inbounds %Nat8, %Str %7, %Nat32 %6 ; eval_index
  %9 = load %Nat8, %Nat8* %8
  %10 = bitcast [2 x %Nat8]* @func8_str1 to %Str
  %11 = getelementptr inbounds %Nat8, %Str %10, %Int32 0 ; eval_index
  %12 = load %Nat8, %Nat8* %11
  %13 = icmp eq %Nat8 %9, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %14 = load %Nat32, %Nat32* %c
  %15 = add %Nat32 %14, 1
  store %Nat32 %15, %Nat32* %len
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  %16 = load %Nat32, %Nat32* %c
  %17 = add %Nat32 %16, 1
  store %Nat32 %17, %Nat32* %c
  br label %continue_0
break_0:

;stmt10:
  %18 = load %Nat32, %Nat32* %len
  ret %Nat32 %18
}

define %Str @getprefix (%Str %_path) {
  %path = alloca %Str
  store %Str %_path, %Str* %path

;stmt0:
  %1 = load %Str, %Str* %path
  %2 = call %Nat32 (%Str) @prepart (%Str %1)

;stmt1:
  %3 = add %Nat32 %2, 1
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 %3)
  %5 = bitcast %Unit* %4 to %Str

;stmt2:
  %6 = bitcast %Str %5 to %Unit*
  %7 = load %Str, %Str* %path
  %8 = bitcast %Str %7 to %Unit*
  %9 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %6, %Unit* %8, %Nat32 %2)

;stmt3:
  %10 = getelementptr inbounds %Nat8, %Str %5, %Nat32 %2 ; eval_index
  store %Nat8 0, %Nat8* %10

;stmt4:
  ret %Str %5
}

define %Str @get_last (%Str %_path) {
  %path = alloca %Str
  store %Str %_path, %Str* %path

;stmt0:
  %1 = load %Str, %Str* %path
  %2 = call %Nat32 (%Str) @prepart (%Str %1)

;stmt1:
  %3 = load %Str, %Str* %path
  %4 = call %Nat32 (%Str) @strlen (%Str %3)
  %5 = sub %Nat32 %4, %2

;stmt2:
  %6 = add %Nat32 %5, 1
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 %6)
  %8 = bitcast %Unit* %7 to %Str

;stmt3:
  %9 = bitcast %Str %8 to %Unit*
  %10 = load %Str, %Str* %path
  %11 = getelementptr inbounds %Nat8, %Str %10, %Nat32 %2 ; eval_index
  %12 = bitcast %Nat8* %11 to %Unit*
  %13 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %9, %Unit* %12, %Nat32 %5)

;stmt4:
  %14 = getelementptr inbounds %Nat8, %Str %8, %Nat32 %5 ; eval_index
  store %Nat8 0, %Nat8* %14

;stmt5:
  ret %Str %8
}

define %Bool @exists (%Str %_fname) {
  %fname = alloca %Str
  store %Str %_fname, %Str* %fname

;stmt0:
  %1 = load %Str, %Str* %fname
  %2 = call %Int32 (%Str, %Int32) @open (%Str %1, %Int32 0)

;stmt1:
  %3 = icmp slt %Int32 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %5 = call %Int32 (%Int32) @close (%Int32 %2)

;stmt5:
  ret %Bool 1
}

define %Bool @isdir (%Str %_name) {
  %name = alloca %Str
  store %Str %_name, %Str* %name

;stmt0:
  %1 = load %Str, %Str* %name
  %2 = call %Unit* (%Str) @opendir (%Str %1)

;stmt1:
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %6 = call %Int32 (%Unit*) @closedir (%Unit* %2)

;stmt5:
  ret %Bool 1
}

define void @node_init (%Node* %_node) {
  %node = alloca %Node*
  store %Node* %_node, %Node** %node

;stmt0:
  %1 = load %Node*, %Node** %node
  %2 = bitcast %Node* %1 to %Unit*
  %3 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %2, %Nat8 0, %Nat32 32)
  ret void
}

define %Node* @node_new () {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %2 = bitcast %Unit* %1 to %Node*

;stmt1:
  call void (%Node*) @node_init (%Node* %2)

;stmt2:
  ret %Node* %2
}

define void @node_append (%Node* %_n, %Node* %_an) {
  %n = alloca %Node*
  store %Node* %_n, %Node** %n
  %an = alloca %Node*
  store %Node* %_an, %Node** %an

;stmt0:
  %1 = load %Node*, %Node** %n
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 1 ; eval_access
  %3 = load %Node*, %Node** %2

;stmt1:
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = load %Node*, %Node** %an
  %8 = getelementptr inbounds %Node, %Node* %7, i32 0, i32 1 ; eval_access
  store %Node* %3, %Node** %8

;stmt4:
  %9 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 0 ; eval_access
  %10 = load %Node*, %Node** %an
  store %Node* %10, %Node** %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %11 = load %Node*, %Node** %n
  %12 = getelementptr inbounds %Node, %Node* %11, i32 0, i32 1 ; eval_access
  %13 = load %Node*, %Node** %an
  store %Node* %13, %Node** %12

;stmt6:
  %14 = load %Node*, %Node** %an
  %15 = getelementptr inbounds %Node, %Node* %14, i32 0, i32 0 ; eval_access
  %16 = load %Node*, %Node** %n
  store %Node* %16, %Node** %15
  ret void
}

define void @node_exclude (%Node* %_node) {
  %node = alloca %Node*
  store %Node* %_node, %Node** %node

;stmt0:
  %1 = load %Node*, %Node** %node
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 0 ; eval_access
  %3 = load %Node*, %Node** %2

;stmt1:
  %4 = load %Node*, %Node** %node
  %5 = getelementptr inbounds %Node, %Node* %4, i32 0, i32 1 ; eval_access
  %6 = load %Node*, %Node** %5

;stmt2:
  %7 = bitcast %Node* %3 to %Unit*
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %10 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 1 ; eval_access
  store %Node* %6, %Node** %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %11 = bitcast %Node* %6 to %Unit*
  %12 = inttoptr %Nat32 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %14 = getelementptr inbounds %Node, %Node* %6, i32 0, i32 0 ; eval_access
  store %Node* %3, %Node** %14
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @node_foreach (%Node* %_node_chain, %NodeForeachHandler %_f, %Unit* %_ctx) {
  %node_chain = alloca %Node*
  store %Node* %_node_chain, %Node** %node_chain
  %f = alloca %NodeForeachHandler
  store %NodeForeachHandler %_f, %NodeForeachHandler* %f
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %Node*, %Node** %node_chain
  %2 = bitcast %Node* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %n = alloca %Node*

;stmt4:
  %6 = load %Node*, %Node** %node_chain
  store %Node* %6, %Node** %n

;stmt5:
  %index = alloca %Nat32

;stmt6:
  store %Nat32 0, %Nat32* %index

;stmt7:
  br label %continue_0
continue_0:
  %7 = load %Node*, %Node** %n
  %8 = bitcast %Node* %7 to %Unit*
  %9 = inttoptr %Nat32 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  br i1 %10, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %11 = load %NodeForeachHandler, %NodeForeachHandler* %f
  %12 = load %Node*, %Node** %n
  %13 = load %Unit*, %Unit** %ctx
  %14 = load %Nat32, %Nat32* %index
  call void (%Node*, %Unit*, %Nat32) %11 (%Node* %12, %Unit* %13, %Nat32 %14)

;stmt10:
  %15 = load %Node*, %Node** %n
  %16 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 1 ; eval_access
  %17 = load %Node*, %Node** %16
  store %Node* %17, %Node** %n

;stmt11:
  %18 = load %Nat32, %Nat32* %index
  %19 = add %Nat32 %18, 1
  store %Nat32 %19, %Nat32* %index
  br label %continue_0
break_0:
  ret void
}

define %Node* @node_search (%Node* %_node_chain, %NodeSearchHandler %_f, %Unit* %_ctx) {
  %node_chain = alloca %Node*
  store %Node* %_node_chain, %Node** %node_chain
  %f = alloca %NodeSearchHandler
  store %NodeSearchHandler %_f, %NodeSearchHandler* %f
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %Node*, %Node** %node_chain
  %2 = bitcast %Node* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = bitcast %Unit* %5 to %Node*
  ret %Node* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %n = alloca %Node*

;stmt4:
  %8 = load %Node*, %Node** %node_chain
  store %Node* %8, %Node** %n

;stmt5:
  %index = alloca %Nat32

;stmt6:
  store %Nat32 0, %Nat32* %index

;stmt7:
  br label %continue_0
continue_0:
  %9 = load %Node*, %Node** %n
  %10 = bitcast %Node* %9 to %Unit*
  %11 = inttoptr %Nat32 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  br i1 %12, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %13 = load %NodeSearchHandler, %NodeSearchHandler* %f
  %14 = load %Node*, %Node** %n
  %15 = load %Unit*, %Unit** %ctx
  %16 = load %Nat32, %Nat32* %index
  %17 = call %Bool (%Node*, %Unit*, %Nat32) %13 (%Node* %14, %Unit* %15, %Nat32 %16)
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %18 = load %Node*, %Node** %n
  ret %Node* %18
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %20 = load %Node*, %Node** %n
  %21 = getelementptr inbounds %Node, %Node* %20, i32 0, i32 1 ; eval_access
  %22 = load %Node*, %Node** %21
  store %Node* %22, %Node** %n

;stmt13:
  %23 = load %Nat32, %Nat32* %index
  %24 = add %Nat32 %23, 1
  store %Nat32 %24, %Nat32* %index
  br label %continue_0
break_0:

;stmt14:
  %25 = inttoptr %Nat32 0 to %Unit*
  %26 = bitcast %Unit* %25 to %Node*
  ret %Node* %26
}

define %Bool @func20 (%Node* %_n, %Unit* %_ctx, %Nat32 %_index) {
  %n = alloca %Node*
  store %Node* %_n, %Node** %n
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Node*, %Node** %n
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 3 ; eval_access
  %3 = load %Unit*, %Unit** %2
  %4 = load %Unit*, %Unit** %ctx
  %5 = icmp eq %Unit* %3, %4
  ret %Bool %5
}

define %Node* @node_search_by_data (%Node* %_node_chain, %Unit* %_data) {
  %node_chain = alloca %Node*
  store %Node* %_node_chain, %Node** %node_chain
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data

;stmt0:
  %1 = load %Node*, %Node** %node_chain
  %2 = load %Unit*, %Unit** %data
  %3 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %1, %NodeSearchHandler @func20, %Unit* %2)
  ret %Node* %3
}

define void @map_init (%List* %_list) {
  %list = alloca %List*
  store %List* %_list, %List** %list

;stmt0:
  %1 = load %List*, %List** %list
  %2 = bitcast %List* %1 to %Unit*
  %3 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %2, %Nat8 0, %Nat32 24)
  ret void
}

define %List* @map_new () {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %List*

;stmt1:
  call void (%List*) @map_init (%List* %2)

;stmt2:
  ret %List* %2
}

define %Bool @list_append (%List* %_list, %Unit* %_obj) {
  %list = alloca %List*
  store %List* %_list, %List** %list
  %obj = alloca %Unit*
  store %Unit* %_obj, %Unit** %obj

;stmt0:
  %1 = load %List*, %List** %list
  %2 = bitcast %List* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Unit*, %Unit** %obj
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = icmp eq %Unit* %5, %6
  %8 = or %Bool %4, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %10 = call %Node* () @node_new ()

;stmt4:
  %11 = getelementptr inbounds %Node, %Node* %10, i32 0, i32 3 ; eval_access
  %12 = load %Unit*, %Unit** %obj
  store %Unit* %12, %Unit** %11

;stmt5:
  %13 = load %List*, %List** %list
  %14 = getelementptr inbounds %List, %List* %13, i32 0, i32 0 ; eval_access
  %15 = load %Node*, %Node** %14
  %16 = bitcast %Node* %15 to %Unit*
  %17 = inttoptr %Nat32 0 to %Unit*
  %18 = icmp eq %Unit* %16, %17
  br i1 %18, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %19 = load %List*, %List** %list
  %20 = getelementptr inbounds %List, %List* %19, i32 0, i32 0 ; eval_access
  store %Node* %10, %Node** %20
  br label %endif_1
else_1:

;stmt8:

;stmt9:
  %21 = load %List*, %List** %list
  %22 = getelementptr inbounds %List, %List* %21, i32 0, i32 1 ; eval_access
  %23 = load %Node*, %Node** %22
  call void (%Node*, %Node*) @node_append (%Node* %23, %Node* %10)
  br label %endif_1
endif_1:

;stmt10:
  %24 = load %List*, %List** %list
  %25 = getelementptr inbounds %List, %List* %24, i32 0, i32 1 ; eval_access
  store %Node* %10, %Node** %25

;stmt11:
  %26 = load %List*, %List** %list
  %27 = getelementptr inbounds %List, %List* %26, i32 0, i32 2 ; eval_access
  %28 = load %List*, %List** %list
  %29 = getelementptr inbounds %List, %List* %28, i32 0, i32 2 ; eval_access
  %30 = load %Nat64, %Nat64* %29
  %31 = add %Nat64 %30, 1
  store %Nat64 %31, %Nat64* %27

;stmt12:
  ret %Bool 1
}

define %Bool @list_extend (%List* %_list1, %List* %_list2) {
  %list1 = alloca %List*
  store %List* %_list1, %List** %list1
  %list2 = alloca %List*
  store %List* %_list2, %List** %list2

;stmt0:
  %1 = load %List*, %List** %list1
  %2 = bitcast %List* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %List*, %List** %list2
  %6 = bitcast %List* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %4, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %11 = load %List*, %List** %list1
  %12 = getelementptr inbounds %List, %List* %11, i32 0, i32 1 ; eval_access
  %13 = load %Node*, %Node** %12

;stmt4:
  %14 = load %List*, %List** %list1
  %15 = getelementptr inbounds %List, %List* %14, i32 0, i32 2 ; eval_access
  %16 = load %List*, %List** %list1
  %17 = getelementptr inbounds %List, %List* %16, i32 0, i32 2 ; eval_access
  %18 = load %Nat64, %Nat64* %17
  %19 = load %List*, %List** %list2
  %20 = getelementptr inbounds %List, %List* %19, i32 0, i32 2 ; eval_access
  %21 = load %Nat64, %Nat64* %20
  %22 = add %Nat64 %18, %21
  store %Nat64 %22, %Nat64* %15

;stmt5:
  %23 = bitcast %Node* %13 to %Unit*
  %24 = inttoptr %Nat32 0 to %Unit*
  %25 = icmp eq %Unit* %23, %24
  br i1 %25, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %26 = load %List*, %List** %list1
  %27 = getelementptr inbounds %List, %List* %26, i32 0, i32 0 ; eval_access
  %28 = load %List*, %List** %list2
  %29 = getelementptr inbounds %List, %List* %28, i32 0, i32 0 ; eval_access
  %30 = load %Node*, %Node** %29
  store %Node* %30, %Node** %27

;stmt8:
  %31 = load %List*, %List** %list1
  %32 = getelementptr inbounds %List, %List* %31, i32 0, i32 1 ; eval_access
  %33 = load %List*, %List** %list2
  %34 = getelementptr inbounds %List, %List* %33, i32 0, i32 1 ; eval_access
  %35 = load %Node*, %Node** %34
  store %Node* %35, %Node** %32

;stmt9:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %37 = getelementptr inbounds %Node, %Node* %13, i32 0, i32 1 ; eval_access
  %38 = load %List*, %List** %list2
  %39 = getelementptr inbounds %List, %List* %38, i32 0, i32 0 ; eval_access
  %40 = load %Node*, %Node** %39
  store %Node* %40, %Node** %37

;stmt11:
  %41 = load %List*, %List** %list2
  %42 = getelementptr inbounds %List, %List* %41, i32 0, i32 0 ; eval_access
  %43 = load %Node*, %Node** %42
  %44 = bitcast %Node* %43 to %Unit*
  %45 = inttoptr %Nat32 0 to %Unit*
  %46 = icmp ne %Unit* %44, %45
  %47 = load %List*, %List** %list2
  %48 = getelementptr inbounds %List, %List* %47, i32 0, i32 1 ; eval_access
  %49 = load %Node*, %Node** %48
  %50 = bitcast %Node* %49 to %Unit*
  %51 = inttoptr %Nat32 0 to %Unit*
  %52 = icmp ne %Unit* %50, %51
  %53 = and %Bool %46, %52
  br i1 %53, label %then_2, label %else_2
then_2:

;stmt12:

;stmt13:
  %54 = load %List*, %List** %list2
  %55 = getelementptr inbounds %List, %List* %54, i32 0, i32 0 ; eval_access
  %56 = load %Node*, %Node** %55
  %57 = getelementptr inbounds %Node, %Node* %56, i32 0, i32 0 ; eval_access
  store %Node* %13, %Node** %57

;stmt14:
  %58 = load %List*, %List** %list1
  %59 = getelementptr inbounds %List, %List* %58, i32 0, i32 1 ; eval_access
  %60 = load %List*, %List** %list2
  %61 = getelementptr inbounds %List, %List* %60, i32 0, i32 1 ; eval_access
  %62 = load %Node*, %Node** %61
  store %Node* %62, %Node** %59
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt15:
  ret %Bool 1
}

define %Bool @list_subst (%List* %_list, %Unit* %_o1, %Unit* %_o2) {
  %list = alloca %List*
  store %List* %_list, %List** %list
  %o1 = alloca %Unit*
  store %Unit* %_o1, %Unit** %o1
  %o2 = alloca %Unit*
  store %Unit* %_o2, %Unit** %o2

;stmt0:
  %1 = load %List*, %List** %list
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0 ; eval_access
  %3 = load %Node*, %Node** %2
  %4 = load %Unit*, %Unit** %o1
  %5 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %3, %Unit* %4)

;stmt1:
  %6 = bitcast %Node* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %10 = getelementptr inbounds %Node, %Node* %5, i32 0, i32 3 ; eval_access
  %11 = load %Unit*, %Unit** %o2
  store %Unit* %11, %Unit** %10

;stmt5:
  ret %Bool 1
}

define void @list_node_remove (%List* %_list, %Node* %_n) {
  %list = alloca %List*
  store %List* %_list, %List** %list
  %n = alloca %Node*
  store %Node* %_n, %Node** %n

;stmt0:
  %1 = load %Node*, %Node** %n
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 0 ; eval_access
  %3 = load %Node*, %Node** %2

;stmt1:
  %4 = load %Node*, %Node** %n
  %5 = getelementptr inbounds %Node, %Node* %4, i32 0, i32 1 ; eval_access
  %6 = load %Node*, %Node** %5

;stmt2:
  %7 = load %Node*, %Node** %n
  call void (%Node*) @node_exclude (%Node* %7)

;stmt3:
  %8 = load %List*, %List** %list
  %9 = getelementptr inbounds %List, %List* %8, i32 0, i32 0 ; eval_access
  %10 = load %Node*, %Node** %9
  %11 = load %Node*, %Node** %n
  %12 = icmp eq %Node* %10, %11
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %13 = load %List*, %List** %list
  %14 = getelementptr inbounds %List, %List* %13, i32 0, i32 0 ; eval_access
  store %Node* %6, %Node** %14
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %15 = load %List*, %List** %list
  %16 = getelementptr inbounds %List, %List* %15, i32 0, i32 1 ; eval_access
  %17 = load %Node*, %Node** %16
  %18 = load %Node*, %Node** %n
  %19 = icmp eq %Node* %17, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %20 = load %List*, %List** %list
  %21 = getelementptr inbounds %List, %List* %20, i32 0, i32 1 ; eval_access
  store %Node* %3, %Node** %21
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %22 = load %Node*, %Node** %n
  %23 = bitcast %Node* %22 to %Unit*
  call void (%Unit*) @free (%Unit* %23)

;stmt10:
  %24 = load %List*, %List** %list
  %25 = getelementptr inbounds %List, %List* %24, i32 0, i32 2 ; eval_access
  %26 = load %List*, %List** %list
  %27 = getelementptr inbounds %List, %List* %26, i32 0, i32 2 ; eval_access
  %28 = load %Nat64, %Nat64* %27
  %29 = sub %Nat64 %28, 1
  store %Nat64 %29, %Nat64* %25
  ret void
}

define %Bool @list_remove (%List* %_list, %Unit* %_o) {
  %list = alloca %List*
  store %List* %_list, %List** %list
  %o = alloca %Unit*
  store %Unit* %_o, %Unit** %o

;stmt0:
  %1 = load %List*, %List** %list
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0 ; eval_access
  %3 = load %Node*, %Node** %2
  %4 = load %Unit*, %Unit** %o
  %5 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %3, %Unit* %4)

;stmt1:
  %6 = bitcast %Node* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %10 = load %List*, %List** %list
  call void (%List*, %Node*) @list_node_remove (%List* %10, %Node* %5)

;stmt5:
  ret %Bool 1
}

define void @list_foreach (%List* %_list, %ListForeachHandler %_f, %Unit* %_ctx) {
  %list = alloca %List*
  store %List* %_list, %List** %list
  %f = alloca %ListForeachHandler
  store %ListForeachHandler %_f, %ListForeachHandler* %f
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %index = alloca %Nat32

;stmt1:
  store %Nat32 0, %Nat32* %index

;stmt2:
  %n = alloca %Node*

;stmt3:
  %1 = load %List*, %List** %list
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0 ; eval_access
  %3 = load %Node*, %Node** %2
  store %Node* %3, %Node** %n

;stmt4:
  br label %continue_0
continue_0:
  %4 = load %Node*, %Node** %n
  %5 = bitcast %Node* %4 to %Unit*
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %8 = load %ListForeachHandler, %ListForeachHandler* %f
  %9 = load %Node*, %Node** %n
  %10 = getelementptr inbounds %Node, %Node* %9, i32 0, i32 3 ; eval_access
  %11 = load %Unit*, %Unit** %10
  %12 = load %Unit*, %Unit** %ctx
  %13 = load %Nat32, %Nat32* %index
  call void (%Unit*, %Unit*, %Nat32) %8 (%Unit* %11, %Unit* %12, %Nat32 %13)

;stmt7:
  %14 = load %Node*, %Node** %n
  %15 = getelementptr inbounds %Node, %Node* %14, i32 0, i32 1 ; eval_access
  %16 = load %Node*, %Node** %15
  store %Node* %16, %Node** %n

;stmt8:
  %17 = load %Nat32, %Nat32* %index
  %18 = add %Nat32 %17, 1
  store %Nat32 %18, %Nat32* %index
  br label %continue_0
break_0:
  ret void
}

define void @list_foreach2 (%List* %_list1, %List* %_list2, %ListForeachHandler2 %_f, %Unit* %_ctx) {
  %list1 = alloca %List*
  store %List* %_list1, %List** %list1
  %list2 = alloca %List*
  store %List* %_list2, %List** %list2
  %f = alloca %ListForeachHandler2
  store %ListForeachHandler2 %_f, %ListForeachHandler2* %f
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %n1 = alloca %Node*

;stmt1:
  %n2 = alloca %Node*

;stmt2:
  %1 = load %List*, %List** %list1
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0 ; eval_access
  %3 = load %Node*, %Node** %2
  store %Node* %3, %Node** %n1

;stmt3:
  %4 = load %List*, %List** %list2
  %5 = getelementptr inbounds %List, %List* %4, i32 0, i32 0 ; eval_access
  %6 = load %Node*, %Node** %5
  store %Node* %6, %Node** %n2

;stmt4:
  %index = alloca %Nat32

;stmt5:
  store %Nat32 0, %Nat32* %index

;stmt6:
  br label %continue_0
continue_0:
  %7 = load %Node*, %Node** %n1
  %8 = bitcast %Node* %7 to %Unit*
  %9 = inttoptr %Nat32 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  %11 = load %Node*, %Node** %n2
  %12 = bitcast %Node* %11 to %Unit*
  %13 = inttoptr %Nat32 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  %15 = and %Bool %10, %14
  br i1 %15, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %16 = load %ListForeachHandler2, %ListForeachHandler2* %f
  %17 = load %Node*, %Node** %n1
  %18 = getelementptr inbounds %Node, %Node* %17, i32 0, i32 3 ; eval_access
  %19 = load %Unit*, %Unit** %18
  %20 = load %Node*, %Node** %n2
  %21 = getelementptr inbounds %Node, %Node* %20, i32 0, i32 3 ; eval_access
  %22 = load %Unit*, %Unit** %21
  %23 = load %Unit*, %Unit** %ctx
  %24 = load %Nat32, %Nat32* %index
  call void (%Unit*, %Unit*, %Unit*, %Nat32) %16 (%Unit* %19, %Unit* %22, %Unit* %23, %Nat32 %24)

;stmt9:
  %25 = load %Node*, %Node** %n1
  %26 = getelementptr inbounds %Node, %Node* %25, i32 0, i32 1 ; eval_access
  %27 = load %Node*, %Node** %26
  store %Node* %27, %Node** %n1

;stmt10:
  %28 = load %Node*, %Node** %n2
  %29 = getelementptr inbounds %Node, %Node* %28, i32 0, i32 1 ; eval_access
  %30 = load %Node*, %Node** %29
  store %Node* %30, %Node** %n2

;stmt11:
  %31 = load %Nat32, %Nat32* %index
  %32 = add %Nat32 %31, 1
  store %Nat32 %32, %Nat32* %index
  br label %continue_0
break_0:
  ret void
}

define %Bool @list_compare (%List* %_list1, %List* %_list2, %ListCompareHandler %_f, %Unit* %_ctx) {
  %list1 = alloca %List*
  store %List* %_list1, %List** %list1
  %list2 = alloca %List*
  store %List* %_list2, %List** %list2
  %f = alloca %ListCompareHandler
  store %ListCompareHandler %_f, %ListCompareHandler* %f
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %List*, %List** %list1
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 2 ; eval_access
  %3 = load %Nat64, %Nat64* %2
  %4 = load %List*, %List** %list2
  %5 = getelementptr inbounds %List, %List* %4, i32 0, i32 2 ; eval_access
  %6 = load %Nat64, %Nat64* %5
  %7 = icmp ne %Nat64 %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %n1 = alloca %Node*

;stmt4:
  %n2 = alloca %Node*

;stmt5:
  %9 = load %List*, %List** %list1
  %10 = getelementptr inbounds %List, %List* %9, i32 0, i32 0 ; eval_access
  %11 = load %Node*, %Node** %10
  store %Node* %11, %Node** %n1

;stmt6:
  %12 = load %List*, %List** %list2
  %13 = getelementptr inbounds %List, %List* %12, i32 0, i32 0 ; eval_access
  %14 = load %Node*, %Node** %13
  store %Node* %14, %Node** %n2

;stmt7:
  %index = alloca %Nat32

;stmt8:
  store %Nat32 0, %Nat32* %index

;stmt9:
  br label %continue_0
continue_0:
  %15 = load %Node*, %Node** %n1
  %16 = bitcast %Node* %15 to %Unit*
  %17 = inttoptr %Nat32 0 to %Unit*
  %18 = icmp ne %Unit* %16, %17
  %19 = load %Node*, %Node** %n2
  %20 = bitcast %Node* %19 to %Unit*
  %21 = inttoptr %Nat32 0 to %Unit*
  %22 = icmp ne %Unit* %20, %21
  %23 = and %Bool %18, %22
  br i1 %23, label %body_0, label %break_0
body_0:

;stmt10:

;stmt11:
  %24 = load %ListCompareHandler, %ListCompareHandler* %f
  %25 = load %Node*, %Node** %n1
  %26 = getelementptr inbounds %Node, %Node* %25, i32 0, i32 3 ; eval_access
  %27 = load %Unit*, %Unit** %26
  %28 = load %Node*, %Node** %n2
  %29 = getelementptr inbounds %Node, %Node* %28, i32 0, i32 3 ; eval_access
  %30 = load %Unit*, %Unit** %29
  %31 = load %Unit*, %Unit** %ctx
  %32 = load %Nat32, %Nat32* %index
  %33 = call %Bool (%Unit*, %Unit*, %Unit*, %Nat32) %24 (%Unit* %27, %Unit* %30, %Unit* %31, %Nat32 %32)
  %34 = xor %Bool %33, 1
  br i1 %34, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  ret %Bool 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt14:
  %36 = load %Node*, %Node** %n1
  %37 = getelementptr inbounds %Node, %Node* %36, i32 0, i32 1 ; eval_access
  %38 = load %Node*, %Node** %37
  store %Node* %38, %Node** %n1

;stmt15:
  %39 = load %Node*, %Node** %n2
  %40 = getelementptr inbounds %Node, %Node* %39, i32 0, i32 1 ; eval_access
  %41 = load %Node*, %Node** %40
  store %Node* %41, %Node** %n2

;stmt16:
  %42 = load %Nat32, %Nat32* %index
  %43 = add %Nat32 %42, 1
  store %Nat32 %43, %Nat32* %index
  br label %continue_0
break_0:

;stmt17:
  ret %Bool 1
}

define %Unit* @list_search (%List* %_list, %ListSearchHandler %_f, %Unit* %_ctx) {
  %list = alloca %List*
  store %List* %_list, %List** %list
  %f = alloca %ListSearchHandler
  store %ListSearchHandler %_f, %ListSearchHandler* %f
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %List*, %List** %list
  %2 = bitcast %List* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = inttoptr %Nat32 0 to %Unit*
  ret %Unit* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %n = alloca %Node*

;stmt4:
  %7 = load %List*, %List** %list
  %8 = getelementptr inbounds %List, %List* %7, i32 0, i32 0 ; eval_access
  %9 = load %Node*, %Node** %8
  store %Node* %9, %Node** %n

;stmt5:
  %index = alloca %Nat32

;stmt6:
  store %Nat32 0, %Nat32* %index

;stmt7:
  br label %continue_0
continue_0:
  %10 = load %Node*, %Node** %n
  %11 = bitcast %Node* %10 to %Unit*
  %12 = inttoptr %Nat32 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %14 = load %ListSearchHandler, %ListSearchHandler* %f
  %15 = load %Node*, %Node** %n
  %16 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 3 ; eval_access
  %17 = load %Unit*, %Unit** %16
  %18 = load %Unit*, %Unit** %ctx
  %19 = load %Nat32, %Nat32* %index
  %20 = call %Unit* (%Unit*, %Unit*, %Nat32) %14 (%Unit* %17, %Unit* %18, %Nat32 %19)

;stmt10:
  %21 = inttoptr %Nat32 0 to %Unit*
  %22 = icmp ne %Unit* %20, %21
  br i1 %22, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  ret %Unit* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt13:
  %24 = load %Node*, %Node** %n
  %25 = getelementptr inbounds %Node, %Node* %24, i32 0, i32 1 ; eval_access
  %26 = load %Node*, %Node** %25
  store %Node* %26, %Node** %n

;stmt14:
  %27 = load %Nat32, %Nat32* %index
  %28 = add %Nat32 %27, 1
  store %Nat32 %28, %Nat32* %index
  br label %continue_0
break_0:

;stmt15:
  %29 = inttoptr %Nat32 0 to %Unit*
  ret %Unit* %29
}

define %List* @list_map (%List* %_list, %ListMapHandler %_f, %Unit* %_ctx) {
  %list = alloca %List*
  store %List* %_list, %List** %list
  %f = alloca %ListMapHandler
  store %ListMapHandler %_f, %ListMapHandler* %f
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %List*, %List** %list
  %2 = bitcast %List* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = bitcast %Unit* %5 to %List*
  ret %List* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %index = alloca %Nat32

;stmt4:
  store %Nat32 0, %Nat32* %index

;stmt5:
  %n = alloca %Node*

;stmt6:
  %8 = load %List*, %List** %list
  %9 = getelementptr inbounds %List, %List* %8, i32 0, i32 0 ; eval_access
  %10 = load %Node*, %Node** %9
  store %Node* %10, %Node** %n

;stmt7:
  %11 = call %List* () @map_new ()

;stmt8:
  br label %continue_0
continue_0:
  %12 = load %Node*, %Node** %n
  %13 = bitcast %Node* %12 to %Unit*
  %14 = inttoptr %Nat32 0 to %Unit*
  %15 = icmp ne %Unit* %13, %14
  br i1 %15, label %body_0, label %break_0
body_0:

;stmt9:

;stmt10:
  %16 = load %ListMapHandler, %ListMapHandler* %f
  %17 = load %Node*, %Node** %n
  %18 = getelementptr inbounds %Node, %Node* %17, i32 0, i32 3 ; eval_access
  %19 = load %Unit*, %Unit** %18
  %20 = load %Unit*, %Unit** %ctx
  %21 = load %Nat32, %Nat32* %index
  %22 = call %Unit* (%Unit*, %Unit*, %Nat32) %16 (%Unit* %19, %Unit* %20, %Nat32 %21)

;stmt11:
  %23 = inttoptr %Nat32 0 to %Unit*
  %24 = icmp ne %Unit* %22, %23
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %25 = call %Bool (%List*, %Unit*) @list_append (%List* %11, %Unit* %22)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt14:
  %26 = load %Nat32, %Nat32* %index
  %27 = add %Nat32 %26, 1
  store %Nat32 %27, %Nat32* %index

;stmt15:
  %28 = load %Node*, %Node** %n
  %29 = getelementptr inbounds %Node, %Node* %28, i32 0, i32 1 ; eval_access
  %30 = load %Node*, %Node** %29
  store %Node* %30, %Node** %n
  br label %continue_0
break_0:

;stmt16:
  ret %List* %11
}

define %Bool @map_append (%List* %_m, %Str %_k, %Unit* %_v) {
  %m = alloca %List*
  store %List* %_m, %List** %m
  %k = alloca %Str
  store %Str %_k, %Str* %k
  %v = alloca %Unit*
  store %Unit* %_v, %Unit** %v

;stmt0:
  %1 = load %List*, %List** %m
  %2 = bitcast %List* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Str, %Str* %k
  %6 = bitcast %Str %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = load %Unit*, %Unit** %v
  %10 = inttoptr %Nat32 0 to %Unit*
  %11 = icmp eq %Unit* %9, %10
  %12 = or %Bool %8, %11
  %13 = or %Bool %4, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %15 = call %Node* () @node_new ()

;stmt4:
  %16 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 2 ; eval_access
  %17 = load %Str, %Str* %k
  %18 = bitcast %Str %17 to %Unit*
  store %Unit* %18, %Unit** %16

;stmt5:
  %19 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 3 ; eval_access
  %20 = load %Unit*, %Unit** %v
  store %Unit* %20, %Unit** %19

;stmt6:
  %21 = load %List*, %List** %m
  %22 = getelementptr inbounds %List, %List* %21, i32 0, i32 0 ; eval_access
  %23 = load %Node*, %Node** %22
  %24 = bitcast %Node* %23 to %Unit*
  %25 = inttoptr %Nat32 0 to %Unit*
  %26 = icmp eq %Unit* %24, %25
  br i1 %26, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %27 = load %List*, %List** %m
  %28 = getelementptr inbounds %List, %List* %27, i32 0, i32 0 ; eval_access
  store %Node* %15, %Node** %28
  br label %endif_1
else_1:

;stmt9:

;stmt10:
  %29 = load %List*, %List** %m
  %30 = getelementptr inbounds %List, %List* %29, i32 0, i32 1 ; eval_access
  %31 = load %Node*, %Node** %30
  call void (%Node*, %Node*) @node_append (%Node* %31, %Node* %15)
  br label %endif_1
endif_1:

;stmt11:
  %32 = load %List*, %List** %m
  %33 = getelementptr inbounds %List, %List* %32, i32 0, i32 1 ; eval_access
  store %Node* %15, %Node** %33

;stmt12:
  %34 = load %List*, %List** %m
  %35 = getelementptr inbounds %List, %List* %34, i32 0, i32 2 ; eval_access
  %36 = load %List*, %List** %m
  %37 = getelementptr inbounds %List, %List* %36, i32 0, i32 2 ; eval_access
  %38 = load %Nat64, %Nat64* %37
  %39 = add %Nat64 %38, 1
  store %Nat64 %39, %Nat64* %35

;stmt13:
  ret %Bool 1
}

define %Bool @f (%Node* %_n, %Unit* %_ctx, %Nat32 %_index) {
  %n = alloca %Node*
  store %Node* %_n, %Node** %n
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Node*, %Node** %n
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 2 ; eval_access
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Str
  %5 = load %Unit*, %Unit** %ctx
  %6 = bitcast %Unit* %5 to %Str
  %7 = call %Int32 (%Str, %Str) @strcmp (%Str %4, %Str %6)
  %8 = icmp eq %Int32 %7, 0
  ret %Bool %8
}

define %Node* @map_list_node_get (%List* %_m, %Str %_k) {
  %m = alloca %List*
  store %List* %_m, %List** %m
  %k = alloca %Str
  store %Str %_k, %Str* %k

;stmt0:
  %1 = load %List*, %List** %m
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0 ; eval_access
  %3 = load %Node*, %Node** %2
  %4 = load %Str, %Str* %k
  %5 = bitcast %Str %4 to %Unit*
  %6 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %3, %NodeSearchHandler @f, %Unit* %5)
  ret %Node* %6
}

define void @map_reset (%List* %_m, %Str %_k, %Unit* %_v) {
  %m = alloca %List*
  store %List* %_m, %List** %m
  %k = alloca %Str
  store %Str %_k, %Str* %k
  %v = alloca %Unit*
  store %Unit* %_v, %Unit** %v

;stmt0:
  %1 = load %List*, %List** %m
  %2 = load %Str, %Str* %k
  %3 = call %Node* (%List*, %Str) @map_list_node_get (%List* %1, %Str %2)

;stmt1:
  %4 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 3 ; eval_access
  %5 = load %Unit*, %Unit** %v
  store %Unit* %5, %Unit** %4
  ret void
}

define %Unit* @map_remove (%List* %_m, %Str %_k) {
  %m = alloca %List*
  store %List* %_m, %List** %m
  %k = alloca %Str
  store %Str %_k, %Str* %k

;stmt0:
  %1 = load %List*, %List** %m
  %2 = load %Str, %Str* %k
  %3 = call %Node* (%List*, %Str) @map_list_node_get (%List* %1, %Str %2)

;stmt1:
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = inttoptr %Nat32 0 to %Unit*
  ret %Unit* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %9 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 3 ; eval_access
  %10 = load %Unit*, %Unit** %9

;stmt5:
  %11 = load %List*, %List** %m
  call void (%List*, %Node*) @list_node_remove (%List* %11, %Node* %3)

;stmt6:
  ret %Unit* %10
}

define %Unit* @map_get (%List* %_m, %Str %_k) {
  %m = alloca %List*
  store %List* %_m, %List** %m
  %k = alloca %Str
  store %Str %_k, %Str* %k

;stmt0:
  %1 = load %List*, %List** %m
  %2 = load %Str, %Str* %k
  %3 = call %Node* (%List*, %Str) @map_list_node_get (%List* %1, %Str %2)

;stmt1:
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 3 ; eval_access
  %8 = load %Unit*, %Unit** %7
  ret %Unit* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %10 = inttoptr %Nat32 0 to %Unit*
  ret %Unit* %10
}

define void @map_foreach (%List* %_m, %MapForeachHandler %_f, %Unit* %_ctx) {
  %m = alloca %List*
  store %List* %_m, %List** %m
  %f = alloca %MapForeachHandler
  store %MapForeachHandler %_f, %MapForeachHandler* %f
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %n = alloca %Node*

;stmt1:
  %1 = load %List*, %List** %m
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0 ; eval_access
  %3 = load %Node*, %Node** %2
  store %Node* %3, %Node** %n

;stmt2:
  br label %continue_0
continue_0:
  %4 = load %Node*, %Node** %n
  %5 = bitcast %Node* %4 to %Unit*
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %8 = load %MapForeachHandler, %MapForeachHandler* %f
  %9 = load %Node*, %Node** %n
  %10 = getelementptr inbounds %Node, %Node* %9, i32 0, i32 2 ; eval_access
  %11 = load %Unit*, %Unit** %10
  %12 = load %Node*, %Node** %n
  %13 = getelementptr inbounds %Node, %Node* %12, i32 0, i32 3 ; eval_access
  %14 = load %Unit*, %Unit** %13
  %15 = load %Unit*, %Unit** %ctx
  call void (%Unit*, %Unit*, %Unit*) %8 (%Unit* %11, %Unit* %14, %Unit* %15)

;stmt5:
  %16 = load %Node*, %Node** %n
  %17 = getelementptr inbounds %Node, %Node* %16, i32 0, i32 1 ; eval_access
  %18 = load %Node*, %Node** %17
  store %Node* %18, %Node** %n
  br label %continue_0
break_0:
  ret void
}

define void @linecnt () {

;stmt0:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5 ; eval_access
  %2 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5 ; eval_access
  %3 = load %Nat32, %Nat32* %2
  %4 = add %Nat32 %3, 1
  store %Nat32 %4, %Nat32* %1
  ret void
}

define void @lex_init (%Str %_fname) {
  %fname = alloca %Str
  store %Str %_fname, %Str* %fname

;stmt0:
  %1 = load %Str, %Str* %fname
  %2 = call %Bool (%Str) @exists (%Str %1)
  %3 = xor %Bool %2, 1
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = bitcast [11 x %Nat8]* @func41_str1 to %Str
  %5 = load %Str, %Str* %fname
  %6 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %5)

;stmt3:
  %7 = bitcast [17 x %Nat8]* @func41_str2 to %Str
  call void (%Str) @fatal (%Str %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 0 ; eval_access
  %9 = load %Str, %Str* %fname
  %10 = call %Int32 (%Str, %Int32) @open (%Str %9, %Int32 0)
  store %Int32 %10, %Int32* %8

;stmt5:
  %11 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5 ; eval_access
  store %Nat32 1, %Nat32* %11

;stmt6:
  %12 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3 ; eval_access
  store %Nat16 1, %Nat16* %12

;stmt7:
  %13 = call %Str () @cwd ()

;stmt8:
  %14 = bitcast [2 x %Nat8]* @func41_str3 to %Str
  %15 = load %Str, %Str* %fname
  %16 = call %Str (%Str, %Str, %Str) @cat3 (%Str %13, %Str %14, %Str %15)

;stmt9:
  %17 = bitcast %Str %13 to %Unit*
  call void (%Unit*) @free (%Unit* %17)

;stmt10:
  %18 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 7 ; eval_access
  store %Str %16, %Str* %18
  ret void
}

define %Nat8 @getcc () {

;stmt0:
  %c = alloca %Nat8

;stmt1:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8 ; eval_access
  %2 = load %Nat8, %Nat8* %1
  %3 = icmp ne %Nat8 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %4 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8 ; eval_access
  %5 = load %Nat8, %Nat8* %4
  store %Nat8 %5, %Nat8* %c

;stmt4:
  %6 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8 ; eval_access
  store %Nat8 0, %Nat8* %6
  br label %endif_0
else_0:

;stmt5:

;stmt6:
  %7 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 0 ; eval_access
  %8 = load %Int32, %Int32* %7
  %9 = getelementptr inbounds %Nat8, %Nat8* %c, i32 0 ; ref
  %10 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %8, %Nat8* %9, %Nat32 1)

;stmt7:
  %11 = icmp eq %Int32 %10, 0
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  ret %Nat8 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %13 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3 ; eval_access
  %14 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3 ; eval_access
  %15 = load %Nat16, %Nat16* %14
  %16 = add %Nat16 %15, 1
  store %Nat16 %16, %Nat16* %13
  br label %endif_0
endif_0:

;stmt11:
  %17 = load %Nat8, %Nat8* %c
  ret %Nat8 %17
}

define void @lex_putback (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8 ; eval_access
  %2 = load %Nat8, %Nat8* %c
  store %Nat8 %2, %Nat8* %1
  ret void
}

define void @fill (%Rule %_rule) {
  %rule = alloca %Rule
  store %Rule %_rule, %Rule* %rule

;stmt0:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt1:

;stmt2:
  %c = alloca %Nat8

;stmt3:
  %1 = call %Nat8 () @getcc ()
  store %Nat8 %1, %Nat8* %c

;stmt4:
  %2 = load %Nat8, %Nat8* %c
  %3 = icmp eq %Nat8 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %4 = bitcast [23 x %Nat8]* @func44_str1 to %Str
  call void (%Str) @fatal (%Str %4)

;stmt7:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %5 = load %Rule, %Rule* %rule
  %6 = load %Nat8, %Nat8* %c
  %7 = call %Bool (%Nat8) %5 (%Nat8 %6)
  br i1 %7, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %8 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2 ; eval_access
  %9 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %10 = load %Nat32, %Nat32* %9
  %11 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %8, i32 0, %Nat32 %10 ; eval_index
  %12 = load %Nat8, %Nat8* %c
  store %Nat8 %12, %Nat8* %11

;stmt11:
  %13 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %14 = load %Nat32, %Nat32* %13
  %15 = icmp uge %Nat32 %14, 255
  br i1 %15, label %then_2, label %else_2
then_2:

;stmt12:

;stmt13:
  %16 = bitcast [16 x %Nat8]* @func44_str2 to %Str
  call void (%Str) @fatal (%Str %16)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt14:
  %17 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %18 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %19 = load %Nat32, %Nat32* %18
  %20 = add %Nat32 %19, 1
  store %Nat32 %20, %Nat32* %17
  br label %endif_1
else_1:

;stmt15:

;stmt16:
  %21 = load %Nat8, %Nat8* %c
  call void (%Nat8) @lex_putback (%Nat8 %21)

;stmt17:
  br label %break_0
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
  ret void
}

define %Bool @blank (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = bitcast [2 x %Nat8]* @func45_str1 to %Str
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = bitcast [2 x %Nat8]* @func45_str2 to %Str
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0 ; eval_index
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp eq %Nat8 %6, %9
  %11 = or %Bool %5, %10
  ret %Bool %11
}

define %Bool @minus (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = bitcast [2 x %Nat8]* @func46_str1 to %Str
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  ret %Bool %5
}

define %Bool @slash (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = bitcast [2 x %Nat8]* @func47_str1 to %Str
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = bitcast [2 x %Nat8]* @func47_str2 to %Str
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0 ; eval_index
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp eq %Nat8 %6, %9
  %11 = or %Bool %5, %10
  ret %Bool %11
}

define %Bool @rarrow (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = bitcast [2 x %Nat8]* @func48_str1 to %Str
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = bitcast [2 x %Nat8]* @func48_str2 to %Str
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0 ; eval_index
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp eq %Nat8 %6, %9
  %11 = or %Bool %5, %10
  ret %Bool %11
}

define %Bool @larrow (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = bitcast [2 x %Nat8]* @func49_str1 to %Str
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = bitcast [2 x %Nat8]* @func49_str2 to %Str
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0 ; eval_index
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp eq %Nat8 %6, %9
  %11 = or %Bool %5, %10
  ret %Bool %11
}

define %Bool @eq (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = bitcast [2 x %Nat8]* @func50_str1 to %Str
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  ret %Bool %5
}

define %Bool @bang (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = bitcast [2 x %Nat8]* @func51_str1 to %Str
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  ret %Bool %5
}

define %Bool @id (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = call %Bool (%Nat8) @isalnum (%Nat8 %1)
  %3 = load %Nat8, %Nat8* %c
  %4 = bitcast [2 x %Nat8]* @func52_str1 to %Str
  %5 = getelementptr inbounds %Nat8, %Str %4, %Int32 0 ; eval_index
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp eq %Nat8 %3, %6
  %8 = or %Bool %2, %7
  ret %Bool %8
}

define %Bool @digit (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = call %Bool (%Nat8) @isalnum (%Nat8 %1)
  ret %Bool %2
}

define %TokenType @gettoken () {

;stmt0:
  %c = alloca %Nat8

;stmt1:
  br label %again
again:

;stmt2:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  %2 = load %TokenType, %TokenType* %1
  %3 = icmp eq %TokenType %2, 6
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  call void () @linecnt ()

;stmt5:
  %4 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3 ; eval_access
  store %Nat16 0, %Nat16* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %5 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  store %TokenType 0, %TokenType* %5

;stmt7:
  %6 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  store %Nat32 0, %Nat32* %6

;stmt8:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt9:

;stmt10:
  %7 = call %Nat8 () @getcc ()
  store %Nat8 %7, %Nat8* %c

;stmt11:
  %8 = load %Nat8, %Nat8* %c
  %9 = call %Bool (%Nat8) @blank (%Nat8 %8)
  %10 = xor %Bool %9, 1
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt14:
  %12 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 6 ; eval_access
  %13 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3 ; eval_access
  %14 = load %Nat16, %Nat16* %13
  store %Nat16 %14, %Nat16* %12

;stmt15:
  %15 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2 ; eval_access
  %16 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %15, i32 0, %Int32 0 ; eval_index
  %17 = load %Nat8, %Nat8* %c
  store %Nat8 %17, %Nat8* %16

;stmt16:
  %18 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  store %Nat32 1, %Nat32* %18

;stmt17:
  %19 = load %Nat8, %Nat8* %c
  %20 = call %Bool (%Nat8) @isalpha (%Nat8 %19)
  %21 = load %Nat8, %Nat8* %c
  %22 = bitcast [2 x %Nat8]* @func54_str1 to %Str
  %23 = getelementptr inbounds %Nat8, %Str %22, %Int32 0 ; eval_index
  %24 = load %Nat8, %Nat8* %23
  %25 = icmp eq %Nat8 %21, %24
  %26 = or %Bool %20, %25
  br i1 %26, label %then_2, label %else_2
then_2:

;stmt18:

;stmt19:
  %27 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  store %TokenType 1, %TokenType* %27

;stmt20:
  call void (%Rule) @fill (%Rule @id)
  br label %endif_2
else_2:

;stmt21:
  %28 = load %Nat8, %Nat8* %c
  %29 = call %Bool (%Nat8) @isdigit (%Nat8 %28)
  br i1 %29, label %then_3, label %else_3
then_3:

;stmt22:

;stmt23:
  %30 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  store %TokenType 2, %TokenType* %30

;stmt24:
  call void (%Rule) @fill (%Rule @digit)
  br label %endif_3
else_3:

;stmt25:

;stmt26:
  %31 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  store %TokenType 3, %TokenType* %31

;stmt27:
  %32 = load %Nat8, %Nat8* %c
  %33 = bitcast [2 x %Nat8]* @func54_str2 to %Str
  %34 = getelementptr inbounds %Nat8, %Str %33, %Int32 0 ; eval_index
  %35 = load %Nat8, %Nat8* %34
  %36 = icmp eq %Nat8 %32, %35
  br i1 %36, label %then_4, label %else_4
then_4:

;stmt28:

;stmt29:
  %37 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  store %TokenType 6, %TokenType* %37
  br label %endif_4
else_4:

;stmt30:
  %38 = load %Nat8, %Nat8* %c
  %39 = bitcast [2 x %Nat8]* @func54_str3 to %Str
  %40 = getelementptr inbounds %Nat8, %Str %39, %Int32 0 ; eval_index
  %41 = load %Nat8, %Nat8* %40
  %42 = icmp eq %Nat8 %38, %41
  br i1 %42, label %then_5, label %else_5
then_5:

;stmt31:

;stmt32:
  call void (%Rule) @fill (%Rule @eq)
  br label %endif_5
else_5:

;stmt33:
  %43 = load %Nat8, %Nat8* %c
  %44 = bitcast [2 x %Nat8]* @func54_str4 to %Str
  %45 = getelementptr inbounds %Nat8, %Str %44, %Int32 0 ; eval_index
  %46 = load %Nat8, %Nat8* %45
  %47 = icmp eq %Nat8 %43, %46
  br i1 %47, label %then_6, label %else_6
then_6:

;stmt34:

;stmt35:
  call void (%Rule) @fill (%Rule @minus)
  br label %endif_6
else_6:

;stmt36:
  %48 = load %Nat8, %Nat8* %c
  %49 = bitcast [2 x %Nat8]* @func54_str5 to %Str
  %50 = getelementptr inbounds %Nat8, %Str %49, %Int32 0 ; eval_index
  %51 = load %Nat8, %Nat8* %50
  %52 = icmp eq %Nat8 %48, %51
  br i1 %52, label %then_7, label %else_7
then_7:

;stmt37:

;stmt38:
  %53 = call %Bool () @xslash ()
  %54 = xor %Bool %53, 1
  br i1 %54, label %then_8, label %else_8
then_8:

;stmt39:

;stmt40:
  br label %again
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
  br label %endif_7
else_7:

;stmt41:
  %56 = load %Nat8, %Nat8* %c
  %57 = bitcast [2 x %Nat8]* @func54_str6 to %Str
  %58 = getelementptr inbounds %Nat8, %Str %57, %Int32 0 ; eval_index
  %59 = load %Nat8, %Nat8* %58
  %60 = icmp eq %Nat8 %56, %59
  br i1 %60, label %then_9, label %else_9
then_9:

;stmt42:

;stmt43:
  call void (%Rule) @fill (%Rule @rarrow)
  br label %endif_9
else_9:

;stmt44:
  %61 = load %Nat8, %Nat8* %c
  %62 = bitcast [2 x %Nat8]* @func54_str7 to %Str
  %63 = getelementptr inbounds %Nat8, %Str %62, %Int32 0 ; eval_index
  %64 = load %Nat8, %Nat8* %63
  %65 = icmp eq %Nat8 %61, %64
  br i1 %65, label %then_10, label %else_10
then_10:

;stmt45:

;stmt46:
  call void (%Rule) @fill (%Rule @larrow)
  br label %endif_10
else_10:

;stmt47:
  %66 = load %Nat8, %Nat8* %c
  %67 = bitcast [2 x %Nat8]* @func54_str8 to %Str
  %68 = getelementptr inbounds %Nat8, %Str %67, %Int32 0 ; eval_index
  %69 = load %Nat8, %Nat8* %68
  %70 = icmp eq %Nat8 %66, %69
  br i1 %70, label %then_11, label %else_11
then_11:

;stmt48:

;stmt49:
  call void (%Rule) @fill (%Rule @bang)
  br label %endif_11
else_11:

;stmt50:
  %71 = load %Nat8, %Nat8* %c
  %72 = bitcast [2 x %Nat8]* @func54_str9 to %Str
  %73 = getelementptr inbounds %Nat8, %Str %72, %Int32 0 ; eval_index
  %74 = load %Nat8, %Nat8* %73
  %75 = icmp eq %Nat8 %71, %74
  br i1 %75, label %then_12, label %else_12
then_12:

;stmt51:

;stmt52:
  %76 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  store %TokenType 5, %TokenType* %76

;stmt53:
  call void (%Rule) @fill (%Rule @id)
  br label %endif_12
else_12:

;stmt54:
  %77 = load %Nat8, %Nat8* %c
  %78 = bitcast [2 x %Nat8]* @func54_str10 to %Str
  %79 = getelementptr inbounds %Nat8, %Str %78, %Int32 0 ; eval_index
  %80 = load %Nat8, %Nat8* %79
  %81 = icmp eq %Nat8 %77, %80
  br i1 %81, label %then_13, label %else_13
then_13:

;stmt55:

;stmt56:
  call void () @string ()
  br label %endif_13
else_13:

;stmt57:
  %82 = load %Nat8, %Nat8* %c
  %83 = icmp eq %Nat8 %82, 0
  br i1 %83, label %then_14, label %else_14
then_14:

;stmt58:

;stmt59:
  %84 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  store %TokenType 0, %TokenType* %84

;stmt60:
  %85 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2 ; eval_access
  %86 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %85, i32 0, %Int32 0 ; eval_index
  store %Nat8 0, %Nat8* %86

;stmt61:
  %87 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  store %Nat32 0, %Nat32* %87

;stmt62:
  ret %TokenType 0
  br label %endif_14
else_14:

;stmt63:
  br label %endif_14
endif_14:
  br label %endif_13
endif_13:
  br label %endif_12
endif_12:
  br label %endif_11
endif_11:
  br label %endif_10
endif_10:
  br label %endif_9
endif_9:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:

;stmt64:
  %89 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2 ; eval_access
  %90 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %91 = load %Nat32, %Nat32* %90
  %92 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %89, i32 0, %Nat32 %91 ; eval_index
  store %Nat8 0, %Nat8* %92

;stmt65:
  %93 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  %94 = load %TokenType, %TokenType* %93
  ret %TokenType %94
}

define %Bool @xslash () {

;stmt0:
  %c = alloca %Nat8

;stmt1:
  %1 = call %Nat8 () @getcc ()

;stmt2:
  %2 = bitcast [2 x %Nat8]* @func55_str1 to %Str
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %6 = call %Nat8 () @getcc ()
  store %Nat8 %6, %Nat8* %c

;stmt7:
  %7 = load %Nat8, %Nat8* %c
  %8 = icmp eq %Nat8 %7, 0
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %9 = load %Nat8, %Nat8* %c
  call void (%Nat8) @lex_putback (%Nat8 %9)

;stmt10:
  br label %break_0
  br label %endif_1
else_1:

;stmt11:
  %11 = load %Nat8, %Nat8* %c
  %12 = bitcast [2 x %Nat8]* @func55_str2 to %Str
  %13 = getelementptr inbounds %Nat8, %Str %12, %Int32 0 ; eval_index
  %14 = load %Nat8, %Nat8* %13
  %15 = icmp eq %Nat8 %11, %14
  br i1 %15, label %then_2, label %else_2
then_2:

;stmt12:

;stmt13:
  %16 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  store %TokenType 6, %TokenType* %16

;stmt14:
  %17 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2 ; eval_access
  %18 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %17, i32 0, %Int32 0 ; eval_index
  %19 = bitcast [2 x %Nat8]* @func55_str3 to %Str
  %20 = getelementptr inbounds %Nat8, %Str %19, %Int32 0 ; eval_index
  %21 = load %Nat8, %Nat8* %20
  store %Nat8 %21, %Nat8* %18

;stmt15:
  %22 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2 ; eval_access
  %23 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %22, i32 0, %Int32 1 ; eval_index
  store %Nat8 0, %Nat8* %23

;stmt16:
  %24 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  store %Nat32 1, %Nat32* %24

;stmt17:
  br label %break_0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
  br label %endif_0
else_0:

;stmt18:
  %26 = bitcast [2 x %Nat8]* @func55_str4 to %Str
  %27 = getelementptr inbounds %Nat8, %Str %26, %Int32 0 ; eval_index
  %28 = load %Nat8, %Nat8* %27
  %29 = icmp eq %Nat8 %1, %28
  br i1 %29, label %then_3, label %else_3
then_3:

;stmt19:

;stmt20:
  br label %continue_1
continue_1:
  br i1 1, label %body_1, label %break_1
body_1:

;stmt21:

;stmt22:
  %30 = call %Nat8 () @getcc ()
  store %Nat8 %30, %Nat8* %c

;stmt23:
  %31 = load %Nat8, %Nat8* %c
  %32 = icmp eq %Nat8 %31, 0
  br i1 %32, label %then_4, label %else_4
then_4:

;stmt24:

;stmt25:
  %33 = bitcast [23 x %Nat8]* @func55_str5 to %Str
  call void (%Str) @fatal (%Str %33)
  br label %endif_4
else_4:

;stmt26:
  %34 = load %Nat8, %Nat8* %c
  %35 = bitcast [2 x %Nat8]* @func55_str6 to %Str
  %36 = getelementptr inbounds %Nat8, %Str %35, %Int32 0 ; eval_index
  %37 = load %Nat8, %Nat8* %36
  %38 = icmp eq %Nat8 %34, %37
  br i1 %38, label %then_5, label %else_5
then_5:

;stmt27:

;stmt28:
  %39 = call %Nat8 () @getcc ()
  store %Nat8 %39, %Nat8* %c

;stmt29:
  %40 = load %Nat8, %Nat8* %c
  %41 = bitcast [2 x %Nat8]* @func55_str7 to %Str
  %42 = getelementptr inbounds %Nat8, %Str %41, %Int32 0 ; eval_index
  %43 = load %Nat8, %Nat8* %42
  %44 = icmp eq %Nat8 %40, %43
  br i1 %44, label %then_6, label %else_6
then_6:

;stmt30:

;stmt31:
  ret %Bool 0
  br label %endif_6
else_6:

;stmt32:

;stmt33:
  %46 = load %Nat8, %Nat8* %c
  call void (%Nat8) @lex_putback (%Nat8 %46)
  br label %endif_6
endif_6:
  br label %endif_5
else_5:

;stmt34:
  %47 = load %Nat8, %Nat8* %c
  %48 = bitcast [2 x %Nat8]* @func55_str8 to %Str
  %49 = getelementptr inbounds %Nat8, %Str %48, %Int32 0 ; eval_index
  %50 = load %Nat8, %Nat8* %49
  %51 = icmp eq %Nat8 %47, %50
  br i1 %51, label %then_7, label %else_7
then_7:

;stmt35:

;stmt36:
  call void () @linecnt ()
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %continue_1
break_1:
  br label %endif_3
else_3:

;stmt37:

;stmt38:
  call void (%Nat8) @lex_putback (%Nat8 %1)

;stmt39:
  call void (%Rule) @fill (%Rule @slash)
  br label %endif_3
endif_3:
  br label %endif_0
endif_0:

;stmt40:
  ret %Bool 1
}

define void @string () {

;stmt0:
  %c = alloca %Nat8

;stmt1:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  store %TokenType 4, %TokenType* %1

;stmt2:
  %2 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  store %Nat32 0, %Nat32* %2

;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt4:

;stmt5:
  %3 = call %Nat8 () @getcc ()
  store %Nat8 %3, %Nat8* %c

;stmt6:
  %4 = load %Nat8, %Nat8* %c
  %5 = bitcast [2 x %Nat8]* @func56_str1 to %Str
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0 ; eval_index
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %4, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  br label %break_0
  br label %endif_0
else_0:

;stmt9:
  %10 = load %Nat8, %Nat8* %c
  %11 = icmp eq %Nat8 %10, 0
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %12 = bitcast [23 x %Nat8]* @func56_str2 to %Str
  call void (%Str) @fatal (%Str %12)
  br label %endif_1
else_1:

;stmt12:

;stmt13:
  %13 = load %Nat8, %Nat8* %c
  %14 = bitcast [2 x %Nat8]* @func56_str3 to %Str
  %15 = getelementptr inbounds %Nat8, %Str %14, %Int32 0 ; eval_index
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp eq %Nat8 %13, %16
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %18 = call %Nat8 () @getcc ()
  store %Nat8 %18, %Nat8* %c

;stmt16:
  %19 = load %Nat8, %Nat8* %c
  %20 = bitcast [2 x %Nat8]* @func56_str4 to %Str
  %21 = getelementptr inbounds %Nat8, %Str %20, %Int32 0 ; eval_index
  %22 = load %Nat8, %Nat8* %21
  %23 = icmp eq %Nat8 %19, %22
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt17:

;stmt18:
  %24 = bitcast [2 x %Nat8]* @func56_str5 to %Str
  %25 = getelementptr inbounds %Nat8, %Str %24, %Int32 0 ; eval_index
  %26 = load %Nat8, %Nat8* %25
  store %Nat8 %26, %Nat8* %c
  br label %endif_3
else_3:

;stmt19:
  %27 = load %Nat8, %Nat8* %c
  %28 = bitcast [2 x %Nat8]* @func56_str6 to %Str
  %29 = getelementptr inbounds %Nat8, %Str %28, %Int32 0 ; eval_index
  %30 = load %Nat8, %Nat8* %29
  %31 = icmp eq %Nat8 %27, %30
  br i1 %31, label %then_4, label %else_4
then_4:

;stmt20:

;stmt21:
  %32 = bitcast [2 x %Nat8]* @func56_str7 to %Str
  %33 = getelementptr inbounds %Nat8, %Str %32, %Int32 0 ; eval_index
  %34 = load %Nat8, %Nat8* %33
  store %Nat8 %34, %Nat8* %c
  br label %endif_4
else_4:

;stmt22:
  %35 = load %Nat8, %Nat8* %c
  %36 = bitcast [2 x %Nat8]* @func56_str8 to %Str
  %37 = getelementptr inbounds %Nat8, %Str %36, %Int32 0 ; eval_index
  %38 = load %Nat8, %Nat8* %37
  %39 = icmp eq %Nat8 %35, %38
  br i1 %39, label %then_5, label %else_5
then_5:

;stmt23:

;stmt24:
  %40 = bitcast [2 x %Nat8]* @func56_str9 to %Str
  %41 = getelementptr inbounds %Nat8, %Str %40, %Int32 0 ; eval_index
  %42 = load %Nat8, %Nat8* %41
  store %Nat8 %42, %Nat8* %c
  br label %endif_5
else_5:

;stmt25:
  %43 = load %Nat8, %Nat8* %c
  %44 = bitcast [2 x %Nat8]* @func56_str10 to %Str
  %45 = getelementptr inbounds %Nat8, %Str %44, %Int32 0 ; eval_index
  %46 = load %Nat8, %Nat8* %45
  %47 = icmp eq %Nat8 %43, %46
  br i1 %47, label %then_6, label %else_6
then_6:

;stmt26:

;stmt27:
  %48 = bitcast [2 x %Nat8]* @func56_str11 to %Str
  %49 = getelementptr inbounds %Nat8, %Str %48, %Int32 0 ; eval_index
  %50 = load %Nat8, %Nat8* %49
  store %Nat8 %50, %Nat8* %c
  br label %endif_6
else_6:

;stmt28:
  %51 = load %Nat8, %Nat8* %c
  %52 = bitcast [2 x %Nat8]* @func56_str12 to %Str
  %53 = getelementptr inbounds %Nat8, %Str %52, %Int32 0 ; eval_index
  %54 = load %Nat8, %Nat8* %53
  %55 = icmp eq %Nat8 %51, %54
  br i1 %55, label %then_7, label %else_7
then_7:

;stmt29:

;stmt30:
  %56 = bitcast [2 x %Nat8]* @func56_str13 to %Str
  %57 = getelementptr inbounds %Nat8, %Str %56, %Int32 0 ; eval_index
  %58 = load %Nat8, %Nat8* %57
  store %Nat8 %58, %Nat8* %c
  br label %endif_7
else_7:

;stmt31:
  %59 = load %Nat8, %Nat8* %c
  %60 = bitcast [2 x %Nat8]* @func56_str14 to %Str
  %61 = getelementptr inbounds %Nat8, %Str %60, %Int32 0 ; eval_index
  %62 = load %Nat8, %Nat8* %61
  %63 = icmp eq %Nat8 %59, %62
  br i1 %63, label %then_8, label %else_8
then_8:

;stmt32:

;stmt33:
  %64 = bitcast [2 x %Nat8]* @func56_str15 to %Str
  %65 = getelementptr inbounds %Nat8, %Str %64, %Int32 0 ; eval_index
  %66 = load %Nat8, %Nat8* %65
  store %Nat8 %66, %Nat8* %c
  br label %endif_8
else_8:

;stmt34:
  %67 = load %Nat8, %Nat8* %c
  %68 = bitcast [2 x %Nat8]* @func56_str16 to %Str
  %69 = getelementptr inbounds %Nat8, %Str %68, %Int32 0 ; eval_index
  %70 = load %Nat8, %Nat8* %69
  %71 = icmp eq %Nat8 %67, %70
  br i1 %71, label %then_9, label %else_9
then_9:

;stmt35:

;stmt36:
  %72 = bitcast [2 x %Nat8]* @func56_str17 to %Str
  %73 = getelementptr inbounds %Nat8, %Str %72, %Int32 0 ; eval_index
  %74 = load %Nat8, %Nat8* %73
  store %Nat8 %74, %Nat8* %c
  br label %endif_9
else_9:

;stmt37:
  %75 = load %Nat8, %Nat8* %c
  %76 = bitcast [2 x %Nat8]* @func56_str18 to %Str
  %77 = getelementptr inbounds %Nat8, %Str %76, %Int32 0 ; eval_index
  %78 = load %Nat8, %Nat8* %77
  %79 = icmp eq %Nat8 %75, %78
  br i1 %79, label %then_10, label %else_10
then_10:

;stmt38:

;stmt39:
  %80 = bitcast [2 x %Nat8]* @func56_str19 to %Str
  %81 = getelementptr inbounds %Nat8, %Str %80, %Int32 0 ; eval_index
  %82 = load %Nat8, %Nat8* %81
  store %Nat8 %82, %Nat8* %c
  br label %endif_10
else_10:

;stmt40:
  %83 = load %Nat8, %Nat8* %c
  %84 = bitcast [2 x %Nat8]* @func56_str20 to %Str
  %85 = getelementptr inbounds %Nat8, %Str %84, %Int32 0 ; eval_index
  %86 = load %Nat8, %Nat8* %85
  %87 = icmp eq %Nat8 %83, %86
  br i1 %87, label %then_11, label %else_11
then_11:

;stmt41:

;stmt42:
  store %Nat8 0, %Nat8* %c
  br label %endif_11
else_11:
  br label %endif_11
endif_11:
  br label %endif_10
endif_10:
  br label %endif_9
endif_9:
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt43:
  %88 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %89 = load %Nat32, %Nat32* %88
  %90 = icmp uge %Nat32 %89, 255
  br i1 %90, label %then_12, label %else_12
then_12:

;stmt44:

;stmt45:
  %91 = bitcast [17 x %Nat8]* @func56_str21 to %Str
  call void (%Str) @fatal (%Str %91)
  br label %endif_12
else_12:
  br label %endif_12
endif_12:

;stmt46:
  %92 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2 ; eval_access
  %93 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %94 = load %Nat32, %Nat32* %93
  %95 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %92, i32 0, %Nat32 %94 ; eval_index
  %96 = load %Nat8, %Nat8* %c
  store %Nat8 %96, %Nat8* %95

;stmt47:
  %97 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %98 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %99 = load %Nat32, %Nat32* %98
  %100 = add %Nat32 %99, 1
  store %Nat32 %100, %Nat32* %97
  br label %continue_0
break_0:
  ret void
}

define %Bool @need (%Str %_s) {
  %s = alloca %Str
  store %Str %_s, %Str* %s

;stmt0:
  %1 = load %Str, %Str* %s
  %2 = call %Bool (%Str) @match (%Str %1)

;stmt1:
  %3 = icmp eq %Bool %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %t = alloca %Token*

;stmt4:
  %4 = call %Token* () @ctok ()
  store %Token* %4, %Token** %t

;stmt5:
  %5 = bitcast [18 x %Nat8]* @func57_str1 to %Str
  %6 = load %Token*, %Token** %t
  %7 = getelementptr inbounds %Token, %Token* %6, i32 0, i32 1 ; eval_access
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %7)

;stmt6:
  %8 = bitcast [24 x %Nat8]* @func57_str2 to %Str
  %9 = load %Str, %Str* %s
  %10 = load %Token*, %Token** %t
  %11 = getelementptr inbounds %Token, %Token* %10, i32 0, i32 2 ; eval_access
  %12 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %11, i32 0, %Int32 0 ; eval_index
  %13 = call %Int32 (%Str, ...) @printf (%Str %8, %Str %9, %Nat8* %12)

;stmt7:
  %14 = bitcast [16 x %Nat8]* @func57_str3 to %Str
  %15 = load %Token*, %Token** %t
  %16 = getelementptr inbounds %Token, %Token* %15, i32 0, i32 0 ; eval_access
  %17 = load %TokenType, %TokenType* %16
  %18 = call %Int32 (%Str, ...) @printf (%Str %14, %TokenType %17)

;stmt8:
  call void (%Int32) @exit (%Int32 0)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  ret %Bool %2
}

define void @skip_nl () {

;stmt0:
  br label %continue_0
continue_0:
  %1 = bitcast [2 x %Nat8]* @func58_str1 to %Str
  %2 = call %Bool (%Str) @match (%Str %1)
  br i1 %2, label %body_0, label %break_0
body_0:

;stmt1:
  br label %continue_0
break_0:
  ret void
}

define void @skipto (%Str %_s) {
  %s = alloca %Str
  store %Str %_s, %Str* %s

;stmt0:
  %1 = bitcast [29 x %Nat8]* @func59_str1 to %Str
  %2 = inttoptr %Nat32 0 to %Unit*
  %3 = bitcast %Unit* %2 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %1, %TokenInfo* %3)

;stmt1:
  %4 = bitcast [12 x %Nat8]* @func59_str2 to %Str
  %5 = call %Token* () @ctok ()
  %6 = getelementptr inbounds %Token, %Token* %5, i32 0, i32 2 ; eval_access
  %7 = call %Int32 (%Str, ...) @printf (%Str %4, [0 x %Nat8]* %6)

;stmt2:
  %8 = bitcast [18 x %Nat8]* @func59_str3 to %Str
  %9 = load %Str, %Str* %s
  %10 = call %Int32 (%Str, ...) @printf (%Str %8, %Str %9)

;stmt3:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define %List* @tokenize (%Str %_filename) {
  %filename = alloca %Str
  store %Str %_filename, %Str* %filename

;stmt0:
  %1 = call %List* () @map_new ()

;stmt1:
  %2 = load %Str, %Str* %filename
  call void (%Str) @lex_init (%Str %2)

;stmt2:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %3 = call %TokenType () @gettoken ()

;stmt5:
  %4 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %5 = load %Nat32, %Nat32* %4
  %6 = trunc %Nat32 %5 to %Nat16
  %7 = add %Nat16 %6, 1

;stmt6:
  %8 = zext %Nat16 %7 to %Nat32
  %9 = add %Nat32 40, %8
  %10 = call %Unit* (%Nat32) @malloc (%Nat32 %9)
  %11 = bitcast %Unit* %10 to %Token*

;stmt7:
  %12 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 0 ; eval_access
  %13 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1 ; eval_access
  %14 = load %TokenType, %TokenType* %13
  store %TokenType %14, %TokenType* %12

;stmt8:
  %15 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1 ; eval_access
  %16 = getelementptr inbounds %TokenInfo, %TokenInfo* %15, i32 0, i32 3 ; eval_access
  %17 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4 ; eval_access
  %18 = load %Nat32, %Nat32* %17
  %19 = trunc %Nat32 %18 to %Nat16
  store %Nat16 %19, %Nat16* %16

;stmt9:
  %20 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1 ; eval_access
  %21 = getelementptr inbounds %TokenInfo, %TokenInfo* %20, i32 0, i32 0 ; eval_access
  %22 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 7 ; eval_access
  %23 = load %Str, %Str* %22
  store %Str %23, %Str* %21

;stmt10:
  %24 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1 ; eval_access
  %25 = getelementptr inbounds %TokenInfo, %TokenInfo* %24, i32 0, i32 1 ; eval_access
  %26 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5 ; eval_access
  %27 = load %Nat32, %Nat32* %26
  store %Nat32 %27, %Nat32* %25

;stmt11:
  %28 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1 ; eval_access
  %29 = getelementptr inbounds %TokenInfo, %TokenInfo* %28, i32 0, i32 2 ; eval_access
  %30 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 6 ; eval_access
  %31 = load %Nat16, %Nat16* %30
  store %Nat16 %31, %Nat16* %29

;stmt12:
  %32 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 2 ; eval_access
  %33 = bitcast [0 x %Nat8]* %32 to %Unit*
  %34 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2 ; eval_access
  %35 = bitcast [256 x %Nat8]* %34 to %Unit*
  %36 = zext %Nat16 %7 to %Nat32
  %37 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %33, %Unit* %35, %Nat32 %36)

;stmt13:
  %38 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 2 ; eval_access
  %39 = add %Nat16 %7, 1
  %40 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %38, i32 0, %Nat16 %39 ; eval_index
  store %Nat8 0, %Nat8* %40

;stmt14:
  %41 = bitcast %Token* %11 to %Unit*
  %42 = call %Bool (%List*, %Unit*) @list_append (%List* %1, %Unit* %41)

;stmt15:
  %43 = icmp eq %TokenType %3, 0
  br i1 %43, label %then_0, label %else_0
then_0:

;stmt16:

;stmt17:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %continue_0
break_0:

;stmt18:
  %45 = load %Nat32, %Nat32* @lines
  %46 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5 ; eval_access
  %47 = load %Nat32, %Nat32* %46
  %48 = add %Nat32 %45, %47
  store %Nat32 %48, %Nat32* @lines

;stmt19:
  ret %List* %1
}

define %Bool @isalpha (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = bitcast [2 x %Nat8]* @func61_str1 to %Str
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp uge %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = bitcast [2 x %Nat8]* @func61_str2 to %Str
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0 ; eval_index
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp ule %Nat8 %6, %9
  %11 = and %Bool %5, %10
  %12 = load %Nat8, %Nat8* %c
  %13 = bitcast [2 x %Nat8]* @func61_str3 to %Str
  %14 = getelementptr inbounds %Nat8, %Str %13, %Int32 0 ; eval_index
  %15 = load %Nat8, %Nat8* %14
  %16 = icmp uge %Nat8 %12, %15
  %17 = load %Nat8, %Nat8* %c
  %18 = bitcast [2 x %Nat8]* @func61_str4 to %Str
  %19 = getelementptr inbounds %Nat8, %Str %18, %Int32 0 ; eval_index
  %20 = load %Nat8, %Nat8* %19
  %21 = icmp ule %Nat8 %17, %20
  %22 = and %Bool %16, %21
  %23 = or %Bool %11, %22
  ret %Bool %23
}

define %Bool @isdigit (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = bitcast [2 x %Nat8]* @func62_str1 to %Str
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp uge %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = bitcast [2 x %Nat8]* @func62_str2 to %Str
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0 ; eval_index
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp ule %Nat8 %6, %9
  %11 = and %Bool %5, %10
  ret %Bool %11
}

define %Bool @isalnum (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = call %Bool (%Nat8) @isalpha (%Nat8 %1)
  %3 = load %Nat8, %Nat8* %c
  %4 = call %Bool (%Nat8) @isdigit (%Nat8 %3)
  %5 = or %Bool %2, %4
  ret %Bool %5
}

define %Str @cwd () {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 512)

;stmt1:
  %2 = bitcast %Unit* %1 to %Str
  %3 = call %Str (%Str, %Nat32) @getcwd (%Str %2, %Nat32 512)
  ret %Str %3
}

define void @liblist_add (%Str %_path) {
  %path = alloca %Str
  store %Str %_path, %Str* %path

;stmt0:
  %1 = load %List*, %List** @liblist
  %2 = load %Str, %Str* %path
  %3 = bitcast %Str %2 to %Unit*
  %4 = call %Bool (%List*, %Unit*) @list_append (%List* %1, %Unit* %3)
  ret void
}

define %Str @domain (%Str %_path) {
  %path = alloca %Str
  store %Str %_path, %Str* %path

;stmt0:
  %i = alloca %Nat32

;stmt1:
  %j = alloca %Nat32

;stmt2:
  store %Nat32 0, %Nat32* %i

;stmt3:
  store %Nat32 0, %Nat32* %j

;stmt4:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 512)
  %2 = bitcast %Unit* %1 to %Str

;stmt5:
  br label %continue_0
continue_0:
  %3 = load %Nat32, %Nat32* %i
  %4 = load %Str, %Str* %path
  %5 = getelementptr inbounds %Nat8, %Str %4, %Nat32 %3 ; eval_index
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp ne %Nat8 %6, 0
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  %8 = load %Nat32, %Nat32* %i
  %9 = load %Str, %Str* %path
  %10 = getelementptr inbounds %Nat8, %Str %9, %Nat32 %8 ; eval_index
  %11 = load %Nat8, %Nat8* %10
  %12 = load %Nat32, %Nat32* %i
  %13 = load %Str, %Str* @pdir
  %14 = getelementptr inbounds %Nat8, %Str %13, %Nat32 %12 ; eval_index
  %15 = load %Nat8, %Nat8* %14
  %16 = icmp ne %Nat8 %11, %15
  br i1 %16, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  %17 = load %Nat32, %Nat32* %j
  %18 = getelementptr inbounds %Nat8, %Str %2, %Nat32 %17 ; eval_index
  %19 = load %Nat32, %Nat32* %i
  %20 = load %Str, %Str* %path
  %21 = getelementptr inbounds %Nat8, %Str %20, %Nat32 %19 ; eval_index
  %22 = load %Nat8, %Nat8* %21
  store %Nat8 %22, %Nat8* %18

;stmt10:
  %23 = load %Nat32, %Nat32* %j
  %24 = add %Nat32 %23, 1
  store %Nat32 %24, %Nat32* %j
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt11:
  %25 = load %Nat32, %Nat32* %i
  %26 = add %Nat32 %25, 1
  store %Nat32 %26, %Nat32* %i
  br label %continue_0
break_0:

;stmt12:
  %27 = load %Nat32, %Nat32* %j
  %28 = getelementptr inbounds %Nat8, %Str %2, %Nat32 %27 ; eval_index
  store %Nat8 0, %Nat8* %28

;stmt13:
  ret %Str %2
}

define %Source* @src_new (%Str %_name, %List* %_tokens) {
  %name = alloca %Str
  store %Str %_name, %Str* %name
  %tokens = alloca %List*
  store %List* %_tokens, %List** %tokens

;stmt0:
  %fullpath = alloca %Str

;stmt1:
  %1 = load %Str, %Str* %name
  store %Str %1, %Str* %fullpath

;stmt2:
  %2 = load %Str, %Str* %name
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3
  %5 = bitcast [2 x %Nat8]* @func67_str1 to %Str
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0 ; eval_index
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %4, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %9 = call %Str () @cwd ()

;stmt5:
  %10 = load %Str, %Str* %name
  %11 = getelementptr inbounds %Nat8, %Str %10, %Int32 1 ; eval_index
  %12 = bitcast %Nat8* %11 to %Str
  %13 = call %Str (%Str, %Str) @cat (%Str %9, %Str %12)
  store %Str %13, %Str* %fullpath
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %14 = call %Unit* (%Nat32) @malloc (%Nat32 40)
  %15 = bitcast %Unit* %14 to %Source*

;stmt7:
  %16 = getelementptr inbounds %Source, %Source* %15, i32 0, i32 0 ; eval_access
  %17 = load %Str, %Str* %fullpath
  store %Str %17, %Str* %16

;stmt8:
  %18 = getelementptr inbounds %Source, %Source* %15, i32 0, i32 3 ; eval_access
  %19 = load %List*, %List** %tokens
  store %List* %19, %List** %18

;stmt9:
  %20 = getelementptr inbounds %Source, %Source* %15, i32 0, i32 4 ; eval_access
  %21 = getelementptr inbounds %Source, %Source* %15, i32 0, i32 3 ; eval_access
  %22 = load %List*, %List** %21
  %23 = getelementptr inbounds %List, %List* %22, i32 0, i32 0 ; eval_access
  %24 = load %Node*, %Node** %23
  store %Node* %24, %Node** %20

;stmt10:
  ret %Source* %15
}

define %Source* @src_open (%Str %_dir, %Str %_resource) {
  %dir = alloca %Str
  store %Str %_dir, %Str* %dir
  %resource = alloca %Str
  store %Str %_resource, %Str* %resource

;stmt0:
  %1 = load %Str, %Str* %dir
  %2 = bitcast [2 x %Nat8]* @func68_str1 to %Str
  %3 = load %Str, %Str* %resource
  %4 = call %Str (%Str, %Str, %Str) @cat3 (%Str %1, %Str %2, %Str %3)

;stmt1:
  %5 = bitcast [3 x %Nat8]* @func68_str2 to %Str
  %6 = call %Str (%Str, %Str) @cat (%Str %4, %Str %5)

;stmt2:
  %tokens = alloca %List*

;stmt3:
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = bitcast %Unit* %7 to %List*
  store %List* %8, %List** %tokens

;stmt4:
  %fname = alloca %Str

;stmt5:
  %9 = call %Bool (%Str) @exists (%Str %6)
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %10 = call %Str (%Str) @getprefix (%Str %6)
  %11 = call %Int32 (%Str) @chdir (%Str %10)

;stmt8:
  %12 = call %Str (%Str) @get_last (%Str %6)
  %13 = call %List* (%Str) @tokenize (%Str %12)
  store %List* %13, %List** %tokens

;stmt9:
  store %Str %6, %Str* %fname
  br label %endif_0
else_0:

;stmt10:

;stmt11:
  %14 = bitcast [8 x %Nat8]* @func68_str3 to %Str
  %15 = call %Str (%Str, %Str) @cat (%Str %4, %Str %14)

;stmt12:
  %16 = call %Bool (%Str) @exists (%Str %15)
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt13:

;stmt14:
  %17 = load %Str, %Str* %resource
  %18 = call %Int32 (%Str) @chdir (%Str %17)

;stmt15:
  %19 = bitcast [7 x %Nat8]* @func68_str4 to %Str
  %20 = call %List* (%Str) @tokenize (%Str %19)
  store %List* %20, %List** %tokens

;stmt16:
  store %Str %15, %Str* %fname
  br label %endif_1
else_1:

;stmt17:

;stmt18:
  %21 = bitcast %Str %15 to %Unit*
  call void (%Unit*) @free (%Unit* %21)
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt19:
  %22 = load %List*, %List** %tokens
  %23 = bitcast %List* %22 to %Unit*
  %24 = inttoptr %Nat32 0 to %Unit*
  %25 = icmp eq %Unit* %23, %24
  br i1 %25, label %then_2, label %else_2
then_2:

;stmt20:

;stmt21:
  %26 = inttoptr %Nat32 0 to %Unit*
  %27 = bitcast %Unit* %26 to %Source*
  ret %Source* %27
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt22:
  %29 = load %Str, %Str* %fname
  %30 = load %List*, %List** %tokens
  %31 = call %Source* (%Str, %List*) @src_new (%Str %29, %List* %30)
  ret %Source* %31
}

define %Unit* @search_in_lib (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Str

;stmt1:
  %3 = load %Unit*, %Unit** %ctx
  %4 = bitcast %Unit* %3 to %Str

;stmt2:
  %5 = call %Source* (%Str, %Str) @src_open (%Str %2, %Str %4)
  %6 = bitcast %Source* %5 to %Unit*
  ret %Unit* %6
}

define %Source* @source_open (%Str %_import_string) {
  %import_string = alloca %Str
  store %Str %_import_string, %Str* %import_string

;stmt0:
  %1 = bitcast [2 x %Nat8]* @func69_str1 to %Str
  %2 = load %Str, %Str* %import_string
  %3 = call %Source* (%Str, %Str) @src_open (%Str %1, %Str %2)

;stmt1:
  %4 = bitcast %Source* %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Source* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = load %Str, %Str* @pdir
  %9 = load %Str, %Str* %import_string
  %10 = call %Source* (%Str, %Str) @src_open (%Str %8, %Str %9)

;stmt5:
  %11 = bitcast %Source* %10 to %Unit*
  %12 = inttoptr %Nat32 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  ret %Source* %10
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt8:
  %15 = load %List*, %List** @liblist
  %16 = load %Str, %Str* %import_string
  %17 = bitcast %Str %16 to %Unit*
  %18 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %15, %ListSearchHandler @search_in_lib, %Unit* %17)
  %19 = bitcast %Unit* %18 to %Source*

;stmt9:
  ret %Source* %19
}

define void @info (%Str %_s) {
  %s = alloca %Str
  store %Str %_s, %Str* %s

;stmt0:
  %1 = bitcast [23 x %Nat8]* @func71_str1 to %Str
  %2 = load %Str, %Str* %s
  %3 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 27, %Int32 36, %Int32 27, %Str %2)
  ret void
}

define void @warning (%Str %_s, %TokenInfo* %_ti) {
  %s = alloca %Str
  store %Str %_s, %Str* %s
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = bitcast %TokenInfo* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = bitcast [35 x %Nat8]* @func72_str1 to %Str
  %6 = load %TokenInfo*, %TokenInfo** %ti
  %7 = getelementptr inbounds %TokenInfo, %TokenInfo* %6, i32 0, i32 0 ; eval_access
  %8 = load %Str, %Str* %7
  %9 = load %TokenInfo*, %TokenInfo** %ti
  %10 = getelementptr inbounds %TokenInfo, %TokenInfo* %9, i32 0, i32 1 ; eval_access
  %11 = load %Nat32, %Nat32* %10
  %12 = load %Str, %Str* %s
  %13 = call %Int32 (%Str, ...) @printf (%Str %5, %Int32 27, %Int32 34, %Int32 27, %Str %8, %Nat32 %11, %Str %12)

;stmt3:
  %14 = load %TokenInfo*, %TokenInfo** %ti
  call void (%TokenInfo*) @show (%TokenInfo* %14)

;stmt4:
  %15 = bitcast [2 x %Nat8]* @func72_str2 to %Str
  %16 = call %Int32 (%Str, ...) @printf (%Str %15)
  br label %endif_0
else_0:

;stmt5:

;stmt6:
  %17 = bitcast [26 x %Nat8]* @func72_str3 to %Str
  %18 = load %Str, %Str* %s
  %19 = call %Int32 (%Str, ...) @printf (%Str %17, %Int32 27, %Int32 34, %Int32 27, %Str %18)
  br label %endif_0
endif_0:

;stmt7:
  %20 = load %Nat32, %Nat32* @warncnt
  %21 = add %Nat32 %20, 1
  store %Nat32 %21, %Nat32* @warncnt
  ret void
}

define void @error (%Str %_s, %TokenInfo* %_ti) {
  %s = alloca %Str
  store %Str %_s, %Str* %s
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = bitcast %TokenInfo* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = bitcast [24 x %Nat8]* @func73_str1 to %Str
  %6 = load %Str, %Str* %s
  %7 = call %Int32 (%Str, ...) @printf (%Str %5, %Int32 27, %Int32 35, %Int32 27, %Str %6)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %8 = bitcast [33 x %Nat8]* @func73_str2 to %Str
  %9 = load %TokenInfo*, %TokenInfo** %ti
  %10 = getelementptr inbounds %TokenInfo, %TokenInfo* %9, i32 0, i32 0 ; eval_access
  %11 = load %Str, %Str* %10
  %12 = load %TokenInfo*, %TokenInfo** %ti
  %13 = getelementptr inbounds %TokenInfo, %TokenInfo* %12, i32 0, i32 1 ; eval_access
  %14 = load %Nat32, %Nat32* %13
  %15 = load %Str, %Str* %s
  %16 = call %Int32 (%Str, ...) @printf (%Str %8, %Int32 27, %Int32 35, %Int32 27, %Str %11, %Nat32 %14, %Str %15)

;stmt5:
  %17 = load %TokenInfo*, %TokenInfo** %ti
  call void (%TokenInfo*) @show (%TokenInfo* %17)

;stmt6:
  %18 = bitcast [2 x %Nat8]* @func73_str3 to %Str
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)
  br label %endif_0
endif_0:

;stmt7:
  %20 = load %Nat32, %Nat32* @errcnt
  %21 = add %Nat32 %20, 1
  store %Nat32 %21, %Nat32* @errcnt

;stmt8:
  %22 = load %Nat32, %Nat32* @errcnt
  %23 = icmp ugt %Nat32 %22, 20
  br i1 %23, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %24 = bitcast [14 x %Nat8]* @func73_str4 to %Str
  %25 = call %Int32 (%Str, ...) @printf (%Str %24)

;stmt11:
  call void (%Int32) @exit (%Int32 -1)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @rem (%Str %_s, %TokenInfo* %_ti) {
  %s = alloca %Str
  store %Str %_s, %Str* %s
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = bitcast [17 x %Nat8]* @func74_str1 to %Str
  %2 = load %Str, %Str* %s
  %3 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 27, %Int32 33, %Str %2, %Int32 27)

;stmt1:
  %4 = load %TokenInfo*, %TokenInfo** %ti
  %5 = bitcast %TokenInfo* %4 to %Unit*
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = load %TokenInfo*, %TokenInfo** %ti
  call void (%TokenInfo*) @show (%TokenInfo* %8)

;stmt4:
  %9 = bitcast [2 x %Nat8]* @func74_str2 to %Str
  %10 = call %Int32 (%Str, ...) @printf (%Str %9)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @gline (%Nat8* %_line, %TokenInfo* %_ti) {
  %line = alloca %Nat8*
  store %Nat8* %_line, %Nat8** %line
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i32 0, i32 0 ; eval_access
  %3 = load %Str, %Str* %2
  %4 = call %Int32 (%Str, %Int32) @open (%Str %3, %Int32 0)

;stmt1:
  %5 = icmp slt %Int32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = load %TokenInfo*, %TokenInfo** %ti
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %7, i32 0, i32 1 ; eval_access
  %9 = load %Nat32, %Nat32* %8

;stmt5:
  %c = alloca %Nat8

;stmt6:
  %linecnt = alloca %Nat32

;stmt7:
  %pos = alloca %Nat32

;stmt8:
  store %Nat32 1, %Nat32* %linecnt

;stmt9:
  store %Nat32 0, %Nat32* %pos

;stmt10:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt11:

;stmt12:
  %10 = load %Nat32, %Nat32* %linecnt
  %11 = icmp eq %Nat32 %10, %9
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt13:

;stmt14:
  br label %continue_1
continue_1:
  br i1 1, label %body_1, label %break_1
body_1:

;stmt15:

;stmt16:
  %12 = getelementptr inbounds %Nat8, %Nat8* %c, i32 0 ; ref
  %13 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %4, %Nat8* %12, %Nat32 1)
  %14 = icmp eq %Int32 %13, 0
  br i1 %14, label %then_2, label %else_2
then_2:

;stmt17:

;stmt18:
  br label %exitt
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt19:
  %16 = load %Nat32, %Nat32* %pos
  %17 = load %Nat8*, %Nat8** %line
  %18 = getelementptr inbounds %Nat8, %Nat8* %17, %Nat32 %16 ; eval_index
  %19 = load %Nat8, %Nat8* %c
  store %Nat8 %19, %Nat8* %18

;stmt20:
  %20 = load %Nat32, %Nat32* %pos
  %21 = add %Nat32 %20, 1
  store %Nat32 %21, %Nat32* %pos

;stmt21:
  %22 = load %Nat8, %Nat8* %c
  %23 = bitcast [2 x %Nat8]* @func75_str1 to %Str
  %24 = getelementptr inbounds %Nat8, %Str %23, %Int32 0 ; eval_index
  %25 = load %Nat8, %Nat8* %24
  %26 = icmp eq %Nat8 %22, %25
  br i1 %26, label %then_3, label %else_3
then_3:

;stmt22:

;stmt23:
  br label %exitt
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %continue_1
break_1:
  br label %endif_1
else_1:

;stmt24:

;stmt25:
  %28 = getelementptr inbounds %Nat8, %Nat8* %c, i32 0 ; ref
  %29 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %4, %Nat8* %28, %Nat32 1)

;stmt26:
  %30 = load %Nat8, %Nat8* %c
  %31 = bitcast [2 x %Nat8]* @func75_str2 to %Str
  %32 = getelementptr inbounds %Nat8, %Str %31, %Int32 0 ; eval_index
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %30, %33
  br i1 %34, label %then_4, label %else_4
then_4:

;stmt27:

;stmt28:
  %35 = load %Nat32, %Nat32* %linecnt
  %36 = add %Nat32 %35, 1
  store %Nat32 %36, %Nat32* %linecnt
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt29:
  br label %exitt
exitt:

;stmt30:
  %37 = call %Int32 (%Int32) @close (%Int32 %4)

;stmt31:
  %38 = load %Nat32, %Nat32* %pos
  %39 = load %Nat8*, %Nat8** %line
  %40 = getelementptr inbounds %Nat8, %Nat8* %39, %Nat32 %38 ; eval_index
  store %Nat8 0, %Nat8* %40

;stmt32:
ret void
  ret void
}

define void @show (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = bitcast [2 x %Nat8]* @func76_str1 to %Str
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %line = alloca [512 x %Nat8]

;stmt2:
  %3 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %line, i32 0, %Int32 0 ; eval_index
  %4 = bitcast %Nat8* %3 to %Unit*
  %5 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %4, %Nat8 0, %Nat32 512)

;stmt3:
  %6 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %line, i32 0, %Int32 0 ; eval_index
  %7 = bitcast %Nat8* %6 to %Nat8*
  %8 = load %TokenInfo*, %TokenInfo** %ti
  call void (%Nat8*, %TokenInfo*) @gline (%Nat8* %7, %TokenInfo* %8)

;stmt4:
  %9 = bitcast [3 x %Nat8]* @func76_str2 to %Str
  %10 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %line, i32 0, %Int32 0 ; eval_index
  %11 = call %Int32 (%Str, ...) @printf (%Str %9, %Nat8* %10)

;stmt5:
  %vpos = alloca %Nat16

;stmt6:
  store %Nat16 1, %Nat16* %vpos

;stmt7:
  br label %continue_0
continue_0:
  %12 = load %Nat16, %Nat16* %vpos
  %13 = load %TokenInfo*, %TokenInfo** %ti
  %14 = getelementptr inbounds %TokenInfo, %TokenInfo* %13, i32 0, i32 2 ; eval_access
  %15 = load %Nat16, %Nat16* %14
  %16 = icmp ult %Nat16 %12, %15
  br i1 %16, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %17 = bitcast [2 x %Nat8]* @func76_str3 to %Str
  %18 = call %Int32 (%Str, ...) @printf (%Str %17)

;stmt10:
  %19 = load %Nat16, %Nat16* %vpos
  %20 = add %Nat16 %19, 1
  store %Nat16 %20, %Nat16* %vpos
  br label %continue_0
break_0:

;stmt11:
  %21 = bitcast [15 x %Nat8]* @func76_str4 to %Str
  %22 = call %Int32 (%Str, ...) @printf (%Str %21, %Int32 27, %Int32 32, %Int32 27)
  ret void
}

define void @fatal (%Str %_s) {
  %s = alloca %Str
  store %Str %_s, %Str* %s

;stmt0:
  %1 = bitcast [24 x %Nat8]* @func77_str1 to %Str
  %2 = load %Str, %Str* %s
  %3 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 27, %Int32 31, %Int32 27, %Str %2)

;stmt1:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define %Type* @type_new (%TypeKind %_k) {
  %k = alloca %TypeKind
  store %TypeKind %_k, %TypeKind* %k

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 184)
  %2 = bitcast %Unit* %1 to %Type*

;stmt1:
  %3 = bitcast %Type* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = bitcast [9 x %Nat8]* @func78_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Type* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 184)

;stmt3:
  %9 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 0 ; eval_access
  %10 = load %TypeKind, %TypeKind* %k
  store %TypeKind %10, %TypeKind* %9

;stmt4:
  %11 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 3 ; eval_access
  %12 = bitcast [14 x %Nat8]* @func78_str2 to %Str
  %13 = call %Nat64 (%Str) @get (%Str %12)
  %14 = trunc %Nat64 %13 to %Nat8
  store %Nat8 %14, %Nat8* %11

;stmt5:
  ret %Type* %2
}

define %Type* @type_basic_new (%Str %_id, %Nat32 %_size, %Nat32 %_p, %Bool %_i, %Bool %_s) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %size = alloca %Nat32
  store %Nat32 %_size, %Nat32* %size
  %p = alloca %Nat32
  store %Nat32 %_p, %Nat32* %p
  %i = alloca %Bool
  store %Bool %_i, %Bool* %i
  %s = alloca %Bool
  store %Bool %_s, %Bool* %s

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 3)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2 ; eval_access
  %3 = load %Nat32, %Nat32* %size
  store %Nat32 %3, %Nat32* %2

;stmt2:
  %4 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 1 ; eval_access
  %5 = load %Str, %Str* %id
  store %Str %5, %Str* %4

;stmt3:
  %6 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5 ; eval_access
  %7 = getelementptr inbounds %TypeBasic, %TypeBasic* %6, i32 0, i32 0 ; eval_access
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt4:
  %9 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5 ; eval_access
  %10 = getelementptr inbounds %TypeBasic, %TypeBasic* %9, i32 0, i32 1 ; eval_access
  %11 = load %Nat32, %Nat32* %p
  store %Nat32 %11, %Nat32* %10

;stmt5:
  %12 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5 ; eval_access
  %13 = getelementptr inbounds %TypeBasic, %TypeBasic* %12, i32 0, i32 2 ; eval_access
  %14 = load %Bool, %Bool* %i
  store %Bool %14, %Bool* %13

;stmt6:
  %15 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5 ; eval_access
  %16 = getelementptr inbounds %TypeBasic, %TypeBasic* %15, i32 0, i32 3 ; eval_access
  %17 = load %Bool, %Bool* %s
  store %Bool %17, %Bool* %16

;stmt7:
  ret %Type* %1
}

define %Bool @type_basic_eq (%TypeBasic* %_a, %TypeBasic* %_b) {
  %a = alloca %TypeBasic*
  store %TypeBasic* %_a, %TypeBasic** %a
  %b = alloca %TypeBasic*
  store %TypeBasic* %_b, %TypeBasic** %b

;stmt0:
  %1 = load %TypeBasic*, %TypeBasic** %a
  %2 = getelementptr inbounds %TypeBasic, %TypeBasic* %1, i32 0, i32 0 ; eval_access
  %3 = load %Str, %Str* %2
  %4 = load %TypeBasic*, %TypeBasic** %b
  %5 = getelementptr inbounds %TypeBasic, %TypeBasic* %4, i32 0, i32 0 ; eval_access
  %6 = load %Str, %Str* %5
  %7 = call %Int32 (%Str, %Str) @strcmp (%Str %3, %Str %6)
  %8 = icmp eq %Int32 %7, 0
  ret %Bool %8
}

define %Field* @field_new (%Str %_id, %Type* %_t, %TokenInfo* %_ti) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = bitcast %Field* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = bitcast [10 x %Nat8]* @func81_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %10 = load %Type*, %Type** %t
  store %Type* %10, %Type** %9

;stmt4:
  %11 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 2 ; eval_access
  store %Nat16 0, %Nat16* %11

;stmt5:
  %12 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 3 ; eval_access
  %13 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %13, %TokenInfo** %12

;stmt6:
  ret %Field* %2
}

define void @fpost (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %4 = load %Type*, %Type** %3

;stmt2:
  %5 = load %Unit*, %Unit** %ctx
  %6 = bitcast %Unit* %5 to %FieldHandleContext*

;stmt3:
  call void (%Type*) @type_undefined_check (%Type* %4)

;stmt4:
  %7 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 2 ; eval_access
  %8 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 0 ; eval_access
  %9 = load %Nat16, %Nat16* %8
  store %Nat16 %9, %Nat16* %7

;stmt5:
  %10 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 0 ; eval_access
  %11 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 0 ; eval_access
  %12 = load %Nat16, %Nat16* %11
  %13 = add %Nat16 %12, 1
  store %Nat16 %13, %Nat16* %10

;stmt6:
  %14 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 1 ; eval_access
  %15 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 1 ; eval_access
  %16 = load %Nat32, %Nat32* %15
  %17 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 2 ; eval_access
  %18 = load %Nat32, %Nat32* %17
  %19 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 2 ; eval_access
  %20 = load %Nat8, %Nat8* %19
  %21 = call %Nat32 (%Nat32, %Nat8) @alignment (%Nat32 %18, %Nat8 %20)
  %22 = add %Nat32 %16, %21
  store %Nat32 %22, %Nat32* %14
  ret void
}

define %Type* @type_record_new (%List* %_fields) {
  %fields = alloca %List*
  store %List* %_fields, %List** %fields

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 6)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 9 ; eval_access
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %2, i32 0, i32 1 ; eval_access
  %4 = call %Nat32 () @get_uid ()
  store %Nat32 %4, %Nat32* %3

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 9 ; eval_access
  %6 = getelementptr inbounds %TypeRecord, %TypeRecord* %5, i32 0, i32 0 ; eval_access
  %7 = load %List*, %List** %fields
  store %List* %7, %List** %6

;stmt3:
  %fhc = alloca %FieldHandleContext

;stmt4:
  %8 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 1 ; eval_access
  store %Nat32 0, %Nat32* %8

;stmt5:
  %9 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 0 ; eval_access
  store %Nat16 0, %Nat16* %9

;stmt6:
  %10 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 2 ; eval_access
  %11 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 3 ; eval_access
  %12 = load %Nat8, %Nat8* %11
  store %Nat8 %12, %Nat8* %10

;stmt7:
  %13 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 9 ; eval_access
  %14 = getelementptr inbounds %TypeRecord, %TypeRecord* %13, i32 0, i32 0 ; eval_access
  %15 = load %List*, %List** %14
  %16 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0 ; ref
  %17 = bitcast %FieldHandleContext* %16 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %15, %ListForeachHandler @fpost, %Unit* %17)

;stmt8:
  %18 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2 ; eval_access
  %19 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 1 ; eval_access
  %20 = load %Nat32, %Nat32* %19
  store %Nat32 %20, %Nat32* %18

;stmt9:
  ret %Type* %1
}

define %Unit* @fsearch2 (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = load %Unit*, %Unit** %ctx
  %4 = bitcast %Unit* %3 to %Str

;stmt2:
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %6 = load %Str, %Str* %5
  %7 = call %Int32 (%Str, %Str) @strcmp (%Str %6, %Str %4)
  %8 = icmp eq %Int32 %7, 0
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %9 = bitcast %Field* %2 to %Unit*
  ret %Unit* %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %11 = inttoptr %Nat32 0 to %Unit*
  ret %Unit* %11
}

define %Field* @type_record_get_field (%Type* %_t, %Str %_field_id) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %field_id = alloca %Str
  store %Str %_field_id, %Str* %field_id

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 9 ; eval_access
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %2, i32 0, i32 0 ; eval_access
  %4 = load %List*, %List** %3
  %5 = load %Str, %Str* %field_id
  %6 = bitcast %Str %5 to %Unit*
  %7 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %4, %ListSearchHandler @fsearch2, %Unit* %6)
  %8 = bitcast %Unit* %7 to %Field*
  ret %Field* %8
}

define %Bool @check_fields (%Unit* %_data1, %Unit* %_data2, %Unit* %_ctx, %Nat32 %_index) {
  %data1 = alloca %Unit*
  store %Unit* %_data1, %Unit** %data1
  %data2 = alloca %Unit*
  store %Unit* %_data2, %Unit** %data2
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data1
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = load %Unit*, %Unit** %data2
  %4 = bitcast %Unit* %3 to %Field*

;stmt2:
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %6 = load %Str, %Str* %5
  %7 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0 ; eval_access
  %8 = load %Str, %Str* %7
  %9 = call %Int32 (%Str, %Str) @strcmp (%Str %6, %Str %8)
  %10 = icmp ne %Int32 %9, 0
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %12 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %13 = load %Type*, %Type** %12
  %14 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1 ; eval_access
  %15 = load %Type*, %Type** %14
  %16 = call %Bool (%Type*, %Type*) @type_eq (%Type* %13, %Type* %15)
  ret %Bool %16
}

define %Bool @type_record_eq (%TypeRecord* %_a, %TypeRecord* %_b) {
  %a = alloca %TypeRecord*
  store %TypeRecord* %_a, %TypeRecord** %a
  %b = alloca %TypeRecord*
  store %TypeRecord* %_b, %TypeRecord** %b

;stmt0:
  %1 = load %TypeRecord*, %TypeRecord** %a
  %2 = getelementptr inbounds %TypeRecord, %TypeRecord* %1, i32 0, i32 0 ; eval_access
  %3 = load %List*, %List** %2
  %4 = load %TypeRecord*, %TypeRecord** %b
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %4, i32 0, i32 0 ; eval_access
  %6 = load %List*, %List** %5
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = call %Bool (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %3, %List* %6, %ListCompareHandler @check_fields, %Unit* %7)
  ret %Bool %8
}

define void @create_constructor (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %EnumConstructor*

;stmt1:
  %3 = load %Unit*, %Unit** %ctx
  %4 = bitcast %Unit* %3 to %Type*

;stmt2:
  %5 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %2, i32 0, i32 1 ; eval_access
  %6 = load %Int64, %Int64* %5
  %7 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %4, %Int64 %6)

;stmt3:
  %8 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %2, i32 0, i32 0 ; eval_access
  %9 = load %Str, %Str* %8
  call void (%Str, %Value*) @bind_value (%Str %9, %Value* %7)
  ret void
}

define %Type* @type_enum_new (%List* %_constructors) {
  %constructors = alloca %List*
  store %List* %_constructors, %List** %constructors

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 5)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 10 ; eval_access
  %3 = getelementptr inbounds %TypeEnum, %TypeEnum* %2, i32 0, i32 1 ; eval_access
  %4 = call %Nat32 () @get_uid ()
  store %Nat32 %4, %Nat32* %3

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2 ; eval_access
  %6 = bitcast [9 x %Nat8]* @func88_str1 to %Str
  %7 = call %Nat64 (%Str) @get (%Str %6)
  %8 = trunc %Nat64 %7 to %Nat32
  store %Nat32 %8, %Nat32* %5

;stmt3:
  %9 = load %List*, %List** %constructors
  %10 = bitcast %Type* %1 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %9, %ListForeachHandler @create_constructor, %Unit* %10)

;stmt4:
  ret %Type* %1
}

define %Bool @type_enum_eq (%TypeEnum* %_a, %TypeEnum* %_b) {
  %a = alloca %TypeEnum*
  store %TypeEnum* %_a, %TypeEnum** %a
  %b = alloca %TypeEnum*
  store %TypeEnum* %_b, %TypeEnum** %b

;stmt0:
  %1 = load %TypeEnum*, %TypeEnum** %a
  %2 = getelementptr inbounds %TypeEnum, %TypeEnum* %1, i32 0, i32 1 ; eval_access
  %3 = load %Nat32, %Nat32* %2
  %4 = load %TypeEnum*, %TypeEnum** %b
  %5 = getelementptr inbounds %TypeEnum, %TypeEnum* %4, i32 0, i32 1 ; eval_access
  %6 = load %Nat32, %Nat32* %5
  %7 = icmp eq %Nat32 %3, %6
  ret %Bool %7
}

define %Type* @type_array_new (%Type* %_of, %Nat32 %_volume, %Bool %_undefined) {
  %of = alloca %Type*
  store %Type* %_of, %Type** %of
  %volume = alloca %Nat32
  store %Nat32 %_volume, %Nat32* %volume
  %undefined = alloca %Bool
  store %Bool %_undefined, %Bool* %undefined

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 8)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8 ; eval_access
  %3 = getelementptr inbounds %TypeArray, %TypeArray* %2, i32 0, i32 0 ; eval_access
  %4 = load %Type*, %Type** %of
  store %Type* %4, %Type** %3

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8 ; eval_access
  %6 = getelementptr inbounds %TypeArray, %TypeArray* %5, i32 0, i32 1 ; eval_access
  %7 = load %Nat32, %Nat32* %volume
  store %Nat32 %7, %Nat32* %6

;stmt3:
  %8 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8 ; eval_access
  %9 = getelementptr inbounds %TypeArray, %TypeArray* %8, i32 0, i32 2 ; eval_access
  %10 = load %Bool, %Bool* %undefined
  store %Bool %10, %Bool* %9

;stmt4:
  %11 = load %Bool, %Bool* %undefined
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %12 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2 ; eval_access
  %13 = bitcast [12 x %Nat8]* @func91_str1 to %Str
  %14 = call %Nat64 (%Str) @get (%Str %13)
  %15 = trunc %Nat64 %14 to %Nat32
  store %Nat32 %15, %Nat32* %12
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %16 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2 ; eval_access
  %17 = load %Nat32, %Nat32* %volume
  %18 = load %Type*, %Type** %of
  %19 = getelementptr inbounds %Type, %Type* %18, i32 0, i32 2 ; eval_access
  %20 = load %Nat32, %Nat32* %19
  %21 = mul %Nat32 %17, %20
  store %Nat32 %21, %Nat32* %16
  br label %endif_0
endif_0:

;stmt9:
  ret %Type* %1
}

define %Bool @type_array_eq (%TypeArray* %_a, %TypeArray* %_b) {
  %a = alloca %TypeArray*
  store %TypeArray* %_a, %TypeArray** %a
  %b = alloca %TypeArray*
  store %TypeArray* %_b, %TypeArray** %b

;stmt0:
  %1 = load %TypeArray*, %TypeArray** %a
  %2 = getelementptr inbounds %TypeArray, %TypeArray* %1, i32 0, i32 0 ; eval_access
  %3 = load %Type*, %Type** %2
  %4 = load %TypeArray*, %TypeArray** %b
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %4, i32 0, i32 0 ; eval_access
  %6 = load %Type*, %Type** %5
  %7 = call %Bool (%Type*, %Type*) @type_eq (%Type* %3, %Type* %6)
  %8 = xor %Bool %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %10 = load %TypeArray*, %TypeArray** %a
  %11 = getelementptr inbounds %TypeArray, %TypeArray* %10, i32 0, i32 2 ; eval_access
  %12 = load %Bool, %Bool* %11
  %13 = load %TypeArray*, %TypeArray** %b
  %14 = getelementptr inbounds %TypeArray, %TypeArray* %13, i32 0, i32 2 ; eval_access
  %15 = load %Bool, %Bool* %14
  %16 = and %Bool %12, %15
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %18 = load %TypeArray*, %TypeArray** %a
  %19 = getelementptr inbounds %TypeArray, %TypeArray* %18, i32 0, i32 2 ; eval_access
  %20 = load %Bool, %Bool* %19
  %21 = load %TypeArray*, %TypeArray** %b
  %22 = getelementptr inbounds %TypeArray, %TypeArray* %21, i32 0, i32 2 ; eval_access
  %23 = load %Bool, %Bool* %22
  %24 = or %Bool %20, %23
  br i1 %24, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  ret %Bool 0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt9:
  %26 = load %TypeArray*, %TypeArray** %a
  %27 = getelementptr inbounds %TypeArray, %TypeArray* %26, i32 0, i32 1 ; eval_access
  %28 = load %Nat32, %Nat32* %27
  %29 = load %TypeArray*, %TypeArray** %b
  %30 = getelementptr inbounds %TypeArray, %TypeArray* %29, i32 0, i32 1 ; eval_access
  %31 = load %Nat32, %Nat32* %30
  %32 = icmp eq %Nat32 %28, %31
  br i1 %32, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  ret %Bool 1
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt12:
  ret %Bool 0
}

define %Type* @type_pointer_new (%Type* %_to) {
  %to = alloca %Type*
  store %Type* %_to, %Type** %to

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 7)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 7 ; eval_access
  %3 = getelementptr inbounds %TypePointer, %TypePointer* %2, i32 0, i32 0 ; eval_access
  %4 = load %Type*, %Type** %to
  store %Type* %4, %Type** %3

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2 ; eval_access
  %6 = bitcast [12 x %Nat8]* @func93_str1 to %Str
  %7 = call %Nat64 (%Str) @get (%Str %6)
  %8 = trunc %Nat64 %7 to %Nat32
  store %Nat32 %8, %Nat32* %5

;stmt3:
  ret %Type* %1
}

define %Bool @type_pointer_eq (%TypePointer* %_a, %TypePointer* %_b) {
  %a = alloca %TypePointer*
  store %TypePointer* %_a, %TypePointer** %a
  %b = alloca %TypePointer*
  store %TypePointer* %_b, %TypePointer** %b

;stmt0:
  %1 = load %TypePointer*, %TypePointer** %a
  %2 = getelementptr inbounds %TypePointer, %TypePointer* %1, i32 0, i32 0 ; eval_access
  %3 = load %Type*, %Type** %2
  %4 = load %TypePointer*, %TypePointer** %b
  %5 = getelementptr inbounds %TypePointer, %TypePointer* %4, i32 0, i32 0 ; eval_access
  %6 = load %Type*, %Type** %5
  %7 = call %Bool (%Type*, %Type*) @type_eq (%Type* %3, %Type* %6)
  ret %Bool %7
}

define %Type* @type_func_new (%List* %_params, %Type* %_rettype, %Bool %_arghack) {
  %params = alloca %List*
  store %List* %_params, %List** %params
  %rettype = alloca %Type*
  store %Type* %_rettype, %Type** %rettype
  %arghack = alloca %Bool
  store %Bool %_arghack, %Bool* %arghack

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 4)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2 ; eval_access
  %3 = bitcast [12 x %Nat8]* @func95_str1 to %Str
  %4 = call %Nat64 (%Str) @get (%Str %3)
  %5 = trunc %Nat64 %4 to %Nat32
  store %Nat32 %5, %Nat32* %2

;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6 ; eval_access
  %7 = getelementptr inbounds %TypeFunc, %TypeFunc* %6, i32 0, i32 0 ; eval_access
  %8 = load %List*, %List** %params
  store %List* %8, %List** %7

;stmt3:
  %9 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6 ; eval_access
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %9, i32 0, i32 1 ; eval_access
  %11 = load %Type*, %Type** %rettype
  store %Type* %11, %Type** %10

;stmt4:
  %12 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6 ; eval_access
  %13 = getelementptr inbounds %TypeFunc, %TypeFunc* %12, i32 0, i32 2 ; eval_access
  %14 = load %Bool, %Bool* %arghack
  store %Bool %14, %Bool* %13

;stmt5:
  ret %Type* %1
}

define %Bool @check_param (%Unit* %_data1, %Unit* %_data2, %Unit* %_ctx, %Nat32 %_index) {
  %data1 = alloca %Unit*
  store %Unit* %_data1, %Unit** %data1
  %data2 = alloca %Unit*
  store %Unit* %_data2, %Unit** %data2
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data1
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = load %Unit*, %Unit** %data2
  %4 = bitcast %Unit* %3 to %Field*

;stmt2:
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %6 = load %Str, %Str* %5
  %7 = bitcast %Str %6 to %Unit*
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  %10 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0 ; eval_access
  %11 = load %Str, %Str* %10
  %12 = bitcast %Str %11 to %Unit*
  %13 = inttoptr %Nat32 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  %15 = and %Bool %9, %14
  br i1 %15, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %16 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %17 = load %Str, %Str* %16
  %18 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0 ; eval_access
  %19 = load %Str, %Str* %18
  %20 = call %Int32 (%Str, %Str) @strcmp (%Str %17, %Str %19)
  %21 = icmp ne %Int32 %20, 0
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  ret %Bool 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %23 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %24 = load %Type*, %Type** %23
  %25 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1 ; eval_access
  %26 = load %Type*, %Type** %25
  %27 = call %Bool (%Type*, %Type*) @type_eq (%Type* %24, %Type* %26)
  ret %Bool %27
}

define %Bool @type_function_eq (%TypeFunc* %_a, %TypeFunc* %_b) {
  %a = alloca %TypeFunc*
  store %TypeFunc* %_a, %TypeFunc** %a
  %b = alloca %TypeFunc*
  store %TypeFunc* %_b, %TypeFunc** %b

;stmt0:
  %1 = load %TypeFunc*, %TypeFunc** %a
  %2 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i32 0, i32 1 ; eval_access
  %3 = load %Type*, %Type** %2
  %4 = load %TypeFunc*, %TypeFunc** %b
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %4, i32 0, i32 1 ; eval_access
  %6 = load %Type*, %Type** %5
  %7 = call %Bool (%Type*, %Type*) @type_eq (%Type* %3, %Type* %6)
  %8 = xor %Bool %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %10 = load %TypeFunc*, %TypeFunc** %a
  %11 = getelementptr inbounds %TypeFunc, %TypeFunc* %10, i32 0, i32 0 ; eval_access
  %12 = load %List*, %List** %11
  %13 = load %TypeFunc*, %TypeFunc** %b
  %14 = getelementptr inbounds %TypeFunc, %TypeFunc* %13, i32 0, i32 0 ; eval_access
  %15 = load %List*, %List** %14
  %16 = inttoptr %Nat32 0 to %Unit*
  %17 = call %Bool (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %12, %List* %15, %ListCompareHandler @check_param, %Unit* %16)
  ret %Bool %17
}

define void @foreach_func_param (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %4 = load %Type*, %Type** %3
  call void (%Type*) @type_undefined_check (%Type* %4)
  ret void
}

define void @foreach_struct_field (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0 ; eval_access
  %6 = load %TypeKind, %TypeKind* %5
  %7 = icmp eq %TypeKind %6, 2
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = bitcast [15 x %Nat8]* @func100_str1 to %Str
  %9 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %10 = load %Type*, %Type** %9
  %11 = getelementptr inbounds %Type, %Type* %10, i32 0, i32 13 ; eval_access
  %12 = load %TokenInfo*, %TokenInfo** %11
  call void (%Str, %TokenInfo*) @error (%Str %8, %TokenInfo* %12)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @type_undefined_check (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = call %Bool (%Type*) @type_is_basic (%Type* %1)
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:
  br label %endif_0
else_0:

;stmt2:
  %3 = load %Type*, %Type** %t
  %4 = call %Bool (%Type*) @type_is_pointer (%Type* %3)
  br i1 %4, label %then_1, label %else_1
then_1:

;stmt3:

;stmt4:
  %5 = load %Type*, %Type** %t
  %6 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 7 ; eval_access
  %7 = getelementptr inbounds %TypePointer, %TypePointer* %6, i32 0, i32 0 ; eval_access
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 0 ; eval_access
  %10 = load %TypeKind, %TypeKind* %9
  %11 = icmp eq %TypeKind %10, 2
  br i1 %11, label %then_2, label %else_2
then_2:

;stmt5:
  br label %endif_2
else_2:

;stmt6:

;stmt7:
  %12 = load %Type*, %Type** %t
  %13 = getelementptr inbounds %Type, %Type* %12, i32 0, i32 7 ; eval_access
  %14 = getelementptr inbounds %TypePointer, %TypePointer* %13, i32 0, i32 0 ; eval_access
  %15 = load %Type*, %Type** %14
  call void (%Type*) @type_undefined_check (%Type* %15)
  br label %endif_2
endif_2:
  br label %endif_1
else_1:

;stmt8:
  %16 = load %Type*, %Type** %t
  %17 = call %Bool (%Type*) @type_is_array (%Type* %16)
  br i1 %17, label %then_3, label %else_3
then_3:

;stmt9:

;stmt10:
  %18 = load %Type*, %Type** %t
  %19 = getelementptr inbounds %Type, %Type* %18, i32 0, i32 8 ; eval_access
  %20 = getelementptr inbounds %TypeArray, %TypeArray* %19, i32 0, i32 0 ; eval_access
  %21 = load %Type*, %Type** %20
  call void (%Type*) @type_undefined_check (%Type* %21)
  br label %endif_3
else_3:

;stmt11:
  %22 = load %Type*, %Type** %t
  %23 = call %Bool (%Type*) @type_is_function (%Type* %22)
  br i1 %23, label %then_4, label %else_4
then_4:

;stmt12:

;stmt13:
  %24 = load %Type*, %Type** %t
  %25 = getelementptr inbounds %Type, %Type* %24, i32 0, i32 6 ; eval_access
  %26 = getelementptr inbounds %TypeFunc, %TypeFunc* %25, i32 0, i32 1 ; eval_access
  %27 = load %Type*, %Type** %26
  call void (%Type*) @type_undefined_check (%Type* %27)

;stmt14:
  %28 = load %Type*, %Type** %t
  %29 = getelementptr inbounds %Type, %Type* %28, i32 0, i32 6 ; eval_access
  %30 = getelementptr inbounds %TypeFunc, %TypeFunc* %29, i32 0, i32 0 ; eval_access
  %31 = load %List*, %List** %30
  %32 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %31, %ListForeachHandler @foreach_func_param, %Unit* %32)
  br label %endif_4
else_4:

;stmt15:
  %33 = load %Type*, %Type** %t
  %34 = call %Bool (%Type*) @type_is_record (%Type* %33)
  br i1 %34, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %35 = load %Type*, %Type** %t
  %36 = getelementptr inbounds %Type, %Type* %35, i32 0, i32 9 ; eval_access
  %37 = getelementptr inbounds %TypeRecord, %TypeRecord* %36, i32 0, i32 0 ; eval_access
  %38 = load %List*, %List** %37
  %39 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %38, %ListForeachHandler @foreach_struct_field, %Unit* %39)
  br label %endif_5
else_5:

;stmt18:
  %40 = load %Type*, %Type** %t
  %41 = call %Bool (%Type*) @type_is_enum (%Type* %40)
  br i1 %41, label %then_6, label %else_6
then_6:

;stmt19:
  br label %endif_6
else_6:

;stmt20:
  %42 = load %Type*, %Type** %t
  %43 = getelementptr inbounds %Type, %Type* %42, i32 0, i32 0 ; eval_access
  %44 = load %TypeKind, %TypeKind* %43
  %45 = icmp eq %TypeKind %44, 2
  br i1 %45, label %then_7, label %else_7
then_7:

;stmt21:

;stmt22:
  %46 = bitcast [36 x %Nat8]* @func98_str1 to %Str
  %47 = load %Type*, %Type** %t
  %48 = getelementptr inbounds %Type, %Type* %47, i32 0, i32 13 ; eval_access
  %49 = load %TokenInfo*, %TokenInfo** %48
  call void (%Str, %TokenInfo*) @error (%Str %46, %TokenInfo* %49)
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  ret void
}

define %Bool @type_eq (%Type* %_a, %Type* %_b) {
  %a = alloca %Type*
  store %Type* %_a, %Type** %a
  %b = alloca %Type*
  store %Type* %_b, %Type** %b

;stmt0:
  %1 = load %Type*, %Type** %a
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0 ; eval_access
  %3 = load %TypeKind, %TypeKind* %2
  %4 = load %Type*, %Type** %b
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0 ; eval_access
  %6 = load %TypeKind, %TypeKind* %5
  %7 = icmp ne %TypeKind %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = load %Type*, %Type** %a
  %10 = getelementptr inbounds %Type, %Type* %9, i32 0, i32 1 ; eval_access
  %11 = load %Str, %Str* %10
  %12 = bitcast %Str %11 to %Unit*
  %13 = inttoptr %Nat32 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  %15 = load %Type*, %Type** %b
  %16 = getelementptr inbounds %Type, %Type* %15, i32 0, i32 1 ; eval_access
  %17 = load %Str, %Str* %16
  %18 = bitcast %Str %17 to %Unit*
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = icmp ne %Unit* %18, %19
  %21 = and %Bool %14, %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %22 = load %Type*, %Type** %a
  %23 = getelementptr inbounds %Type, %Type* %22, i32 0, i32 1 ; eval_access
  %24 = load %Str, %Str* %23
  %25 = load %Type*, %Type** %b
  %26 = getelementptr inbounds %Type, %Type* %25, i32 0, i32 1 ; eval_access
  %27 = load %Str, %Str* %26
  %28 = call %Int32 (%Str, %Str) @strcmp (%Str %24, %Str %27)
  %29 = icmp eq %Int32 %28, 0
  br i1 %29, label %then_2, label %else_2
then_2:

;stmt6:

;stmt7:
  ret %Bool 1
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt8:
  %31 = load %Type*, %Type** %a
  %32 = getelementptr inbounds %Type, %Type* %31, i32 0, i32 0 ; eval_access
  %33 = load %TypeKind, %TypeKind* %32

;stmt9:
  %34 = icmp eq %TypeKind %33, 3
  br i1 %34, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %35 = load %Type*, %Type** %a
  %36 = getelementptr inbounds %Type, %Type* %35, i32 0, i32 5 ; eval_access
  %37 = load %Type*, %Type** %b
  %38 = getelementptr inbounds %Type, %Type* %37, i32 0, i32 5 ; eval_access
  %39 = call %Bool (%TypeBasic*, %TypeBasic*) @type_basic_eq (%TypeBasic* %36, %TypeBasic* %38)
  ret %Bool %39
  br label %endif_3
else_3:

;stmt12:
  %41 = icmp eq %TypeKind %33, 7
  br i1 %41, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %42 = load %Type*, %Type** %a
  %43 = getelementptr inbounds %Type, %Type* %42, i32 0, i32 7 ; eval_access
  %44 = load %Type*, %Type** %b
  %45 = getelementptr inbounds %Type, %Type* %44, i32 0, i32 7 ; eval_access
  %46 = call %Bool (%TypePointer*, %TypePointer*) @type_pointer_eq (%TypePointer* %43, %TypePointer* %45)
  ret %Bool %46
  br label %endif_4
else_4:

;stmt15:
  %48 = icmp eq %TypeKind %33, 8
  br i1 %48, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %49 = load %Type*, %Type** %a
  %50 = getelementptr inbounds %Type, %Type* %49, i32 0, i32 8 ; eval_access
  %51 = load %Type*, %Type** %b
  %52 = getelementptr inbounds %Type, %Type* %51, i32 0, i32 8 ; eval_access
  %53 = call %Bool (%TypeArray*, %TypeArray*) @type_array_eq (%TypeArray* %50, %TypeArray* %52)
  ret %Bool %53
  br label %endif_5
else_5:

;stmt18:
  %55 = icmp eq %TypeKind %33, 4
  br i1 %55, label %then_6, label %else_6
then_6:

;stmt19:

;stmt20:
  %56 = load %Type*, %Type** %a
  %57 = getelementptr inbounds %Type, %Type* %56, i32 0, i32 6 ; eval_access
  %58 = load %Type*, %Type** %b
  %59 = getelementptr inbounds %Type, %Type* %58, i32 0, i32 6 ; eval_access
  %60 = call %Bool (%TypeFunc*, %TypeFunc*) @type_function_eq (%TypeFunc* %57, %TypeFunc* %59)
  ret %Bool %60
  br label %endif_6
else_6:

;stmt21:
  %62 = icmp eq %TypeKind %33, 6
  br i1 %62, label %then_7, label %else_7
then_7:

;stmt22:

;stmt23:
  %63 = load %Type*, %Type** %a
  %64 = getelementptr inbounds %Type, %Type* %63, i32 0, i32 9 ; eval_access
  %65 = load %Type*, %Type** %b
  %66 = getelementptr inbounds %Type, %Type* %65, i32 0, i32 9 ; eval_access
  %67 = call %Bool (%TypeRecord*, %TypeRecord*) @type_record_eq (%TypeRecord* %64, %TypeRecord* %66)
  ret %Bool %67
  br label %endif_7
else_7:

;stmt24:
  %69 = icmp eq %TypeKind %33, 5
  br i1 %69, label %then_8, label %else_8
then_8:

;stmt25:

;stmt26:
  %70 = load %Type*, %Type** %a
  %71 = getelementptr inbounds %Type, %Type* %70, i32 0, i32 10 ; eval_access
  %72 = load %Type*, %Type** %b
  %73 = getelementptr inbounds %Type, %Type* %72, i32 0, i32 10 ; eval_access
  %74 = call %Bool (%TypeEnum*, %TypeEnum*) @type_enum_eq (%TypeEnum* %71, %TypeEnum* %73)
  ret %Bool %74
  br label %endif_8
else_8:

;stmt27:
  %76 = icmp eq %TypeKind %33, 1
  br i1 %76, label %then_9, label %else_9
then_9:

;stmt28:

;stmt29:
  %77 = load %Type*, %Type** %b
  %78 = getelementptr inbounds %Type, %Type* %77, i32 0, i32 0 ; eval_access
  %79 = load %TypeKind, %TypeKind* %78
  %80 = icmp eq %TypeKind %79, 1
  ret %Bool %80
  br label %endif_9
else_9:
  br label %endif_9
endif_9:
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:

;stmt30:
  %82 = bitcast [26 x %Nat8]* @func101_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool 0, %Str %82)

;stmt31:
  ret %Bool 0
}

define %Type* @type_new_undefined (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 2)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 4 ; eval_access
  %3 = getelementptr inbounds %TypeUndefined, %TypeUndefined* %2, i32 0, i32 0 ; eval_access
  %4 = load %Str, %Str* %id
  store %Str %4, %Str* %3

;stmt2:
  %5 = load %Str, %Str* %id
  call void (%Str, %Type*) @bind_type_global (%Str %5, %Type* %1)

;stmt3:
  ret %Type* %1
}

define %Bool @type_is_basic (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0 ; eval_access
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 3
  ret %Bool %4
}

define %Bool @type_is_function (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0 ; eval_access
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 4
  ret %Bool %4
}

define %Bool @type_is_record (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0 ; eval_access
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 6
  ret %Bool %4
}

define %Bool @type_is_enum (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0 ; eval_access
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 5
  ret %Bool %4
}

define %Bool @type_is_pointer (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0 ; eval_access
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 7
  ret %Bool %4
}

define %Bool @type_is_array (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0 ; eval_access
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 8
  ret %Bool %4
}

define %Bool @type_is_basic_integer (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0 ; eval_access
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = load %Type*, %Type** %t
  %6 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 5 ; eval_access
  %7 = getelementptr inbounds %TypeBasic, %TypeBasic* %6, i32 0, i32 2 ; eval_access
  %8 = load %Bool, %Bool* %7
  ret %Bool %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  ret %Bool 0
}

define %Nat32 @get_uid () {

;stmt0:
  %1 = load %Nat32, %Nat32* @x_uid

;stmt1:
  %2 = load %Nat32, %Nat32* @x_uid
  %3 = add %Nat32 %2, 1
  store %Nat32 %3, %Nat32* @x_uid

;stmt2:
  ret %Nat32 %1
}

define %Nat32 @alignment (%Nat32 %_req_sz, %Nat8 %_align) {
  %req_sz = alloca %Nat32
  store %Nat32 %_req_sz, %Nat32* %req_sz
  %align = alloca %Nat8
  store %Nat8 %_align, %Nat8* %align

;stmt0:
  %sz = alloca %Nat32

;stmt1:
  %1 = load %Nat32, %Nat32* %req_sz
  store %Nat32 %1, %Nat32* %sz

;stmt2:
  br label %continue_0
continue_0:
  %2 = load %Nat32, %Nat32* %sz
  %3 = load %Nat8, %Nat8* %align
  %4 = zext %Nat8 %3 to %Nat32
  %5 = urem %Nat32 %2, %4
  %6 = icmp ne %Nat32 %5, 0
  br i1 %6, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %7 = load %Nat32, %Nat32* %sz
  %8 = add %Nat32 %7, 1
  store %Nat32 %8, %Nat32* %sz
  br label %continue_0
break_0:

;stmt5:
  %9 = load %Nat32, %Nat32* %sz
  ret %Nat32 %9
}

define %Bool @storage_is_const (%Storage* %_s) {
  %s = alloca %Storage*
  store %Storage* %_s, %Storage** %s

;stmt0:
  %1 = load %Storage*, %Storage** %s
  %2 = getelementptr inbounds %Storage, %Storage* %1, i32 0, i32 0 ; eval_access
  %3 = load %StorageClass, %StorageClass* %2

;stmt1:
  %4 = icmp eq %StorageClass %3, 1
  %5 = icmp eq %StorageClass %3, 2
  %6 = icmp eq %StorageClass %3, 3
  %7 = icmp eq %StorageClass %3, 4
  %8 = icmp eq %StorageClass %3, 5
  %9 = or %Bool %7, %8
  %10 = or %Bool %6, %9
  %11 = or %Bool %5, %10
  %12 = or %Bool %4, %11

;stmt2:
  ret %Bool %12
}

define %Bool @storageIsRegister (%Storage* %_s) {
  %s = alloca %Storage*
  store %Storage* %_s, %Storage** %s

;stmt0:
  %1 = load %Storage*, %Storage** %s
  %2 = getelementptr inbounds %Storage, %Storage* %1, i32 0, i32 0 ; eval_access
  %3 = load %StorageClass, %StorageClass* %2
  %4 = icmp eq %StorageClass %3, 9
  ret %Bool %4
}

define %Bool @storageIsMutable (%Storage* %_s) {
  %s = alloca %Storage*
  store %Storage* %_s, %Storage** %s

;stmt0:
  %1 = load %Storage*, %Storage** %s
  %2 = getelementptr inbounds %Storage, %Storage* %1, i32 0, i32 0 ; eval_access
  %3 = load %StorageClass, %StorageClass* %2

;stmt1:
  %4 = icmp eq %StorageClass %3, 6
  %5 = icmp eq %StorageClass %3, 7
  %6 = icmp eq %StorageClass %3, 8
  %7 = or %Bool %5, %6
  %8 = or %Bool %4, %7
  ret %Bool %8
}

define %Value* @value_new (%ValueKind %_k, %Type* %_t, %Value* %_l, %Value* %_r) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 144)
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = bitcast [10 x %Nat8]* @func115_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Value* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 144)

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 0 ; eval_access
  %10 = load %ValueKind, %ValueKind* %k
  store %ValueKind %10, %ValueKind* %9

;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 3 ; eval_access
  %12 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %11, i32 0, %Int32 0 ; eval_index
  %13 = load %Value*, %Value** %l
  store %Value* %13, %Value** %12

;stmt5:
  %14 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 3 ; eval_access
  %15 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %14, i32 0, %Int32 1 ; eval_index
  %16 = load %Value*, %Value** %r
  store %Value* %16, %Value** %15

;stmt6:
  %17 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 1 ; eval_access
  %18 = load %Type*, %Type** %t
  store %Type* %18, %Type** %17

;stmt7:
  %19 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2 ; eval_access
  %20 = getelementptr inbounds %Storage, %Storage* %19, i32 0, i32 0 ; eval_access
  store %StorageClass 0, %StorageClass* %20

;stmt8:
  ret %Value* %2
}

define %Bool @value_is_const (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2 ; eval_access
  %3 = call %Bool (%Storage*) @storage_is_const (%Storage* %2)
  ret %Bool %3
}

define %Value* @valueFreePtr2 () {

;stmt0:
  %1 = load %Type*, %Type** @typeBaseNat
  %2 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %1, %Int64 0)

;stmt1:
  %3 = load %Type*, %Type** @typeFreePtr
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = bitcast %Unit* %4 to %Value*
  %6 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_register (%ValueKind 25, %Type* %3, %Value* %2, %Value* %5)

;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 7 ; eval_access
  %8 = load %Type*, %Type** @typeFreePtr
  store %Type* %8, %Type** %7

;stmt3:
  ret %Value* %6
}

define %Value* @value_new_register (%ValueKind %_k, %Type* %_t, %Value* %_l, %Value* %_r) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r

;stmt0:
  %1 = load %ValueKind, %ValueKind* %k
  %2 = load %Type*, %Type** %t
  %3 = load %Value*, %Value** %l
  %4 = load %Value*, %Value** %r
  %5 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind %1, %Type* %2, %Value* %3, %Value* %4)

;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 2 ; eval_access
  %7 = getelementptr inbounds %Storage, %Storage* %6, i32 0, i32 0 ; eval_access
  store %StorageClass 9, %StorageClass* %7

;stmt2:
  ret %Value* %5
}

define %Value* @value_new_address (%ValueKind %_k, %Type* %_t, %Value* %_l, %Value* %_r) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r

;stmt0:
  %1 = load %ValueKind, %ValueKind* %k
  %2 = load %Type*, %Type** %t
  %3 = load %Value*, %Value** %l
  %4 = load %Value*, %Value** %r
  %5 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind %1, %Type* %2, %Value* %3, %Value* %4)

;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 2 ; eval_access
  %7 = getelementptr inbounds %Storage, %Storage* %6, i32 0, i32 0 ; eval_access
  store %StorageClass 8, %StorageClass* %7

;stmt2:
  ret %Value* %5
}

define %Value* @value_new_imm_const (%Type* %_t, %Int64 %_dx) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %dx = alloca %Int64
  store %Int64 %_dx, %Int64* %dx

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = inttoptr %Nat32 0 to %Unit*
  %3 = bitcast %Unit* %2 to %Value*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = bitcast %Unit* %4 to %Value*
  %6 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 1, %Type* %1, %Value* %3, %Value* %5)

;stmt1:
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 2 ; eval_access
  %8 = getelementptr inbounds %Storage, %Storage* %7, i32 0, i32 0 ; eval_access
  store %StorageClass 1, %StorageClass* %8

;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 2 ; eval_access
  %10 = getelementptr inbounds %Storage, %Storage* %9, i32 0, i32 1 ; eval_access
  %11 = load %Int64, %Int64* %dx
  store %Int64 %11, %Int64* %10

;stmt3:
  ret %Value* %6
}

define %Bool @valueIsReadonly (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2 ; eval_access
  %3 = call %Bool (%Storage*) @storageIsMutable (%Storage* %2)
  %4 = xor %Bool %3, 1
  ret %Bool %4
}

define %Bool @isUnaryOpKind (%ValueKind %_k) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k

;stmt0:
  %1 = load %ValueKind, %ValueKind* %k
  %2 = icmp eq %ValueKind %1, 2
  %3 = load %ValueKind, %ValueKind* %k
  %4 = icmp eq %ValueKind %3, 3
  %5 = load %ValueKind, %ValueKind* %k
  %6 = icmp eq %ValueKind %5, 5
  %7 = load %ValueKind, %ValueKind* %k
  %8 = icmp eq %ValueKind %7, 4
  %9 = or %Bool %6, %8
  %10 = or %Bool %4, %9
  %11 = or %Bool %2, %10
  ret %Bool %11
}

define %Bool @isBinaryOpKind (%ValueKind %_k) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k

;stmt0:
  %1 = load %ValueKind, %ValueKind* %k
  %2 = icmp eq %ValueKind %1, 6
  %3 = load %ValueKind, %ValueKind* %k
  %4 = icmp eq %ValueKind %3, 7
  %5 = load %ValueKind, %ValueKind* %k
  %6 = icmp eq %ValueKind %5, 8
  %7 = load %ValueKind, %ValueKind* %k
  %8 = icmp eq %ValueKind %7, 9
  %9 = load %ValueKind, %ValueKind* %k
  %10 = icmp eq %ValueKind %9, 10
  %11 = load %ValueKind, %ValueKind* %k
  %12 = icmp eq %ValueKind %11, 13
  %13 = load %ValueKind, %ValueKind* %k
  %14 = icmp eq %ValueKind %13, 11
  %15 = load %ValueKind, %ValueKind* %k
  %16 = icmp eq %ValueKind %15, 12
  %17 = load %ValueKind, %ValueKind* %k
  %18 = call %Bool (%ValueKind) @isReletionOpKind (%ValueKind %17)
  %19 = or %Bool %16, %18
  %20 = or %Bool %14, %19
  %21 = or %Bool %12, %20
  %22 = or %Bool %10, %21
  %23 = or %Bool %8, %22
  %24 = or %Bool %6, %23
  %25 = or %Bool %4, %24
  %26 = or %Bool %2, %25
  ret %Bool %26
}

define %Bool @isReletionOpKind (%ValueKind %_k) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k

;stmt0:
  %1 = load %ValueKind, %ValueKind* %k
  %2 = icmp eq %ValueKind %1, 14
  %3 = load %ValueKind, %ValueKind* %k
  %4 = icmp eq %ValueKind %3, 15
  %5 = load %ValueKind, %ValueKind* %k
  %6 = icmp eq %ValueKind %5, 16
  %7 = load %ValueKind, %ValueKind* %k
  %8 = icmp eq %ValueKind %7, 17
  %9 = load %ValueKind, %ValueKind* %k
  %10 = icmp eq %ValueKind %9, 18
  %11 = load %ValueKind, %ValueKind* %k
  %12 = icmp eq %ValueKind %11, 19
  %13 = or %Bool %10, %12
  %14 = or %Bool %8, %13
  %15 = or %Bool %6, %14
  %16 = or %Bool %4, %15
  %17 = or %Bool %2, %16
  ret %Bool %17
}

define %Type* @getType (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %8 = load %Type*, %Type** %7

;stmt4:
  %9 = bitcast %Type* %8 to %Unit*
  %10 = inttoptr %Nat32 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  ret %Type* %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  %t = alloca %Type*

;stmt8:
  %13 = inttoptr %Nat32 0 to %Unit*
  %14 = bitcast %Unit* %13 to %Type*
  store %Type* %14, %Type** %t

;stmt9:
  %15 = load %Value*, %Value** %v
  %16 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 0 ; eval_access
  %17 = load %ValueKind, %ValueKind* %16

;stmt10:
  %18 = icmp eq %ValueKind %17, 1
  br i1 %18, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %19 = load %Value*, %Value** %v
  %20 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 2 ; eval_access
  %21 = getelementptr inbounds %Storage, %Storage* %20, i32 0, i32 3 ; eval_access
  %22 = load %Str, %Str* %21

;stmt13:
  %vx = alloca %Value*

;stmt14:
  %23 = call %Value* (%Str) @get_value (%Str %22)
  store %Value* %23, %Value** %vx

;stmt15:
  %24 = load %Value*, %Value** %vx
  %25 = bitcast %Value* %24 to %Unit*
  %26 = inttoptr %Nat32 0 to %Unit*
  %27 = icmp eq %Unit* %25, %26
  br i1 %27, label %then_3, label %else_3
then_3:

;stmt16:

;stmt17:
  %28 = bitcast [14 x %Nat8]* @func125_str1 to %Str
  %29 = load %Value*, %Value** %v
  %30 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 8 ; eval_access
  %31 = load %TokenInfo*, %TokenInfo** %30
  call void (%Str, %TokenInfo*) @error (%Str %28, %TokenInfo* %31)

;stmt18:
  %32 = inttoptr %Nat32 0 to %Unit*
  %33 = bitcast %Unit* %32 to %Type*
  ret %Type* %33
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt19:
  %35 = load %Value*, %Value** %vx
  %36 = getelementptr inbounds %Value, %Value* %35, i32 0, i32 1 ; eval_access
  %37 = load %Type*, %Type** %36
  store %Type* %37, %Type** %t
  br label %endif_2
else_2:

;stmt20:
  %38 = call %Bool (%ValueKind) @isBinaryOpKind (%ValueKind %17)
  br i1 %38, label %then_4, label %else_4
then_4:

;stmt21:

;stmt22:
  %39 = load %Value*, %Value** %v
  %40 = call %Type* (%Value*) @getTypeBinary (%Value* %39)
  store %Type* %40, %Type** %t
  br label %endif_4
else_4:

;stmt23:
  %41 = call %Bool (%ValueKind) @isUnaryOpKind (%ValueKind %17)
  br i1 %41, label %then_5, label %else_5
then_5:

;stmt24:

;stmt25:
  %42 = load %Value*, %Value** %v
  %43 = call %Type* (%Value*) @getTypeUnary (%Value* %42)
  store %Type* %43, %Type** %t
  br label %endif_5
else_5:

;stmt26:
  %44 = icmp eq %ValueKind %17, 22
  br i1 %44, label %then_6, label %else_6
then_6:

;stmt27:

;stmt28:
  %45 = load %Value*, %Value** %v
  %46 = call %Type* (%Value*) @getTypeCall (%Value* %45)
  store %Type* %46, %Type** %t
  br label %endif_6
else_6:

;stmt29:
  %47 = icmp eq %ValueKind %17, 23
  br i1 %47, label %then_7, label %else_7
then_7:

;stmt30:

;stmt31:
  %48 = load %Value*, %Value** %v
  %49 = call %Type* (%Value*) @getTypeIndex (%Value* %48)
  store %Type* %49, %Type** %t
  br label %endif_7
else_7:

;stmt32:
  %50 = icmp eq %ValueKind %17, 24
  br i1 %50, label %then_8, label %else_8
then_8:

;stmt33:

;stmt34:
  %51 = load %Value*, %Value** %v
  %52 = call %Type* (%Value*) @getTypeAccess (%Value* %51)
  store %Type* %52, %Type** %t
  br label %endif_8
else_8:

;stmt35:
  %53 = icmp eq %ValueKind %17, 25
  br i1 %53, label %then_9, label %else_9
then_9:

;stmt36:

;stmt37:
  %54 = load %Value*, %Value** %v
  %55 = call %Type* (%Value*) @getTypeCast (%Value* %54)
  store %Type* %55, %Type** %t
  br label %endif_9
else_9:

;stmt38:
  %56 = icmp eq %ValueKind %17, 20
  %57 = icmp eq %ValueKind %17, 21
  %58 = or %Bool %56, %57
  br i1 %58, label %then_10, label %else_10
then_10:

;stmt39:

;stmt40:
  %59 = load %Value*, %Value** %v
  %60 = call %Type* (%Value*) @getTypeShift (%Value* %59)
  store %Type* %60, %Type** %t
  br label %endif_10
else_10:
  br label %endif_10
endif_10:
  br label %endif_9
endif_9:
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_2
endif_2:

;stmt41:
  %61 = load %Value*, %Value** %v
  %62 = getelementptr inbounds %Value, %Value* %61, i32 0, i32 1 ; eval_access
  %63 = load %Type*, %Type** %t
  store %Type* %63, %Type** %62

;stmt42:
  %64 = load %Type*, %Type** %t
  ret %Type* %64

;stmt43:
  br label %fail
fail:

;stmt44:
  %66 = bitcast [25 x %Nat8]* @func125_str2 to %Str
  call void (%Bool, %Str) @assert (%Bool 0, %Str %66)

;stmt45:
  %67 = inttoptr %Nat32 0 to %Unit*
  %68 = bitcast %Unit* %67 to %Type*
  ret %Type* %68
}

define %Bool @isArrayReference (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0 ; eval_access
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 8
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %6 = load %Type*, %Type** %t
  %7 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 8 ; eval_access
  %8 = getelementptr inbounds %TypeArray, %TypeArray* %7, i32 0, i32 2 ; eval_access
  %9 = load %Bool, %Bool* %8
  ret %Bool %9
}

define %Value* @castIfNumericTo (%Value* %_v, %Type* %_t) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1 ; eval_access
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0 ; eval_access
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = load %Value*, %Value** %v
  %8 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 1 ; eval_access
  %9 = load %Type*, %Type** %t
  store %Type* %9, %Type** %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %10 = load %Value*, %Value** %v
  ret %Value* %10
}

define %Value* @nat (%Value* %_v, %Type* %_t) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1 ; eval_access
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = bitcast %Type* %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  %7 = bitcast [20 x %Nat8]* @func128_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %6, %Str %7)

;stmt2:
  %8 = load %Type*, %Type** %t
  %9 = bitcast %Type* %8 to %Unit*
  %10 = inttoptr %Nat32 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  %12 = bitcast [15 x %Nat8]* @func128_str2 to %Str
  call void (%Bool, %Str) @assert (%Bool %11, %Str %12)

;stmt3:
  %13 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0 ; eval_access
  %14 = load %TypeKind, %TypeKind* %13
  %15 = icmp eq %TypeKind %14, 1
  br i1 %15, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %16 = load %Type*, %Type** %t
  %17 = call %Bool (%Type*) @type_is_basic_integer (%Type* %16)
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %18 = load %Type*, %Type** %t
  %19 = load %Value*, %Value** %v
  %20 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 2 ; eval_access
  %21 = getelementptr inbounds %Storage, %Storage* %20, i32 0, i32 1 ; eval_access
  %22 = load %Int64, %Int64* %21
  %23 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %18, %Int64 %22)
  ret %Value* %23
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %25 = load %Value*, %Value** %v
  %26 = getelementptr inbounds %Value, %Value* %25, i32 0, i32 1 ; eval_access
  %27 = load %Type*, %Type** %26
  %28 = load %Type*, %Type** %t
  %29 = call %Bool (%Type*, %Type*) @naturalConversionIsPossible (%Type* %27, %Type* %28)
  br i1 %29, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %30 = load %Value*, %Value** %v
  %31 = load %Type*, %Type** %t
  %32 = load %Value*, %Value** %v
  %33 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 8 ; eval_access
  %34 = load %TokenInfo*, %TokenInfo** %33
  %35 = call %Value* (%Value*, %Type*, %TokenInfo*) @cast (%Value* %30, %Type* %31, %TokenInfo* %34)

;stmt11:
  %36 = call %Type* (%Value*) @getType (%Value* %35)

;stmt12:
  ret %Value* %35
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt13:
  %38 = load %Value*, %Value** %v
  ret %Value* %38
}

define %Bool @naturalConversionIsPossible (%Type* %_a, %Type* %_b) {
  %a = alloca %Type*
  store %Type* %_a, %Type** %a
  %b = alloca %Type*
  store %Type* %_b, %Type** %b

;stmt0:
  %1 = load %Type*, %Type** %b
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0 ; eval_access
  %3 = load %TypeKind, %TypeKind* %2

;stmt1:
  %4 = load %Type*, %Type** %a
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0 ; eval_access
  %6 = load %TypeKind, %TypeKind* %5

;stmt2:
  %7 = icmp eq %TypeKind %3, 8
  %8 = icmp eq %TypeKind %6, 8
  %9 = and %Bool %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %10 = load %Type*, %Type** %b
  %11 = getelementptr inbounds %Type, %Type* %10, i32 0, i32 8 ; eval_access
  %12 = getelementptr inbounds %TypeArray, %TypeArray* %11, i32 0, i32 2 ; eval_access
  %13 = load %Bool, %Bool* %12
  %14 = load %Type*, %Type** %a
  %15 = getelementptr inbounds %Type, %Type* %14, i32 0, i32 8 ; eval_access
  %16 = getelementptr inbounds %TypeArray, %TypeArray* %15, i32 0, i32 2 ; eval_access
  %17 = load %Bool, %Bool* %16
  %18 = xor %Bool %17, 1
  %19 = and %Bool %13, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %21 = icmp eq %TypeKind %3, 7
  %22 = icmp eq %TypeKind %6, 7
  %23 = and %Bool %21, %22
  br i1 %23, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %24 = load %Type*, %Type** %a
  %25 = load %Type*, %Type** @typeFreePtr
  %26 = call %Bool (%Type*, %Type*) @type_eq (%Type* %24, %Type* %25)
  br i1 %26, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  ret %Bool 1
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt12:
  %28 = load %Type*, %Type** %b
  %29 = load %Type*, %Type** @typeFreePtr
  %30 = call %Bool (%Type*, %Type*) @type_eq (%Type* %28, %Type* %29)
  br i1 %30, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  ret %Bool 1
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt15:
  %32 = icmp eq %TypeKind %3, 8
  %33 = icmp eq %TypeKind %6, 7
  %34 = and %Bool %32, %33
  br i1 %34, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %35 = load %Type*, %Type** %b
  %36 = getelementptr inbounds %Type, %Type* %35, i32 0, i32 8 ; eval_access
  %37 = getelementptr inbounds %TypeArray, %TypeArray* %36, i32 0, i32 2 ; eval_access
  %38 = load %Bool, %Bool* %37
  %39 = load %Type*, %Type** %a
  %40 = load %Type*, %Type** @typeFreePtr
  %41 = call %Bool (%Type*, %Type*) @type_eq (%Type* %39, %Type* %40)
  %42 = and %Bool %38, %41
  br i1 %42, label %then_6, label %else_6
then_6:

;stmt18:

;stmt19:
  ret %Bool 1
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
  br label %endif_5
else_5:
  br label %endif_5
endif_5:

;stmt20:
  %44 = icmp eq %TypeKind %6, 8
  %45 = icmp eq %TypeKind %3, 7
  %46 = and %Bool %44, %45
  br i1 %46, label %then_7, label %else_7
then_7:

;stmt21:

;stmt22:
  %47 = load %Type*, %Type** %a
  %48 = getelementptr inbounds %Type, %Type* %47, i32 0, i32 8 ; eval_access
  %49 = getelementptr inbounds %TypeArray, %TypeArray* %48, i32 0, i32 2 ; eval_access
  %50 = load %Bool, %Bool* %49
  %51 = load %Type*, %Type** %b
  %52 = load %Type*, %Type** @typeFreePtr
  %53 = call %Bool (%Type*, %Type*) @type_eq (%Type* %51, %Type* %52)
  %54 = and %Bool %50, %53
  br i1 %54, label %then_8, label %else_8
then_8:

;stmt23:

;stmt24:
  ret %Bool 1
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
  br label %endif_7
else_7:
  br label %endif_7
endif_7:

;stmt25:
  ret %Bool 0
}

define %Stmt* @stmt_new (%StmtKind %_kind) {
  %kind = alloca %StmtKind
  store %StmtKind %_kind, %StmtKind* %kind

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 72)
  %2 = bitcast %Unit* %1 to %Stmt*

;stmt1:
  %3 = bitcast %Stmt* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = bitcast [9 x %Nat8]* @func130_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Stmt* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 72)

;stmt3:
  %9 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 0 ; eval_access
  %10 = load %StmtKind, %StmtKind* %kind
  store %StmtKind %10, %StmtKind* %9

;stmt4:
  ret %Stmt* %2
}

define %Stmt* @stmt_new_vardef (%Str %_id, %Type* %_t, %Value* %_init_value) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %init_value = alloca %Value*
  store %Value* %_init_value, %Value** %init_value

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 0)
  %2 = bitcast %Unit* %1 to %VarDef*

;stmt1:
  %3 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 0 ; eval_access
  %4 = load %Str, %Str* %id
  store %Str %4, %Str* %3

;stmt2:
  %5 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 2 ; eval_access
  %6 = load %Value*, %Value** %init_value
  store %Value* %6, %Value** %5

;stmt3:
  %7 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 1 ; eval_access
  %8 = load %Type*, %Type** %t
  store %Type* %8, %Type** %7

;stmt4:
  %9 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 1)

;stmt5:
  %10 = getelementptr inbounds %Stmt, %Stmt* %9, i32 0, i32 3 ; eval_access
  store %VarDef* %2, %VarDef** %10

;stmt6:
  ret %Stmt* %9
}

define %Stmt* @stmt_new_let (%Value* %_v, %Value* %_xv) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %xv = alloca %Value*
  store %Value* %_xv, %Value** %xv

;stmt0:
  %1 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 0)

;stmt1:
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %v
  store %Value* %4, %Value** %3

;stmt2:
  %5 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1 ; eval_access
  %6 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %5, i32 0, %Int32 1 ; eval_index
  %7 = load %Value*, %Value** %xv
  store %Value* %7, %Value** %6

;stmt3:
  ret %Stmt* %1
}

define %Stmt* @stmt_new_assign (%Value* %_l, %Value* %_r, %TokenInfo* %_ti) {
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 4)

;stmt1:
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %l
  store %Value* %4, %Value** %3

;stmt2:
  %5 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1 ; eval_access
  %6 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %5, i32 0, %Int32 1 ; eval_index
  %7 = load %Value*, %Value** %r
  store %Value* %7, %Value** %6

;stmt3:
  %8 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 7 ; eval_access
  %9 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %9, %TokenInfo** %8

;stmt4:
  ret %Stmt* %1
}

define void @asm_init (%Assembly* %_a, %Str %_name) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %name = alloca %Str
  store %Str %_name, %Str* %name

;stmt0:
  %1 = load %Assembly*, %Assembly** %a
  %2 = getelementptr inbounds %Assembly, %Assembly* %1, i32 0, i32 0 ; eval_access
  %3 = load %Str, %Str* %name
  store %Str %3, %Str* %2

;stmt1:
  %4 = load %Assembly*, %Assembly** %a
  %5 = getelementptr inbounds %Assembly, %Assembly* %4, i32 0, i32 1 ; eval_access
  %6 = call %List* () @map_new ()
  store %List* %6, %List** %5

;stmt2:
  %7 = load %Assembly*, %Assembly** %a
  %8 = getelementptr inbounds %Assembly, %Assembly* %7, i32 0, i32 2 ; eval_access
  %9 = call %List* () @map_new ()
  store %List* %9, %List** %8

;stmt3:
  %10 = load %Assembly*, %Assembly** %a
  %11 = getelementptr inbounds %Assembly, %Assembly* %10, i32 0, i32 3 ; eval_access
  %12 = call %List* () @map_new ()
  store %List* %12, %List** %11

;stmt4:
  %13 = load %Assembly*, %Assembly** %a
  %14 = getelementptr inbounds %Assembly, %Assembly* %13, i32 0, i32 4 ; eval_access
  %15 = call %List* () @map_new ()
  store %List* %15, %List** %14
  ret void
}

define %TypeDef* @asm_typedef_add (%Assembly* %_a, %Str %_id, %Type* %_t) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %2 = bitcast %Unit* %1 to %TypeDef*

;stmt1:
  %3 = bitcast %TypeDef* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = bitcast [16 x %Nat8]* @func135_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %TypeDef, %TypeDef* %2, i32 0, i32 0 ; eval_access
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %TypeDef, %TypeDef* %2, i32 0, i32 1 ; eval_access
  %10 = load %Type*, %Type** %t
  store %Type* %10, %Type** %9

;stmt4:
  %11 = load %Assembly*, %Assembly** %a
  %12 = getelementptr inbounds %Assembly, %Assembly* %11, i32 0, i32 1 ; eval_access
  %13 = load %List*, %List** %12
  %14 = bitcast %TypeDef* %2 to %Unit*
  %15 = call %Bool (%List*, %Unit*) @list_append (%List* %13, %Unit* %14)

;stmt5:
  ret %TypeDef* %2
}

define %ConstDef* @asm_constdef_add (%Assembly* %_a, %Str %_id, %Value* %_v) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %2 = bitcast %Unit* %1 to %ConstDef*

;stmt1:
  %3 = bitcast %ConstDef* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = bitcast [17 x %Nat8]* @func136_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %ConstDef, %ConstDef* %2, i32 0, i32 0 ; eval_access
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %ConstDef, %ConstDef* %2, i32 0, i32 1 ; eval_access
  %10 = load %Value*, %Value** %v
  store %Value* %10, %Value** %9

;stmt4:
  %11 = load %Assembly*, %Assembly** %a
  %12 = getelementptr inbounds %Assembly, %Assembly* %11, i32 0, i32 2 ; eval_access
  %13 = load %List*, %List** %12
  %14 = bitcast %ConstDef* %2 to %Unit*
  %15 = call %Bool (%List*, %Unit*) @list_append (%List* %13, %Unit* %14)

;stmt5:
  ret %ConstDef* %2
}

define %VarDef* @asm_vardef_add (%Assembly* %_a, %Str %_id, %Type* %_t, %Value* %_init_value) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %init_value = alloca %Value*
  store %Value* %_init_value, %Value** %init_value

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %VarDef*

;stmt1:
  %3 = bitcast %VarDef* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = bitcast [15 x %Nat8]* @func137_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 0 ; eval_access
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 2 ; eval_access
  %10 = load %Value*, %Value** %init_value
  store %Value* %10, %Value** %9

;stmt4:
  %11 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 1 ; eval_access
  %12 = load %Type*, %Type** %t
  store %Type* %12, %Type** %11

;stmt5:
  %13 = load %Assembly*, %Assembly** %a
  %14 = getelementptr inbounds %Assembly, %Assembly* %13, i32 0, i32 3 ; eval_access
  %15 = load %List*, %List** %14
  %16 = bitcast %VarDef* %2 to %Unit*
  %17 = call %Bool (%List*, %Unit*) @list_append (%List* %15, %Unit* %16)

;stmt6:
  ret %VarDef* %2
}

define %FuncDef* @asm_funcdef_add (%Assembly* %_a, %Str %_id, %Type* %_t, %Block* %_b) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %b = alloca %Block*
  store %Block* %_b, %Block** %b

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %FuncDef*

;stmt1:
  %3 = bitcast %FuncDef* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = bitcast [16 x %Nat8]* @func138_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 0 ; eval_access
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 1 ; eval_access
  %10 = load %Type*, %Type** %t
  store %Type* %10, %Type** %9

;stmt4:
  %11 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 2 ; eval_access
  %12 = load %Block*, %Block** %b
  store %Block* %12, %Block** %11

;stmt5:
  %13 = load %Assembly*, %Assembly** %a
  %14 = getelementptr inbounds %Assembly, %Assembly* %13, i32 0, i32 4 ; eval_access
  %15 = load %List*, %List** %14
  %16 = bitcast %FuncDef* %2 to %Unit*
  %17 = call %Bool (%List*, %Unit*) @list_append (%List* %15, %Unit* %16)

;stmt6:
  ret %FuncDef* %2
}

define void @asm_func_rename (%Assembly* %_a, %Str %_id_from, %Str %_id_to) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %id_from = alloca %Str
  store %Str %_id_from, %Str* %id_from
  %id_to = alloca %Str
  store %Str %_id_to, %Str* %id_to

;stmt0:
  %1 = load %Assembly*, %Assembly** %a
  %2 = getelementptr inbounds %Assembly, %Assembly* %1, i32 0, i32 4 ; eval_access
  %3 = load %List*, %List** %2
  %4 = load %Str, %Str* %id_from
  %5 = load %Str, %Str* %id_to
  call void (%List*, %Str, %Str) @asm_rename (%List* %3, %Str %4, %Str %5)
  ret void
}

define void @asm_const_rename (%Assembly* %_a, %Str %_id_from, %Str %_id_to) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %id_from = alloca %Str
  store %Str %_id_from, %Str* %id_from
  %id_to = alloca %Str
  store %Str %_id_to, %Str* %id_to

;stmt0:
  %1 = load %Assembly*, %Assembly** %a
  %2 = getelementptr inbounds %Assembly, %Assembly* %1, i32 0, i32 2 ; eval_access
  %3 = load %List*, %List** %2
  %4 = load %Str, %Str* %id_from
  %5 = load %Str, %Str* %id_to
  call void (%List*, %Str, %Str) @asm_rename (%List* %3, %Str %4, %Str %5)
  ret void
}

define %Unit* @search (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Str*

;stmt1:
  %3 = load %Str, %Str* %2
  %4 = load %Unit*, %Unit** %ctx
  %5 = bitcast %Unit* %4 to %Str
  %6 = call %Int32 (%Str, %Str) @strcmp (%Str %3, %Str %5)
  %7 = icmp eq %Int32 %6, 0
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = load %Unit*, %Unit** %data
  ret %Unit* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %10 = inttoptr %Nat32 0 to %Unit*
  ret %Unit* %10
}

define void @asm_rename (%List* %_list, %Str %_id_from, %Str %_id_to) {
  %list = alloca %List*
  store %List* %_list, %List** %list
  %id_from = alloca %Str
  store %Str %_id_from, %Str* %id_from
  %id_to = alloca %Str
  store %Str %_id_to, %Str* %id_to

;stmt0:
  %1 = load %List*, %List** %list
  %2 = load %Str, %Str* %id_from
  %3 = bitcast %Str %2 to %Unit*
  %4 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %1, %ListSearchHandler @search, %Unit* %3)
  %5 = bitcast %Unit* %4 to %ConstDef*

;stmt1:
  %6 = bitcast %ConstDef* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  %9 = bitcast [29 x %Nat8]* @func141_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %8, %Str %9)

;stmt2:
  %10 = getelementptr inbounds %ConstDef, %ConstDef* %5, i32 0, i32 0 ; eval_access
  %11 = load %Str, %Str* %id_to
  store %Str %11, %Str* %10
  ret void
}

define %Str @print_value_kind (%ValueKind %_k) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k

;stmt0:
  %1 = load %ValueKind, %ValueKind* %k
  %2 = icmp eq %ValueKind %1, 1
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %3 = bitcast [8 x %Nat8]* @func143_str1 to %Str
  ret %Str %3
  br label %endif_0
else_0:

;stmt3:
  %5 = load %ValueKind, %ValueKind* %k
  %6 = icmp eq %ValueKind %5, 2
  br i1 %6, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %7 = bitcast [9 x %Nat8]* @func143_str2 to %Str
  ret %Str %7
  br label %endif_1
else_1:

;stmt6:
  %9 = load %ValueKind, %ValueKind* %k
  %10 = icmp eq %ValueKind %9, 3
  br i1 %10, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %11 = bitcast [11 x %Nat8]* @func143_str3 to %Str
  ret %Str %11
  br label %endif_2
else_2:

;stmt9:
  %13 = load %ValueKind, %ValueKind* %k
  %14 = icmp eq %ValueKind %13, 4
  br i1 %14, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %15 = bitcast [9 x %Nat8]* @func143_str4 to %Str
  ret %Str %15
  br label %endif_3
else_3:

;stmt12:
  %17 = load %ValueKind, %ValueKind* %k
  %18 = icmp eq %ValueKind %17, 5
  br i1 %18, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %19 = bitcast [11 x %Nat8]* @func143_str5 to %Str
  ret %Str %19
  br label %endif_4
else_4:

;stmt15:
  %21 = load %ValueKind, %ValueKind* %k
  %22 = icmp eq %ValueKind %21, 20
  br i1 %22, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %23 = bitcast [9 x %Nat8]* @func143_str6 to %Str
  ret %Str %23
  br label %endif_5
else_5:

;stmt18:
  %25 = load %ValueKind, %ValueKind* %k
  %26 = icmp eq %ValueKind %25, 21
  br i1 %26, label %then_6, label %else_6
then_6:

;stmt19:

;stmt20:
  %27 = bitcast [9 x %Nat8]* @func143_str7 to %Str
  ret %Str %27
  br label %endif_6
else_6:

;stmt21:
  %29 = load %ValueKind, %ValueKind* %k
  %30 = icmp eq %ValueKind %29, 6
  br i1 %30, label %then_7, label %else_7
then_7:

;stmt22:

;stmt23:
  %31 = bitcast [9 x %Nat8]* @func143_str8 to %Str
  ret %Str %31
  br label %endif_7
else_7:

;stmt24:
  %33 = load %ValueKind, %ValueKind* %k
  %34 = icmp eq %ValueKind %33, 7
  br i1 %34, label %then_8, label %else_8
then_8:

;stmt25:

;stmt26:
  %35 = bitcast [9 x %Nat8]* @func143_str9 to %Str
  ret %Str %35
  br label %endif_8
else_8:

;stmt27:
  %37 = load %ValueKind, %ValueKind* %k
  %38 = icmp eq %ValueKind %37, 8
  br i1 %38, label %then_9, label %else_9
then_9:

;stmt28:

;stmt29:
  %39 = bitcast [9 x %Nat8]* @func143_str10 to %Str
  ret %Str %39
  br label %endif_9
else_9:

;stmt30:
  %41 = load %ValueKind, %ValueKind* %k
  %42 = icmp eq %ValueKind %41, 9
  br i1 %42, label %then_10, label %else_10
then_10:

;stmt31:

;stmt32:
  %43 = bitcast [9 x %Nat8]* @func143_str11 to %Str
  ret %Str %43
  br label %endif_10
else_10:

;stmt33:
  %45 = load %ValueKind, %ValueKind* %k
  %46 = icmp eq %ValueKind %45, 10
  br i1 %46, label %then_11, label %else_11
then_11:

;stmt34:

;stmt35:
  %47 = bitcast [9 x %Nat8]* @func143_str12 to %Str
  ret %Str %47
  br label %endif_11
else_11:

;stmt36:
  %49 = load %ValueKind, %ValueKind* %k
  %50 = icmp eq %ValueKind %49, 11
  br i1 %50, label %then_12, label %else_12
then_12:

;stmt37:

;stmt38:
  %51 = bitcast [8 x %Nat8]* @func143_str13 to %Str
  ret %Str %51
  br label %endif_12
else_12:

;stmt39:
  %53 = load %ValueKind, %ValueKind* %k
  %54 = icmp eq %ValueKind %53, 12
  br i1 %54, label %then_13, label %else_13
then_13:

;stmt40:

;stmt41:
  %55 = bitcast [9 x %Nat8]* @func143_str14 to %Str
  ret %Str %55
  br label %endif_13
else_13:

;stmt42:
  %57 = load %ValueKind, %ValueKind* %k
  %58 = icmp eq %ValueKind %57, 13
  br i1 %58, label %then_14, label %else_14
then_14:

;stmt43:

;stmt44:
  %59 = bitcast [9 x %Nat8]* @func143_str15 to %Str
  ret %Str %59
  br label %endif_14
else_14:

;stmt45:
  %61 = load %ValueKind, %ValueKind* %k
  %62 = icmp eq %ValueKind %61, 14
  br i1 %62, label %then_15, label %else_15
then_15:

;stmt46:

;stmt47:
  %63 = bitcast [8 x %Nat8]* @func143_str16 to %Str
  ret %Str %63
  br label %endif_15
else_15:

;stmt48:
  %65 = load %ValueKind, %ValueKind* %k
  %66 = icmp eq %ValueKind %65, 15
  br i1 %66, label %then_16, label %else_16
then_16:

;stmt49:

;stmt50:
  %67 = bitcast [8 x %Nat8]* @func143_str17 to %Str
  ret %Str %67
  br label %endif_16
else_16:

;stmt51:
  %69 = load %ValueKind, %ValueKind* %k
  %70 = icmp eq %ValueKind %69, 16
  br i1 %70, label %then_17, label %else_17
then_17:

;stmt52:

;stmt53:
  %71 = bitcast [8 x %Nat8]* @func143_str18 to %Str
  ret %Str %71
  br label %endif_17
else_17:

;stmt54:
  %73 = load %ValueKind, %ValueKind* %k
  %74 = icmp eq %ValueKind %73, 17
  br i1 %74, label %then_18, label %else_18
then_18:

;stmt55:

;stmt56:
  %75 = bitcast [8 x %Nat8]* @func143_str19 to %Str
  ret %Str %75
  br label %endif_18
else_18:

;stmt57:
  %77 = load %ValueKind, %ValueKind* %k
  %78 = icmp eq %ValueKind %77, 18
  br i1 %78, label %then_19, label %else_19
then_19:

;stmt58:

;stmt59:
  %79 = bitcast [8 x %Nat8]* @func143_str20 to %Str
  ret %Str %79
  br label %endif_19
else_19:

;stmt60:
  %81 = load %ValueKind, %ValueKind* %k
  %82 = icmp eq %ValueKind %81, 19
  br i1 %82, label %then_20, label %else_20
then_20:

;stmt61:

;stmt62:
  %83 = bitcast [8 x %Nat8]* @func143_str21 to %Str
  ret %Str %83
  br label %endif_20
else_20:

;stmt63:
  %85 = load %ValueKind, %ValueKind* %k
  %86 = icmp eq %ValueKind %85, 22
  br i1 %86, label %then_21, label %else_21
then_21:

;stmt64:

;stmt65:
  %87 = bitcast [10 x %Nat8]* @func143_str22 to %Str
  ret %Str %87
  br label %endif_21
else_21:

;stmt66:
  %89 = load %ValueKind, %ValueKind* %k
  %90 = icmp eq %ValueKind %89, 23
  br i1 %90, label %then_22, label %else_22
then_22:

;stmt67:

;stmt68:
  %91 = bitcast [11 x %Nat8]* @func143_str23 to %Str
  ret %Str %91
  br label %endif_22
else_22:

;stmt69:
  %93 = load %ValueKind, %ValueKind* %k
  %94 = icmp eq %ValueKind %93, 24
  br i1 %94, label %then_23, label %else_23
then_23:

;stmt70:

;stmt71:
  %95 = bitcast [12 x %Nat8]* @func143_str24 to %Str
  ret %Str %95
  br label %endif_23
else_23:

;stmt72:
  %97 = load %ValueKind, %ValueKind* %k
  %98 = icmp eq %ValueKind %97, 25
  br i1 %98, label %then_24, label %else_24
then_24:

;stmt73:

;stmt74:
  %99 = bitcast [10 x %Nat8]* @func143_str25 to %Str
  ret %Str %99
  br label %endif_24
else_24:

;stmt75:
  %101 = load %ValueKind, %ValueKind* %k
  %102 = icmp eq %ValueKind %101, 0
  br i1 %102, label %then_25, label %else_25
then_25:

;stmt76:

;stmt77:
  %103 = bitcast [13 x %Nat8]* @func143_str26 to %Str
  ret %Str %103
  br label %endif_25
else_25:
  br label %endif_25
endif_25:
  br label %endif_24
endif_24:
  br label %endif_23
endif_23:
  br label %endif_22
endif_22:
  br label %endif_21
endif_21:
  br label %endif_20
endif_20:
  br label %endif_19
endif_19:
  br label %endif_18
endif_18:
  br label %endif_17
endif_17:
  br label %endif_16
endif_16:
  br label %endif_15
endif_15:
  br label %endif_14
endif_14:
  br label %endif_13
endif_13:
  br label %endif_12
endif_12:
  br label %endif_11
endif_11:
  br label %endif_10
endif_10:
  br label %endif_9
endif_9:
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt78:
  %105 = bitcast [13 x %Nat8]* @func143_str27 to %Str
  ret %Str %105
}

define %Str @print_storage_class (%StorageClass %_c) {
  %c = alloca %StorageClass
  store %StorageClass %_c, %StorageClass* %c

;stmt0:
  %1 = load %StorageClass, %StorageClass* %c
  %2 = icmp eq %StorageClass %1, 0
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %3 = bitcast [17 x %Nat8]* @func144_str1 to %Str
  ret %Str %3
  br label %endif_0
else_0:

;stmt3:
  %5 = load %StorageClass, %StorageClass* %c
  %6 = icmp eq %StorageClass %5, 1
  br i1 %6, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %7 = bitcast [17 x %Nat8]* @func144_str2 to %Str
  ret %Str %7
  br label %endif_1
else_1:

;stmt6:
  %9 = load %StorageClass, %StorageClass* %c
  %10 = icmp eq %StorageClass %9, 4
  br i1 %10, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %11 = bitcast [13 x %Nat8]* @func144_str3 to %Str
  ret %Str %11
  br label %endif_2
else_2:

;stmt9:
  %13 = load %StorageClass, %StorageClass* %c
  %14 = icmp eq %StorageClass %13, 2
  br i1 %14, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %15 = bitcast [16 x %Nat8]* @func144_str4 to %Str
  ret %Str %15
  br label %endif_3
else_3:

;stmt12:
  %17 = load %StorageClass, %StorageClass* %c
  %18 = icmp eq %StorageClass %17, 9
  br i1 %18, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %19 = bitcast [16 x %Nat8]* @func144_str5 to %Str
  ret %Str %19
  br label %endif_4
else_4:

;stmt15:
  %21 = load %StorageClass, %StorageClass* %c
  %22 = icmp eq %StorageClass %21, 8
  br i1 %22, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %23 = bitcast [15 x %Nat8]* @func144_str6 to %Str
  ret %Str %23
  br label %endif_5
else_5:

;stmt18:
  %25 = load %StorageClass, %StorageClass* %c
  %26 = icmp eq %StorageClass %25, 6
  br i1 %26, label %then_6, label %else_6
then_6:

;stmt19:

;stmt20:
  %27 = bitcast [13 x %Nat8]* @func144_str7 to %Str
  ret %Str %27
  br label %endif_6
else_6:

;stmt21:
  %29 = load %StorageClass, %StorageClass* %c
  %30 = icmp eq %StorageClass %29, 7
  br i1 %30, label %then_7, label %else_7
then_7:

;stmt22:

;stmt23:
  %31 = bitcast [14 x %Nat8]* @func144_str8 to %Str
  ret %Str %31
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt24:
  %33 = bitcast [20 x %Nat8]* @func144_str9 to %Str
  ret %Str %33
}

define void @value_show (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = bitcast [13 x %Nat8]* @func145_str1 to %Str
  %2 = load %Value*, %Value** %v
  %3 = call %Int32 (%Str, ...) @printf (%Str %1, %Value* %2)

;stmt1:
  %4 = bitcast [12 x %Nat8]* @func145_str2 to %Str
  %5 = load %Value*, %Value** %v
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 0 ; eval_access
  %7 = load %ValueKind, %ValueKind* %6
  %8 = call %Str (%ValueKind) @print_value_kind (%ValueKind %7)
  %9 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %8)

;stmt2:
  %10 = bitcast [9 x %Nat8]* @func145_str3 to %Str
  %11 = call %Int32 (%Str, ...) @printf (%Str %10)

;stmt3:
  %12 = load %Value*, %Value** %v
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 1 ; eval_access
  %14 = load %Type*, %Type** %13
  call void (%Type*) @prttype (%Type* %14)

;stmt4:
  %15 = bitcast [2 x %Nat8]* @func145_str4 to %Str
  %16 = call %Int32 (%Str, ...) @printf (%Str %15)

;stmt5:
  %17 = bitcast [21 x %Nat8]* @func145_str5 to %Str
  %18 = load %Value*, %Value** %v
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 2 ; eval_access
  %20 = getelementptr inbounds %Storage, %Storage* %19, i32 0, i32 0 ; eval_access
  %21 = load %StorageClass, %StorageClass* %20
  %22 = call %Str (%StorageClass) @print_storage_class (%StorageClass %21)
  %23 = call %Int32 (%Str, ...) @printf (%Str %17, %Str %22)

;stmt6:
  %24 = bitcast [18 x %Nat8]* @func145_str6 to %Str
  %25 = load %Value*, %Value** %v
  %26 = getelementptr inbounds %Value, %Value* %25, i32 0, i32 2 ; eval_access
  %27 = getelementptr inbounds %Storage, %Storage* %26, i32 0, i32 3 ; eval_access
  %28 = load %Str, %Str* %27
  %29 = call %Int32 (%Str, ...) @printf (%Str %24, %Str %28)

;stmt7:
  %30 = bitcast [19 x %Nat8]* @func145_str7 to %Str
  %31 = load %Value*, %Value** %v
  %32 = getelementptr inbounds %Value, %Value* %31, i32 0, i32 2 ; eval_access
  %33 = getelementptr inbounds %Storage, %Storage* %32, i32 0, i32 2 ; eval_access
  %34 = load %Nat32, %Nat32* %33
  %35 = call %Int32 (%Str, ...) @printf (%Str %30, %Nat32 %34)

;stmt8:
  %36 = bitcast [19 x %Nat8]* @func145_str8 to %Str
  %37 = load %Value*, %Value** %v
  %38 = getelementptr inbounds %Value, %Value* %37, i32 0, i32 2 ; eval_access
  %39 = getelementptr inbounds %Storage, %Storage* %38, i32 0, i32 1 ; eval_access
  %40 = load %Int64, %Int64* %39
  %41 = call %Int32 (%Str, ...) @printf (%Str %36, %Int64 %40)

;stmt9:
  %42 = bitcast [3 x %Nat8]* @func145_str9 to %Str
  %43 = call %Int32 (%Str, ...) @printf (%Str %42)
  ret void
}

define void @prttype (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 1 ; eval_access
  %3 = load %Str, %Str* %2
  %4 = bitcast %Str %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = bitcast [3 x %Nat8]* @func146_str1 to %Str
  %8 = load %Type*, %Type** %t
  %9 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 1 ; eval_access
  %10 = load %Str, %Str* %9
  %11 = call %Int32 (%Str, ...) @printf (%Str %7, %Str %10)

;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %13 = load %Type*, %Type** %t
  %14 = getelementptr inbounds %Type, %Type* %13, i32 0, i32 0 ; eval_access
  %15 = load %TypeKind, %TypeKind* %14

;stmt5:
  %16 = icmp eq %TypeKind %15, 3
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %17 = bitcast [3 x %Nat8]* @func146_str2 to %Str
  %18 = load %Type*, %Type** %t
  %19 = getelementptr inbounds %Type, %Type* %18, i32 0, i32 5 ; eval_access
  %20 = getelementptr inbounds %TypeBasic, %TypeBasic* %19, i32 0, i32 0 ; eval_access
  %21 = load %Str, %Str* %20
  %22 = call %Int32 (%Str, ...) @printf (%Str %17, %Str %21)
  br label %endif_1
else_1:

;stmt8:
  %23 = icmp eq %TypeKind %15, 7
  br i1 %23, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %24 = bitcast [2 x %Nat8]* @func146_str3 to %Str
  %25 = call %Int32 (%Str, ...) @printf (%Str %24)

;stmt11:
  %26 = load %Type*, %Type** %t
  %27 = getelementptr inbounds %Type, %Type* %26, i32 0, i32 7 ; eval_access
  %28 = getelementptr inbounds %TypePointer, %TypePointer* %27, i32 0, i32 0 ; eval_access
  %29 = load %Type*, %Type** %28
  call void (%Type*) @prttype (%Type* %29)
  br label %endif_2
else_2:

;stmt12:
  %30 = icmp eq %TypeKind %15, 8
  br i1 %30, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %31 = load %Type*, %Type** %t
  call void (%Type*) @print_type_array (%Type* %31)
  br label %endif_3
else_3:

;stmt15:
  %32 = icmp eq %TypeKind %15, 6
  br i1 %32, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %33 = load %Type*, %Type** %t
  call void (%Type*) @print_type_record (%Type* %33)
  br label %endif_4
else_4:

;stmt18:
  %34 = icmp eq %TypeKind %15, 5
  br i1 %34, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %35 = load %Type*, %Type** %t
  call void (%Type*) @print_type_enum (%Type* %35)
  br label %endif_5
else_5:

;stmt21:
  %36 = icmp eq %TypeKind %15, 4
  br i1 %36, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %37 = load %Type*, %Type** %t
  %38 = getelementptr inbounds %Type, %Type* %37, i32 0, i32 6 ; eval_access
  call void (%TypeFunc*) @print_type_func (%TypeFunc* %38)
  br label %endif_6
else_6:

;stmt24:
  %39 = icmp eq %TypeKind %15, 2
  br i1 %39, label %then_7, label %else_7
then_7:

;stmt25:

;stmt26:
  %40 = bitcast [3 x %Nat8]* @func146_str4 to %Str
  %41 = load %Type*, %Type** %t
  %42 = getelementptr inbounds %Type, %Type* %41, i32 0, i32 4 ; eval_access
  %43 = getelementptr inbounds %TypeUndefined, %TypeUndefined* %42, i32 0, i32 0 ; eval_access
  %44 = load %Str, %Str* %43
  %45 = call %Int32 (%Str, ...) @printf (%Str %40, %Str %44)
  br label %endif_7
else_7:

;stmt27:
  %46 = icmp eq %TypeKind %15, 1
  br i1 %46, label %then_8, label %else_8
then_8:

;stmt28:

;stmt29:
  %47 = bitcast [14 x %Nat8]* @func146_str5 to %Str
  %48 = call %Int32 (%Str, ...) @printf (%Str %47)
  br label %endif_8
else_8:

;stmt30:

;stmt31:
  %49 = bitcast [31 x %Nat8]* @func146_str6 to %Str
  %50 = call %Int32 (%Str, ...) @printf (%Str %49, %TypeKind %15)

;stmt32:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  ret void
}

define void @print_field (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = bitcast [6 x %Nat8]* @func148_str1 to %Str
  %2 = load %Unit*, %Unit** %data
  %3 = bitcast %Unit* %2 to %Field*
  %4 = getelementptr inbounds %Field, %Field* %3, i32 0, i32 0 ; eval_access
  %5 = load %Str, %Str* %4
  %6 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %5)

;stmt1:
  %7 = load %Unit*, %Unit** %data
  %8 = bitcast %Unit* %7 to %Field*
  %9 = getelementptr inbounds %Field, %Field* %8, i32 0, i32 1 ; eval_access
  %10 = load %Type*, %Type** %9
  call void (%Type*) @prttype (%Type* %10)

;stmt2:
  %11 = bitcast [3 x %Nat8]* @func148_str2 to %Str
  %12 = call %Int32 (%Str, ...) @printf (%Str %11)
  ret void
}

define void @print_type_record (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = bitcast [2 x %Nat8]* @func147_str1 to %Str
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %3 = load %Type*, %Type** %t
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 9 ; eval_access
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %4, i32 0, i32 0 ; eval_access
  %6 = load %List*, %List** %5
  %7 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %6, %ListForeachHandler @print_field, %Unit* %7)

;stmt2:
  %8 = bitcast [2 x %Nat8]* @func147_str2 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)

;stmt3:
  %10 = bitcast [16 x %Nat8]* @func147_str3 to %Str
  %11 = load %Type*, %Type** %t
  %12 = getelementptr inbounds %Type, %Type* %11, i32 0, i32 9 ; eval_access
  %13 = getelementptr inbounds %TypeRecord, %TypeRecord* %12, i32 0, i32 1 ; eval_access
  %14 = load %Nat32, %Nat32* %13
  %15 = call %Int32 (%Str, ...) @printf (%Str %10, %Nat32 %14)
  ret void
}

define void @print_cons (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = bitcast [5 x %Nat8]* @func150_str1 to %Str
  %2 = load %Unit*, %Unit** %data
  %3 = bitcast %Unit* %2 to %Value*
  %4 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 2 ; eval_access
  %5 = getelementptr inbounds %Storage, %Storage* %4, i32 0, i32 3 ; eval_access
  %6 = load %Str, %Str* %5
  %7 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %6)
  ret void
}

define void @print_type_enum (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = bitcast [2 x %Nat8]* @func149_str1 to %Str
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %3 = load %Type*, %Type** %t
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 10 ; eval_access
  %5 = getelementptr inbounds %TypeEnum, %TypeEnum* %4, i32 0, i32 0 ; eval_access
  %6 = load %List*, %List** %5
  %7 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %6, %ListForeachHandler @print_cons, %Unit* %7)

;stmt2:
  %8 = bitcast [2 x %Nat8]* @func149_str2 to %Str
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  ret void
}

define void @print_type_array (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8 ; eval_access
  %3 = getelementptr inbounds %TypeArray, %TypeArray* %2, i32 0, i32 2 ; eval_access
  %4 = load %Bool, %Bool* %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = bitcast [3 x %Nat8]* @func151_str1 to %Str
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %7 = bitcast [5 x %Nat8]* @func151_str2 to %Str
  %8 = load %Type*, %Type** %t
  %9 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 8 ; eval_access
  %10 = getelementptr inbounds %TypeArray, %TypeArray* %9, i32 0, i32 1 ; eval_access
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Int32 (%Str, ...) @printf (%Str %7, %Nat32 %11)
  br label %endif_0
endif_0:

;stmt5:
  %13 = load %Type*, %Type** %t
  %14 = getelementptr inbounds %Type, %Type* %13, i32 0, i32 8 ; eval_access
  %15 = getelementptr inbounds %TypeArray, %TypeArray* %14, i32 0, i32 0 ; eval_access
  %16 = load %Type*, %Type** %15
  call void (%Type*) @prttype (%Type* %16)
  ret void
}

define void @print_params (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = load %Bool, %Bool* @needs
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %4 = bitcast [3 x %Nat8]* @func153_str1 to %Str
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
  br label %endif_0
else_0:

;stmt4:

;stmt5:
  store %Bool 1, %Bool* @needs
  br label %endif_0
endif_0:

;stmt6:
  %6 = bitcast [6 x %Nat8]* @func153_str2 to %Str
  %7 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %8 = load %Str, %Str* %7
  %9 = call %Int32 (%Str, ...) @printf (%Str %6, %Str %8)

;stmt7:
  %10 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %11 = load %Type*, %Type** %10
  call void (%Type*) @prttype (%Type* %11)
  ret void
}

define void @print_type_func (%TypeFunc* %_t) {
  %t = alloca %TypeFunc*
  store %TypeFunc* %_t, %TypeFunc** %t

;stmt0:
  %1 = bitcast [2 x %Nat8]* @func152_str1 to %Str
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  store %Bool 0, %Bool* @needs

;stmt2:
  %3 = load %TypeFunc*, %TypeFunc** %t
  %4 = getelementptr inbounds %TypeFunc, %TypeFunc* %3, i32 0, i32 0 ; eval_access
  %5 = load %List*, %List** %4
  %6 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %5, %ListForeachHandler @print_params, %Unit* %6)

;stmt3:
  %7 = bitcast [6 x %Nat8]* @func152_str2 to %Str
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)

;stmt4:
  %9 = load %TypeFunc*, %TypeFunc** %t
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %9, i32 0, i32 1 ; eval_access
  %11 = load %Type*, %Type** %10
  call void (%Type*) @prttype (%Type* %11)
  ret void
}

define void @shwt (%Unit* %_k, %Unit* %_v, %Unit* %_ctx) {
  %k = alloca %Unit*
  store %Unit* %_k, %Unit** %k
  %v = alloca %Unit*
  store %Unit* %_v, %Unit** %v
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %Unit*, %Unit** %k
  %2 = bitcast %Unit* %1 to %Str
  %3 = call %Nat32 (%Str) @strlen (%Str %2)

;stmt1:
  %4 = bitcast [5 x %Nat8]* @func155_str1 to %Str
  %5 = load %Unit*, %Unit** %k
  %6 = call %Int32 (%Str, ...) @printf (%Str %4, %Unit* %5)

;stmt2:
  %i = alloca %Nat32

;stmt3:
  store %Nat32 0, %Nat32* %i

;stmt4:
  br label %continue_0
continue_0:
  %7 = load %Nat32, %Nat32* %i
  %8 = sub %Nat32 40, %3
  %9 = icmp ult %Nat32 %7, %8
  br i1 %9, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %10 = bitcast [2 x %Nat8]* @func155_str2 to %Str
  %11 = call %Int32 (%Str, ...) @printf (%Str %10)

;stmt7:
  %12 = load %Nat32, %Nat32* %i
  %13 = add %Nat32 %12, 1
  store %Nat32 %13, %Nat32* %i
  br label %continue_0
break_0:

;stmt8:
  %14 = load %Unit*, %Unit** %v
  %15 = bitcast %Unit* %14 to %Type*

;stmt9:
  call void (%Type*) @prttype (%Type* %15)

;stmt10:
  %16 = bitcast [2 x %Nat8]* @func155_str3 to %Str
  %17 = call %Int32 (%Str, ...) @printf (%Str %16)
  ret void
}

define void @showTypes () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1 ; eval_access
  %2 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @shwt, %Unit* %2)
  ret void
}

define void @shwv (%Unit* %_k, %Unit* %_v, %Unit* %_ctx) {
  %k = alloca %Unit*
  store %Unit* %_k, %Unit** %k
  %v = alloca %Unit*
  store %Unit* %_v, %Unit** %v
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %Unit*, %Unit** %k
  %2 = bitcast %Unit* %1 to %Str
  %3 = call %Nat32 (%Str) @strlen (%Str %2)

;stmt1:
  %4 = bitcast [8 x %Nat8]* @func157_str1 to %Str
  %5 = load %Unit*, %Unit** %k
  %6 = call %Int32 (%Str, ...) @printf (%Str %4, %Unit* %5)

;stmt2:
  %i = alloca %Nat32

;stmt3:
  store %Nat32 0, %Nat32* %i

;stmt4:
  br label %continue_0
continue_0:
  %7 = load %Nat32, %Nat32* %i
  %8 = sub %Nat32 40, %3
  %9 = icmp ult %Nat32 %7, %8
  br i1 %9, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %10 = bitcast [2 x %Nat8]* @func157_str2 to %Str
  %11 = call %Int32 (%Str, ...) @printf (%Str %10)

;stmt7:
  %12 = load %Nat32, %Nat32* %i
  %13 = add %Nat32 %12, 1
  store %Nat32 %13, %Nat32* %i
  br label %continue_0
break_0:

;stmt8:
  %14 = load %Unit*, %Unit** %v
  %15 = bitcast %Unit* %14 to %Value*
  %16 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 1 ; eval_access
  %17 = load %Type*, %Type** %16
  call void (%Type*) @prttype (%Type* %17)

;stmt9:
  %18 = bitcast [2 x %Nat8]* @func157_str3 to %Str
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)
  ret void
}

define void @showValues () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2 ; eval_access
  %2 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @shwv, %Unit* %2)
  ret void
}

define void @chk (%Unit* %_k, %Unit* %_v, %Unit* %_ctx) {
  %k = alloca %Unit*
  store %Unit* %_k, %Unit** %k
  %v = alloca %Unit*
  store %Unit* %_v, %Unit** %v
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %Unit*, %Unit** %v
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = call %Type* (%Value*) @getType (%Value* %2)

;stmt2:
  %4 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 1 ; eval_access
  %5 = load %Type*, %Type** %4
  %6 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 0 ; eval_access
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 4
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  call void (%Value*) @checkFunc (%Value* %2)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @checkMain () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2 ; eval_access
  %2 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @chk, %Unit* %2)
  ret void
}

define void @checkFunc (%Value* %_f) {
  %f = alloca %Value*
  store %Value* %_f, %Value** %f

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %2 = load %Value*, %Value** %1

;stmt1:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %4 = load %Value*, %Value** %f
  store %Value* %4, %Value** %3

;stmt2:
  %5 = load %Value*, %Value** %f
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 6 ; eval_access
  %7 = load %Block*, %Block** %6

;stmt3:
  %8 = bitcast %Block* %7 to %Unit*
  %9 = inttoptr %Nat32 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  call void (%Block*) @checkBlock (%Block* %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %11 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  store %Value* %2, %Value** %11
  ret void
}

define void @set (%Str %_id, %Nat64 %_v) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %v = alloca %Nat64
  store %Nat64 %_v, %Nat64* %v

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 8)
  %2 = bitcast %Unit* %1 to %Nat64*

;stmt1:
  %3 = load %Nat64, %Nat64* %v
  store %Nat64 %3, %Nat64* %2

;stmt2:
  %4 = load %List*, %List** @settings
  %5 = load %Str, %Str* %id
  %6 = call %Unit* (%List*, %Str) @map_get (%List* %4, %Str %5)

;stmt3:
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  call void (%Unit*) @free (%Unit* %6)

;stmt6:
  %9 = load %List*, %List** @settings
  %10 = load %Str, %Str* %id
  %11 = bitcast %Nat64* %2 to %Unit*
  %12 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %9, %Str %10, %Unit* %11)
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %13 = load %List*, %List** @settings
  %14 = load %Str, %Str* %id
  %15 = bitcast %Nat64* %2 to %Unit*
  call void (%List*, %Str, %Unit*) @map_reset (%List* %13, %Str %14, %Unit* %15)
  br label %endif_0
endif_0:
  ret void
}

define %Nat64 @get (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = load %List*, %List** @settings
  %2 = load %Str, %Str* %id
  %3 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %2)
  %4 = bitcast %Unit* %3 to %Nat64*

;stmt1:
  %5 = load %Nat64, %Nat64* %4
  ret %Nat64 %5
}

define void @parse (%Source* %_src) {
  %src = alloca %Source*
  store %Source* %_src, %Source** %src

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0 ; eval_access
  %2 = load %Source*, %Source** %1

;stmt1:
  %3 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0 ; eval_access
  %4 = load %Source*, %Source** %src
  store %Source* %4, %Source** %3

;stmt2:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  call void () @skip_nl ()

;stmt5:
  %5 = bitcast [7 x %Nat8]* @func163_str1 to %Str
  %6 = call %Bool (%Str) @match (%Str %5)
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  call void () @doimport ()
  br label %endif_0
else_0:

;stmt8:

;stmt9:
  br label %break_0
  br label %endif_0
endif_0:
  br label %continue_0
break_0:

;stmt10:
  br label %continue_1
continue_1:
  br i1 1, label %body_1, label %break_1
body_1:

;stmt11:

;stmt12:
  call void () @skip_nl ()

;stmt13:
  %8 = call %Token* () @ctok ()

;stmt14:
  %9 = bitcast [4 x %Nat8]* @func163_str2 to %Str
  %10 = call %Bool (%Str) @match (%Str %9)
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt15:

;stmt16:
  %11 = call %Stmt* (%Bool) @dolet (%Bool 0)
  br label %endif_1
else_1:

;stmt17:
  %12 = bitcast [5 x %Nat8]* @func163_str3 to %Str
  %13 = call %Bool (%Str) @match (%Str %12)
  br i1 %13, label %then_2, label %else_2
then_2:

;stmt18:

;stmt19:
  call void () @dotypedef ()
  br label %endif_2
else_2:

;stmt20:
  %14 = bitcast [7 x %Nat8]* @func163_str4 to %Str
  %15 = call %Bool (%Str) @match (%Str %14)
  br i1 %15, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  call void () @doextern ()
  br label %endif_3
else_3:

;stmt23:
  %16 = bitcast [4 x %Nat8]* @func163_str5 to %Str
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_4, label %else_4
then_4:

;stmt24:

;stmt25:
  call void () @dovardef ()
  br label %endif_4
else_4:

;stmt26:

;stmt27:
  %18 = bitcast [8 x %Nat8]* @func163_str6 to %Str
  %19 = call %Bool (%Str) @match (%Str %18)
  br i1 %19, label %then_5, label %else_5
then_5:

;stmt28:

;stmt29:
  %20 = bitcast [12 x %Nat8]* @func163_str7 to %Str
  call void (%Str, %Nat64) @set (%Str %20, %Nat64 1)

;stmt30:
  br label %continue_1
  br label %endif_5
else_5:
  br label %endif_5
endif_5:

;stmt31:
  %22 = bitcast [11 x %Nat8]* @func163_str8 to %Str
  %23 = call %Bool (%Str) @match (%Str %22)
  br i1 %23, label %then_6, label %else_6
then_6:

;stmt32:

;stmt33:
  br label %continue_1
  br label %endif_6
else_6:
  br label %endif_6
endif_6:

;stmt34:
  %25 = call %Bool () @eof ()
  br i1 %25, label %then_7, label %else_7
then_7:

;stmt35:

;stmt36:
  br label %break_1
  br label %endif_7
else_7:
  br label %endif_7
endif_7:

;stmt37:
  %27 = bitcast [17 x %Nat8]* @func163_str9 to %Str
  %28 = call %Token* () @ctok ()
  %29 = getelementptr inbounds %Token, %Token* %28, i32 0, i32 1 ; eval_access
  call void (%Str, %TokenInfo*) @error (%Str %27, %TokenInfo* %29)

;stmt38:
  br label %continue_2
continue_2:
  br i1 1, label %body_2, label %break_2
body_2:

;stmt39:

;stmt40:
  %30 = call %Token* () @ctok ()

;stmt41:
  %31 = getelementptr inbounds %Token, %Token* %30, i32 0, i32 0 ; eval_access
  %32 = load %TokenType, %TokenType* %31
  %33 = icmp eq %TokenType %32, 1
  br i1 %33, label %then_8, label %else_8
then_8:

;stmt42:

;stmt43:
  %34 = bitcast [4 x %Nat8]* @func163_str10 to %Str
  %35 = getelementptr inbounds %Token, %Token* %30, i32 0, i32 2 ; eval_access
  %36 = bitcast [0 x %Nat8]* %35 to %Str
  %37 = call %Int32 (%Str, %Str) @strcmp (%Str %34, %Str %36)
  %38 = icmp eq %Int32 %37, 0
  %39 = bitcast [4 x %Nat8]* @func163_str11 to %Str
  %40 = getelementptr inbounds %Token, %Token* %30, i32 0, i32 2 ; eval_access
  %41 = bitcast [0 x %Nat8]* %40 to %Str
  %42 = call %Int32 (%Str, %Str) @strcmp (%Str %39, %Str %41)
  %43 = icmp eq %Int32 %42, 0
  %44 = bitcast [5 x %Nat8]* @func163_str12 to %Str
  %45 = getelementptr inbounds %Token, %Token* %30, i32 0, i32 2 ; eval_access
  %46 = bitcast [0 x %Nat8]* %45 to %Str
  %47 = call %Int32 (%Str, %Str) @strcmp (%Str %44, %Str %46)
  %48 = icmp eq %Int32 %47, 0
  %49 = or %Bool %43, %48
  %50 = or %Bool %38, %49
  br i1 %50, label %then_9, label %else_9
then_9:

;stmt44:

;stmt45:
  br label %break_2
  br label %endif_9
else_9:
  br label %endif_9
endif_9:
  br label %endif_8
else_8:

;stmt46:
  %52 = getelementptr inbounds %Token, %Token* %30, i32 0, i32 0 ; eval_access
  %53 = load %TokenType, %TokenType* %52
  %54 = icmp eq %TokenType %53, 0
  br i1 %54, label %then_10, label %else_10
then_10:

;stmt47:

;stmt48:
  br label %break_2
  br label %endif_10
else_10:
  br label %endif_10
endif_10:
  br label %endif_8
endif_8:

;stmt49:
  call void () @skip ()
  br label %continue_2
break_2:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:

;stmt50:
  %56 = bitcast [12 x %Nat8]* @func163_str13 to %Str
  call void (%Str, %Nat64) @set (%Str %56, %Nat64 0)
  br label %continue_1
break_1:

;stmt51:
  %57 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0 ; eval_access
  store %Source* %2, %Source** %57
  ret void
}

define void @doimport () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0 ; eval_access
  %3 = load %TokenType, %TokenType* %2
  %4 = icmp ne %TokenType %3, 4
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = bitcast [23 x %Nat8]* @func164_str1 to %Str
  %6 = call %Token* () @ctok ()
  %7 = getelementptr inbounds %Token, %Token* %6, i32 0, i32 1 ; eval_access
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %7)

;stmt3:
  call void () @skip ()

;stmt4:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 2 ; eval_access
  %11 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %10, i32 0, %Int32 0 ; eval_index
  %12 = bitcast %Nat8* %11 to %Str
  %13 = call %Str (%Str) @dup (%Str %12)

;stmt6:
  call void () @skip ()

;stmt7:
  %14 = call %Str (%Nat32) @str_new (%Nat32 512)

;stmt8:
  %15 = call %Str (%Str, %Nat32) @getcwd (%Str %14, %Nat32 512)

;stmt9:
  %16 = call %Source* (%Str) @source_open (%Str %13)

;stmt10:
  %17 = bitcast %Source* %16 to %Unit*
  %18 = inttoptr %Nat32 0 to %Unit*
  %19 = icmp eq %Unit* %17, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %20 = bitcast [18 x %Nat8]* @func164_str2 to %Str
  %21 = call %Int32 (%Str, ...) @printf (%Str %20, %Str %13)

;stmt13:
  %22 = bitcast [14 x %Nat8]* @func164_str3 to %Str
  call void (%Str) @fatal (%Str %22)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt14:
  call void (%Source*) @parse (%Source* %16)

;stmt15:
  %23 = call %Int32 (%Str) @chdir (%Str %14)

;stmt16:
  %24 = bitcast %Str %13 to %Unit*
  call void (%Unit*) @free (%Unit* %24)

;stmt17:
  %25 = bitcast %Str %14 to %Unit*
  call void (%Unit*) @free (%Unit* %25)

;stmt18:
ret void

;stmt19:
  br label %fail
fail:

;stmt20:
  %27 = bitcast %Str %13 to %Unit*
  call void (%Unit*) @free (%Unit* %27)

;stmt21:
  %28 = bitcast %Str %14 to %Unit*
  call void (%Unit*) @free (%Unit* %28)
  ret void
}

define void @dotypedef () {

;stmt0:
  %1 = call %Str () @parse_id ()

;stmt1:
  %2 = bitcast %Str %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %6 = bitcast [2 x %Nat8]* @func165_str1 to %Str
  %7 = call %Bool (%Str) @need (%Str %6)

;stmt5:
  %t = alloca %Type*

;stmt6:
  %8 = call %Type* (%Bool) @parse_type (%Bool 1)
  store %Type* %8, %Type** %t

;stmt7:
  %9 = load %Type*, %Type** %t
  %10 = bitcast %Type* %9 to %Unit*
  %11 = inttoptr %Nat32 0 to %Unit*
  %12 = icmp eq %Unit* %10, %11
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %14 = load %Type*, %Type** %t
  %15 = getelementptr inbounds %Type, %Type* %14, i32 0, i32 0 ; eval_access
  %16 = load %TypeKind, %TypeKind* %15
  %17 = icmp ne %TypeKind %16, 3
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %18 = load %Type*, %Type** %t
  %19 = getelementptr inbounds %Type, %Type* %18, i32 0, i32 1 ; eval_access
  %20 = load %Str, %Str* %19
  %21 = bitcast %Str %20 to %Unit*
  %22 = inttoptr %Nat32 0 to %Unit*
  %23 = icmp eq %Unit* %21, %22
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %24 = load %Type*, %Type** %t
  %25 = getelementptr inbounds %Type, %Type* %24, i32 0, i32 1 ; eval_access
  store %Str %1, %Str* %25
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt15:
  %tt = alloca %Type*

;stmt16:
  %26 = call %Type* (%Str) @get_type (%Str %1)
  store %Type* %26, %Type** %tt

;stmt17:
  %27 = load %Type*, %Type** %tt
  %28 = bitcast %Type* %27 to %Unit*
  %29 = inttoptr %Nat32 0 to %Unit*
  %30 = icmp ne %Unit* %28, %29
  br i1 %30, label %then_4, label %else_4
then_4:

;stmt18:

;stmt19:
  %31 = load %Type*, %Type** %tt
  %32 = getelementptr inbounds %Type, %Type* %31, i32 0, i32 0 ; eval_access
  %33 = load %TypeKind, %TypeKind* %32
  %34 = icmp eq %TypeKind %33, 2
  br i1 %34, label %then_5, label %else_5
then_5:

;stmt20:

;stmt21:
  %35 = load %Type*, %Type** %tt
  %36 = bitcast %Type* %35 to %Unit*
  %37 = load %Type*, %Type** %t
  %38 = bitcast %Type* %37 to %Unit*
  %39 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %36, %Unit* %38, %Nat32 184)

;stmt22:
  %40 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  %41 = load %Type*, %Type** %t
  %42 = call %TypeDef* (%Assembly*, %Str, %Type*) @asm_typedef_add (%Assembly* %40, %Str %1, %Type* %41)

;stmt23:
ret void
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_4
else_4:
  br label %endif_4
endif_4:

;stmt24:
  %44 = load %Type*, %Type** %t
  call void (%Str, %Type*) @bind_type_global (%Str %1, %Type* %44)

;stmt25:
  %45 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  %46 = load %Type*, %Type** %t
  %47 = call %TypeDef* (%Assembly*, %Str, %Type*) @asm_typedef_add (%Assembly* %45, %Str %1, %Type* %46)
  ret void
}

define void @handle_fields (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %4 = load %Str, %Str* %3

;stmt2:
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %6 = load %Type*, %Type** %5

;stmt3:
  %7 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %8 = load %Value*, %Value** %7
  %9 = bitcast %Value* %8 to %Unit*
  %10 = inttoptr %Nat32 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %12 = inttoptr %Nat32 0 to %Unit*
  %13 = bitcast %Unit* %12 to %Value*
  %14 = call %Value* (%Str, %Type*, %Value*) @create_local_var (%Str %4, %Type* %6, %Value* %13)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %15 = inttoptr %Nat32 0 to %Unit*
  %16 = bitcast %Unit* %15 to %Value*
  call void (%Str, %Type*, %Value*) @create_global_var (%Str %4, %Type* %6, %Value* %16)
  br label %endif_0
endif_0:
  ret void
}

define void @dovardef () {

;stmt0:
  %1 = call %List* () @parse_field ()

;stmt1:
  %2 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %1, %ListForeachHandler @handle_fields, %Unit* %2)
  ret void
}

define %Stmt* @dolet (%Bool %_local) {
  %local = alloca %Bool
  store %Bool %_local, %Bool* %local

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access

;stmt1:
  %3 = call %Str () @parse_id ()

;stmt2:
  %4 = bitcast [2 x %Nat8]* @func168_str1 to %Str
  %5 = call %Bool (%Str) @need (%Str %4)

;stmt3:
  %6 = call %Value* () @expr ()

;stmt4:
  %7 = bitcast %Str %3 to %Unit*
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  %10 = bitcast %Value* %6 to %Unit*
  %11 = inttoptr %Nat32 0 to %Unit*
  %12 = icmp eq %Unit* %10, %11
  %13 = or %Bool %9, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %14 = inttoptr %Nat32 0 to %Unit*
  %15 = bitcast %Unit* %14 to %Stmt*
  ret %Stmt* %15
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  call void (%Value*, %Str) @rename (%Value* %6, %Str %3)

;stmt8:
  %17 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 10 ; eval_access
  store %TokenInfo* %2, %TokenInfo** %17

;stmt9:
  %18 = load %Bool, %Bool* %local
  %19 = xor %Bool %18, 1
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  call void (%Str, %Value*, %TokenInfo*) @def_global (%Str %3, %Value* %6, %TokenInfo* %2)

;stmt12:
  %20 = inttoptr %Nat32 0 to %Unit*
  %21 = bitcast %Unit* %20 to %Stmt*
  ret %Stmt* %21
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt13:
  %23 = call %Bool (%Value*) @value_is_const (%Value* %6)
  %24 = xor %Bool %23, 1
  br i1 %24, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %25 = inttoptr %Nat32 0 to %Unit*
  %26 = bitcast %Unit* %25 to %Type*
  %27 = inttoptr %Nat32 0 to %Unit*
  %28 = bitcast %Unit* %27 to %Value*
  %29 = inttoptr %Nat32 0 to %Unit*
  %30 = bitcast %Unit* %29 to %Value*
  %31 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_register (%ValueKind 1, %Type* %26, %Value* %28, %Value* %30)

;stmt16:
  %32 = getelementptr inbounds %Value, %Value* %31, i32 0, i32 2 ; eval_access
  %33 = getelementptr inbounds %Storage, %Storage* %32, i32 0, i32 3 ; eval_access
  store %Str %3, %Str* %33

;stmt17:
  %34 = call %Stmt* (%Value*, %Value*) @stmt_new_let (%Value* %6, %Value* %31)

;stmt18:
  %35 = getelementptr inbounds %Stmt, %Stmt* %34, i32 0, i32 7 ; eval_access
  store %TokenInfo* %2, %TokenInfo** %35

;stmt19:
  call void (%Str, %Value*) @bind_value_local (%Str %3, %Value* %31)

;stmt20:
  ret %Stmt* %34
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt21:
  %37 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %38 = load %Block*, %Block** %37
  call void (%Block*, %Str, %Value*) @bind_value_in_block (%Block* %38, %Str %3, %Value* %6)

;stmt22:
  %39 = inttoptr %Nat32 0 to %Unit*
  %40 = bitcast %Unit* %39 to %Stmt*
  ret %Stmt* %40
}

define void @extern_decl (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 3 ; eval_access
  %8 = load %TokenInfo*, %TokenInfo** %7
  call void (%Str, %Type*, %TokenInfo*) @declare (%Str %4, %Type* %6, %TokenInfo* %8)
  ret void
}

define void @doextern () {

;stmt0:
  %1 = call %List* () @parse_field ()

;stmt1:
  %2 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %1, %ListForeachHandler @extern_decl, %Unit* %2)
  ret void
}

define %Block* @doblock () {

;stmt0:
  %1 = call %List* () @map_new ()

;stmt1:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 72)
  %3 = bitcast %Unit* %2 to %Block*

;stmt2:
  %4 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 1 ; eval_access
  %5 = call %List* () @map_new ()
  store %List* %5, %List** %4

;stmt3:
  %6 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 4 ; eval_access
  %7 = call %List* () @map_new ()
  store %List* %7, %List** %6

;stmt4:
  %8 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 2 ; eval_access
  call void (%List*) @map_init (%List* %8)

;stmt5:
  %9 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 3 ; eval_access
  call void (%List*) @map_init (%List* %9)

;stmt6:
  %10 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 0 ; eval_access
  %11 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %12 = load %Block*, %Block** %11
  store %Block* %12, %Block** %10

;stmt7:
  %13 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  store %Block* %3, %Block** %13

;stmt8:
  br label %continue_0
continue_0:
  %14 = bitcast [2 x %Nat8]* @func171_str1 to %Str
  %15 = call %Bool (%Str) @match (%Str %14)
  %16 = xor %Bool %15, 1
  br i1 %16, label %body_0, label %break_0
body_0:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %17 = call %Bool () @eof ()
  br i1 %17, label %then_0, label %else_0
then_0:

;stmt12:

;stmt13:
  %18 = bitcast [23 x %Nat8]* @func171_str2 to %Str
  call void (%Str) @fatal (%Str %18)

;stmt14:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt15:
  %20 = bitcast [2 x %Nat8]* @func171_str3 to %Str
  %21 = call %Bool (%Str) @match (%Str %20)
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt16:

;stmt17:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt18:
  %23 = call %Stmt* () @stmt ()

;stmt19:
  %24 = bitcast %Stmt* %23 to %Unit*
  %25 = inttoptr %Nat32 0 to %Unit*
  %26 = icmp ne %Unit* %24, %25
  br i1 %26, label %then_2, label %else_2
then_2:

;stmt20:

;stmt21:
  %27 = call %Bool () @sep ()

;stmt22:
  call void (%Stmt*) @add_stmt (%Stmt* %23)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %continue_0
break_0:

;stmt23:
  %28 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %29 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 0 ; eval_access
  %30 = load %Block*, %Block** %29
  store %Block* %30, %Block** %28

;stmt24:
  ret %Block* %3
}

define %Str @parse_id () {

;stmt0:
  %1 = call %Token* () @ctok ()

;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0 ; eval_access
  %3 = load %TokenType, %TokenType* %2
  %4 = icmp ne %TokenType %3, 1
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = bitcast [12 x %Nat8]* @func172_str1 to %Str
  %6 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)

;stmt4:
  %7 = bitcast [9 x %Nat8]* @func172_str2 to %Str
  %8 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0 ; eval_access
  %9 = load %TokenType, %TokenType* %8
  %10 = call %Int32 (%Str, ...) @printf (%Str %7, %TokenType %9)

;stmt5:
  %11 = bitcast [9 x %Nat8]* @func172_str3 to %Str
  %12 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2 ; eval_access
  %13 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %12, i32 0, %Int32 0 ; eval_index
  %14 = load %Nat8, %Nat8* %13
  %15 = call %Int32 (%Str, ...) @printf (%Str %11, %Nat8 %14)

;stmt6:
  %16 = bitcast [14 x %Nat8]* @func172_str4 to %Str
  %17 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2 ; eval_access
  %18 = bitcast [0 x %Nat8]* %17 to %Str
  %19 = call %Int32 (%Str, ...) @printf (%Str %16, %Str %18)

;stmt7:
  %20 = inttoptr %Nat32 0 to %Unit*
  %21 = bitcast %Unit* %20 to %Str
  ret %Str %21
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %23 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access
  %24 = getelementptr inbounds %TokenInfo, %TokenInfo* %23, i32 0, i32 3 ; eval_access
  %25 = load %Nat16, %Nat16* %24
  %26 = zext %Nat16 %25 to %Nat32
  %27 = add %Nat32 %26, 1
  %28 = call %Str (%Nat32) @str_new (%Nat32 %27)

;stmt9:
  %29 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2 ; eval_access
  %30 = bitcast [0 x %Nat8]* %29 to %Str
  %31 = call %Nat8* (%Str, %Str) @strcpy (%Str %28, %Str %30)

;stmt10:
  call void () @skip ()

;stmt11:
  ret %Str %28
}

define void @set_type (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = load %Unit*, %Unit** %ctx
  %4 = bitcast %Unit* %3 to %Type*

;stmt2:
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  store %Type* %4, %Type** %5
  ret void
}

define %List* @parse_field () {

;stmt0:
  %1 = call %List* () @map_new ()

;stmt1:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt2:

;stmt3:
  %2 = call %Token* () @ctok ()
  %3 = getelementptr inbounds %Token, %Token* %2, i32 0, i32 1 ; eval_access

;stmt4:
  %4 = call %Str () @parse_id ()

;stmt5:
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = bitcast %Unit* %5 to %Type*
  %7 = call %Field* (%Str, %Type*, %TokenInfo*) @field_new (%Str %4, %Type* %6, %TokenInfo* %3)

;stmt6:
  %8 = bitcast %Field* %7 to %Unit*
  %9 = call %Bool (%List*, %Unit*) @list_append (%List* %1, %Unit* %8)

;stmt7:
  %10 = bitcast [2 x %Nat8]* @func173_str1 to %Str
  %11 = call %Bool (%Str) @match (%Str %10)
  %12 = xor %Bool %11, 1
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt10:
  call void () @skip_nl ()
  br label %continue_0
break_0:

;stmt11:
  %14 = bitcast [2 x %Nat8]* @func173_str2 to %Str
  %15 = call %Bool (%Str) @need (%Str %14)

;stmt12:
  %16 = call %Type* (%Bool) @parse_type (%Bool 1)

;stmt13:
  %17 = bitcast %Type* %16 to %Unit*
  %18 = inttoptr %Nat32 0 to %Unit*
  %19 = icmp eq %Unit* %17, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt14:

;stmt15:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt16:
  %21 = bitcast %Type* %16 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %1, %ListForeachHandler @set_type, %Unit* %21)

;stmt17:
  ret %List* %1

;stmt18:
  br label %fail
fail:

;stmt19:
  %23 = inttoptr %Nat32 0 to %Unit*
  %24 = bitcast %Unit* %23 to %List*
  ret %List* %24
}

define %Node* @gett () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0 ; eval_access
  %2 = load %Source*, %Source** %1
  %3 = getelementptr inbounds %Source, %Source* %2, i32 0, i32 4 ; eval_access
  %4 = load %Node*, %Node** %3
  ret %Node* %4
}

define void @sett (%Node* %_tn) {
  %tn = alloca %Node*
  store %Node* %_tn, %Node** %tn

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0 ; eval_access
  %2 = load %Source*, %Source** %1
  %3 = getelementptr inbounds %Source, %Source* %2, i32 0, i32 4 ; eval_access
  %4 = load %Node*, %Node** %tn
  store %Node* %4, %Node** %3
  ret void
}

define %Token* @ctok () {

;stmt0:
  %1 = call %Node* () @gett ()
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 3 ; eval_access
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Token*
  ret %Token* %4
}

define %Bool @eof () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0 ; eval_access
  %3 = load %TokenType, %TokenType* %2
  %4 = icmp eq %TokenType %3, 0
  ret %Bool %4
}

define %Bool @sep () {

;stmt0:
  %1 = call %Token* () @ctok ()

;stmt1:
  %2 = call %Bool () @separator ()

;stmt2:
  %3 = icmp eq %Bool %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %4 = bitcast [19 x %Nat8]* @func179_str1 to %Str
  %5 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  ret %Bool %2
}

define %Bool @separator () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2 ; eval_access
  %3 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Nat8, %Nat8* %3

;stmt1:
  %5 = bitcast [2 x %Nat8]* @func180_str1 to %Str
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0 ; eval_index
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %4, %7
  %9 = bitcast [2 x %Nat8]* @func180_str2 to %Str
  %10 = getelementptr inbounds %Nat8, %Str %9, %Int32 0 ; eval_index
  %11 = load %Nat8, %Nat8* %10
  %12 = icmp eq %Nat8 %4, %11
  %13 = or %Bool %8, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  call void () @skip ()

;stmt4:
  ret %Bool 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %15 = bitcast [2 x %Nat8]* @func180_str3 to %Str
  %16 = getelementptr inbounds %Nat8, %Str %15, %Int32 0 ; eval_index
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp eq %Nat8 %4, %17
  %19 = bitcast [2 x %Nat8]* @func180_str4 to %Str
  %20 = getelementptr inbounds %Nat8, %Str %19, %Int32 0 ; eval_index
  %21 = load %Nat8, %Nat8* %20
  %22 = icmp eq %Nat8 %4, %21
  %23 = or %Bool %18, %22
  br i1 %23, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt8:
  ret %Bool 0
}

define void @skip () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0 ; eval_access
  %2 = load %Source*, %Source** %1
  %3 = getelementptr inbounds %Source, %Source* %2, i32 0, i32 4 ; eval_access
  %4 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0 ; eval_access
  %5 = load %Source*, %Source** %4
  %6 = getelementptr inbounds %Source, %Source* %5, i32 0, i32 4 ; eval_access
  %7 = load %Node*, %Node** %6
  %8 = getelementptr inbounds %Node, %Node* %7, i32 0, i32 1 ; eval_access
  %9 = load %Node*, %Node** %8
  store %Node* %9, %Node** %3
  ret void
}

define %Bool @match (%Str %_s) {
  %s = alloca %Str
  store %Str %_s, %Str* %s

;stmt0:
  %1 = call %Token* () @ctok ()

;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0 ; eval_access
  %3 = load %TokenType, %TokenType* %2
  %4 = icmp eq %TokenType %3, 4
  %5 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0 ; eval_access
  %6 = load %TokenType, %TokenType* %5
  %7 = icmp eq %TokenType %6, 0
  %8 = or %Bool %4, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %10 = load %Str, %Str* %s
  %11 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2 ; eval_access
  %12 = bitcast [0 x %Nat8]* %11 to %Str
  %13 = call %Int32 (%Str, %Str) @strcmp (%Str %10, %Str %12)
  %14 = icmp eq %Int32 %13, 0

;stmt5:
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  call void () @skip ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt8:
  ret %Bool %14
}

define void @module_context_init (%ModuleContext* %_ctx) {
  %ctx = alloca %ModuleContext*
  store %ModuleContext* %_ctx, %ModuleContext** %ctx

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1 ; eval_access
  call void (%List*) @map_init (%List* %1)

;stmt1:
  %2 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2 ; eval_access
  call void (%List*) @map_init (%List* %2)
  ret void
}

define void @declare (%Str %_id, %Type* %_type, %TokenInfo* %_ti) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %type = alloca %Type*
  store %Type* %_type, %Type** %type
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Str, %Str* %id
  %2 = bitcast %Str %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Type*, %Type** %type
  %6 = bitcast %Type* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %4, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %11 = load %Str, %Str* %id
  %12 = call %Value* (%Str) @get_value_global (%Str %11)

;stmt4:
  %13 = bitcast %Value* %12 to %Unit*
  %14 = inttoptr %Nat32 0 to %Unit*
  %15 = icmp ne %Unit* %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %16 = bitcast [25 x %Nat8]* @func184_str1 to %Str
  %17 = load %TokenInfo*, %TokenInfo** %ti
  call void (%Str, %TokenInfo*) @error (%Str %16, %TokenInfo* %17)

;stmt7:
  %18 = bitcast [14 x %Nat8]* @func184_str2 to %Str
  %19 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 9 ; eval_access
  %20 = load %TokenInfo*, %TokenInfo** %19
  call void (%Str, %TokenInfo*) @rem (%Str %18, %TokenInfo* %20)

;stmt8:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %22 = load %Type*, %Type** %type
  %23 = inttoptr %Nat32 0 to %Unit*
  %24 = bitcast %Unit* %23 to %Value*
  %25 = inttoptr %Nat32 0 to %Unit*
  %26 = bitcast %Unit* %25 to %Value*
  %27 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 1, %Type* %22, %Value* %24, %Value* %26)

;stmt10:
  %28 = getelementptr inbounds %Value, %Value* %27, i32 0, i32 2 ; eval_access
  %29 = getelementptr inbounds %Storage, %Storage* %28, i32 0, i32 3 ; eval_access
  %30 = load %Str, %Str* %id
  %31 = call %Str (%Str) @decorate (%Str %30)
  store %Str %31, %Str* %29

;stmt11:
  %32 = getelementptr inbounds %Value, %Value* %27, i32 0, i32 1 ; eval_access
  %33 = load %Type*, %Type** %type
  store %Type* %33, %Type** %32

;stmt12:
  %34 = getelementptr inbounds %Value, %Value* %27, i32 0, i32 9 ; eval_access
  %35 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %35, %TokenInfo** %34

;stmt13:
  %36 = load %Type*, %Type** %type
  %37 = getelementptr inbounds %Type, %Type* %36, i32 0, i32 0 ; eval_access
  %38 = load %TypeKind, %TypeKind* %37
  %39 = icmp eq %TypeKind %38, 4
  br i1 %39, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %40 = getelementptr inbounds %Value, %Value* %27, i32 0, i32 2 ; eval_access
  %41 = getelementptr inbounds %Storage, %Storage* %40, i32 0, i32 0 ; eval_access
  store %StorageClass 2, %StorageClass* %41

;stmt16:
  %42 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  %43 = load %Str, %Str* %id
  %44 = load %Type*, %Type** %type
  %45 = inttoptr %Nat32 0 to %Unit*
  %46 = bitcast %Unit* %45 to %Block*
  %47 = call %FuncDef* (%Assembly*, %Str, %Type*, %Block*) @asm_funcdef_add (%Assembly* %42, %Str %43, %Type* %44, %Block* %46)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt17:
  %48 = load %Str, %Str* %id
  call void (%Str, %Value*) @bind_value_global (%Str %48, %Value* %27)
  ret void
}

define void @def_global (%Str %_id, %Value* %_v, %TokenInfo* %_ti) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Str, %Str* %id
  %2 = bitcast %Str %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  %5 = bitcast [18 x %Nat8]* @func185_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %4, %Str %5)

;stmt1:
  %6 = load %Value*, %Value** %v
  %7 = bitcast %Value* %6 to %Unit*
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  %10 = bitcast [17 x %Nat8]* @func185_str2 to %Str
  call void (%Bool, %Str) @assert (%Bool %9, %Str %10)

;stmt2:
  %11 = load %Value*, %Value** %v
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 10 ; eval_access
  %13 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %13, %TokenInfo** %12

;stmt3:
  %14 = load %Str, %Str* %id
  %15 = call %Value* (%Str) @get_value_global (%Str %14)

;stmt4:
  %16 = bitcast %Value* %15 to %Unit*
  %17 = inttoptr %Nat32 0 to %Unit*
  %18 = icmp ne %Unit* %16, %17
  br i1 %18, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %19 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 0 ; eval_access
  %20 = load %Value*, %Value** %v
  %21 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 0 ; eval_access
  %22 = load %ValueKind, %ValueKind* %21
  store %ValueKind %22, %ValueKind* %19

;stmt7:
  %23 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 1 ; eval_access
  %24 = load %Value*, %Value** %v
  %25 = getelementptr inbounds %Value, %Value* %24, i32 0, i32 1 ; eval_access
  %26 = load %Type*, %Type** %25
  store %Type* %26, %Type** %23

;stmt8:
  %27 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 2 ; eval_access
  %28 = load %Value*, %Value** %v
  %29 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 2 ; eval_access
  %30 = load %Storage, %Storage* %29
  store %Storage %30, %Storage* %27

;stmt9:
  %31 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 6 ; eval_access
  %32 = load %Value*, %Value** %v
  %33 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 6 ; eval_access
  %34 = load %Block*, %Block** %33
  store %Block* %34, %Block** %31

;stmt10:
  %35 = load %Str, %Str* %id
  call void (%Value*, %Str) @rename (%Value* %15, %Str %35)

;stmt11:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt12:
  %37 = load %Value*, %Value** %v
  %38 = load %Str, %Str* %id
  call void (%Value*, %Str) @rename (%Value* %37, %Str %38)

;stmt13:
  %39 = load %Str, %Str* %id
  %40 = load %Value*, %Value** %v
  call void (%Str, %Value*) @bind_value_global (%Str %39, %Value* %40)
  ret void
}

define void @rename (%Value* %_v, %Str %_id) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = load %Str, %Str* %id
  %2 = call %Str (%Str) @decorate (%Str %1)

;stmt1:
  %3 = load %Value*, %Value** %v
  %4 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 2 ; eval_access
  %5 = getelementptr inbounds %Storage, %Storage* %4, i32 0, i32 0 ; eval_access
  %6 = load %StorageClass, %StorageClass* %5

;stmt2:
  %7 = icmp eq %StorageClass %6, 2
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = load %Value*, %Value** %v
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 2 ; eval_access
  %10 = getelementptr inbounds %Storage, %Storage* %9, i32 0, i32 3 ; eval_access
  %11 = load %Str, %Str* %10

;stmt5:
  %12 = load %Value*, %Value** %v
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 2 ; eval_access
  %14 = getelementptr inbounds %Storage, %Storage* %13, i32 0, i32 3 ; eval_access
  store %Str %2, %Str* %14

;stmt6:
  %15 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  call void (%Assembly*, %Str, %Str) @asm_func_rename (%Assembly* %15, %Str %11, %Str %2)
  br label %endif_0
else_0:

;stmt7:
  %16 = icmp eq %StorageClass %6, 3
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %17 = load %Value*, %Value** %v
  %18 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 3 ; eval_access
  %19 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %18, i32 0, %Int32 0 ; eval_index
  %20 = load %Value*, %Value** %19
  %21 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 2 ; eval_access
  %22 = getelementptr inbounds %Storage, %Storage* %21, i32 0, i32 3 ; eval_access
  %23 = load %Str, %Str* %22

;stmt10:
  %24 = load %Value*, %Value** %v
  %25 = getelementptr inbounds %Value, %Value* %24, i32 0, i32 3 ; eval_access
  %26 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %25, i32 0, %Int32 0 ; eval_index
  %27 = load %Value*, %Value** %26
  %28 = getelementptr inbounds %Value, %Value* %27, i32 0, i32 2 ; eval_access
  %29 = getelementptr inbounds %Storage, %Storage* %28, i32 0, i32 3 ; eval_access
  store %Str %2, %Str* %29

;stmt11:
  %30 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  call void (%Assembly*, %Str, %Str) @asm_const_rename (%Assembly* %30, %Str %23, %Str %2)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  ret void
}

define void @bind_type_local (%Str %_id, %Type* %_t) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %2 = load %Block*, %Block** %1
  %3 = getelementptr inbounds %Block, %Block* %2, i32 0, i32 2 ; eval_access
  %4 = load %Str, %Str* %id
  %5 = load %Type*, %Type** %t
  call void (%List*, %Str, %Type*) @add_type (%List* %3, %Str %4, %Type* %5)
  ret void
}

define void @bind_type_global (%Str %_id, %Type* %_t) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1 ; eval_access
  %2 = load %Str, %Str* %id
  %3 = load %Type*, %Type** %t
  call void (%List*, %Str, %Type*) @add_type (%List* %1, %Str %2, %Type* %3)
  ret void
}

define void @bind_type_builtin (%Str %_id, %Type* %_t) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %List*, %List** @globalTypeIndex
  %2 = load %Str, %Str* %id
  %3 = load %Type*, %Type** %t
  %4 = bitcast %Type* %3 to %Unit*
  %5 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %1, %Str %2, %Unit* %4)
  ret void
}

define void @add_type (%List* %_index, %Str %_id, %Type* %_t) {
  %index = alloca %List*
  store %List* %_index, %List** %index
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %List*, %List** %index
  %2 = load %Str, %Str* %id
  %3 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %2)
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = bitcast [44 x %Nat8]* @func190_str1 to %Str
  %7 = load %Type*, %Type** %t
  %8 = getelementptr inbounds %Type, %Type* %7, i32 0, i32 13 ; eval_access
  %9 = load %TokenInfo*, %TokenInfo** %8
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %9)

;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %11 = load %List*, %List** %index
  %12 = load %Str, %Str* %id
  %13 = load %Type*, %Type** %t
  %14 = bitcast %Type* %13 to %Unit*
  %15 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %11, %Str %12, %Unit* %14)
  ret void
}

define %Type* @get_type (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = load %List*, %List** @globalTypeIndex
  %2 = load %Str, %Str* %id
  %3 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %2)

;stmt1:
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = bitcast %Unit* %3 to %Type*
  ret %Type* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %b = alloca %Block*

;stmt5:
  %8 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %9 = load %Block*, %Block** %8
  store %Block* %9, %Block** %b

;stmt6:
  br label %continue_0
continue_0:
  %10 = load %Block*, %Block** %b
  %11 = bitcast %Block* %10 to %Unit*
  %12 = inttoptr %Nat32 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %14 = load %Block*, %Block** %b
  %15 = getelementptr inbounds %Block, %Block* %14, i32 0, i32 2 ; eval_access
  %16 = load %Str, %Str* %id
  %17 = call %Unit* (%List*, %Str) @map_get (%List* %15, %Str %16)
  %18 = bitcast %Unit* %17 to %Type*

;stmt9:
  %19 = bitcast %Type* %18 to %Unit*
  %20 = inttoptr %Nat32 0 to %Unit*
  %21 = icmp ne %Unit* %19, %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  ret %Type* %18
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %23 = load %Block*, %Block** %b
  %24 = getelementptr inbounds %Block, %Block* %23, i32 0, i32 0 ; eval_access
  %25 = load %Block*, %Block** %24
  store %Block* %25, %Block** %b
  br label %continue_0
break_0:

;stmt13:
  %26 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1 ; eval_access
  %27 = load %Str, %Str* %id
  %28 = call %Unit* (%List*, %Str) @map_get (%List* %26, %Str %27)
  %29 = bitcast %Unit* %28 to %Type*
  ret %Type* %29
}

define void @bind_value (%Str %_id, %Value* %_v) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %2 = load %Block*, %Block** %1

;stmt1:
  %3 = bitcast %Block* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Str, %Str* %id
  %7 = load %Value*, %Value** %v
  call void (%Block*, %Str, %Value*) @bind_value_in_block (%Block* %2, %Str %6, %Value* %7)
  br label %endif_0
else_0:

;stmt4:

;stmt5:
  %8 = load %Str, %Str* %id
  %9 = load %Value*, %Value** %v
  call void (%Str, %Value*) @bind_value_global (%Str %8, %Value* %9)
  br label %endif_0
endif_0:
  ret void
}

define void @bind_value_in_block (%Block* %_b, %Str %_id, %Value* %_v) {
  %b = alloca %Block*
  store %Block* %_b, %Block** %b
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Block*, %Block** %b
  %2 = getelementptr inbounds %Block, %Block* %1, i32 0, i32 3 ; eval_access
  %3 = load %Str, %Str* %id
  %4 = load %Value*, %Value** %v
  %5 = bitcast %Value* %4 to %Unit*
  %6 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %2, %Str %3, %Unit* %5)
  %7 = inttoptr %Bool %6 to %Value*
  ret void
}

define void @bind_value_local (%Str %_id, %Value* %_v) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %2 = load %Block*, %Block** %1
  %3 = getelementptr inbounds %Block, %Block* %2, i32 0, i32 3 ; eval_access
  %4 = load %Str, %Str* %id
  %5 = load %Value*, %Value** %v
  call void (%List*, %Str, %Value*) @add_value (%List* %3, %Str %4, %Value* %5)
  ret void
}

define void @bind_value_global (%Str %_id, %Value* %_v) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2 ; eval_access
  %2 = load %Str, %Str* %id
  %3 = load %Value*, %Value** %v
  call void (%List*, %Str, %Value*) @add_value (%List* %1, %Str %2, %Value* %3)
  ret void
}

define void @add_value (%List* %_index, %Str %_id, %Value* %_v) {
  %index = alloca %List*
  store %List* %_index, %List** %index
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %List*, %List** %index
  %2 = load %Str, %Str* %id
  %3 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %2)
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = bitcast [45 x %Nat8]* @func196_str1 to %Str
  %7 = load %Value*, %Value** %v
  %8 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 8 ; eval_access
  %9 = load %TokenInfo*, %TokenInfo** %8
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %9)

;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %11 = load %List*, %List** %index
  %12 = load %Str, %Str* %id
  %13 = load %Value*, %Value** %v
  %14 = bitcast %Value* %13 to %Unit*
  %15 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %11, %Str %12, %Unit* %14)
  ret void
}

define void @bind_value_builtin (%Str %_id, %Value* %_v) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %List*, %List** @globalValueIndex
  %2 = load %Str, %Str* %id
  %3 = load %Value*, %Value** %v
  %4 = bitcast %Value* %3 to %Unit*
  %5 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %1, %Str %2, %Unit* %4)
  ret void
}

define %Value* @get_value (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = load %Str, %Str* %id
  %2 = call %Value* (%Str) @get_value_local (%Str %1)

;stmt1:
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Value* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %global = alloca %Value*

;stmt5:
  %7 = load %Str, %Str* %id
  %8 = call %Value* (%Str) @get_value_global (%Str %7)
  store %Value* %8, %Value** %global

;stmt6:
  %9 = load %Value*, %Value** %global
  %10 = bitcast %Value* %9 to %Unit*
  %11 = inttoptr %Nat32 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %13 = load %Value*, %Value** %global
  ret %Value* %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %15 = load %Str, %Str* %id
  %16 = call %Value* (%Str) @get_value_builtin (%Str %15)
  ret %Value* %16
}

define %Value* @get_value_from_block (%Block* %_b, %Str %_id) {
  %b = alloca %Block*
  store %Block* %_b, %Block** %b
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = load %Block*, %Block** %b
  %2 = getelementptr inbounds %Block, %Block* %1, i32 0, i32 3 ; eval_access
  %3 = load %Str, %Str* %id
  %4 = call %Unit* (%List*, %Str) @map_get (%List* %2, %Str %3)
  %5 = bitcast %Unit* %4 to %Value*
  ret %Value* %5
}

define %Value* @get_value_local (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %b = alloca %Block*

;stmt1:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %2 = load %Block*, %Block** %1
  store %Block* %2, %Block** %b

;stmt2:
  br label %continue_0
continue_0:
  %3 = load %Block*, %Block** %b
  %4 = bitcast %Block* %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %7 = load %Block*, %Block** %b
  %8 = load %Str, %Str* %id
  %9 = call %Value* (%Block*, %Str) @get_value_from_block (%Block* %7, %Str %8)

;stmt5:
  %10 = bitcast %Value* %9 to %Unit*
  %11 = inttoptr %Nat32 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  ret %Value* %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %14 = load %Block*, %Block** %b
  %15 = getelementptr inbounds %Block, %Block* %14, i32 0, i32 0 ; eval_access
  %16 = load %Block*, %Block** %15
  store %Block* %16, %Block** %b

;stmt9:
  %17 = load %Block*, %Block** %b
  %18 = bitcast %Block* %17 to %Unit*
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = icmp eq %Unit* %18, %19
  br i1 %20, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %21 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %22 = load %Value*, %Value** %21
  %23 = getelementptr inbounds %Value, %Value* %22, i32 0, i32 1 ; eval_access
  %24 = load %Type*, %Type** %23
  %25 = getelementptr inbounds %Type, %Type* %24, i32 0, i32 6 ; eval_access
  %26 = getelementptr inbounds %TypeFunc, %TypeFunc* %25, i32 0, i32 0 ; eval_access
  %27 = load %List*, %List** %26
  %28 = load %Str, %Str* %id
  %29 = call %Value* (%List*, %Str) @get_value_from_params (%List* %27, %Str %28)
  ret %Value* %29
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt12:
  %31 = inttoptr %Nat32 0 to %Unit*
  %32 = bitcast %Unit* %31 to %Value*
  ret %Value* %32
}

define %Value* @get_value_global (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2 ; eval_access
  %2 = load %Str, %Str* %id
  %3 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %2)
  %4 = bitcast %Unit* %3 to %Value*
  ret %Value* %4
}

define %Value* @get_value_builtin (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = bitcast [4 x %Nat8]* @func202_str1 to %Str
  %2 = load %Str, %Str* %id
  %3 = call %Int32 (%Str, %Str) @strcmp (%Str %1, %Str %2)
  %4 = icmp eq %Int32 %3, 0
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = call %Value* () @valueFreePtr2 ()
  ret %Value* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %7 = load %List*, %List** @globalValueIndex
  %8 = load %Str, %Str* %id
  %9 = call %Unit* (%List*, %Str) @map_get (%List* %7, %Str %8)

;stmt4:
  %10 = inttoptr %Nat32 0 to %Unit*
  %11 = icmp eq %Unit* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %12 = load %Str, %Str* %id
  %13 = bitcast [5 x %Nat8]* @func202_str2 to %Str
  %14 = call %Int32 (%Str, %Str) @strcmp (%Str %12, %Str %13)
  %15 = icmp eq %Int32 %14, 0
  br i1 %15, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %16 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %17 = load %Value*, %Value** %16
  ret %Value* %17
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %19 = bitcast %Unit* %9 to %Value*
  ret %Value* %19
}

define %Unit* @psearch (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %4 = load %Str, %Str* %3
  %5 = load %Unit*, %Unit** %ctx
  %6 = bitcast %Unit* %5 to %Str
  %7 = call %Int32 (%Str, %Str) @strcmp (%Str %4, %Str %6)
  %8 = icmp eq %Int32 %7, 0
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %9 = load %Unit*, %Unit** %data
  ret %Unit* %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %11 = inttoptr %Nat32 0 to %Unit*
  ret %Unit* %11
}

define %Value* @get_value_from_params (%List* %_params, %Str %_id) {
  %params = alloca %List*
  store %List* %_params, %List** %params
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = load %List*, %List** %params
  %2 = load %Str, %Str* %id
  %3 = bitcast %Str %2 to %Unit*
  %4 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %1, %ListSearchHandler @psearch, %Unit* %3)
  %5 = bitcast %Unit* %4 to %Field*

;stmt1:
  %6 = bitcast %Field* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %9 = inttoptr %Nat32 0 to %Unit*
  %10 = bitcast %Unit* %9 to %Value*
  ret %Value* %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %12 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 1 ; eval_access
  %13 = load %Type*, %Type** %12
  %14 = inttoptr %Nat32 0 to %Unit*
  %15 = bitcast %Unit* %14 to %Value*
  %16 = inttoptr %Nat32 0 to %Unit*
  %17 = bitcast %Unit* %16 to %Value*
  %18 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 1, %Type* %13, %Value* %15, %Value* %17)

;stmt5:
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 2 ; eval_access
  %20 = getelementptr inbounds %Storage, %Storage* %19, i32 0, i32 0 ; eval_access
  store %StorageClass 6, %StorageClass* %20

;stmt6:
  %21 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 8 ; eval_access
  %22 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 3 ; eval_access
  %23 = load %TokenInfo*, %TokenInfo** %22
  store %TokenInfo* %23, %TokenInfo** %21

;stmt7:
  %24 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 2 ; eval_access
  %25 = getelementptr inbounds %Storage, %Storage* %24, i32 0, i32 3 ; eval_access
  %26 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 0 ; eval_access
  %27 = load %Str, %Str* %26
  store %Str %27, %Str* %25

;stmt8:
  ret %Value* %18
}

define %Str @decorate (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = load %Str, %Str* %id
  ret %Str %1
}

define %Str @get_suid (%Str %_prefix, %Nat32 %_uid) {
  %prefix = alloca %Str
  store %Str %_prefix, %Str* %prefix
  %uid = alloca %Nat32
  store %Nat32 %_uid, %Nat32* %uid

;stmt0:
  %1 = load %Str, %Str* %prefix
  %2 = call %Nat32 (%Str) @strlen (%Str %1)
  %3 = add %Nat32 %2, 8
  %4 = add %Nat32 %3, 1
  %5 = call %Unit* (%Nat32) @malloc (%Nat32 %4)
  %6 = bitcast %Unit* %5 to %Str

;stmt1:
  %7 = bitcast %Str %6 to %Unit*
  %8 = bitcast [5 x %Nat8]* @func206_str1 to %Str
  %9 = load %Str, %Str* %prefix
  %10 = load %Nat32, %Nat32* %uid
  %11 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %7, %Str %8, %Str %9, %Nat32 %10)

;stmt2:
  ret %Str %6
}

define %Str @get_prefix () {

;stmt0:
  %s = alloca %Str

;stmt1:
  %1 = bitcast [1 x %Nat8]* @func207_str1 to %Str
  store %Str %1, %Str* %s

;stmt2:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %3 = load %Value*, %Value** %2
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %8 = load %Value*, %Value** %7
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 2 ; eval_access
  %10 = getelementptr inbounds %Storage, %Storage* %9, i32 0, i32 3 ; eval_access
  %11 = load %Str, %Str* %10
  %12 = call %Nat32 (%Str) @strlen (%Str %11)
  %13 = add %Nat32 %12, 2
  %14 = call %Unit* (%Nat32) @malloc (%Nat32 %13)
  %15 = bitcast %Unit* %14 to %Str
  store %Str %15, %Str* %s

;stmt5:
  %16 = load %Str, %Str* %s
  %17 = bitcast %Str %16 to %Unit*
  %18 = bitcast [4 x %Nat8]* @func207_str2 to %Str
  %19 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %20 = load %Value*, %Value** %19
  %21 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 2 ; eval_access
  %22 = getelementptr inbounds %Storage, %Storage* %21, i32 0, i32 3 ; eval_access
  %23 = load %Str, %Str* %22
  %24 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %17, %Str %18, %Str %23)
  br label %endif_0
else_0:

;stmt6:
  br label %endif_0
endif_0:

;stmt7:
  %25 = load %Str, %Str* %s
  ret %Str %25
}

define %Str @get_name (%Str %_res, %Nat32* %_uid) {
  %res = alloca %Str
  store %Str %_res, %Str* %res
  %uid = alloca %Nat32*
  store %Nat32* %_uid, %Nat32** %uid

;stmt0:
  %1 = call %Str () @get_prefix ()

;stmt1:
  %id = alloca %Str

;stmt2:
  %2 = load %Nat32*, %Nat32** %uid
  %3 = load %Nat32*, %Nat32** %uid
  %4 = load %Nat32, %Nat32* %3
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* %2

;stmt3:
  %6 = load %Str, %Str* %res
  %7 = load %Nat32*, %Nat32** %uid
  %8 = load %Nat32, %Nat32* %7
  %9 = call %Str (%Str, %Nat32) @get_suid (%Str %6, %Nat32 %8)
  store %Str %9, %Str* %id

;stmt4:
  %10 = call %Nat32 (%Str) @strlen (%Str %1)
  %11 = load %Str, %Str* %id
  %12 = call %Nat32 (%Str) @strlen (%Str %11)
  %13 = add %Nat32 %10, %12
  %14 = add %Nat32 %13, 1
  %15 = call %Unit* (%Nat32) @malloc (%Nat32 %14)
  %16 = bitcast %Unit* %15 to %Str

;stmt5:
  %17 = bitcast %Str %16 to %Unit*
  %18 = bitcast [5 x %Nat8]* @func208_str1 to %Str
  %19 = load %Str, %Str* %id
  %20 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %17, %Str %18, %Str %1, %Str %19)

;stmt6:
  ret %Str %16
}

define %Str @get_name_func () {

;stmt0:
  %1 = bitcast [5 x %Nat8]* @func209_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @func_uid, i32 0 ; ref
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_str () {

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %2 = load %Value*, %Value** %1
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = bitcast [4 x %Nat8]* @func210_str1 to %Str
  %7 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 4 ; eval_access
  %8 = call %Str (%Str, %Nat32*) @get_name (%Str %6, %Nat32* %7)
  ret %Str %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %10 = bitcast [4 x %Nat8]* @func210_str2 to %Str
  %11 = getelementptr inbounds %Nat32, %Nat32* @str_uid, i32 0 ; ref
  %12 = call %Str (%Str, %Nat32*) @get_name (%Str %10, %Nat32* %11)
  ret %Str %12
}

define %Str @get_name_arr () {

;stmt0:
  %1 = bitcast [4 x %Nat8]* @func211_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @arr_uid, i32 0 ; ref
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_var () {

;stmt0:
  %1 = bitcast [4 x %Nat8]* @func212_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @var_uid, i32 0 ; ref
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_type () {

;stmt0:
  %1 = bitcast [5 x %Nat8]* @func213_str1 to %Str
  %2 = getelementptr inbounds %Nat32, %Nat32* @type_uid, i32 0 ; ref
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Value* @create_local_var (%Str %_id, %Type* %_t, %Value* %_init_value) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %init_value = alloca %Value*
  store %Value* %_init_value, %Value** %init_value

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = inttoptr %Nat32 0 to %Unit*
  %3 = bitcast %Unit* %2 to %Value*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = bitcast %Unit* %4 to %Value*
  %6 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 1, %Type* %1, %Value* %3, %Value* %5)

;stmt1:
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 2 ; eval_access
  %8 = getelementptr inbounds %Storage, %Storage* %7, i32 0, i32 0 ; eval_access
  store %StorageClass 6, %StorageClass* %8

;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 2 ; eval_access
  %10 = getelementptr inbounds %Storage, %Storage* %9, i32 0, i32 3 ; eval_access
  %11 = load %Str, %Str* %id
  store %Str %11, %Str* %10

;stmt3:
  %12 = load %Str, %Str* %id
  call void (%Str, %Value*) @bind_value_local (%Str %12, %Value* %6)

;stmt4:
  %13 = load %Str, %Str* %id
  %14 = load %Type*, %Type** %t
  %15 = load %Value*, %Value** %init_value
  %16 = call %Stmt* (%Str, %Type*, %Value*) @stmt_new_vardef (%Str %13, %Type* %14, %Value* %15)
  call void (%Stmt*) @add_stmt (%Stmt* %16)

;stmt5:
  %17 = load %Value*, %Value** %init_value
  %18 = bitcast %Value* %17 to %Unit*
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = icmp ne %Unit* %18, %19
  br i1 %20, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %21 = load %Value*, %Value** %init_value
  %22 = inttoptr %Nat32 0 to %Unit*
  %23 = bitcast %Unit* %22 to %TokenInfo*
  %24 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @stmt_new_assign (%Value* %6, %Value* %21, %TokenInfo* %23)
  call void (%Stmt*) @add_stmt (%Stmt* %24)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  ret %Value* %6
}

define void @create_global_var (%Str %_id, %Type* %_t, %Value* %_init_value) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %init_value = alloca %Value*
  store %Value* %_init_value, %Value** %init_value

;stmt0:
  %1 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  %2 = load %Str, %Str* %id
  %3 = load %Type*, %Type** %t
  %4 = load %Value*, %Value** %init_value
  %5 = call %VarDef* (%Assembly*, %Str, %Type*, %Value*) @asm_vardef_add (%Assembly* %1, %Str %2, %Type* %3, %Value* %4)

;stmt1:
  %6 = load %Type*, %Type** %t
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = bitcast %Unit* %7 to %Value*
  %9 = inttoptr %Nat32 0 to %Unit*
  %10 = bitcast %Unit* %9 to %Value*
  %11 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 1, %Type* %6, %Value* %8, %Value* %10)

;stmt2:
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 2 ; eval_access
  %13 = getelementptr inbounds %Storage, %Storage* %12, i32 0, i32 0 ; eval_access
  store %StorageClass 7, %StorageClass* %13

;stmt3:
  %14 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 2 ; eval_access
  %15 = getelementptr inbounds %Storage, %Storage* %14, i32 0, i32 3 ; eval_access
  %16 = load %Str, %Str* %id
  store %Str %16, %Str* %15

;stmt4:
  %17 = load %Str, %Str* %id
  call void (%Str, %Value*) @bind_value_global (%Str %17, %Value* %11)
  ret void
}

define void @add_stmt (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = bitcast %Stmt* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %6 = load %Block*, %Block** %5
  %7 = getelementptr inbounds %Block, %Block* %6, i32 0, i32 1 ; eval_access
  %8 = load %List*, %List** %7
  %9 = load %Stmt*, %Stmt** %s
  %10 = bitcast %Stmt* %9 to %Unit*
  %11 = call %Bool (%List*, %Unit*) @list_append (%List* %8, %Unit* %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Type* @parse_type (%Bool %_add_new_type) {
  %add_new_type = alloca %Bool
  store %Bool %_add_new_type, %Bool* %add_new_type

;stmt0:
  %t = alloca %Type*

;stmt1:
  %1 = inttoptr %Nat32 0 to %Unit*
  %2 = bitcast %Unit* %1 to %Type*
  store %Type* %2, %Type** %t

;stmt2:
  %3 = call %Token* () @ctok ()

;stmt3:
  %4 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 1 ; eval_access

;stmt4:
  %5 = call %Token* () @ctok ()
  %6 = getelementptr inbounds %Token, %Token* %5, i32 0, i32 0 ; eval_access
  %7 = load %TokenType, %TokenType* %6
  %8 = icmp eq %TokenType %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %9 = bitcast [7 x %Nat8]* @func217_str1 to %Str
  %10 = call %Bool (%Str) @match (%Str %9)
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %11 = call %Type* () @parse_type_record ()
  store %Type* %11, %Type** %t
  br label %endif_1
else_1:

;stmt9:
  %12 = bitcast [5 x %Nat8]* @func217_str2 to %Str
  %13 = call %Bool (%Str) @match (%Str %12)
  br i1 %13, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %14 = call %Type* () @parse_type_enum ()
  store %Type* %14, %Type** %t
  br label %endif_2
else_2:

;stmt12:

;stmt13:
  %15 = call %Type* () @parse_type_base ()
  store %Type* %15, %Type** %t
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:

;stmt14:

;stmt15:
  %16 = bitcast [2 x %Nat8]* @func217_str3 to %Str
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_3, label %else_3
then_3:

;stmt16:

;stmt17:
  %18 = call %Type* (%Bool) @parse_type (%Bool 1)

;stmt18:
  %19 = bitcast %Type* %18 to %Unit*
  %20 = inttoptr %Nat32 0 to %Unit*
  %21 = icmp eq %Unit* %19, %20
  br i1 %21, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %22 = inttoptr %Nat32 0 to %Unit*
  %23 = bitcast %Unit* %22 to %Type*
  ret %Type* %23
  br label %endif_4
else_4:
  br label %endif_4
endif_4:

;stmt21:
  %25 = call %Type* (%Type*) @type_pointer_new (%Type* %18)
  store %Type* %25, %Type** %t
  br label %endif_3
else_3:

;stmt22:
  %26 = bitcast [2 x %Nat8]* @func217_str4 to %Str
  %27 = call %Bool (%Str) @match (%Str %26)
  br i1 %27, label %then_5, label %else_5
then_5:

;stmt23:

;stmt24:
  %28 = call %Type* () @parse_type_array ()
  store %Type* %28, %Type** %t
  br label %endif_5
else_5:

;stmt25:
  %29 = bitcast [2 x %Nat8]* @func217_str5 to %Str
  %30 = call %Bool (%Str) @match (%Str %29)
  br i1 %30, label %then_6, label %else_6
then_6:

;stmt26:

;stmt27:
  %31 = call %Type* () @parse_type_func ()
  store %Type* %31, %Type** %t
  br label %endif_6
else_6:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_3
endif_3:
  br label %endif_0
endif_0:

;stmt28:
  %32 = load %Type*, %Type** %t
  %33 = bitcast %Type* %32 to %Unit*
  %34 = inttoptr %Nat32 0 to %Unit*
  %35 = icmp eq %Unit* %33, %34
  br i1 %35, label %then_7, label %else_7
then_7:

;stmt29:

;stmt30:
  %36 = bitcast [14 x %Nat8]* @func217_str6 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %36, %TokenInfo* %4)

;stmt31:
  %37 = bitcast [8 x %Nat8]* @func217_str7 to %Str
  %38 = call %Token* () @ctok ()
  %39 = getelementptr inbounds %Token, %Token* %38, i32 0, i32 2 ; eval_access
  %40 = load [0 x %Nat8], [0 x %Nat8]* %39
  %41 = call %Int32 (%Str, ...) @printf (%Str %37, [0 x %Nat8] %40)
  br label %endif_7
else_7:

;stmt32:

;stmt33:
  %42 = load %Type*, %Type** %t
  %43 = getelementptr inbounds %Type, %Type* %42, i32 0, i32 2 ; eval_access
  %44 = load %Type*, %Type** %t
  %45 = getelementptr inbounds %Type, %Type* %44, i32 0, i32 2 ; eval_access
  %46 = load %Nat32, %Nat32* %45
  %47 = bitcast [14 x %Nat8]* @func217_str8 to %Str
  %48 = call %Nat64 (%Str) @get (%Str %47)
  %49 = trunc %Nat64 %48 to %Nat8
  %50 = call %Nat32 (%Nat32, %Nat8) @alignment (%Nat32 %46, %Nat8 %49)
  store %Nat32 %50, %Nat32* %43

;stmt34:
  %51 = load %Type*, %Type** %t
  %52 = getelementptr inbounds %Type, %Type* %51, i32 0, i32 12 ; eval_access
  store %TokenInfo* %4, %TokenInfo** %52

;stmt35:
  %53 = load %Type*, %Type** %t
  %54 = getelementptr inbounds %Type, %Type* %53, i32 0, i32 13 ; eval_access
  store %TokenInfo* %4, %TokenInfo** %54
  br label %endif_7
endif_7:

;stmt36:
  %55 = load %Type*, %Type** %t
  ret %Type* %55
}

define %Type* @parse_type_base () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access

;stmt1:
  %3 = call %Str () @parse_id ()

;stmt2:
  %4 = bitcast %Str %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = bitcast [12 x %Nat8]* @func218_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %2)

;stmt5:
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = bitcast %Unit* %8 to %Type*
  ret %Type* %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %11 = call %Type* (%Str) @get_type (%Str %3)

;stmt7:
  %12 = bitcast %Type* %11 to %Unit*
  %13 = inttoptr %Nat32 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  ret %Type* %11
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %16 = call %Type* (%Str) @type_new_undefined (%Str %3)
  ret %Type* %16
}

define %List* @parse_fields (%Str %_term) {
  %term = alloca %Str
  store %Str %_term, %Str* %term

;stmt0:
  %1 = call %List* () @map_new ()

;stmt1:
  call void () @skip_nl ()

;stmt2:
  br label %continue_0
continue_0:
  %2 = load %Str, %Str* %term
  %3 = call %Bool (%Str) @match (%Str %2)
  %4 = xor %Bool %3, 1
  br i1 %4, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  call void () @skip_nl ()

;stmt5:
  %5 = call %Token* () @ctok ()
  %6 = getelementptr inbounds %Token, %Token* %5, i32 0, i32 1 ; eval_access

;stmt6:
  %7 = call %List* () @parse_field ()

;stmt7:
  %8 = bitcast %List* %7 to %Unit*
  %9 = inttoptr %Nat32 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  %11 = bitcast [14 x %Nat8]* @func219_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %6)

;stmt10:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt11:
  %13 = bitcast [2 x %Nat8]* @func219_str2 to %Str
  %14 = call %Bool (%Str) @match (%Str %13)

;stmt12:
  call void () @skip_nl ()

;stmt13:
  %15 = call %Bool (%List*, %List*) @list_extend (%List* %1, %List* %7)
  br label %continue_0
break_0:

;stmt14:
  ret %List* %1

;stmt15:
  br label %fail
fail:

;stmt16:
  %17 = inttoptr %Nat32 0 to %Unit*
  %18 = bitcast %Unit* %17 to %List*
  ret %List* %18
}

define %Type* @parse_type_record () {

;stmt0:
  %1 = bitcast [2 x %Nat8]* @func220_str1 to %Str
  %2 = call %Bool (%Str) @need (%Str %1)

;stmt1:
  %3 = bitcast [2 x %Nat8]* @func220_str2 to %Str
  %4 = call %List* (%Str) @parse_fields (%Str %3)

;stmt2:
  %5 = call %Type* (%List*) @type_record_new (%List* %4)
  ret %Type* %5
}

define %Type* @parse_type_enum () {

;stmt0:
  %1 = call %List* () @map_new ()

;stmt1:
  %num = alloca %Int64

;stmt2:
  store %Int64 0, %Int64* %num

;stmt3:
  %2 = bitcast [2 x %Nat8]* @func221_str1 to %Str
  %3 = call %Bool (%Str) @need (%Str %2)

;stmt4:
  call void () @skip_nl ()

;stmt5:
  br label %continue_0
continue_0:
  %4 = bitcast [2 x %Nat8]* @func221_str2 to %Str
  %5 = call %Bool (%Str) @match (%Str %4)
  %6 = xor %Bool %5, 1
  br i1 %6, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  call void () @skip_nl ()

;stmt8:
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %8 = bitcast %Unit* %7 to %EnumConstructor*

;stmt9:
  %9 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %8, i32 0, i32 0 ; eval_access
  %10 = call %Str () @parse_id ()
  store %Str %10, %Str* %9

;stmt10:
  %11 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %8, i32 0, i32 1 ; eval_access
  %12 = load %Int64, %Int64* %num
  store %Int64 %12, %Int64* %11

;stmt11:
  %13 = bitcast %EnumConstructor* %8 to %Unit*
  %14 = call %Bool (%List*, %Unit*) @list_append (%List* %1, %Unit* %13)

;stmt12:
  %15 = load %Int64, %Int64* %num
  %16 = add %Int64 %15, 1
  store %Int64 %16, %Int64* %num

;stmt13:
  %17 = bitcast [2 x %Nat8]* @func221_str3 to %Str
  %18 = call %Bool (%Str) @match (%Str %17)
  %19 = xor %Bool %18, 1
  br i1 %19, label %then_0, label %else_0
then_0:

;stmt14:

;stmt15:
  call void () @skip_nl ()

;stmt16:
  %20 = bitcast [2 x %Nat8]* @func221_str4 to %Str
  %21 = call %Bool (%Str) @need (%Str %20)

;stmt17:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %continue_0
break_0:

;stmt18:
  call void () @skip_nl ()

;stmt19:
  %23 = call %Type* (%List*) @type_enum_new (%List* %1)
  ret %Type* %23
}

define %Type* @parse_type_array () {

;stmt0:
  %1 = bitcast [2 x %Nat8]* @func222_str1 to %Str
  %2 = call %Bool (%Str) @match (%Str %1)
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %3 = call %Type* (%Bool) @parse_type (%Bool 1)

;stmt3:
  %4 = bitcast %Type* %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %8 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %3, %Nat32 0, %Bool 1)
  ret %Type* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %10 = call %Value* () @cexpr ()

;stmt8:
  %11 = bitcast %Value* %10 to %Unit*
  %12 = inttoptr %Nat32 0 to %Unit*
  %13 = icmp eq %Unit* %11, %12
  br i1 %13, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt11:
  %15 = bitcast [2 x %Nat8]* @func222_str2 to %Str
  %16 = call %Bool (%Str) @need (%Str %15)

;stmt12:
  %17 = call %Type* (%Bool) @parse_type (%Bool 1)

;stmt13:
  %18 = bitcast %Type* %17 to %Unit*
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = icmp eq %Unit* %18, %19
  br i1 %20, label %then_3, label %else_3
then_3:

;stmt14:

;stmt15:
  br label %fail
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt16:
  %22 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 2 ; eval_access
  %23 = getelementptr inbounds %Storage, %Storage* %22, i32 0, i32 1 ; eval_access
  %24 = load %Int64, %Int64* %23
  %25 = trunc %Int64 %24 to %Nat32
  %26 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %17, %Nat32 %25, %Bool 0)
  ret %Type* %26

;stmt17:
  br label %fail
fail:

;stmt18:
  %28 = inttoptr %Nat32 0 to %Unit*
  %29 = bitcast %Unit* %28 to %Type*
  ret %Type* %29
}

define %Type* @parse_type_func () {

;stmt0:
  %1 = bitcast [2 x %Nat8]* @func223_str1 to %Str
  %2 = call %List* (%Str) @parse_fields (%Str %1)

;stmt1:
  %3 = bitcast [3 x %Nat8]* @func223_str2 to %Str
  %4 = call %Bool (%Str) @need (%Str %3)

;stmt2:
  %5 = call %Type* (%Bool) @parse_type (%Bool 1)

;stmt3:
  %6 = bitcast %List* %2 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = bitcast %Type* %5 to %Unit*
  %10 = inttoptr %Nat32 0 to %Unit*
  %11 = icmp eq %Unit* %9, %10
  %12 = or %Bool %8, %11
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %13 = inttoptr %Nat32 0 to %Unit*
  %14 = bitcast %Unit* %13 to %Type*
  ret %Type* %14
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %16 = bitcast [12 x %Nat8]* @func223_str3 to %Str
  %17 = call %Nat64 (%Str) @get (%Str %16)
  %18 = icmp eq %Nat64 %17, 1

;stmt7:
  %19 = call %Type* (%List*, %Type*, %Bool) @type_func_new (%List* %2, %Type* %5, %Bool %18)
  ret %Type* %19
}

define %Value* @un (%ValueKind %_k, %Value* %_v, %TokenInfo* %_ti) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = bitcast %Unit* %5 to %Value*
  ret %Value* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %8 = load %ValueKind, %ValueKind* %k
  %9 = icmp eq %ValueKind %8, 2
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %10 = load %Value*, %Value** %v
  %11 = load %TokenInfo*, %TokenInfo** %ti
  %12 = call %Value* (%Value*, %TokenInfo*) @un_ref (%Value* %10, %TokenInfo* %11)
  ret %Value* %12
  br label %endif_1
else_1:

;stmt6:
  %14 = load %ValueKind, %ValueKind* %k
  %15 = icmp eq %ValueKind %14, 3
  br i1 %15, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %16 = load %Value*, %Value** %v
  %17 = load %TokenInfo*, %TokenInfo** %ti
  %18 = call %Value* (%Value*, %TokenInfo*) @un_deref (%Value* %16, %TokenInfo* %17)
  ret %Value* %18
  br label %endif_2
else_2:

;stmt9:
  %20 = load %ValueKind, %ValueKind* %k
  %21 = icmp eq %ValueKind %20, 5
  br i1 %21, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %22 = load %Value*, %Value** %v
  %23 = load %TokenInfo*, %TokenInfo** %ti
  %24 = call %Value* (%Value*, %TokenInfo*) @un_minus (%Value* %22, %TokenInfo* %23)
  ret %Value* %24
  br label %endif_3
else_3:

;stmt12:
  %26 = load %ValueKind, %ValueKind* %k
  %27 = icmp eq %ValueKind %26, 4
  br i1 %27, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %28 = load %Value*, %Value** %v
  %29 = load %TokenInfo*, %TokenInfo** %ti
  %30 = call %Value* (%Value*, %TokenInfo*) @un_not (%Value* %28, %TokenInfo* %29)
  ret %Value* %30
  br label %endif_4
else_4:

;stmt15:

;stmt16:
  %32 = bitcast [40 x %Nat8]* @func224_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool 0, %Str %32)
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:

;stmt17:
  %33 = inttoptr %Nat32 0 to %Unit*
  %34 = bitcast %Unit* %33 to %Value*
  ret %Value* %34
}

define %Value* @un_minus (%Value* %_v, %TokenInfo* %_ti) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %vx = alloca %Value*

;stmt1:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2 ; eval_access
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 0 ; eval_access
  %4 = load %StorageClass, %StorageClass* %3
  %5 = icmp eq %StorageClass %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %8 = load %Type*, %Type** %7
  %9 = load %Value*, %Value** %v
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 2 ; eval_access
  %11 = getelementptr inbounds %Storage, %Storage* %10, i32 0, i32 1 ; eval_access
  %12 = load %Int64, %Int64* %11
  %13 = sub nsw %Int64 0, %12
  %14 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %8, %Int64 %13)
  ret %Value* %14
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %16 = inttoptr %Nat32 0 to %Unit*
  %17 = bitcast %Unit* %16 to %Type*
  %18 = load %Value*, %Value** %v
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = bitcast %Unit* %19 to %Value*
  %21 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_register (%ValueKind 5, %Type* %17, %Value* %18, %Value* %20)
  store %Value* %21, %Value** %vx

;stmt5:
  %22 = load %Value*, %Value** %vx
  %23 = getelementptr inbounds %Value, %Value* %22, i32 0, i32 8 ; eval_access
  %24 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %24, %TokenInfo** %23

;stmt6:
  %25 = load %Value*, %Value** %vx
  ret %Value* %25
}

define %Value* @un_not (%Value* %_v, %TokenInfo* %_ti) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %vx = alloca %Value*

;stmt1:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2 ; eval_access
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 0 ; eval_access
  %4 = load %StorageClass, %StorageClass* %3
  %5 = icmp eq %StorageClass %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %8 = load %Type*, %Type** %7
  %9 = load %Value*, %Value** %v
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 2 ; eval_access
  %11 = getelementptr inbounds %Storage, %Storage* %10, i32 0, i32 1 ; eval_access
  %12 = load %Int64, %Int64* %11
  %13 = xor %Int64 %12, -1
  %14 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %8, %Int64 %13)
  ret %Value* %14
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %16 = inttoptr %Nat32 0 to %Unit*
  %17 = bitcast %Unit* %16 to %Type*
  %18 = load %Value*, %Value** %v
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = bitcast %Unit* %19 to %Value*
  %21 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_register (%ValueKind 4, %Type* %17, %Value* %18, %Value* %20)
  store %Value* %21, %Value** %vx

;stmt5:
  %22 = load %Value*, %Value** %vx
  %23 = getelementptr inbounds %Value, %Value* %22, i32 0, i32 8 ; eval_access
  %24 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %24, %TokenInfo** %23

;stmt6:
  %25 = load %Value*, %Value** %vx
  ret %Value* %25
}

define %Value* @un_ref (%Value* %_v, %TokenInfo* %_ti) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = inttoptr %Nat32 0 to %Unit*
  %2 = bitcast %Unit* %1 to %Type*
  %3 = load %Value*, %Value** %v
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = bitcast %Unit* %4 to %Value*
  %6 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_register (%ValueKind 2, %Type* %2, %Value* %3, %Value* %5)

;stmt1:
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 8 ; eval_access
  %8 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %8, %TokenInfo** %7

;stmt2:
  ret %Value* %6
}

define %Value* @un_deref (%Value* %_v, %TokenInfo* %_ti) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = inttoptr %Nat32 0 to %Unit*
  %2 = bitcast %Unit* %1 to %Type*
  %3 = load %Value*, %Value** %v
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = bitcast %Unit* %4 to %Value*
  %6 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_address (%ValueKind 3, %Type* %2, %Value* %3, %Value* %5)

;stmt1:
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 8 ; eval_access
  %8 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %8, %TokenInfo** %7

;stmt2:
  ret %Value* %6
}

define %Type* @getTypeUnary (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = call %Type* (%Value*) @getType (%Value* %4)

;stmt2:
  %t = alloca %Type*

;stmt3:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 0 ; eval_access
  %8 = load %ValueKind, %ValueKind* %7

;stmt4:
  %9 = icmp eq %ValueKind %8, 2
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %10 = call %Type* (%Type*) @type_pointer_new (%Type* %5)
  store %Type* %10, %Type** %t
  br label %endif_0
else_0:

;stmt7:
  %11 = icmp eq %ValueKind %8, 3
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %12 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 0 ; eval_access
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 7
  br i1 %14, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %15 = bitcast [18 x %Nat8]* @func229_str1 to %Str
  %16 = load %Value*, %Value** %v
  %17 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 8 ; eval_access
  %18 = load %TokenInfo*, %TokenInfo** %17
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %18)

;stmt12:
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = bitcast %Unit* %19 to %Type*
  ret %Type* %20
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt13:
  %22 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 7 ; eval_access
  %23 = getelementptr inbounds %TypePointer, %TypePointer* %22, i32 0, i32 0 ; eval_access
  %24 = load %Type*, %Type** %23
  store %Type* %24, %Type** %t
  br label %endif_1
else_1:

;stmt14:
  %25 = icmp eq %ValueKind %8, 5
  br i1 %25, label %then_3, label %else_3
then_3:

;stmt15:

;stmt16:
  store %Type* %5, %Type** %t
  br label %endif_3
else_3:

;stmt17:
  %26 = icmp eq %ValueKind %8, 4
  br i1 %26, label %then_4, label %else_4
then_4:

;stmt18:

;stmt19:
  store %Type* %5, %Type** %t
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt20:
  %27 = load %Type*, %Type** %t
  ret %Type* %27
}

define %Bool @binTypeOk (%ValueKind %_k, %Type* %_t) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %ValueKind, %ValueKind* %k
  %2 = icmp eq %ValueKind %1, 14
  %3 = load %ValueKind, %ValueKind* %k
  %4 = icmp eq %ValueKind %3, 15
  %5 = or %Bool %2, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %7 = load %Type*, %Type** %t
  %8 = call %Bool (%Type*) @type_is_basic_integer (%Type* %7)
  %9 = load %Type*, %Type** %t
  %10 = getelementptr inbounds %Type, %Type* %9, i32 0, i32 0 ; eval_access
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp eq %TypeKind %11, 1
  %13 = or %Bool %8, %12
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %15 = load %Type*, %Type** %t
  %16 = load %Type*, %Type** @typeBool
  %17 = call %Bool (%Type*, %Type*) @type_eq (%Type* %15, %Type* %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %18 = load %ValueKind, %ValueKind* %k
  %19 = icmp eq %ValueKind %18, 13
  %20 = load %ValueKind, %ValueKind* %k
  %21 = icmp eq %ValueKind %20, 11
  %22 = load %ValueKind, %ValueKind* %k
  %23 = icmp eq %ValueKind %22, 12
  %24 = or %Bool %21, %23
  %25 = or %Bool %19, %24
  ret %Bool %25
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt9:
  ret %Bool 0
}

define %Bool @isNumericOperation (%ValueKind %_k) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k

;stmt0:
  %1 = load %ValueKind, %ValueKind* %k
  %2 = icmp eq %ValueKind %1, 6
  %3 = load %ValueKind, %ValueKind* %k
  %4 = icmp eq %ValueKind %3, 7
  %5 = load %ValueKind, %ValueKind* %k
  %6 = icmp eq %ValueKind %5, 7
  %7 = load %ValueKind, %ValueKind* %k
  %8 = icmp eq %ValueKind %7, 8
  %9 = load %ValueKind, %ValueKind* %k
  %10 = icmp eq %ValueKind %9, 9
  %11 = load %ValueKind, %ValueKind* %k
  %12 = icmp eq %ValueKind %11, 16
  %13 = load %ValueKind, %ValueKind* %k
  %14 = icmp eq %ValueKind %13, 17
  %15 = load %ValueKind, %ValueKind* %k
  %16 = icmp eq %ValueKind %15, 18
  %17 = load %ValueKind, %ValueKind* %k
  %18 = icmp eq %ValueKind %17, 19
  %19 = or %Bool %16, %18
  %20 = or %Bool %14, %19
  %21 = or %Bool %12, %20
  %22 = or %Bool %10, %21
  %23 = or %Bool %8, %22
  %24 = or %Bool %6, %23
  %25 = or %Bool %4, %24
  %26 = or %Bool %2, %25
  ret %Bool %26
}

define %Bool @isLogicNumericOperation (%ValueKind %_k) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k

;stmt0:
  %1 = load %ValueKind, %ValueKind* %k
  %2 = icmp eq %ValueKind %1, 11
  %3 = load %ValueKind, %ValueKind* %k
  %4 = icmp eq %ValueKind %3, 12
  %5 = load %ValueKind, %ValueKind* %k
  %6 = icmp eq %ValueKind %5, 13
  %7 = or %Bool %4, %6
  %8 = or %Bool %2, %7
  ret %Bool %8
}

define %Value* @bin (%ValueKind %_k, %Value* %_l, %Value* %_r, %TokenInfo* %_ti) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %l
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Value*, %Value** %r
  %6 = bitcast %Value* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %4, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %11 = inttoptr %Nat32 0 to %Unit*

;stmt4:
  %v = alloca %Value*

;stmt5:
  %12 = load %Value*, %Value** %l
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 2 ; eval_access
  %14 = getelementptr inbounds %Storage, %Storage* %13, i32 0, i32 0 ; eval_access
  %15 = load %StorageClass, %StorageClass* %14
  %16 = icmp eq %StorageClass %15, 1
  %17 = load %Value*, %Value** %r
  %18 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 2 ; eval_access
  %19 = getelementptr inbounds %Storage, %Storage* %18, i32 0, i32 0 ; eval_access
  %20 = load %StorageClass, %StorageClass* %19
  %21 = icmp eq %StorageClass %20, 1
  %22 = and %Bool %16, %21
  br i1 %22, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %23 = load %ValueKind, %ValueKind* %k
  %24 = load %Value*, %Value** %l
  %25 = load %Value*, %Value** %r
  %26 = call %Value* (%ValueKind, %Value*, %Value*) @binImm (%ValueKind %23, %Value* %24, %Value* %25)
  store %Value* %26, %Value** %v
  br label %endif_1
else_1:

;stmt8:

;stmt9:
  %27 = load %ValueKind, %ValueKind* %k
  %28 = bitcast %Unit* %11 to %Type*
  %29 = load %Value*, %Value** %l
  %30 = load %Value*, %Value** %r
  %31 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_register (%ValueKind %27, %Type* %28, %Value* %29, %Value* %30)
  store %Value* %31, %Value** %v
  br label %endif_1
endif_1:

;stmt10:
  %32 = load %Value*, %Value** %v
  %33 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 8 ; eval_access
  %34 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %34, %TokenInfo** %33

;stmt11:
  %35 = load %Value*, %Value** %v
  ret %Value* %35

;stmt12:
  br label %fail
fail:

;stmt13:
  %37 = inttoptr %Nat32 0 to %Unit*
  %38 = bitcast %Unit* %37 to %Value*
  ret %Value* %38
}

define %Value* @binImm (%ValueKind %_k, %Value* %_l, %Value* %_r) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r

;stmt0:
  %v = alloca %Int64

;stmt1:
  %t = alloca %Type*

;stmt2:
  %1 = load %Value*, %Value** %l
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2 ; eval_access
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 1 ; eval_access
  %4 = load %Int64, %Int64* %3

;stmt3:
  %5 = load %Value*, %Value** %r
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 2 ; eval_access
  %7 = getelementptr inbounds %Storage, %Storage* %6, i32 0, i32 1 ; eval_access
  %8 = load %Int64, %Int64* %7

;stmt4:
  %9 = call %Type* (%TypeKind) @type_new (%TypeKind 1)
  store %Type* %9, %Type** %t

;stmt5:
  %10 = load %ValueKind, %ValueKind* %k
  %11 = icmp eq %ValueKind %10, 6
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %12 = add %Int64 %4, %8
  store %Int64 %12, %Int64* %v
  br label %endif_0
else_0:

;stmt8:
  %13 = load %ValueKind, %ValueKind* %k
  %14 = icmp eq %ValueKind %13, 7
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %15 = sub %Int64 %4, %8
  store %Int64 %15, %Int64* %v
  br label %endif_1
else_1:

;stmt11:
  %16 = load %ValueKind, %ValueKind* %k
  %17 = icmp eq %ValueKind %16, 8
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt12:

;stmt13:
  %18 = mul %Int64 %4, %8
  store %Int64 %18, %Int64* %v
  br label %endif_2
else_2:

;stmt14:
  %19 = load %ValueKind, %ValueKind* %k
  %20 = icmp eq %ValueKind %19, 9
  br i1 %20, label %then_3, label %else_3
then_3:

;stmt15:

;stmt16:
  %21 = sdiv %Int64 %4, %8
  store %Int64 %21, %Int64* %v
  br label %endif_3
else_3:

;stmt17:
  %22 = load %ValueKind, %ValueKind* %k
  %23 = icmp eq %ValueKind %22, 10
  br i1 %23, label %then_4, label %else_4
then_4:

;stmt18:

;stmt19:
  %24 = srem %Int64 %4, %8
  store %Int64 %24, %Int64* %v
  br label %endif_4
else_4:

;stmt20:
  %25 = load %ValueKind, %ValueKind* %k
  %26 = icmp eq %ValueKind %25, 11
  br i1 %26, label %then_5, label %else_5
then_5:

;stmt21:

;stmt22:
  %27 = or %Int64 %4, %8
  store %Int64 %27, %Int64* %v
  br label %endif_5
else_5:

;stmt23:
  %28 = load %ValueKind, %ValueKind* %k
  %29 = icmp eq %ValueKind %28, 12
  br i1 %29, label %then_6, label %else_6
then_6:

;stmt24:

;stmt25:
  %30 = xor %Int64 %4, %8
  store %Int64 %30, %Int64* %v
  br label %endif_6
else_6:

;stmt26:
  %31 = load %ValueKind, %ValueKind* %k
  %32 = icmp eq %ValueKind %31, 13
  br i1 %32, label %then_7, label %else_7
then_7:

;stmt27:

;stmt28:
  %33 = and %Int64 %4, %8
  store %Int64 %33, %Int64* %v
  br label %endif_7
else_7:

;stmt29:

;stmt30:
  %34 = load %Type*, %Type** @typeBool
  store %Type* %34, %Type** %t

;stmt31:
  %35 = load %ValueKind, %ValueKind* %k
  %36 = icmp eq %ValueKind %35, 14
  br i1 %36, label %then_8, label %else_8
then_8:

;stmt32:

;stmt33:
  %37 = icmp eq %Int64 %4, %8
  %38 = sext %Bool %37 to %Int64
  store %Int64 %38, %Int64* %v
  br label %endif_8
else_8:

;stmt34:
  %39 = load %ValueKind, %ValueKind* %k
  %40 = icmp eq %ValueKind %39, 15
  br i1 %40, label %then_9, label %else_9
then_9:

;stmt35:

;stmt36:
  %41 = icmp ne %Int64 %4, %8
  %42 = sext %Bool %41 to %Int64
  store %Int64 %42, %Int64* %v
  br label %endif_9
else_9:

;stmt37:
  %43 = load %ValueKind, %ValueKind* %k
  %44 = icmp eq %ValueKind %43, 16
  br i1 %44, label %then_10, label %else_10
then_10:

;stmt38:

;stmt39:
  %45 = icmp slt %Int64 %4, %8
  %46 = sext %Bool %45 to %Int64
  store %Int64 %46, %Int64* %v
  br label %endif_10
else_10:

;stmt40:
  %47 = load %ValueKind, %ValueKind* %k
  %48 = icmp eq %ValueKind %47, 17
  br i1 %48, label %then_11, label %else_11
then_11:

;stmt41:

;stmt42:
  %49 = icmp sgt %Int64 %4, %8
  %50 = sext %Bool %49 to %Int64
  store %Int64 %50, %Int64* %v
  br label %endif_11
else_11:

;stmt43:
  %51 = load %ValueKind, %ValueKind* %k
  %52 = icmp eq %ValueKind %51, 18
  br i1 %52, label %then_12, label %else_12
then_12:

;stmt44:

;stmt45:
  %53 = icmp sle %Int64 %4, %8
  %54 = sext %Bool %53 to %Int64
  store %Int64 %54, %Int64* %v
  br label %endif_12
else_12:

;stmt46:
  %55 = load %ValueKind, %ValueKind* %k
  %56 = icmp eq %ValueKind %55, 19
  br i1 %56, label %then_13, label %else_13
then_13:

;stmt47:

;stmt48:
  %57 = icmp sge %Int64 %4, %8
  %58 = sext %Bool %57 to %Int64
  store %Int64 %58, %Int64* %v
  br label %endif_13
else_13:

;stmt49:

;stmt50:
  %59 = bitcast [32 x %Nat8]* @func234_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool 0, %Str %59)
  br label %endif_13
endif_13:
  br label %endif_12
endif_12:
  br label %endif_11
endif_11:
  br label %endif_10
endif_10:
  br label %endif_9
endif_9:
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt51:
  %60 = load %Type*, %Type** %t
  %61 = load %Int64, %Int64* %v
  %62 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %60, %Int64 %61)
  ret %Value* %62
}

define %Type* @getTypeBinary (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = load %Value*, %Value** %v
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 3 ; eval_access
  %7 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %6, i32 0, %Int32 1 ; eval_index
  %8 = load %Value*, %Value** %7

;stmt2:
  %9 = call %Type* (%Value*) @getType (%Value* %4)

;stmt3:
  %10 = call %Type* (%Value*) @getType (%Value* %8)

;stmt4:
  %11 = bitcast %Type* %9 to %Unit*
  %12 = inttoptr %Nat32 0 to %Unit*
  %13 = icmp eq %Unit* %11, %12
  %14 = bitcast %Type* %10 to %Unit*
  %15 = inttoptr %Nat32 0 to %Unit*
  %16 = icmp eq %Unit* %14, %15
  %17 = or %Bool %13, %16
  br i1 %17, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %19 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 1 ; eval_access
  %20 = load %Type*, %Type** %19
  %21 = call %Value* (%Value*, %Type*) @nat (%Value* %4, %Type* %20)

;stmt8:
  %22 = getelementptr inbounds %Value, %Value* %21, i32 0, i32 1 ; eval_access
  %23 = load %Type*, %Type** %22
  %24 = call %Value* (%Value*, %Type*) @nat (%Value* %8, %Type* %23)

;stmt9:
  %25 = getelementptr inbounds %Value, %Value* %21, i32 0, i32 1 ; eval_access
  %26 = load %Type*, %Type** %25

;stmt10:
  %27 = getelementptr inbounds %Value, %Value* %24, i32 0, i32 1 ; eval_access
  %28 = load %Type*, %Type** %27

;stmt11:
  %29 = call %Bool (%Type*, %Type*) @type_eq (%Type* %26, %Type* %28)
  %30 = xor %Bool %29, 1
  br i1 %30, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %31 = bitcast [11 x %Nat8]* @func235_str1 to %Str
  %32 = load %Value*, %Value** %v
  %33 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 8 ; eval_access
  %34 = load %TokenInfo*, %TokenInfo** %33
  call void (%Str, %TokenInfo*) @error (%Str %31, %TokenInfo* %34)

;stmt14:
  %35 = bitcast [9 x %Nat8]* @func235_str2 to %Str
  %36 = call %Int32 (%Str, ...) @printf (%Str %35)

;stmt15:
  call void (%Type*) @prttype (%Type* %26)

;stmt16:
  %37 = bitcast [2 x %Nat8]* @func235_str3 to %Str
  %38 = call %Int32 (%Str, ...) @printf (%Str %37)

;stmt17:
  %39 = bitcast [9 x %Nat8]* @func235_str4 to %Str
  %40 = call %Int32 (%Str, ...) @printf (%Str %39)

;stmt18:
  call void (%Type*) @prttype (%Type* %28)

;stmt19:
  %41 = bitcast [2 x %Nat8]* @func235_str5 to %Str
  %42 = call %Int32 (%Str, ...) @printf (%Str %41)

;stmt20:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt21:
  %44 = load %Value*, %Value** %v
  %45 = getelementptr inbounds %Value, %Value* %44, i32 0, i32 0 ; eval_access
  %46 = load %ValueKind, %ValueKind* %45

;stmt22:
  %47 = call %Bool (%ValueKind, %Type*) @binTypeOk (%ValueKind %46, %Type* %26)
  %48 = xor %Bool %47, 1
  br i1 %48, label %then_2, label %else_2
then_2:

;stmt23:

;stmt24:
  %49 = bitcast [18 x %Nat8]* @func235_str6 to %Str
  %50 = load %Value*, %Value** %v
  %51 = getelementptr inbounds %Value, %Value* %50, i32 0, i32 8 ; eval_access
  %52 = load %TokenInfo*, %TokenInfo** %51
  call void (%Str, %TokenInfo*) @error (%Str %49, %TokenInfo* %52)

;stmt25:
  %53 = inttoptr %Nat32 0 to %Unit*
  %54 = bitcast %Unit* %53 to %Type*
  ret %Type* %54
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt26:
  %56 = load %Value*, %Value** %v
  %57 = getelementptr inbounds %Value, %Value* %56, i32 0, i32 3 ; eval_access
  %58 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %57, i32 0, %Int32 0 ; eval_index
  store %Value* %21, %Value** %58

;stmt27:
  %59 = load %Value*, %Value** %v
  %60 = getelementptr inbounds %Value, %Value* %59, i32 0, i32 3 ; eval_access
  %61 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %60, i32 0, %Int32 1 ; eval_index
  store %Value* %24, %Value** %61

;stmt28:
  %62 = call %Bool (%ValueKind) @isReletionOpKind (%ValueKind %46)
  br i1 %62, label %then_3, label %else_3
then_3:

;stmt29:

;stmt30:
  %63 = load %Type*, %Type** @typeBool
  ret %Type* %63
  br label %endif_3
else_3:

;stmt31:

;stmt32:
  ret %Type* %26
  br label %endif_3
endif_3:

;stmt33:
  br label %fail
fail:

;stmt34:
  %66 = inttoptr %Nat32 0 to %Unit*
  %67 = bitcast %Unit* %66 to %Type*
  ret %Type* %67
}

define %Value* @shift_op (%ValueKind %_k, %Value* %_l, %Value* %_r, %TokenInfo* %_ti) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %l
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Value*, %Value** %r
  %6 = bitcast %Value* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %4, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %11 = inttoptr %Nat32 0 to %Unit*

;stmt4:
  %retv = alloca %Value*

;stmt5:
  %12 = inttoptr %Nat32 0 to %Unit*
  %13 = bitcast %Unit* %12 to %Value*
  store %Value* %13, %Value** %retv

;stmt6:
  %14 = load %Value*, %Value** %l
  %15 = getelementptr inbounds %Value, %Value* %14, i32 0, i32 2 ; eval_access
  %16 = getelementptr inbounds %Storage, %Storage* %15, i32 0, i32 0 ; eval_access
  %17 = load %StorageClass, %StorageClass* %16
  %18 = icmp eq %StorageClass %17, 1
  %19 = load %Value*, %Value** %r
  %20 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 2 ; eval_access
  %21 = getelementptr inbounds %Storage, %Storage* %20, i32 0, i32 0 ; eval_access
  %22 = load %StorageClass, %StorageClass* %21
  %23 = icmp eq %StorageClass %22, 1
  %24 = and %Bool %18, %23
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %v = alloca %Int64

;stmt9:
  %25 = load %ValueKind, %ValueKind* %k
  %26 = icmp eq %ValueKind %25, 20
  br i1 %26, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %27 = load %Value*, %Value** %l
  %28 = getelementptr inbounds %Value, %Value* %27, i32 0, i32 2 ; eval_access
  %29 = getelementptr inbounds %Storage, %Storage* %28, i32 0, i32 1 ; eval_access
  %30 = load %Int64, %Int64* %29
  %31 = load %Value*, %Value** %r
  %32 = getelementptr inbounds %Value, %Value* %31, i32 0, i32 2 ; eval_access
  %33 = getelementptr inbounds %Storage, %Storage* %32, i32 0, i32 1 ; eval_access
  %34 = load %Int64, %Int64* %33
  %35 = shl %Int64 %30, %34
  store %Int64 %35, %Int64* %v
  br label %endif_2
else_2:

;stmt12:
  %36 = load %ValueKind, %ValueKind* %k
  %37 = icmp eq %ValueKind %36, 21
  br i1 %37, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %38 = load %Value*, %Value** %l
  %39 = getelementptr inbounds %Value, %Value* %38, i32 0, i32 2 ; eval_access
  %40 = getelementptr inbounds %Storage, %Storage* %39, i32 0, i32 1 ; eval_access
  %41 = load %Int64, %Int64* %40
  %42 = load %Value*, %Value** %r
  %43 = getelementptr inbounds %Value, %Value* %42, i32 0, i32 2 ; eval_access
  %44 = getelementptr inbounds %Storage, %Storage* %43, i32 0, i32 1 ; eval_access
  %45 = load %Int64, %Int64* %44
  %46 = ashr %Int64 %41, %45
  store %Int64 %46, %Int64* %v
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:

;stmt15:
  %47 = bitcast %Unit* %11 to %Type*
  %48 = load %Int64, %Int64* %v
  %49 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %47, %Int64 %48)
  store %Value* %49, %Value** %retv
  br label %endif_1
else_1:

;stmt16:

;stmt17:
  %50 = load %ValueKind, %ValueKind* %k
  %51 = bitcast %Unit* %11 to %Type*
  %52 = load %Value*, %Value** %l
  %53 = load %Value*, %Value** %r
  %54 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_register (%ValueKind %50, %Type* %51, %Value* %52, %Value* %53)
  store %Value* %54, %Value** %retv
  br label %endif_1
endif_1:

;stmt18:
  %55 = load %Value*, %Value** %retv
  %56 = getelementptr inbounds %Value, %Value* %55, i32 0, i32 8 ; eval_access
  %57 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %57, %TokenInfo** %56

;stmt19:
  %58 = load %Value*, %Value** %retv
  ret %Value* %58

;stmt20:
  br label %fail
fail:

;stmt21:
  %60 = inttoptr %Nat32 0 to %Unit*
  %61 = bitcast %Unit* %60 to %Value*
  ret %Value* %61
}

define %Type* @getTypeShift (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = load %Value*, %Value** %v
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 3 ; eval_access
  %7 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %6, i32 0, %Int32 1 ; eval_index
  %8 = load %Value*, %Value** %7

;stmt2:
  %9 = call %Type* (%Value*) @getType (%Value* %4)

;stmt3:
  %10 = call %Type* (%Value*) @getType (%Value* %8)

;stmt4:
  %11 = load %Type*, %Type** @typeBaseInt
  %12 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %4, %Type* %11)
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 1 ; eval_access
  %14 = load %Type*, %Type** %13

;stmt5:
  %15 = load %Type*, %Type** @typeBaseInt
  %16 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %8, %Type* %15)

;stmt6:
  ret %Type* %14
}

define %Value* @indx (%Value* %_a, %Value* %_i, %TokenInfo* %_ti) {
  %a = alloca %Value*
  store %Value* %_a, %Value** %a
  %i = alloca %Value*
  store %Value* %_i, %Value** %i
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %a
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Value*, %Value** %i
  %6 = bitcast %Value* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %4, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %11 = inttoptr %Nat32 0 to %Unit*
  %12 = bitcast %Unit* %11 to %Type*
  %13 = load %Value*, %Value** %a
  %14 = load %Value*, %Value** %i
  %15 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_address (%ValueKind 23, %Type* %12, %Value* %13, %Value* %14)
  ret %Value* %15

;stmt4:
  br label %fail
fail:

;stmt5:
  %17 = inttoptr %Nat32 0 to %Unit*
  %18 = bitcast %Unit* %17 to %Value*
  ret %Value* %18
}

define %Type* @getTypeIndex (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = load %Value*, %Value** %v
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 3 ; eval_access
  %7 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %6, i32 0, %Int32 1 ; eval_index
  %8 = load %Value*, %Value** %7

;stmt2:
  %9 = call %Type* (%Value*) @getType (%Value* %4)

;stmt3:
  %10 = call %Type* (%Value*) @getType (%Value* %8)

;stmt4:
  %11 = load %Type*, %Type** @typeBaseInt
  %12 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %4, %Type* %11)

;stmt5:
  %13 = load %Type*, %Type** @typeBaseInt
  %14 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %8, %Type* %13)

;stmt6:
  %15 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1 ; eval_access
  %16 = load %Type*, %Type** %15
  %17 = getelementptr inbounds %Type, %Type* %16, i32 0, i32 8 ; eval_access
  %18 = getelementptr inbounds %TypeArray, %TypeArray* %17, i32 0, i32 0 ; eval_access
  %19 = load %Type*, %Type** %18
  ret %Type* %19
}

define %Value* @access (%Value* %_r, %Str %_fid, %TokenInfo* %_ti) {
  %r = alloca %Value*
  store %Value* %_r, %Value** %r
  %fid = alloca %Str
  store %Str %_fid, %Str* %fid
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %r
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Str, %Str* %fid
  %6 = bitcast %Str %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %4, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %11 = inttoptr %Nat32 0 to %Unit*

;stmt4:
  %12 = bitcast %Unit* %11 to %Type*
  %13 = load %Value*, %Value** %r
  %14 = inttoptr %Nat32 0 to %Unit*
  %15 = bitcast %Unit* %14 to %Value*
  %16 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_address (%ValueKind 24, %Type* %12, %Value* %13, %Value* %15)

;stmt5:
  %17 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 4 ; eval_access
  %18 = load %Str, %Str* %fid
  store %Str %18, %Str* %17

;stmt6:
  ret %Value* %16

;stmt7:
  br label %fail
fail:

;stmt8:
  %20 = inttoptr %Nat32 0 to %Unit*
  %21 = bitcast %Unit* %20 to %Value*
  ret %Value* %21
}

define %Type* @getTypeAccess (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = call %Type* (%Value*) @getType (%Value* %4)

;stmt2:
  %record_type = alloca %Type*

;stmt3:
  %6 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 0 ; eval_access
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %9 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 7 ; eval_access
  %10 = getelementptr inbounds %TypePointer, %TypePointer* %9, i32 0, i32 0 ; eval_access
  %11 = load %Type*, %Type** %10
  store %Type* %11, %Type** %record_type
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  store %Type* %5, %Type** %record_type
  br label %endif_0
endif_0:

;stmt8:
  %12 = load %Type*, %Type** %record_type
  %13 = getelementptr inbounds %Type, %Type* %12, i32 0, i32 0 ; eval_access
  %14 = load %TypeKind, %TypeKind* %13
  %15 = icmp ne %TypeKind %14, 6
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %16 = bitcast [41 x %Nat8]* @func241_str1 to %Str
  %17 = load %Value*, %Value** %v
  %18 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 8 ; eval_access
  %19 = load %TokenInfo*, %TokenInfo** %18
  call void (%Str, %TokenInfo*) @error (%Str %16, %TokenInfo* %19)

;stmt11:
  %20 = inttoptr %Nat32 0 to %Unit*
  %21 = bitcast %Unit* %20 to %Type*
  ret %Type* %21
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %23 = load %Type*, %Type** %record_type
  %24 = load %Value*, %Value** %v
  %25 = getelementptr inbounds %Value, %Value* %24, i32 0, i32 4 ; eval_access
  %26 = load %Str, %Str* %25
  %27 = call %Field* (%Type*, %Str) @type_record_get_field (%Type* %23, %Str %26)

;stmt13:
  %28 = bitcast %Field* %27 to %Unit*
  %29 = inttoptr %Nat32 0 to %Unit*
  %30 = icmp eq %Unit* %28, %29
  br i1 %30, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %31 = bitcast [16 x %Nat8]* @func241_str2 to %Str
  %32 = load %Value*, %Value** %v
  %33 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 8 ; eval_access
  %34 = load %TokenInfo*, %TokenInfo** %33
  call void (%Str, %TokenInfo*) @error (%Str %31, %TokenInfo* %34)

;stmt16:
  %35 = inttoptr %Nat32 0 to %Unit*
  %36 = bitcast %Unit* %35 to %Type*
  ret %Type* %36
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt17:
  %38 = getelementptr inbounds %Field, %Field* %27, i32 0, i32 1 ; eval_access
  %39 = load %Type*, %Type** %38
  ret %Type* %39
}

define %Value* @call (%Value* %_f, %List* %_a, %TokenInfo* %_ti) {
  %f = alloca %Value*
  store %Value* %_f, %Value** %f
  %a = alloca %List*
  store %List* %_a, %List** %a
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %f
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %List*, %List** %a
  %6 = bitcast %List* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %4, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %10 = inttoptr %Nat32 0 to %Unit*
  %11 = bitcast %Unit* %10 to %Value*
  ret %Value* %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %13 = inttoptr %Nat32 0 to %Unit*

;stmt4:
  %14 = bitcast %Unit* %13 to %Type*
  %15 = load %Value*, %Value** %f
  %16 = inttoptr %Nat32 0 to %Unit*
  %17 = bitcast %Unit* %16 to %Value*
  %18 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_register (%ValueKind 22, %Type* %14, %Value* %15, %Value* %17)

;stmt5:
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 5 ; eval_access
  %20 = load %List*, %List** %a
  store %List* %20, %List** %19

;stmt6:
  ret %Value* %18

;stmt7:
  br label %fail
fail:

;stmt8:
  %22 = inttoptr %Nat32 0 to %Unit*
  %23 = bitcast %Unit* %22 to %Value*
  ret %Value* %23
}

define %Type* @getTypeCall (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = call %Type* (%Value*) @getType (%Value* %4)

;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 0 ; eval_access
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp ne %TypeKind %7, 4
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %9 = bitcast [18 x %Nat8]* @func243_str1 to %Str
  %10 = load %Value*, %Value** %v
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 8 ; eval_access
  %12 = load %TokenInfo*, %TokenInfo** %11
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %12)

;stmt5:
  %13 = inttoptr %Nat32 0 to %Unit*
  %14 = bitcast %Unit* %13 to %Type*
  ret %Type* %14
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %16 = load %Value*, %Value** %v
  %17 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 5 ; eval_access
  %18 = load %List*, %List** %17
  %19 = load %Value*, %Value** %v
  %20 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 8 ; eval_access
  %21 = load %TokenInfo*, %TokenInfo** %20
  %22 = call %Bool (%Value*, %List*, %TokenInfo*) @checkParams (%Value* %4, %List* %18, %TokenInfo* %21)

;stmt7:
  %23 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 6 ; eval_access
  %24 = getelementptr inbounds %TypeFunc, %TypeFunc* %23, i32 0, i32 1 ; eval_access
  %25 = load %Type*, %Type** %24

;stmt8:
  ret %Type* %25
}

define %Bool @checkParams (%Value* %_f, %List* %_a, %TokenInfo* %_ti) {
  %f = alloca %Value*
  store %Value* %_f, %Value** %f
  %a = alloca %List*
  store %List* %_a, %List** %a
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %f
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1 ; eval_access
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 6 ; eval_access
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %4, i32 0, i32 0 ; eval_access
  %6 = load %List*, %List** %5

;stmt1:
  %7 = load %List*, %List** %a
  %8 = getelementptr inbounds %List, %List* %7, i32 0, i32 2 ; eval_access
  %9 = load %Nat64, %Nat64* %8
  %10 = getelementptr inbounds %List, %List* %6, i32 0, i32 2 ; eval_access
  %11 = load %Nat64, %Nat64* %10
  %12 = icmp ult %Nat64 %9, %11
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %13 = bitcast [21 x %Nat8]* @func244_str1 to %Str
  %14 = load %TokenInfo*, %TokenInfo** %ti
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %14)

;stmt4:
  ret %Bool 0
  br label %endif_0
else_0:

;stmt5:
  %16 = getelementptr inbounds %List, %List* %6, i32 0, i32 2 ; eval_access
  %17 = load %Nat64, %Nat64* %16
  %18 = load %List*, %List** %a
  %19 = getelementptr inbounds %List, %List* %18, i32 0, i32 2 ; eval_access
  %20 = load %Nat64, %Nat64* %19
  %21 = icmp ult %Nat64 %17, %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %22 = load %Value*, %Value** %f
  %23 = getelementptr inbounds %Value, %Value* %22, i32 0, i32 1 ; eval_access
  %24 = load %Type*, %Type** %23
  %25 = getelementptr inbounds %Type, %Type* %24, i32 0, i32 6 ; eval_access
  %26 = getelementptr inbounds %TypeFunc, %TypeFunc* %25, i32 0, i32 2 ; eval_access
  %27 = load %Bool, %Bool* %26
  %28 = xor %Bool %27, 1
  br i1 %28, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %29 = bitcast [19 x %Nat8]* @func244_str2 to %Str
  %30 = load %TokenInfo*, %TokenInfo** %ti
  call void (%Str, %TokenInfo*) @error (%Str %29, %TokenInfo* %30)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt10:
  %pln = alloca %Node*

;stmt11:
  %aln = alloca %Node*

;stmt12:
  %31 = getelementptr inbounds %List, %List* %6, i32 0, i32 0 ; eval_access
  %32 = load %Node*, %Node** %31
  store %Node* %32, %Node** %pln

;stmt13:
  %33 = load %List*, %List** %a
  %34 = getelementptr inbounds %List, %List* %33, i32 0, i32 0 ; eval_access
  %35 = load %Node*, %Node** %34
  store %Node* %35, %Node** %aln

;stmt14:
  br label %continue_0
continue_0:
  %36 = load %Node*, %Node** %pln
  %37 = bitcast %Node* %36 to %Unit*
  %38 = inttoptr %Nat32 0 to %Unit*
  %39 = icmp ne %Unit* %37, %38
  br i1 %39, label %body_0, label %break_0
body_0:

;stmt15:

;stmt16:
  %40 = load %Node*, %Node** %pln
  %41 = getelementptr inbounds %Node, %Node* %40, i32 0, i32 3 ; eval_access
  %42 = load %Unit*, %Unit** %41
  %43 = bitcast %Unit* %42 to %Field*

;stmt17:
  %44 = load %Node*, %Node** %aln
  %45 = getelementptr inbounds %Node, %Node* %44, i32 0, i32 3 ; eval_access
  %46 = load %Unit*, %Unit** %45
  %47 = bitcast %Unit* %46 to %Value*

;stmt18:
  %48 = call %Type* (%Value*) @getType (%Value* %47)

;stmt19:
  %49 = getelementptr inbounds %Field, %Field* %43, i32 0, i32 1 ; eval_access
  %50 = load %Type*, %Type** %49
  %51 = call %Value* (%Value*, %Type*) @nat (%Value* %47, %Type* %50)

;stmt20:
  %52 = getelementptr inbounds %Field, %Field* %43, i32 0, i32 1 ; eval_access
  %53 = load %Type*, %Type** %52
  %54 = getelementptr inbounds %Value, %Value* %51, i32 0, i32 1 ; eval_access
  %55 = load %Type*, %Type** %54
  %56 = call %Bool (%Type*, %Type*) @type_eq (%Type* %53, %Type* %55)
  %57 = xor %Bool %56, 1
  br i1 %57, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  %58 = bitcast [37 x %Nat8]* @func244_str3 to %Str
  %59 = load %TokenInfo*, %TokenInfo** %ti
  call void (%Str, %TokenInfo*) @error (%Str %58, %TokenInfo* %59)

;stmt23:
  %60 = bitcast [7 x %Nat8]* @func244_str4 to %Str
  %61 = call %Int32 (%Str, ...) @printf (%Str %60)

;stmt24:
  %62 = getelementptr inbounds %Value, %Value* %51, i32 0, i32 1 ; eval_access
  %63 = load %Type*, %Type** %62
  call void (%Type*) @prttype (%Type* %63)

;stmt25:
  %64 = bitcast [2 x %Nat8]* @func244_str5 to %Str
  %65 = call %Int32 (%Str, ...) @printf (%Str %64)

;stmt26:
  %66 = bitcast [7 x %Nat8]* @func244_str6 to %Str
  %67 = call %Int32 (%Str, ...) @printf (%Str %66)

;stmt27:
  %68 = getelementptr inbounds %Field, %Field* %43, i32 0, i32 1 ; eval_access
  %69 = load %Type*, %Type** %68
  call void (%Type*) @prttype (%Type* %69)

;stmt28:
  %70 = bitcast [2 x %Nat8]* @func244_str7 to %Str
  %71 = call %Int32 (%Str, ...) @printf (%Str %70)

;stmt29:
  br label %nextarg
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt30:
  %73 = load %List*, %List** %a
  %74 = bitcast %Value* %47 to %Unit*
  %75 = bitcast %Value* %51 to %Unit*
  %76 = call %Bool (%List*, %Unit*, %Unit*) @list_subst (%List* %73, %Unit* %74, %Unit* %75)

;stmt31:
  br label %nextarg
nextarg:

;stmt32:
  %77 = load %Node*, %Node** %aln
  %78 = getelementptr inbounds %Node, %Node* %77, i32 0, i32 1 ; eval_access
  %79 = load %Node*, %Node** %78
  store %Node* %79, %Node** %aln

;stmt33:
  %80 = load %Node*, %Node** %pln
  %81 = getelementptr inbounds %Node, %Node* %80, i32 0, i32 1 ; eval_access
  %82 = load %Node*, %Node** %81
  store %Node* %82, %Node** %pln
  br label %continue_0
break_0:

;stmt34:
  br label %continue_1
continue_1:
  %83 = load %Node*, %Node** %aln
  %84 = bitcast %Node* %83 to %Unit*
  %85 = inttoptr %Nat32 0 to %Unit*
  %86 = icmp ne %Unit* %84, %85
  br i1 %86, label %body_1, label %break_1
body_1:

;stmt35:

;stmt36:
  %87 = load %Node*, %Node** %aln
  %88 = getelementptr inbounds %Node, %Node* %87, i32 0, i32 3 ; eval_access
  %89 = load %Unit*, %Unit** %88
  %90 = bitcast %Unit* %89 to %Value*

;stmt37:
  %91 = call %Type* (%Value*) @getType (%Value* %90)

;stmt38:
  %92 = load %Type*, %Type** @typeBaseInt
  %93 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %90, %Type* %92)

;stmt39:
  %94 = load %List*, %List** %a
  %95 = bitcast %Value* %90 to %Unit*
  %96 = bitcast %Value* %93 to %Unit*
  %97 = call %Bool (%List*, %Unit*, %Unit*) @list_subst (%List* %94, %Unit* %95, %Unit* %96)

;stmt40:
  %98 = load %Node*, %Node** %aln
  %99 = getelementptr inbounds %Node, %Node* %98, i32 0, i32 1 ; eval_access
  %100 = load %Node*, %Node** %99
  store %Node* %100, %Node** %aln
  br label %continue_1
break_1:

;stmt41:
  ret %Bool 1
}

define %Bool @can_imm_cast (%Value* %_v, %Type* %_t) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2 ; eval_access
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 0 ; eval_access
  %4 = load %StorageClass, %StorageClass* %3
  %5 = icmp ne %StorageClass %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  ret %Bool 0
}

define %Value* @cast (%Value* %_v, %Type* %_t, %TokenInfo* %_ti) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Type*, %Type** %t
  %6 = bitcast %Type* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %4, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %11 = load %Value*, %Value** %v
  %12 = load %Type*, %Type** %t
  %13 = call %Bool (%Value*, %Type*) @can_imm_cast (%Value* %11, %Type* %12)
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %14 = load %Type*, %Type** %t
  %15 = load %Value*, %Value** %v
  %16 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 2 ; eval_access
  %17 = getelementptr inbounds %Storage, %Storage* %16, i32 0, i32 1 ; eval_access
  %18 = load %Int64, %Int64* %17
  %19 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %14, %Int64 %18)
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %21 = inttoptr %Nat32 0 to %Unit*
  %22 = bitcast %Unit* %21 to %Type*
  %23 = load %Value*, %Value** %v
  %24 = inttoptr %Nat32 0 to %Unit*
  %25 = bitcast %Unit* %24 to %Value*
  %26 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new_register (%ValueKind 25, %Type* %22, %Value* %23, %Value* %25)

;stmt7:
  %27 = getelementptr inbounds %Value, %Value* %26, i32 0, i32 7 ; eval_access
  %28 = load %Type*, %Type** %t
  store %Type* %28, %Type** %27

;stmt8:
  ret %Value* %26

;stmt9:
  br label %fail
fail:

;stmt10:
  %30 = inttoptr %Nat32 0 to %Unit*
  %31 = bitcast %Unit* %30 to %Value*
  ret %Value* %31
}

define %Type* @getTypeCast (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = call %Type* (%Value*) @getType (%Value* %4)

;stmt2:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 7 ; eval_access
  %8 = load %Type*, %Type** %7

;stmt3:
  ret %Type* %8
}

define %Value* @expr () {

;stmt0:
  %1 = call %Value* () @hier1 ()
  ret %Value* %1
}

define %Value* @cexpr () {

;stmt0:
  %1 = call %Value* () @expr ()

;stmt1:
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %6 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 0 ; eval_access
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp eq %ValueKind %7, 2
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %9 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %10 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %9, i32 0, %Int32 0 ; eval_index
  %11 = load %Value*, %Value** %10
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 2 ; eval_access
  %13 = getelementptr inbounds %Storage, %Storage* %12, i32 0, i32 0 ; eval_access
  %14 = load %StorageClass, %StorageClass* %13

;stmt7:
  %15 = icmp eq %StorageClass %14, 7
  br i1 %15, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  ret %Value* %1
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %17 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2 ; eval_access
  %18 = call %Bool (%Storage*) @storage_is_const (%Storage* %17)
  %19 = xor %Bool %18, 1
  br i1 %19, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %20 = bitcast [24 x %Nat8]* @func249_str1 to %Str
  %21 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 8 ; eval_access
  %22 = load %TokenInfo*, %TokenInfo** %21
  call void (%Str, %TokenInfo*) @error (%Str %20, %TokenInfo* %22)

;stmt13:
  br label %fail
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt14:
  ret %Value* %1

;stmt15:
  br label %fail
fail:

;stmt16:
  %25 = inttoptr %Nat32 0 to %Unit*
  %26 = bitcast %Unit* %25 to %Value*
  ret %Value* %26
}

define %Value* @hier1 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier2 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1 ; eval_access

;stmt6:
  %11 = bitcast [3 x %Nat8]* @func250_str1 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %13 = load %Value*, %Value** %v

;stmt10:
  %14 = call %Value* () @hier1 ()

;stmt11:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 11, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %v
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %16 = load %Value*, %Value** %v
  ret %Value* %16
}

define %Value* @hier2 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier3 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1 ; eval_access

;stmt6:
  %11 = bitcast [4 x %Nat8]* @func251_str1 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %13 = load %Value*, %Value** %v

;stmt10:
  %14 = call %Value* () @hier2 ()

;stmt11:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 12, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %v
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %16 = load %Value*, %Value** %v
  ret %Value* %16
}

define %Value* @hier3 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier4 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1 ; eval_access

;stmt6:
  %11 = bitcast [4 x %Nat8]* @func252_str1 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %13 = load %Value*, %Value** %v

;stmt10:
  %14 = call %Value* () @hier3 ()

;stmt11:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 13, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %v
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %16 = load %Value*, %Value** %v
  ret %Value* %16
}

define %Value* @hier4 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier5 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1 ; eval_access

;stmt8:
  %11 = bitcast [3 x %Nat8]* @func253_str1 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %13 = load %Value*, %Value** %v

;stmt12:
  %14 = call %Value* () @hier4 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 14, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %16 = bitcast [3 x %Nat8]* @func253_str2 to %Str
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %18 = load %Value*, %Value** %v

;stmt18:
  %19 = call %Value* () @hier4 ()

;stmt19:
  %20 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 15, %Value* %18, %Value* %19, %TokenInfo* %10)
  store %Value* %20, %Value** %v
  br label %endif_2
else_2:

;stmt20:

;stmt21:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt22:
  %22 = load %Value*, %Value** %v
  ret %Value* %22
}

define %Value* @hier5 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier6 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1 ; eval_access

;stmt8:
  %11 = bitcast [2 x %Nat8]* @func254_str1 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %13 = load %Value*, %Value** %v

;stmt12:
  %14 = call %Value* () @hier6 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 16, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %16 = bitcast [2 x %Nat8]* @func254_str2 to %Str
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %18 = load %Value*, %Value** %v

;stmt18:
  %19 = call %Value* () @hier6 ()

;stmt19:
  %20 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 17, %Value* %18, %Value* %19, %TokenInfo* %10)
  store %Value* %20, %Value** %v
  br label %endif_2
else_2:

;stmt20:
  %21 = bitcast [3 x %Nat8]* @func254_str3 to %Str
  %22 = call %Bool (%Str) @match (%Str %21)
  br i1 %22, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  call void () @skip_nl ()

;stmt23:
  %23 = load %Value*, %Value** %v

;stmt24:
  %24 = call %Value* () @hier6 ()

;stmt25:
  %25 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 18, %Value* %23, %Value* %24, %TokenInfo* %10)
  store %Value* %25, %Value** %v
  br label %endif_3
else_3:

;stmt26:
  %26 = bitcast [3 x %Nat8]* @func254_str4 to %Str
  %27 = call %Bool (%Str) @match (%Str %26)
  br i1 %27, label %then_4, label %else_4
then_4:

;stmt27:

;stmt28:
  call void () @skip_nl ()

;stmt29:
  %28 = load %Value*, %Value** %v

;stmt30:
  %29 = call %Value* () @hier6 ()

;stmt31:
  %30 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 19, %Value* %28, %Value* %29, %TokenInfo* %10)
  store %Value* %30, %Value** %v
  br label %endif_4
else_4:

;stmt32:

;stmt33:
  br label %break_0
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt34:
  %32 = load %Value*, %Value** %v
  ret %Value* %32
}

define %Value* @hier6 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier7 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1 ; eval_access

;stmt8:
  %11 = bitcast [3 x %Nat8]* @func255_str1 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %13 = load %Value*, %Value** %v

;stmt12:
  %14 = call %Value* () @hier7 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @shift_op (%ValueKind 20, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %16 = bitcast [3 x %Nat8]* @func255_str2 to %Str
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %18 = load %Value*, %Value** %v

;stmt18:
  %19 = call %Value* () @hier7 ()

;stmt19:
  %20 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @shift_op (%ValueKind 21, %Value* %18, %Value* %19, %TokenInfo* %10)
  store %Value* %20, %Value** %v
  br label %endif_2
else_2:

;stmt20:

;stmt21:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt22:
  %22 = load %Value*, %Value** %v
  ret %Value* %22
}

define %Value* @hier7 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier8 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1 ; eval_access

;stmt8:
  %11 = bitcast [2 x %Nat8]* @func256_str1 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %13 = load %Value*, %Value** %v

;stmt12:
  %14 = call %Value* () @hier8 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 6, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %16 = bitcast [2 x %Nat8]* @func256_str2 to %Str
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %18 = load %Value*, %Value** %v

;stmt18:
  %19 = call %Value* () @hier8 ()

;stmt19:
  %20 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 7, %Value* %18, %Value* %19, %TokenInfo* %10)
  store %Value* %20, %Value** %v
  br label %endif_2
else_2:

;stmt20:

;stmt21:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt22:
  %22 = load %Value*, %Value** %v
  ret %Value* %22
}

define %Value* @hier8 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier9 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1 ; eval_access

;stmt8:
  %11 = bitcast [2 x %Nat8]* @func257_str1 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %13 = load %Value*, %Value** %v

;stmt12:
  %14 = call %Value* () @hier9 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 8, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %16 = bitcast [2 x %Nat8]* @func257_str2 to %Str
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %18 = load %Value*, %Value** %v

;stmt18:
  %19 = call %Value* () @hier9 ()

;stmt19:
  %20 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 9, %Value* %18, %Value* %19, %TokenInfo* %10)
  store %Value* %20, %Value** %v
  br label %endif_2
else_2:

;stmt20:
  %21 = bitcast [2 x %Nat8]* @func257_str3 to %Str
  %22 = call %Bool (%Str) @match (%Str %21)
  br i1 %22, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  call void () @skip_nl ()

;stmt23:
  %23 = load %Value*, %Value** %v

;stmt24:
  %24 = call %Value* () @hier9 ()

;stmt25:
  %25 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 10, %Value* %23, %Value* %24, %TokenInfo* %10)
  store %Value* %25, %Value** %v
  br label %endif_3
else_3:

;stmt26:

;stmt27:
  br label %break_0
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt28:
  %27 = load %Value*, %Value** %v
  ret %Value* %27
}

define %Value* @hier9 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier10 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1 ; eval_access

;stmt6:
  %11 = bitcast [3 x %Nat8]* @func258_str1 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %13 = call %Type* (%Bool) @parse_type (%Bool 0)

;stmt9:
  %14 = load %Value*, %Value** %v
  %15 = call %Value* (%Value*, %Type*, %TokenInfo*) @cast (%Value* %14, %Type* %13, %TokenInfo* %10)
  store %Value* %15, %Value** %v
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %16 = load %Value*, %Value** %v
  ret %Value* %16
}

define %Value* @hier10 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access

;stmt2:
  %3 = bitcast [2 x %Nat8]* @func259_str1 to %Str
  %4 = call %Bool (%Str) @match (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %5 = call %Value* () @hier10 ()

;stmt5:
  %6 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 3, %Value* %5, %TokenInfo* %2)
  store %Value* %6, %Value** %v
  br label %endif_0
else_0:

;stmt6:
  %7 = bitcast [2 x %Nat8]* @func259_str2 to %Str
  %8 = call %Bool (%Str) @match (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %9 = call %Value* () @hier11 ()

;stmt9:
  %10 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 2, %Value* %9, %TokenInfo* %2)
  store %Value* %10, %Value** %v
  br label %endif_1
else_1:

;stmt10:
  %11 = bitcast [4 x %Nat8]* @func259_str3 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %13 = call %Value* () @hier10 ()

;stmt13:
  %14 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 4, %Value* %13, %TokenInfo* %2)
  store %Value* %14, %Value** %v
  br label %endif_2
else_2:

;stmt14:
  %15 = bitcast [2 x %Nat8]* @func259_str4 to %Str
  %16 = call %Bool (%Str) @match (%Str %15)
  br i1 %16, label %then_3, label %else_3
then_3:

;stmt15:

;stmt16:
  %17 = call %Value* () @hier10 ()

;stmt17:
  %18 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 5, %Value* %17, %TokenInfo* %2)
  store %Value* %18, %Value** %v
  br label %endif_3
else_3:

;stmt18:
  %19 = bitcast [7 x %Nat8]* @func259_str5 to %Str
  %20 = call %Bool (%Str) @match (%Str %19)
  br i1 %20, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %21 = call %Token* () @ctok ()
  %22 = getelementptr inbounds %Token, %Token* %21, i32 0, i32 1 ; eval_access

;stmt21:
  %23 = call %Type* (%Bool) @parse_type (%Bool 0)

;stmt22:
  %24 = bitcast %Type* %23 to %Unit*
  %25 = inttoptr %Nat32 0 to %Unit*
  %26 = icmp eq %Unit* %24, %25
  br i1 %26, label %then_5, label %else_5
then_5:

;stmt23:

;stmt24:
  %27 = bitcast [23 x %Nat8]* @func259_str6 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %27, %TokenInfo* %22)

;stmt25:
  %28 = inttoptr %Nat32 0 to %Unit*
  %29 = bitcast %Unit* %28 to %Value*
  ret %Value* %29
  br label %endif_5
else_5:
  br label %endif_5
endif_5:

;stmt26:
  %31 = load %Type*, %Type** @typeSizeof
  %32 = getelementptr inbounds %Type, %Type* %23, i32 0, i32 2 ; eval_access
  %33 = load %Nat32, %Nat32* %32
  %34 = sext %Nat32 %33 to %Int64
  %35 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %31, %Int64 %34)
  store %Value* %35, %Value** %v

;stmt27:
  %36 = load %Value*, %Value** %v
  %37 = getelementptr inbounds %Value, %Value* %36, i32 0, i32 8 ; eval_access
  store %TokenInfo* %2, %TokenInfo** %37
  br label %endif_4
else_4:

;stmt28:
  %38 = bitcast [8 x %Nat8]* @func259_str7 to %Str
  %39 = call %Bool (%Str) @match (%Str %38)
  br i1 %39, label %then_6, label %else_6
then_6:

;stmt29:

;stmt30:
  %40 = call %Token* () @ctok ()
  %41 = getelementptr inbounds %Token, %Token* %40, i32 0, i32 1 ; eval_access

;stmt31:
  %42 = call %Type* (%Bool) @parse_type (%Bool 0)

;stmt32:
  %43 = bitcast %Type* %42 to %Unit*
  %44 = inttoptr %Nat32 0 to %Unit*
  %45 = icmp eq %Unit* %43, %44
  br i1 %45, label %then_7, label %else_7
then_7:

;stmt33:

;stmt34:
  %46 = bitcast [24 x %Nat8]* @func259_str8 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %46, %TokenInfo* %41)

;stmt35:
  %47 = inttoptr %Nat32 0 to %Unit*
  %48 = bitcast %Unit* %47 to %Value*
  ret %Value* %48
  br label %endif_7
else_7:
  br label %endif_7
endif_7:

;stmt36:
  %50 = load %Type*, %Type** @typeAlignof
  %51 = getelementptr inbounds %Type, %Type* %42, i32 0, i32 3 ; eval_access
  %52 = load %Nat8, %Nat8* %51
  %53 = sext %Nat8 %52 to %Int64
  %54 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %50, %Int64 %53)
  store %Value* %54, %Value** %v

;stmt37:
  %55 = load %Value*, %Value** %v
  %56 = getelementptr inbounds %Value, %Value* %55, i32 0, i32 8 ; eval_access
  store %TokenInfo* %2, %TokenInfo** %56
  br label %endif_6
else_6:

;stmt38:

;stmt39:
  %57 = call %Value* () @hier11 ()
  store %Value* %57, %Value** %v
  br label %endif_6
endif_6:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt40:
  %58 = load %Value*, %Value** %v
  ret %Value* %58
}

define %Value* @hier11 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier12 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1 ; eval_access

;stmt8:
  %11 = bitcast [2 x %Nat8]* @func260_str1 to %Str
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %13 = call %List* () @map_new ()

;stmt11:
  br label %continue_1
continue_1:
  %14 = bitcast [2 x %Nat8]* @func260_str2 to %Str
  %15 = call %Bool (%Str) @match (%Str %14)
  %16 = xor %Bool %15, 1
  br i1 %16, label %body_1, label %break_1
body_1:

;stmt12:

;stmt13:
  %17 = call %Value* () @expr ()

;stmt14:
  %18 = bitcast %Value* %17 to %Unit*
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = icmp eq %Unit* %18, %19
  br i1 %20, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  %21 = bitcast [3 x %Nat8]* @func260_str3 to %Str
  call void (%Str) @skipto (%Str %21)

;stmt17:
  %22 = bitcast [2 x %Nat8]* @func260_str4 to %Str
  %23 = call %Bool (%Str) @match (%Str %22)
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt18:

;stmt19:
  br label %continue_1
  br label %endif_3
else_3:

;stmt20:
  %25 = bitcast [2 x %Nat8]* @func260_str5 to %Str
  %26 = call %Bool (%Str) @match (%Str %25)
  br i1 %26, label %then_4, label %else_4
then_4:

;stmt21:

;stmt22:
  br label %break_1
  br label %endif_4
else_4:

;stmt23:

;stmt24:
  %28 = inttoptr %Nat32 0 to %Unit*
  %29 = bitcast %Unit* %28 to %Value*
  ret %Value* %29
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt25:
  %31 = bitcast %Value* %17 to %Unit*
  %32 = call %Bool (%List*, %Unit*) @list_append (%List* %13, %Unit* %31)

;stmt26:
  %33 = bitcast [2 x %Nat8]* @func260_str6 to %Str
  %34 = call %Bool (%Str) @match (%Str %33)
  %35 = xor %Bool %34, 1
  br i1 %35, label %then_5, label %else_5
then_5:

;stmt27:

;stmt28:
  %36 = bitcast [2 x %Nat8]* @func260_str7 to %Str
  %37 = call %Bool (%Str) @need (%Str %36)
  br label %endif_5
else_5:

;stmt29:

;stmt30:
  br label %break_1
  br label %endif_5
endif_5:
  br label %continue_1
break_1:

;stmt31:
  %39 = load %Value*, %Value** %v
  %40 = call %Value* (%Value*, %List*, %TokenInfo*) @call (%Value* %39, %List* %13, %TokenInfo* %10)
  store %Value* %40, %Value** %v
  br label %endif_1
else_1:

;stmt32:
  %41 = bitcast [2 x %Nat8]* @func260_str8 to %Str
  %42 = call %Bool (%Str) @match (%Str %41)
  br i1 %42, label %then_6, label %else_6
then_6:

;stmt33:

;stmt34:
  %43 = call %Value* () @expr ()

;stmt35:
  %44 = bitcast [2 x %Nat8]* @func260_str9 to %Str
  %45 = call %Bool (%Str) @match (%Str %44)

;stmt36:
  %46 = load %Value*, %Value** %v
  %47 = call %Value* (%Value*, %Value*, %TokenInfo*) @indx (%Value* %46, %Value* %43, %TokenInfo* %10)
  store %Value* %47, %Value** %v
  br label %endif_6
else_6:

;stmt37:
  %48 = bitcast [2 x %Nat8]* @func260_str10 to %Str
  %49 = call %Bool (%Str) @match (%Str %48)
  br i1 %49, label %then_7, label %else_7
then_7:

;stmt38:

;stmt39:
  %50 = call %Str () @parse_id ()

;stmt40:
  %51 = load %Value*, %Value** %v
  %52 = call %Value* (%Value*, %Str, %TokenInfo*) @access (%Value* %51, %Str %50, %TokenInfo* %10)
  store %Value* %52, %Value** %v
  br label %endif_7
else_7:

;stmt41:

;stmt42:
  br label %break_0
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt43:
  %54 = load %Value*, %Value** %v
  ret %Value* %54
}

define %Value* @hier12 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access

;stmt2:
  %3 = bitcast [2 x %Nat8]* @func261_str1 to %Str
  %4 = call %Bool (%Str) @match (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %5 = call %Value* () @expr ()
  store %Value* %5, %Value** %v

;stmt5:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 8 ; eval_access
  store %TokenInfo* %2, %TokenInfo** %7

;stmt6:
  %8 = bitcast [2 x %Nat8]* @func261_str2 to %Str
  %9 = call %Bool (%Str) @need (%Str %8)
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %10 = call %Value* () @term ()
  store %Value* %10, %Value** %v
  br label %endif_0
endif_0:

;stmt9:
  %11 = load %Value*, %Value** %v
  ret %Value* %11
}

define %Value* @term () {

;stmt0:
  %1 = call %Token* () @ctok ()

;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0 ; eval_access
  %3 = load %TokenType, %TokenType* %2

;stmt2:
  %v = alloca %Value*

;stmt3:
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = bitcast %Unit* %4 to %Value*
  store %Value* %5, %Value** %v

;stmt4:
  %6 = icmp eq %TokenType %3, 1
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %7 = bitcast [5 x %Nat8]* @func262_str1 to %Str
  %8 = call %Bool (%Str) @match (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %9 = call %Value* () @term_func ()
  store %Value* %9, %Value** %v
  br label %endif_1
else_1:

;stmt9:
  %10 = bitcast [6 x %Nat8]* @func262_str2 to %Str
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %12 = call %Value* () @term_arr ()
  store %Value* %12, %Value** %v
  br label %endif_2
else_2:

;stmt12:

;stmt13:
  %13 = call %Value* () @term_id ()
  store %Value* %13, %Value** %v
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:

;stmt14:
  %14 = icmp eq %TokenType %3, 2
  br i1 %14, label %then_3, label %else_3
then_3:

;stmt15:

;stmt16:
  %15 = call %Value* () @term_num ()
  store %Value* %15, %Value** %v
  br label %endif_3
else_3:

;stmt17:
  %16 = icmp eq %TokenType %3, 4
  br i1 %16, label %then_4, label %else_4
then_4:

;stmt18:

;stmt19:
  %17 = call %Value* () @term_str ()
  store %Value* %17, %Value** %v
  br label %endif_4
else_4:

;stmt20:
  %18 = icmp eq %TokenType %3, 5
  br i1 %18, label %then_5, label %else_5
then_5:

;stmt21:

;stmt22:
  %19 = call %Value* () @term_hash ()
  store %Value* %19, %Value** %v
  br label %endif_5
else_5:

;stmt23:

;stmt24:
  %20 = bitcast [24 x %Nat8]* @func262_str3 to %Str
  %21 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access
  call void (%Str, %TokenInfo*) @error (%Str %20, %TokenInfo* %21)

;stmt25:
  %22 = bitcast [12 x %Nat8]* @func262_str4 to %Str
  %23 = call %Token* () @ctok ()
  %24 = getelementptr inbounds %Token, %Token* %23, i32 0, i32 2 ; eval_access
  %25 = load [0 x %Nat8], [0 x %Nat8]* %24
  %26 = call %Int32 (%Str, ...) @printf (%Str %22, [0 x %Nat8] %25)
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_0
endif_0:

;stmt26:
  %27 = load %Value*, %Value** %v
  %28 = bitcast %Value* %27 to %Unit*
  %29 = inttoptr %Nat32 0 to %Unit*
  %30 = icmp ne %Unit* %28, %29
  br i1 %30, label %then_6, label %else_6
then_6:

;stmt27:

;stmt28:
  %31 = load %Value*, %Value** %v
  %32 = getelementptr inbounds %Value, %Value* %31, i32 0, i32 8 ; eval_access
  %33 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access
  store %TokenInfo* %33, %TokenInfo** %32
  br label %endif_6
else_6:
  br label %endif_6
endif_6:

;stmt29:
  %34 = load %Value*, %Value** %v
  ret %Value* %34
}

define %Value* @term_str () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access

;stmt1:
  %3 = call %Token* () @ctok ()
  %4 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2 ; eval_access
  %5 = bitcast [0 x %Nat8]* %4 to %Str

;stmt2:
  %6 = call %Nat32 (%Str) @strlen (%Str %5)
  %7 = add %Nat32 %6, 1

;stmt3:
  %8 = call %Str (%Str) @dup (%Str %5)

;stmt4:
  call void () @skip ()

;stmt5:
  %9 = load %Type*, %Type** @typeChar
  %10 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %9, %Nat32 %7, %Bool 0)

;stmt6:
  %11 = call %Str () @get_name_str ()

;stmt7:
  %12 = inttoptr %Nat32 0 to %Unit*
  %13 = bitcast %Unit* %12 to %Value*
  %14 = inttoptr %Nat32 0 to %Unit*
  %15 = bitcast %Unit* %14 to %Value*
  %16 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 1, %Type* %10, %Value* %13, %Value* %15)

;stmt8:
  %17 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 2 ; eval_access
  %18 = getelementptr inbounds %Storage, %Storage* %17, i32 0, i32 0 ; eval_access
  store %StorageClass 3, %StorageClass* %18

;stmt9:
  %19 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 2 ; eval_access
  %20 = getelementptr inbounds %Storage, %Storage* %19, i32 0, i32 3 ; eval_access
  store %Str %11, %Str* %20

;stmt10:
  %21 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 2 ; eval_access
  %22 = getelementptr inbounds %Storage, %Storage* %21, i32 0, i32 4 ; eval_access
  %23 = getelementptr inbounds %String, %String* %22, i32 0, i32 0 ; eval_access
  store %Str %8, %Str* %23

;stmt11:
  %24 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 2 ; eval_access
  %25 = getelementptr inbounds %Storage, %Storage* %24, i32 0, i32 4 ; eval_access
  %26 = getelementptr inbounds %String, %String* %25, i32 0, i32 1 ; eval_access
  store %Nat32 %7, %Nat32* %26

;stmt12:
  %27 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  %28 = call %ConstDef* (%Assembly*, %Str, %Value*) @asm_constdef_add (%Assembly* %27, %Str %11, %Value* %16)

;stmt13:
  %29 = call %Type* (%Type*) @type_pointer_new (%Type* %10)
  %30 = inttoptr %Nat32 0 to %Unit*
  %31 = bitcast %Unit* %30 to %Value*
  %32 = inttoptr %Nat32 0 to %Unit*
  %33 = bitcast %Unit* %32 to %Value*
  %34 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 1, %Type* %29, %Value* %31, %Value* %33)

;stmt14:
  %35 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 2 ; eval_access
  %36 = getelementptr inbounds %Storage, %Storage* %35, i32 0, i32 0 ; eval_access
  store %StorageClass 3, %StorageClass* %36

;stmt15:
  %37 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 2 ; eval_access
  %38 = getelementptr inbounds %Storage, %Storage* %37, i32 0, i32 3 ; eval_access
  store %Str %11, %Str* %38

;stmt16:
  %39 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 2 ; eval_access
  %40 = getelementptr inbounds %Storage, %Storage* %39, i32 0, i32 4 ; eval_access
  %41 = getelementptr inbounds %String, %String* %40, i32 0, i32 0 ; eval_access
  store %Str %8, %Str* %41

;stmt17:
  %42 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 2 ; eval_access
  %43 = getelementptr inbounds %Storage, %Storage* %42, i32 0, i32 4 ; eval_access
  %44 = getelementptr inbounds %String, %String* %43, i32 0, i32 1 ; eval_access
  store %Nat32 %7, %Nat32* %44

;stmt18:
  %45 = load %Type*, %Type** @typeStr
  %46 = inttoptr %Nat32 0 to %Unit*
  %47 = bitcast %Unit* %46 to %Value*
  %48 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 25, %Type* %45, %Value* %34, %Value* %47)

;stmt19:
  %49 = getelementptr inbounds %Value, %Value* %48, i32 0, i32 7 ; eval_access
  %50 = load %Type*, %Type** @typeStr
  store %Type* %50, %Type** %49

;stmt20:
  %51 = getelementptr inbounds %Value, %Value* %48, i32 0, i32 2 ; eval_access
  %52 = getelementptr inbounds %Storage, %Storage* %51, i32 0, i32 0 ; eval_access
  store %StorageClass 3, %StorageClass* %52

;stmt21:
  %53 = getelementptr inbounds %Value, %Value* %48, i32 0, i32 10 ; eval_access
  store %TokenInfo* %2, %TokenInfo** %53

;stmt22:
  ret %Value* %48

;stmt23:
  br label %fail
fail:

;stmt24:
  %55 = inttoptr %Nat32 0 to %Unit*
  %56 = bitcast %Unit* %55 to %Value*
  ret %Value* %56
}

define %Value* @term_arr () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access

;stmt1:
  %3 = call %Type* (%Bool) @parse_type (%Bool 0)

;stmt2:
  %4 = bitcast [2 x %Nat8]* @func264_str1 to %Str
  %5 = call %Bool (%Str) @need (%Str %4)

;stmt3:
  %6 = call %List* () @map_new ()

;stmt4:
  %len = alloca %Nat32

;stmt5:
  store %Nat32 0, %Nat32* %len

;stmt6:
  br label %continue_0
continue_0:
  %7 = bitcast [2 x %Nat8]* @func264_str2 to %Str
  %8 = call %Bool (%Str) @match (%Str %7)
  %9 = xor %Bool %8, 1
  br i1 %9, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %item = alloca %Value*

;stmt9:
  %10 = call %Value* () @cexpr ()
  store %Value* %10, %Value** %item

;stmt10:
  %11 = load %Value*, %Value** %item
  %12 = bitcast %Value* %11 to %Unit*
  %13 = inttoptr %Nat32 0 to %Unit*
  %14 = icmp eq %Unit* %12, %13
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt11:

;stmt12:
  %15 = bitcast [2 x %Nat8]* @func264_str3 to %Str
  %16 = call %Bool (%Str) @match (%Str %15)

;stmt13:
  br label %continue_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt14:
  %18 = load %Nat32, %Nat32* %len
  %19 = add %Nat32 %18, 1
  store %Nat32 %19, %Nat32* %len

;stmt15:
  %20 = load %Value*, %Value** %item
  %21 = bitcast %Value* %20 to %Unit*
  %22 = call %Bool (%List*, %Unit*) @list_append (%List* %6, %Unit* %21)

;stmt16:
  %23 = bitcast [2 x %Nat8]* @func264_str4 to %Str
  %24 = call %Bool (%Str) @match (%Str %23)
  br label %continue_0
break_0:

;stmt17:
  %25 = call %Str () @get_name_arr ()

;stmt18:
  %26 = load %Nat32, %Nat32* %len
  %27 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %3, %Nat32 %26, %Bool 0)

;stmt19:
  %28 = inttoptr %Nat32 0 to %Unit*
  %29 = bitcast %Unit* %28 to %Value*
  %30 = inttoptr %Nat32 0 to %Unit*
  %31 = bitcast %Unit* %30 to %Value*
  %32 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 1, %Type* %27, %Value* %29, %Value* %31)

;stmt20:
  %33 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 2 ; eval_access
  %34 = getelementptr inbounds %Storage, %Storage* %33, i32 0, i32 0 ; eval_access
  store %StorageClass 4, %StorageClass* %34

;stmt21:
  %35 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 2 ; eval_access
  %36 = getelementptr inbounds %Storage, %Storage* %35, i32 0, i32 3 ; eval_access
  store %Str %25, %Str* %36

;stmt22:
  %37 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 2 ; eval_access
  %38 = getelementptr inbounds %Storage, %Storage* %37, i32 0, i32 5 ; eval_access
  store %List* %6, %List** %38

;stmt23:
  %39 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 10 ; eval_access
  store %TokenInfo* %2, %TokenInfo** %39

;stmt24:
  %40 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  %41 = call %ConstDef* (%Assembly*, %Str, %Value*) @asm_constdef_add (%Assembly* %40, %Str %25, %Value* %32)

;stmt25:
  ret %Value* %32
}

define %Value* @term_func () {

;stmt0:
  %1 = load %FuncContext, %FuncContext* @fctx

;stmt1:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %3 = load %Block*, %Block** %2

;stmt2:
  %4 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = bitcast %Unit* %5 to %Value*
  store %Value* %6, %Value** %4

;stmt3:
  %7 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = bitcast %Unit* %8 to %Block*
  store %Block* %9, %Block** %7

;stmt4:
  %10 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2 ; eval_access
  store %Nat32 0, %Nat32* %10

;stmt5:
  %11 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3 ; eval_access
  store %Nat32 0, %Nat32* %11

;stmt6:
  %12 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 4 ; eval_access
  store %Nat32 0, %Nat32* %12

;stmt7:
  %13 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 5 ; eval_access
  store %Nat32 0, %Nat32* %13

;stmt8:
  %14 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 6 ; eval_access
  store %Nat32 0, %Nat32* %14

;stmt9:
  %15 = call %Token* () @ctok ()
  %16 = getelementptr inbounds %Token, %Token* %15, i32 0, i32 1 ; eval_access

;stmt10:
  %17 = call %Str () @get_name_func ()

;stmt11:
  %18 = bitcast %Str %17 to %Unit*
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = icmp eq %Unit* %18, %19
  br i1 %20, label %then_0, label %else_0
then_0:

;stmt12:

;stmt13:
  %21 = bitcast [16 x %Nat8]* @func265_str1 to %Str
  %22 = call %Int32 (%Str, ...) @printf (%Str %21)

;stmt14:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt15:
  %24 = call %Type* (%Bool) @parse_type (%Bool 0)

;stmt16:
  %25 = bitcast %Type* %24 to %Unit*
  %26 = inttoptr %Nat32 0 to %Unit*
  %27 = icmp eq %Unit* %25, %26
  br i1 %27, label %then_1, label %else_1
then_1:

;stmt17:

;stmt18:
  %28 = bitcast [18 x %Nat8]* @func265_str2 to %Str
  %29 = call %Int32 (%Str, ...) @printf (%Str %28)

;stmt19:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt20:
  %31 = getelementptr inbounds %Type, %Type* %24, i32 0, i32 0 ; eval_access
  %32 = load %TypeKind, %TypeKind* %31
  %33 = icmp ne %TypeKind %32, 4
  br i1 %33, label %then_2, label %else_2
then_2:

;stmt21:

;stmt22:
  %34 = bitcast [19 x %Nat8]* @func265_str3 to %Str
  %35 = getelementptr inbounds %Type, %Type* %24, i32 0, i32 13 ; eval_access
  %36 = load %TokenInfo*, %TokenInfo** %35
  call void (%Str, %TokenInfo*) @error (%Str %34, %TokenInfo* %36)

;stmt23:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt24:
  %38 = inttoptr %Nat32 0 to %Unit*
  %39 = bitcast %Unit* %38 to %Value*
  %40 = inttoptr %Nat32 0 to %Unit*
  %41 = bitcast %Unit* %40 to %Value*
  %42 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 1, %Type* %24, %Value* %39, %Value* %41)

;stmt25:
  %43 = bitcast %Block* %3 to %Unit*
  %44 = inttoptr %Nat32 0 to %Unit*
  %45 = icmp ne %Unit* %43, %44
  br i1 %45, label %then_3, label %else_3
then_3:

;stmt26:

;stmt27:
  %46 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 4 ; eval_access
  %47 = load %List*, %List** %46
  %48 = bitcast %Value* %42 to %Unit*
  %49 = call %Bool (%List*, %Unit*) @list_append (%List* %47, %Unit* %48)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt28:
  %50 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  store %Value* %42, %Value** %50

;stmt29:
  %51 = getelementptr inbounds %Value, %Value* %42, i32 0, i32 2 ; eval_access
  %52 = getelementptr inbounds %Storage, %Storage* %51, i32 0, i32 0 ; eval_access
  store %StorageClass 2, %StorageClass* %52

;stmt30:
  %53 = getelementptr inbounds %Value, %Value* %42, i32 0, i32 2 ; eval_access
  %54 = getelementptr inbounds %Storage, %Storage* %53, i32 0, i32 3 ; eval_access
  store %Str %17, %Str* %54

;stmt31:
  %55 = getelementptr inbounds %Value, %Value* %42, i32 0, i32 10 ; eval_access
  store %TokenInfo* %16, %TokenInfo** %55

;stmt32:
  %56 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  store %Value* %42, %Value** %56

;stmt33:
  %57 = bitcast [2 x %Nat8]* @func265_str4 to %Str
  %58 = call %Bool (%Str) @need (%Str %57)

;stmt34:
  %59 = call %Block* () @doblock ()

;stmt35:
  %60 = getelementptr inbounds %Value, %Value* %42, i32 0, i32 6 ; eval_access
  store %Block* %59, %Block** %60

;stmt36:
  %61 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  %62 = call %FuncDef* (%Assembly*, %Str, %Type*, %Block*) @asm_funcdef_add (%Assembly* %61, %Str %17, %Type* %24, %Block* %59)

;stmt37:
  store %FuncContext %1, %FuncContext* @fctx

;stmt38:
  ret %Value* %42

;stmt39:
  br label %fail
fail:

;stmt40:
  store %FuncContext %1, %FuncContext* @fctx

;stmt41:
  %64 = inttoptr %Nat32 0 to %Unit*
  %65 = bitcast %Unit* %64 to %Value*
  ret %Value* %65
}

define %Value* @term_id () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access

;stmt1:
  %3 = call %Str () @parse_id ()

;stmt2:
  %4 = bitcast %Str %3 to %Unit*
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = bitcast %Unit* %7 to %Value*
  ret %Value* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %v = alloca %Value*

;stmt6:
  %10 = call %Value* (%Str) @get_value (%Str %3)
  store %Value* %10, %Value** %v

;stmt7:
  %11 = load %Value*, %Value** %v
  %12 = bitcast %Value* %11 to %Unit*
  %13 = inttoptr %Nat32 0 to %Unit*
  %14 = icmp eq %Unit* %12, %13
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %15 = inttoptr %Nat32 0 to %Unit*
  %16 = bitcast %Unit* %15 to %Type*
  %17 = inttoptr %Nat32 0 to %Unit*
  %18 = bitcast %Unit* %17 to %Value*
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = bitcast %Unit* %19 to %Value*
  %21 = call %Value* (%ValueKind, %Type*, %Value*, %Value*) @value_new (%ValueKind 1, %Type* %16, %Value* %18, %Value* %20)
  store %Value* %21, %Value** %v

;stmt10:
  %22 = load %Value*, %Value** %v
  %23 = getelementptr inbounds %Value, %Value* %22, i32 0, i32 2 ; eval_access
  %24 = getelementptr inbounds %Storage, %Storage* %23, i32 0, i32 3 ; eval_access
  store %Str %3, %Str* %24

;stmt11:
  %25 = load %Value*, %Value** %v
  %26 = getelementptr inbounds %Value, %Value* %25, i32 0, i32 9 ; eval_access
  store %TokenInfo* %2, %TokenInfo** %26

;stmt12:
  %27 = load %Value*, %Value** %v
  call void (%Str, %Value*) @bind_value_global (%Str %3, %Value* %27)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt13:
  %28 = load %Value*, %Value** %v
  %29 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 2 ; eval_access
  %30 = getelementptr inbounds %Storage, %Storage* %29, i32 0, i32 3 ; eval_access
  store %Str %3, %Str* %30

;stmt14:
  %31 = load %Value*, %Value** %v
  ret %Value* %31

;stmt15:
  br label %fail
fail:

;stmt16:
  %33 = inttoptr %Nat32 0 to %Unit*
  %34 = bitcast %Unit* %33 to %Value*
  ret %Value* %34
}

define %Value* @term_num () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access

;stmt1:
  %d = alloca %Int64

;stmt2:
  %3 = call %Token* () @ctok ()

;stmt3:
  %4 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2 ; eval_access
  %5 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %4, i32 0, %Int32 0 ; eval_index
  %6 = load %Nat8, %Nat8* %5
  %7 = bitcast [2 x %Nat8]* @func267_str1 to %Str
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0 ; eval_index
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp eq %Nat8 %6, %9
  %11 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2 ; eval_access
  %12 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %11, i32 0, %Int32 1 ; eval_index
  %13 = load %Nat8, %Nat8* %12
  %14 = bitcast [2 x %Nat8]* @func267_str2 to %Str
  %15 = getelementptr inbounds %Nat8, %Str %14, %Int32 0 ; eval_index
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp eq %Nat8 %13, %16
  %18 = and %Bool %10, %17
  br i1 %18, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %19 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2 ; eval_access
  %20 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %19, i32 0, %Int32 2 ; eval_index
  %21 = bitcast %Nat8* %20 to %Unit*
  %22 = bitcast [5 x %Nat8]* @func267_str3 to %Str
  %23 = getelementptr inbounds %Int64, %Int64* %d, i32 0 ; ref
  %24 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %21, %Str %22, %Int64* %23)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %25 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2 ; eval_access
  %26 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %25, i32 0, %Int32 0 ; eval_index
  %27 = bitcast %Nat8* %26 to %Unit*
  %28 = bitcast [5 x %Nat8]* @func267_str4 to %Str
  %29 = getelementptr inbounds %Int64, %Int64* %d, i32 0 ; ref
  %30 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %27, %Str %28, %Int64* %29)
  br label %endif_0
endif_0:

;stmt8:
  call void () @skip ()

;stmt9:
  %31 = call %Type* (%TypeKind) @type_new (%TypeKind 1)

;stmt10:
  %32 = getelementptr inbounds %Type, %Type* %31, i32 0, i32 11 ; eval_access
  store %TokenInfo* %2, %TokenInfo** %32

;stmt11:
  %33 = load %Int64, %Int64* %d
  %34 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %31, %Int64 %33)

;stmt12:
  %35 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 10 ; eval_access
  store %TokenInfo* %2, %TokenInfo** %35

;stmt13:
  ret %Value* %34
}

define %Value* @term_hash () {

;stmt0:
  %1 = inttoptr %Nat32 0 to %Unit*
  %2 = bitcast %Unit* %1 to %Value*
  ret %Value* %2
}

define %Stmt* @assign (%Value* %_l, %Value* %_r, %TokenInfo* %_ti) {
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %l
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Value*, %Value** %r
  %6 = bitcast %Value* %5 to %Unit*
  %7 = inttoptr %Nat32 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %4, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %10 = inttoptr %Nat32 0 to %Unit*
  %11 = bitcast %Unit* %10 to %Stmt*
  ret %Stmt* %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %13 = load %Value*, %Value** %l
  %14 = load %Value*, %Value** %r
  %15 = load %TokenInfo*, %TokenInfo** %ti
  %16 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @stmt_new_assign (%Value* %13, %Value* %14, %TokenInfo* %15)
  ret %Stmt* %16
}

define void @checkStmtAssign (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = load %Stmt*, %Stmt** %s
  %6 = getelementptr inbounds %Stmt, %Stmt* %5, i32 0, i32 1 ; eval_access
  %7 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %6, i32 0, %Int32 1 ; eval_index
  %8 = load %Value*, %Value** %7

;stmt2:
  %9 = call %Type* (%Value*) @getType (%Value* %4)

;stmt3:
  %10 = call %Type* (%Value*) @getType (%Value* %8)

;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 2 ; eval_access
  %12 = call %Bool (%Storage*) @storageIsMutable (%Storage* %11)
  %13 = xor %Bool %12, 1
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %14 = bitcast [13 x %Nat8]* @func270_str1 to %Str
  %15 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 8 ; eval_access
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %14, %TokenInfo* %16)

;stmt7:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %18 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1 ; eval_access
  %19 = load %Type*, %Type** %18
  %20 = call %Value* (%Value*, %Type*) @nat (%Value* %8, %Type* %19)

;stmt9:
  %21 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 1 ; eval_access
  %22 = load %Type*, %Type** %21
  %23 = call %Bool (%Type*, %Type*) @type_eq (%Type* %9, %Type* %22)
  %24 = xor %Bool %23, 1
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %25 = bitcast [11 x %Nat8]* @func270_str2 to %Str
  %26 = load %Stmt*, %Stmt** %s
  %27 = getelementptr inbounds %Stmt, %Stmt* %26, i32 0, i32 7 ; eval_access
  %28 = load %TokenInfo*, %TokenInfo** %27
  call void (%Str, %TokenInfo*) @error (%Str %25, %TokenInfo* %28)

;stmt12:
  %29 = bitcast [9 x %Nat8]* @func270_str3 to %Str
  %30 = call %Int32 (%Str, ...) @printf (%Str %29)

;stmt13:
  call void (%Type*) @prttype (%Type* %9)

;stmt14:
  %31 = bitcast [2 x %Nat8]* @func270_str4 to %Str
  %32 = call %Int32 (%Str, ...) @printf (%Str %31)

;stmt15:
  %33 = bitcast [9 x %Nat8]* @func270_str5 to %Str
  %34 = call %Int32 (%Str, ...) @printf (%Str %33)

;stmt16:
  %35 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 1 ; eval_access
  %36 = load %Type*, %Type** %35
  call void (%Type*) @prttype (%Type* %36)

;stmt17:
  %37 = bitcast [2 x %Nat8]* @func270_str6 to %Str
  %38 = call %Int32 (%Str, ...) @printf (%Str %37)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt18:
  %39 = load %Stmt*, %Stmt** %s
  %40 = getelementptr inbounds %Stmt, %Stmt* %39, i32 0, i32 1 ; eval_access
  %41 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %40, i32 0, %Int32 1 ; eval_index
  store %Value* %20, %Value** %41
  ret void
}

define void @checkStmtIf (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 5 ; eval_access
  %3 = load %If*, %If** %2

;stmt1:
  %4 = getelementptr inbounds %If, %If* %3, i32 0, i32 0 ; eval_access
  %5 = load %Value*, %Value** %4
  %6 = call %Type* (%Value*) @getType (%Value* %5)

;stmt2:
  %7 = bitcast %Type* %6 to %Unit*
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %10 = load %Type*, %Type** @typeBool
  %11 = call %Bool (%Type*, %Type*) @type_eq (%Type* %6, %Type* %10)
  %12 = xor %Bool %11, 1
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %13 = bitcast [25 x %Nat8]* @func271_str1 to %Str
  %14 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 13 ; eval_access
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %15)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %16 = getelementptr inbounds %If, %If* %3, i32 0, i32 1 ; eval_access
  %17 = load %Stmt*, %Stmt** %16
  call void (%Stmt*) @checkStmt (%Stmt* %17)

;stmt8:
  %18 = getelementptr inbounds %If, %If* %3, i32 0, i32 2 ; eval_access
  %19 = load %Stmt*, %Stmt** %18
  call void (%Stmt*) @checkStmt (%Stmt* %19)
  ret void
}

define void @checkStmtWhile (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 4 ; eval_access
  %3 = load %While*, %While** %2

;stmt1:
  %4 = getelementptr inbounds %While, %While* %3, i32 0, i32 0 ; eval_access
  %5 = load %Value*, %Value** %4
  %6 = call %Type* (%Value*) @getType (%Value* %5)

;stmt2:
  %7 = bitcast %Type* %6 to %Unit*
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %10 = load %Type*, %Type** @typeBool
  %11 = call %Bool (%Type*, %Type*) @type_eq (%Type* %6, %Type* %10)
  %12 = xor %Bool %11, 1
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %13 = bitcast [25 x %Nat8]* @func272_str1 to %Str
  %14 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 13 ; eval_access
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %15)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %16 = getelementptr inbounds %While, %While* %3, i32 0, i32 1 ; eval_access
  %17 = load %Stmt*, %Stmt** %16
  call void (%Stmt*) @checkStmt (%Stmt* %17)
  ret void
}

define void @checkStmtReturn (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = bitcast %Value* %4 to %Unit*
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = call %Type* (%Value*) @getType (%Value* %4)

;stmt4:
  %9 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0 ; eval_access
  %10 = load %Value*, %Value** %9
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1 ; eval_access
  %12 = load %Type*, %Type** %11
  %13 = getelementptr inbounds %Type, %Type* %12, i32 0, i32 6 ; eval_access
  %14 = getelementptr inbounds %TypeFunc, %TypeFunc* %13, i32 0, i32 1 ; eval_access
  %15 = load %Type*, %Type** %14

;stmt5:
  %16 = load %Stmt*, %Stmt** %s
  %17 = getelementptr inbounds %Stmt, %Stmt* %16, i32 0, i32 1 ; eval_access
  %18 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %17, i32 0, %Int32 0 ; eval_index
  %19 = call %Value* (%Value*, %Type*) @nat (%Value* %4, %Type* %15)
  store %Value* %19, %Value** %18
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @checkStmtLet (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = load %Stmt*, %Stmt** %s
  %6 = getelementptr inbounds %Stmt, %Stmt* %5, i32 0, i32 1 ; eval_access
  %7 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %6, i32 0, %Int32 1 ; eval_index
  %8 = load %Value*, %Value** %7

;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 2 ; eval_access
  %10 = getelementptr inbounds %Storage, %Storage* %9, i32 0, i32 3 ; eval_access
  %11 = load %Str, %Str* %10

;stmt3:
  %12 = call %Type* (%Value*) @getType (%Value* %4)

;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 1 ; eval_access
  store %Type* %12, %Type** %13
  ret void
}

define void @checkStmt (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = bitcast %Stmt* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %6 = load %Stmt*, %Stmt** %s
  %7 = getelementptr inbounds %Stmt, %Stmt* %6, i32 0, i32 0 ; eval_access
  %8 = load %StmtKind, %StmtKind* %7

;stmt4:
  %9 = icmp eq %StmtKind %8, 0
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %10 = load %Stmt*, %Stmt** %s
  call void (%Stmt*) @checkStmtLet (%Stmt* %10)
  br label %endif_1
else_1:

;stmt7:
  %11 = icmp eq %StmtKind %8, 3
  br i1 %11, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %12 = load %Stmt*, %Stmt** %s
  %13 = getelementptr inbounds %Stmt, %Stmt* %12, i32 0, i32 1 ; eval_access
  %14 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %13, i32 0, %Int32 0 ; eval_index
  %15 = load %Value*, %Value** %14
  %16 = call %Type* (%Value*) @getType (%Value* %15)
  br label %endif_2
else_2:

;stmt10:
  %17 = icmp eq %StmtKind %8, 4
  br i1 %17, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %18 = load %Stmt*, %Stmt** %s
  call void (%Stmt*) @checkStmtAssign (%Stmt* %18)
  br label %endif_3
else_3:

;stmt13:
  %19 = icmp eq %StmtKind %8, 2
  br i1 %19, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  %20 = load %Stmt*, %Stmt** %s
  %21 = getelementptr inbounds %Stmt, %Stmt* %20, i32 0, i32 2 ; eval_access
  %22 = load %Block*, %Block** %21
  call void (%Block*) @checkBlock (%Block* %22)
  br label %endif_4
else_4:

;stmt16:
  %23 = icmp eq %StmtKind %8, 5
  br i1 %23, label %then_5, label %else_5
then_5:

;stmt17:

;stmt18:
  %24 = load %Stmt*, %Stmt** %s
  call void (%Stmt*) @checkStmtIf (%Stmt* %24)
  br label %endif_5
else_5:

;stmt19:
  %25 = icmp eq %StmtKind %8, 6
  br i1 %25, label %then_6, label %else_6
then_6:

;stmt20:

;stmt21:
  %26 = load %Stmt*, %Stmt** %s
  call void (%Stmt*) @checkStmtWhile (%Stmt* %26)
  br label %endif_6
else_6:

;stmt22:
  %27 = icmp eq %StmtKind %8, 7
  br i1 %27, label %then_7, label %else_7
then_7:

;stmt23:

;stmt24:
  %28 = load %Stmt*, %Stmt** %s
  call void (%Stmt*) @checkStmtReturn (%Stmt* %28)
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  ret void
}

define void @chkf (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  call void (%Value*) @checkFunc (%Value* %2)
  ret void
}

define void @chkb (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Stmt*

;stmt1:
  call void (%Stmt*) @checkStmt (%Stmt* %2)
  ret void
}

define void @checkBlock (%Block* %_b) {
  %b = alloca %Block*
  store %Block* %_b, %Block** %b

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %2 = load %Block*, %Block** %1

;stmt1:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  %4 = load %Block*, %Block** %b
  store %Block* %4, %Block** %3

;stmt2:
  %5 = load %Block*, %Block** %b
  %6 = getelementptr inbounds %Block, %Block* %5, i32 0, i32 4 ; eval_access
  %7 = load %List*, %List** %6
  %8 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %7, %ListForeachHandler @chkf, %Unit* %8)

;stmt3:
  %9 = load %Block*, %Block** %b
  %10 = getelementptr inbounds %Block, %Block* %9, i32 0, i32 1 ; eval_access
  %11 = load %List*, %List** %10
  %12 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %11, %ListForeachHandler @chkb, %Unit* %12)

;stmt4:
  %13 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1 ; eval_access
  store %Block* %2, %Block** %13
  ret void
}

define %Stmt* @stmtBlock (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Block* () @doblock ()

;stmt1:
  %2 = bitcast %Block* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = bitcast %Unit* %5 to %Stmt*
  ret %Stmt* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 2)

;stmt5:
  %9 = getelementptr inbounds %Stmt, %Stmt* %8, i32 0, i32 2 ; eval_access
  store %Block* %1, %Block** %9

;stmt6:
  %10 = getelementptr inbounds %Stmt, %Stmt* %8, i32 0, i32 7 ; eval_access
  %11 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %11, %TokenInfo** %10

;stmt7:
  ret %Stmt* %8
}

define %Stmt* @stmt () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1 ; eval_access

;stmt1:
  %3 = bitcast [4 x %Nat8]* @func280_str1 to %Str
  %4 = call %Bool (%Str) @match (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = call %Stmt* (%Bool) @dolet (%Bool 1)
  ret %Stmt* %5

;stmt4:
  %7 = call %Bool () @sep ()
  br label %endif_0
else_0:

;stmt5:
  %8 = bitcast [2 x %Nat8]* @func280_str2 to %Str
  %9 = call %Bool (%Str) @match (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %10 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %2)
  ret %Stmt* %10
  br label %endif_1
else_1:

;stmt8:
  %12 = bitcast [3 x %Nat8]* @func280_str3 to %Str
  %13 = call %Bool (%Str) @match (%Str %12)
  br i1 %13, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %14 = call %Stmt* (%TokenInfo*) @stmtIf (%TokenInfo* %2)
  ret %Stmt* %14
  br label %endif_2
else_2:

;stmt11:
  %16 = bitcast [6 x %Nat8]* @func280_str4 to %Str
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_3, label %else_3
then_3:

;stmt12:

;stmt13:
  %18 = call %Stmt* (%TokenInfo*) @stmtWhile (%TokenInfo* %2)
  ret %Stmt* %18
  br label %endif_3
else_3:

;stmt14:
  %20 = bitcast [7 x %Nat8]* @func280_str5 to %Str
  %21 = call %Bool (%Str) @match (%Str %20)
  br i1 %21, label %then_4, label %else_4
then_4:

;stmt15:

;stmt16:
  %22 = call %Stmt* (%TokenInfo*) @stmtRet (%TokenInfo* %2)
  ret %Stmt* %22
  br label %endif_4
else_4:

;stmt17:
  %24 = bitcast [6 x %Nat8]* @func280_str6 to %Str
  %25 = call %Bool (%Str) @match (%Str %24)
  br i1 %25, label %then_5, label %else_5
then_5:

;stmt18:

;stmt19:
  %26 = call %Stmt* (%TokenInfo*) @stmtBreak (%TokenInfo* %2)
  ret %Stmt* %26
  br label %endif_5
else_5:

;stmt20:
  %28 = bitcast [9 x %Nat8]* @func280_str7 to %Str
  %29 = call %Bool (%Str) @match (%Str %28)
  br i1 %29, label %then_6, label %else_6
then_6:

;stmt21:

;stmt22:
  %30 = call %Stmt* (%TokenInfo*) @stmtContinue (%TokenInfo* %2)
  ret %Stmt* %30
  br label %endif_6
else_6:

;stmt23:
  %32 = bitcast [4 x %Nat8]* @func280_str8 to %Str
  %33 = call %Bool (%Str) @match (%Str %32)
  br i1 %33, label %then_7, label %else_7
then_7:

;stmt24:

;stmt25:
  call void () @dovardef ()

;stmt26:
  %34 = call %Bool () @sep ()

;stmt27:
  %35 = inttoptr %Nat32 0 to %Unit*
  %36 = bitcast %Unit* %35 to %Stmt*
  ret %Stmt* %36
  br label %endif_7
else_7:

;stmt28:
  %38 = bitcast [5 x %Nat8]* @func280_str9 to %Str
  %39 = call %Bool (%Str) @match (%Str %38)
  br i1 %39, label %then_8, label %else_8
then_8:

;stmt29:

;stmt30:
  call void () @dotypedef ()

;stmt31:
  %40 = call %Bool () @sep ()

;stmt32:
  %41 = inttoptr %Nat32 0 to %Unit*
  %42 = bitcast %Unit* %41 to %Stmt*
  ret %Stmt* %42
  br label %endif_8
else_8:

;stmt33:
  %44 = bitcast [5 x %Nat8]* @func280_str10 to %Str
  %45 = call %Bool (%Str) @match (%Str %44)
  br i1 %45, label %then_9, label %else_9
then_9:

;stmt34:

;stmt35:
  %46 = call %Stmt* (%TokenInfo*) @stmtGoto (%TokenInfo* %2)
  ret %Stmt* %46
  br label %endif_9
else_9:
  br label %endif_9
endif_9:
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt36:
  %48 = call %Node* () @gett ()

;stmt37:
  %49 = call %Token* () @ctok ()
  %50 = getelementptr inbounds %Token, %Token* %49, i32 0, i32 0 ; eval_access
  %51 = load %TokenType, %TokenType* %50
  %52 = icmp eq %TokenType %51, 1
  br i1 %52, label %then_10, label %else_10
then_10:

;stmt38:

;stmt39:
  %53 = call %Str () @parse_id ()

;stmt40:
  %54 = call %Token* () @ctok ()
  %55 = getelementptr inbounds %Token, %Token* %54, i32 0, i32 1 ; eval_access

;stmt41:
  %56 = bitcast [2 x %Nat8]* @func280_str11 to %Str
  %57 = call %Bool (%Str) @match (%Str %56)
  br i1 %57, label %then_11, label %else_11
then_11:

;stmt42:

;stmt43:
  call void (%Str, %TokenInfo*) @setlab (%Str %53, %TokenInfo* %55)

;stmt44:
  %58 = inttoptr %Nat32 0 to %Unit*
  %59 = bitcast %Unit* %58 to %Stmt*
  ret %Stmt* %59
  br label %endif_11
else_11:

;stmt45:

;stmt46:
  call void (%Node*) @sett (%Node* %48)
  br label %endif_11
endif_11:
  br label %endif_10
else_10:
  br label %endif_10
endif_10:

;stmt47:
  %61 = call %Stmt* () @doexpr ()

;stmt48:
  %62 = bitcast %Stmt* %61 to %Unit*
  %63 = inttoptr %Nat32 0 to %Unit*
  %64 = icmp eq %Unit* %62, %63
  br i1 %64, label %then_12, label %else_12
then_12:

;stmt49:

;stmt50:
  call void () @stmt_restore ()
  br label %endif_12
else_12:
  br label %endif_12
endif_12:

;stmt51:
  ret %Stmt* %61
}

define void @stmt_restore () {

;stmt0:
  call void () @skip ()
  ret void
}

define %Stmt* @stmtIf (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %If*

;stmt1:
  %3 = getelementptr inbounds %If, %If* %2, i32 0, i32 0 ; eval_access
  %4 = call %Value* () @expr ()
  store %Value* %4, %Value** %3

;stmt2:
  %5 = bitcast [2 x %Nat8]* @func282_str1 to %Str
  %6 = call %Bool (%Str) @match (%Str %5)

;stmt3:
  %7 = call %Token* () @ctok ()
  %8 = getelementptr inbounds %Token, %Token* %7, i32 0, i32 1 ; eval_access

;stmt4:
  %9 = bitcast [2 x %Nat8]* @func282_str2 to %Str
  %10 = call %Bool (%Str) @need (%Str %9)

;stmt5:
  %11 = getelementptr inbounds %If, %If* %2, i32 0, i32 1 ; eval_access
  %12 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %8)
  store %Stmt* %12, %Stmt** %11

;stmt6:
  %13 = bitcast [5 x %Nat8]* @func282_str3 to %Str
  %14 = call %Bool (%Str) @match (%Str %13)
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %15 = bitcast [2 x %Nat8]* @func282_str4 to %Str
  %16 = call %Bool (%Str) @match (%Str %15)

;stmt9:
  %17 = call %Token* () @ctok ()
  %18 = getelementptr inbounds %Token, %Token* %17, i32 0, i32 1 ; eval_access

;stmt10:
  %19 = bitcast [3 x %Nat8]* @func282_str5 to %Str
  %20 = call %Bool (%Str) @match (%Str %19)
  br i1 %20, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %21 = getelementptr inbounds %If, %If* %2, i32 0, i32 2 ; eval_access
  %22 = call %Stmt* (%TokenInfo*) @stmtIf (%TokenInfo* %18)
  store %Stmt* %22, %Stmt** %21
  br label %endif_1
else_1:

;stmt13:

;stmt14:
  %23 = bitcast [2 x %Nat8]* @func282_str6 to %Str
  %24 = call %Bool (%Str) @need (%Str %23)

;stmt15:
  %25 = getelementptr inbounds %If, %If* %2, i32 0, i32 2 ; eval_access
  %26 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %18)
  store %Stmt* %26, %Stmt** %25
  br label %endif_1
endif_1:
  br label %endif_0
else_0:

;stmt16:

;stmt17:
  %27 = getelementptr inbounds %If, %If* %2, i32 0, i32 2 ; eval_access
  %28 = inttoptr %Nat32 0 to %Unit*
  %29 = bitcast %Unit* %28 to %Stmt*
  store %Stmt* %29, %Stmt** %27
  br label %endif_0
endif_0:

;stmt18:
  %30 = getelementptr inbounds %If, %If* %2, i32 0, i32 0 ; eval_access
  %31 = load %Value*, %Value** %30
  %32 = bitcast %Value* %31 to %Unit*
  %33 = inttoptr %Nat32 0 to %Unit*
  %34 = icmp eq %Unit* %32, %33
  %35 = getelementptr inbounds %If, %If* %2, i32 0, i32 1 ; eval_access
  %36 = load %Stmt*, %Stmt** %35
  %37 = bitcast %Stmt* %36 to %Unit*
  %38 = inttoptr %Nat32 0 to %Unit*
  %39 = icmp eq %Unit* %37, %38
  %40 = or %Bool %34, %39
  br i1 %40, label %then_2, label %else_2
then_2:

;stmt19:

;stmt20:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt21:
  %42 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 5)

;stmt22:
  %43 = getelementptr inbounds %Stmt, %Stmt* %42, i32 0, i32 5 ; eval_access
  store %If* %2, %If** %43

;stmt23:
  %44 = getelementptr inbounds %Stmt, %Stmt* %42, i32 0, i32 7 ; eval_access
  %45 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %45, %TokenInfo** %44

;stmt24:
  ret %Stmt* %42

;stmt25:
  br label %fail
fail:

;stmt26:
  %47 = inttoptr %Nat32 0 to %Unit*
  %48 = bitcast %Unit* %47 to %Stmt*
  ret %Stmt* %48
}

define %Stmt* @stmtWhile (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2 ; eval_access
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2 ; eval_access
  %3 = load %Nat32, %Nat32* %2
  %4 = add %Nat32 %3, 1
  store %Nat32 %4, %Nat32* %1

;stmt1:
  %5 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %6 = bitcast %Unit* %5 to %While*

;stmt2:
  %7 = getelementptr inbounds %While, %While* %6, i32 0, i32 0 ; eval_access
  %8 = call %Value* () @expr ()
  store %Value* %8, %Value** %7

;stmt3:
  %9 = bitcast [2 x %Nat8]* @func283_str1 to %Str
  %10 = call %Bool (%Str) @match (%Str %9)

;stmt4:
  %11 = call %Token* () @ctok ()
  %12 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1 ; eval_access

;stmt5:
  %13 = bitcast [2 x %Nat8]* @func283_str2 to %Str
  %14 = call %Bool (%Str) @need (%Str %13)

;stmt6:
  %15 = getelementptr inbounds %While, %While* %6, i32 0, i32 1 ; eval_access
  %16 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %12)
  store %Stmt* %16, %Stmt** %15

;stmt7:
  %17 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2 ; eval_access
  %18 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2 ; eval_access
  %19 = load %Nat32, %Nat32* %18
  %20 = sub %Nat32 %19, 1
  store %Nat32 %20, %Nat32* %17

;stmt8:
  %21 = getelementptr inbounds %While, %While* %6, i32 0, i32 0 ; eval_access
  %22 = load %Value*, %Value** %21
  %23 = bitcast %Value* %22 to %Unit*
  %24 = inttoptr %Nat32 0 to %Unit*
  %25 = icmp eq %Unit* %23, %24
  %26 = getelementptr inbounds %While, %While* %6, i32 0, i32 1 ; eval_access
  %27 = load %Stmt*, %Stmt** %26
  %28 = bitcast %Stmt* %27 to %Unit*
  %29 = inttoptr %Nat32 0 to %Unit*
  %30 = icmp eq %Unit* %28, %29
  %31 = or %Bool %25, %30
  br i1 %31, label %then_0, label %else_0
then_0:

;stmt9:

;stmt10:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt11:
  %33 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 6)

;stmt12:
  %34 = getelementptr inbounds %Stmt, %Stmt* %33, i32 0, i32 4 ; eval_access
  store %While* %6, %While** %34

;stmt13:
  %35 = getelementptr inbounds %Stmt, %Stmt* %33, i32 0, i32 7 ; eval_access
  %36 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %36, %TokenInfo** %35

;stmt14:
  ret %Stmt* %33

;stmt15:
  br label %fail
fail:

;stmt16:
  %38 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2 ; eval_access
  %39 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2 ; eval_access
  %40 = load %Nat32, %Nat32* %39
  %41 = sub %Nat32 %40, 1
  store %Nat32 %41, %Nat32* %38

;stmt17:
  %42 = inttoptr %Nat32 0 to %Unit*
  %43 = bitcast %Unit* %42 to %Stmt*
  ret %Stmt* %43
}

define %Stmt* @stmtRet (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Bool () @separator ()
  br i1 %1, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %2 = inttoptr %Nat32 0 to %Unit*
  %3 = bitcast %Unit* %2 to %Value*
  store %Value* %3, %Value** %v
  br label %endif_0
else_0:

;stmt4:

;stmt5:
  %4 = call %Token* () @ctok ()
  %5 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 1 ; eval_access

;stmt6:
  %6 = call %Value* () @expr ()
  store %Value* %6, %Value** %v

;stmt7:
  %7 = load %Value*, %Value** %v
  %8 = bitcast %Value* %7 to %Unit*
  %9 = inttoptr %Nat32 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %11 = bitcast [27 x %Nat8]* @func284_str1 to %Str
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %5)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt10:
  %12 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 7)

;stmt11:
  %13 = getelementptr inbounds %Stmt, %Stmt* %12, i32 0, i32 1 ; eval_access
  %14 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %13, i32 0, %Int32 0 ; eval_index
  %15 = load %Value*, %Value** %v
  store %Value* %15, %Value** %14

;stmt12:
  %16 = getelementptr inbounds %Stmt, %Stmt* %12, i32 0, i32 7 ; eval_access
  %17 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %17, %TokenInfo** %16

;stmt13:
  ret %Stmt* %12

;stmt14:
  br label %fail
fail:

;stmt15:
  %19 = inttoptr %Nat32 0 to %Unit*
  %20 = bitcast %Unit* %19 to %Stmt*
  ret %Stmt* %20
}

define %Stmt* @stmtBreak (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Bool () @sep ()

;stmt1:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2 ; eval_access
  %3 = load %Nat32, %Nat32* %2
  %4 = icmp eq %Nat32 %3, 0
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = bitcast [34 x %Nat8]* @func285_str1 to %Str
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 8)
  ret %Stmt* %8
}

define %Stmt* @stmtContinue (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Bool () @sep ()

;stmt1:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2 ; eval_access
  %3 = load %Nat32, %Nat32* %2
  %4 = icmp eq %Nat32 %3, 0
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = bitcast [37 x %Nat8]* @func286_str1 to %Str
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 9)
  ret %Stmt* %8
}

define void @setlab (%Str %_lab, %TokenInfo* %_ti) {
  %lab = alloca %Str
  store %Str %_lab, %Str* %lab
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 11)

;stmt1:
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 6 ; eval_access
  %3 = load %Str, %Str* %lab
  store %Str %3, %Str* %2

;stmt2:
  %4 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 7 ; eval_access
  %5 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %5, %TokenInfo** %4

;stmt3:
  call void (%Stmt*) @add_stmt (%Stmt* %1)
  ret void
}

define %Stmt* @stmtGoto (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Str () @parse_id ()

;stmt1:
  %2 = bitcast %Str %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = bitcast [15 x %Nat8]* @func288_str1 to %Str
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = bitcast %Unit* %6 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %7)

;stmt4:
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = bitcast %Unit* %8 to %Stmt*
  ret %Stmt* %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %11 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 10)

;stmt6:
  %12 = getelementptr inbounds %Stmt, %Stmt* %11, i32 0, i32 6 ; eval_access
  store %Str %1, %Str* %12

;stmt7:
  %13 = getelementptr inbounds %Stmt, %Stmt* %11, i32 0, i32 7 ; eval_access
  %14 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %14, %TokenInfo** %13

;stmt8:
  ret %Stmt* %11
}

define %Stmt* @doexpr () {

;stmt0:
  %1 = call %Value* () @expr ()

;stmt1:
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  br label %fail_with_restore
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %6 = call %Token* () @ctok ()
  %7 = getelementptr inbounds %Token, %Token* %6, i32 0, i32 1 ; eval_access

;stmt5:
  %8 = bitcast [2 x %Nat8]* @func289_str1 to %Str
  %9 = call %Bool (%Str) @match (%Str %8)
  %10 = xor %Bool %9, 1
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %11 = call %Stmt* (%StmtKind) @stmt_new (%StmtKind 3)

;stmt8:
  %12 = getelementptr inbounds %Stmt, %Stmt* %11, i32 0, i32 1 ; eval_access
  %13 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %12, i32 0, %Int32 0 ; eval_index
  store %Value* %1, %Value** %13

;stmt9:
  %14 = getelementptr inbounds %Stmt, %Stmt* %11, i32 0, i32 7 ; eval_access
  %15 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 8 ; eval_access
  %16 = load %TokenInfo*, %TokenInfo** %15
  store %TokenInfo* %16, %TokenInfo** %14

;stmt10:
  ret %Stmt* %11
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt11:
  %18 = call %Value* () @expr ()

;stmt12:
  %19 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @assign (%Value* %1, %Value* %18, %TokenInfo* %7)
  ret %Stmt* %19

;stmt13:
  br label %fail_with_restore
fail_with_restore:

;stmt14:
  %21 = bitcast [25 x %Nat8]* @func289_str2 to %Str
  %22 = call %Int32 (%Str, ...) @printf (%Str %21)

;stmt15:
  %23 = bitcast [10 x %Nat8]* @func289_str3 to %Str
  %24 = call %Token* () @ctok ()
  %25 = getelementptr inbounds %Token, %Token* %24, i32 0, i32 2 ; eval_access
  %26 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %25, i32 0, %Int32 0 ; eval_index
  %27 = call %Int32 (%Str, ...) @printf (%Str %23, %Nat8* %26)

;stmt16:
  %28 = inttoptr %Nat32 0 to %Unit*
  %29 = bitcast %Unit* %28 to %Stmt*
  ret %Stmt* %29

;stmt17:
  br label %fail
fail:

;stmt18:
  %31 = inttoptr %Nat32 0 to %Unit*
  %32 = bitcast %Unit* %31 to %Stmt*
  ret %Stmt* %32
}

define void @lab_reset () {

;stmt0:
  store %Nat32 0, %Nat32* @clab
  ret void
}

define %Nat32 @lab_get () {

;stmt0:
  %1 = load %Nat32, %Nat32* @clab

;stmt1:
  %2 = load %Nat32, %Nat32* @clab
  %3 = add %Nat32 %2, 1
  store %Nat32 %3, %Nat32* @clab

;stmt2:
  ret %Nat32 %1
}

define void @o (%Str %_s) {
  %s = alloca %Str
  store %Str %_s, %Str* %s

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [3 x %Nat8]* @func292_str1 to %Str
  %3 = load %Str, %Str* %s
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %3)
  ret void
}

define void @nl () {

;stmt0:
  %1 = bitcast [2 x %Nat8]* @func293_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @space () {

;stmt0:
  %1 = bitcast [2 x %Nat8]* @func294_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @comma () {

;stmt0:
  %1 = bitcast [3 x %Nat8]* @func295_str1 to %Str
  call void (%Str) @o (%Str %1)
  ret void
}

define void @printType (%Type* %_t, %Bool %_print_alias, %Bool %_func_as_ptr) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %print_alias = alloca %Bool
  store %Bool %_print_alias, %Bool* %print_alias
  %func_as_ptr = alloca %Bool
  store %Bool %_func_as_ptr, %Bool* %func_as_ptr

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = bitcast %Type* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  %5 = bitcast [26 x %Nat8]* @func296_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %4, %Str %5)

;stmt1:
  %6 = load %Bool, %Bool* %print_alias
  %7 = load %Type*, %Type** %t
  %8 = getelementptr inbounds %Type, %Type* %7, i32 0, i32 1 ; eval_access
  %9 = load %Str, %Str* %8
  %10 = bitcast %Str %9 to %Unit*
  %11 = inttoptr %Nat32 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  %13 = and %Bool %6, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %14 = load %Unit*, %Unit** @fout
  %15 = bitcast [5 x %Nat8]* @func296_str2 to %Str
  %16 = load %Type*, %Type** %t
  %17 = getelementptr inbounds %Type, %Type* %16, i32 0, i32 1 ; eval_access
  %18 = load %Str, %Str* %17
  %19 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15, %Str %18)

;stmt4:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %21 = load %Type*, %Type** %t
  %22 = getelementptr inbounds %Type, %Type* %21, i32 0, i32 0 ; eval_access
  %23 = load %TypeKind, %TypeKind* %22

;stmt6:
  %24 = icmp eq %TypeKind %23, 3
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %25 = load %Unit*, %Unit** @fout
  %26 = bitcast [5 x %Nat8]* @func296_str3 to %Str
  %27 = load %Type*, %Type** %t
  %28 = getelementptr inbounds %Type, %Type* %27, i32 0, i32 5 ; eval_access
  %29 = getelementptr inbounds %TypeBasic, %TypeBasic* %28, i32 0, i32 0 ; eval_access
  %30 = load %Str, %Str* %29
  %31 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %25, %Str %26, %Str %30)
  br label %endif_1
else_1:

;stmt9:
  %32 = icmp eq %TypeKind %23, 5
  br i1 %32, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %33 = load %Type*, %Type** @typeEnum
  call void (%Type*, %Bool, %Bool) @printType (%Type* %33, %Bool 1, %Bool 1)
  br label %endif_2
else_2:

;stmt12:
  %34 = icmp eq %TypeKind %23, 6
  br i1 %34, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %35 = load %Type*, %Type** %t
  %36 = getelementptr inbounds %Type, %Type* %35, i32 0, i32 9 ; eval_access
  call void (%TypeRecord*) @printTypeRecord (%TypeRecord* %36)
  br label %endif_3
else_3:

;stmt15:
  %37 = icmp eq %TypeKind %23, 8
  br i1 %37, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %38 = load %Type*, %Type** %t
  %39 = getelementptr inbounds %Type, %Type* %38, i32 0, i32 8 ; eval_access
  call void (%TypeArray*) @printTypeArray (%TypeArray* %39)
  br label %endif_4
else_4:

;stmt18:
  %40 = icmp eq %TypeKind %23, 7
  br i1 %40, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %41 = load %Type*, %Type** %t
  %42 = getelementptr inbounds %Type, %Type* %41, i32 0, i32 7 ; eval_access
  %43 = getelementptr inbounds %TypePointer, %TypePointer* %42, i32 0, i32 0 ; eval_access
  %44 = load %Type*, %Type** %43
  call void (%Type*, %Bool, %Bool) @printType (%Type* %44, %Bool 1, %Bool 1)

;stmt21:
  %45 = load %Unit*, %Unit** @fout
  %46 = bitcast [2 x %Nat8]* @func296_str4 to %Str
  %47 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %45, %Str %46)
  br label %endif_5
else_5:

;stmt22:
  %48 = icmp eq %TypeKind %23, 4
  br i1 %48, label %then_6, label %else_6
then_6:

;stmt23:

;stmt24:
  %49 = load %Type*, %Type** %t
  %50 = getelementptr inbounds %Type, %Type* %49, i32 0, i32 6 ; eval_access
  %51 = load %Bool, %Bool* %func_as_ptr
  call void (%TypeFunc*, %Bool) @printTypeFunc (%TypeFunc* %50, %Bool %51)
  br label %endif_6
else_6:

;stmt25:
  %52 = icmp eq %TypeKind %23, 5
  br i1 %52, label %then_7, label %else_7
then_7:

;stmt26:

;stmt27:
  %53 = load %Unit*, %Unit** @fout
  %54 = bitcast [16 x %Nat8]* @func296_str5 to %Str
  %55 = load %Type*, %Type** %t
  %56 = getelementptr inbounds %Type, %Type* %55, i32 0, i32 4 ; eval_access
  %57 = getelementptr inbounds %TypeUndefined, %TypeUndefined* %56, i32 0, i32 0 ; eval_access
  %58 = load %Str, %Str* %57
  %59 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %53, %Str %54, %Str %58)
  br label %endif_7
else_7:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  ret void
}

define void @print_struct_field (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Bool, %Bool* @need_comma
  br i1 %1, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %2 = load %Unit*, %Unit** @fout
  %3 = bitcast [3 x %Nat8]* @func298_str1 to %Str
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %5 = load %Unit*, %Unit** %data
  %6 = bitcast %Unit* %5 to %Field*
  %7 = getelementptr inbounds %Field, %Field* %6, i32 0, i32 1 ; eval_access
  %8 = load %Type*, %Type** %7
  call void (%Type*, %Bool, %Bool) @printType (%Type* %8, %Bool 1, %Bool 1)

;stmt4:
  store %Bool 1, %Bool* @need_comma
  ret void
}

define void @printTypeRecord (%TypeRecord* %_r) {
  %r = alloca %TypeRecord*
  store %TypeRecord* %_r, %TypeRecord** %r

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [2 x %Nat8]* @func297_str1 to %Str
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  store %Bool 0, %Bool* @need_comma

;stmt2:
  %4 = load %TypeRecord*, %TypeRecord** %r
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %4, i32 0, i32 0 ; eval_access
  %6 = load %List*, %List** %5
  %7 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %6, %ListForeachHandler @print_struct_field, %Unit* %7)

;stmt3:
  %8 = load %Unit*, %Unit** @fout
  %9 = bitcast [2 x %Nat8]* @func297_str2 to %Str
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9)
  ret void
}

define void @printTypeArray (%TypeArray* %_a) {
  %a = alloca %TypeArray*
  store %TypeArray* %_a, %TypeArray** %a

;stmt0:
  %1 = load %TypeArray*, %TypeArray** %a
  %2 = getelementptr inbounds %TypeArray, %TypeArray* %1, i32 0, i32 0 ; eval_access
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = load %TypeArray*, %TypeArray** %a
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %4, i32 0, i32 2 ; eval_access
  %6 = load %Bool, %Bool* %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt4:
  %7 = bitcast [2 x %Nat8]* @func299_str1 to %Str
  call void (%Str) @o (%Str %7)
  br label %endif_0
else_0:

;stmt5:

;stmt6:
  %8 = load %Unit*, %Unit** @fout
  %9 = bitcast [7 x %Nat8]* @func299_str2 to %Str
  %10 = load %TypeArray*, %TypeArray** %a
  %11 = getelementptr inbounds %TypeArray, %TypeArray* %10, i32 0, i32 1 ; eval_access
  %12 = load %Nat32, %Nat32* %11
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Nat32 %12)

;stmt7:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt8:
  %14 = load %Unit*, %Unit** @fout
  %15 = bitcast [2 x %Nat8]* @func299_str3 to %Str
  %16 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15)
  br label %endif_0
endif_0:
  ret void
}

define void @pt_print_param (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Bool, %Bool* @need_comma
  br i1 %1, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %2 = load %Unit*, %Unit** @fout
  %3 = bitcast [3 x %Nat8]* @func301_str1 to %Str
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %5 = load %Unit*, %Unit** %data
  %6 = bitcast %Unit* %5 to %Field*
  %7 = getelementptr inbounds %Field, %Field* %6, i32 0, i32 1 ; eval_access
  %8 = load %Type*, %Type** %7
  call void (%Type*, %Bool, %Bool) @printType (%Type* %8, %Bool 1, %Bool 1)

;stmt4:
  store %Bool 1, %Bool* @need_comma
  ret void
}

define void @printTypeFunc (%TypeFunc* %_f, %Bool %_func_as_ptr) {
  %f = alloca %TypeFunc*
  store %TypeFunc* %_f, %TypeFunc** %f
  %func_as_ptr = alloca %Bool
  store %Bool %_func_as_ptr, %Bool* %func_as_ptr

;stmt0:
  %1 = load %TypeFunc*, %TypeFunc** %f
  %2 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i32 0, i32 1 ; eval_access
  %3 = load %Type*, %Type** %2
  %4 = load %Type*, %Type** @typeUnit
  %5 = call %Bool (%Type*, %Type*) @type_eq (%Type* %3, %Type* %4)
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = load %Unit*, %Unit** @fout
  %7 = bitcast [5 x %Nat8]* @func300_str1 to %Str
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %9 = load %TypeFunc*, %TypeFunc** %f
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %9, i32 0, i32 1 ; eval_access
  %11 = load %Type*, %Type** %10
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)
  br label %endif_0
endif_0:

;stmt5:
  %12 = load %Unit*, %Unit** @fout
  %13 = bitcast [3 x %Nat8]* @func300_str2 to %Str
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13)

;stmt6:
  store %Bool 0, %Bool* @need_comma

;stmt7:
  %15 = load %TypeFunc*, %TypeFunc** %f
  %16 = getelementptr inbounds %TypeFunc, %TypeFunc* %15, i32 0, i32 0 ; eval_access
  %17 = load %List*, %List** %16
  %18 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %17, %ListForeachHandler @pt_print_param, %Unit* %18)

;stmt8:
  %19 = load %TypeFunc*, %TypeFunc** %f
  %20 = getelementptr inbounds %TypeFunc, %TypeFunc* %19, i32 0, i32 2 ; eval_access
  %21 = load %Bool, %Bool* %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %22 = bitcast [6 x %Nat8]* @func300_str3 to %Str
  call void (%Str) @o (%Str %22)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt11:
  %23 = load %Unit*, %Unit** @fout
  %24 = bitcast [2 x %Nat8]* @func300_str4 to %Str
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %23, %Str %24)

;stmt12:
  %26 = load %Bool, %Bool* %func_as_ptr
  br i1 %26, label %then_2, label %else_2
then_2:

;stmt13:

;stmt14:
  %27 = load %Unit*, %Unit** @fout
  %28 = bitcast [2 x %Nat8]* @func300_str5 to %Str
  %29 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %27, %Str %28)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  ret void
}

define void @reset_local_labels () {

;stmt0:
  store %Nat32 0, %Nat32* @global_if_id

;stmt1:
  store %Nat32 0, %Nat32* @global_while_id

;stmt2:
  store %Nat32 0, %Nat32* @while_id

;stmt3:
  store %Nat32 0, %Nat32* @stmtno

;stmt4:
  store %Nat32 0, %Nat32* @blockno
  ret void
}

define void @print_stmt (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [11 x %Nat8]* @func303_str1 to %Str
  %3 = load %Nat32, %Nat32* @stmtno
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Nat32 %3)

;stmt1:
  %5 = load %Nat32, %Nat32* @stmtno
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* @stmtno

;stmt2:
  %7 = load %Stmt*, %Stmt** %s
  %8 = getelementptr inbounds %Stmt, %Stmt* %7, i32 0, i32 0 ; eval_access
  %9 = load %StmtKind, %StmtKind* %8

;stmt3:
  %10 = icmp eq %StmtKind %9, 2
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %11 = load %Stmt*, %Stmt** %s
  %12 = getelementptr inbounds %Stmt, %Stmt* %11, i32 0, i32 2 ; eval_access
  %13 = load %Block*, %Block** %12
  call void (%Block*) @print_block (%Block* %13)
  br label %endif_0
else_0:

;stmt6:
  %14 = icmp eq %StmtKind %9, 0
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %15 = load %Stmt*, %Stmt** %s
  %16 = getelementptr inbounds %Stmt, %Stmt* %15, i32 0, i32 1 ; eval_access
  %17 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %16, i32 0, %Int32 0 ; eval_index
  %18 = load %Value*, %Value** %17
  %19 = load %Stmt*, %Stmt** %s
  %20 = getelementptr inbounds %Stmt, %Stmt* %19, i32 0, i32 1 ; eval_access
  %21 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %20, i32 0, %Int32 1 ; eval_index
  %22 = load %Value*, %Value** %21
  call void (%Value*, %Value*) @print_stmt_let (%Value* %18, %Value* %22)
  br label %endif_1
else_1:

;stmt9:
  %23 = icmp eq %StmtKind %9, 3
  br i1 %23, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %24 = load %Stmt*, %Stmt** %s
  %25 = getelementptr inbounds %Stmt, %Stmt* %24, i32 0, i32 1 ; eval_access
  %26 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %25, i32 0, %Int32 0 ; eval_index
  %27 = load %Value*, %Value** %26
  call void (%Value*) @print_stmt_expr (%Value* %27)
  br label %endif_2
else_2:

;stmt12:
  %28 = icmp eq %StmtKind %9, 1
  br i1 %28, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %29 = load %Stmt*, %Stmt** %s
  %30 = getelementptr inbounds %Stmt, %Stmt* %29, i32 0, i32 3 ; eval_access
  %31 = load %VarDef*, %VarDef** %30
  call void (%VarDef*) @print_stmt_var (%VarDef* %31)
  br label %endif_3
else_3:

;stmt15:
  %32 = icmp eq %StmtKind %9, 4
  br i1 %32, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %33 = load %Stmt*, %Stmt** %s
  %34 = getelementptr inbounds %Stmt, %Stmt* %33, i32 0, i32 1 ; eval_access
  %35 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %34, i32 0, %Int32 0 ; eval_index
  %36 = load %Value*, %Value** %35
  %37 = load %Stmt*, %Stmt** %s
  %38 = getelementptr inbounds %Stmt, %Stmt* %37, i32 0, i32 1 ; eval_access
  %39 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %38, i32 0, %Int32 1 ; eval_index
  %40 = load %Value*, %Value** %39
  call void (%Value*, %Value*) @print_st (%Value* %36, %Value* %40)
  br label %endif_4
else_4:

;stmt18:
  %41 = icmp eq %StmtKind %9, 5
  br i1 %41, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %42 = load %Stmt*, %Stmt** %s
  %43 = getelementptr inbounds %Stmt, %Stmt* %42, i32 0, i32 5 ; eval_access
  %44 = load %If*, %If** %43
  call void (%If*) @print_stmt_if (%If* %44)
  br label %endif_5
else_5:

;stmt21:
  %45 = icmp eq %StmtKind %9, 6
  br i1 %45, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %46 = load %Stmt*, %Stmt** %s
  %47 = getelementptr inbounds %Stmt, %Stmt* %46, i32 0, i32 4 ; eval_access
  %48 = load %While*, %While** %47
  call void (%While*) @print_stmt_while (%While* %48)
  br label %endif_6
else_6:

;stmt24:
  %49 = icmp eq %StmtKind %9, 7
  br i1 %49, label %then_7, label %else_7
then_7:

;stmt25:

;stmt26:
  %50 = load %Stmt*, %Stmt** %s
  %51 = getelementptr inbounds %Stmt, %Stmt* %50, i32 0, i32 1 ; eval_access
  %52 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %51, i32 0, %Int32 0 ; eval_index
  %53 = load %Value*, %Value** %52
  call void (%Value*) @print_stmt_return (%Value* %53)
  br label %endif_7
else_7:

;stmt27:
  %54 = icmp eq %StmtKind %9, 8
  br i1 %54, label %then_8, label %else_8
then_8:

;stmt28:

;stmt29:
  call void () @print_stmt_break ()
  br label %endif_8
else_8:

;stmt30:
  %55 = icmp eq %StmtKind %9, 9
  br i1 %55, label %then_9, label %else_9
then_9:

;stmt31:

;stmt32:
  call void () @print_stmt_continue ()
  br label %endif_9
else_9:

;stmt33:
  %56 = icmp eq %StmtKind %9, 10
  br i1 %56, label %then_10, label %else_10
then_10:

;stmt34:

;stmt35:
  %57 = load %Stmt*, %Stmt** %s
  %58 = getelementptr inbounds %Stmt, %Stmt* %57, i32 0, i32 6 ; eval_access
  %59 = load %Str, %Str* %58
  call void (%Str) @print_stmt_goto (%Str %59)
  br label %endif_10
else_10:

;stmt36:
  %60 = icmp eq %StmtKind %9, 11
  br i1 %60, label %then_11, label %else_11
then_11:

;stmt37:

;stmt38:
  %61 = load %Stmt*, %Stmt** %s
  %62 = getelementptr inbounds %Stmt, %Stmt* %61, i32 0, i32 6 ; eval_access
  %63 = load %Str, %Str* %62
  call void (%Str) @print_stmt_label (%Str %63)
  br label %endif_11
else_11:

;stmt39:

;stmt40:
  %64 = load %Unit*, %Unit** @fout
  %65 = bitcast [19 x %Nat8]* @func303_str2 to %Str
  %66 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %64, %Str %65)

;stmt41:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_11
endif_11:
  br label %endif_10
endif_10:
  br label %endif_9
endif_9:
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  ret void
}

define void @print_stmt_var (%VarDef* %_v) {
  %v = alloca %VarDef*
  store %VarDef* %_v, %VarDef** %v

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [18 x %Nat8]* @func304_str1 to %Str
  %3 = load %VarDef*, %VarDef** %v
  %4 = getelementptr inbounds %VarDef, %VarDef* %3, i32 0, i32 0 ; eval_access
  %5 = load %Str, %Str* %4
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %5)

;stmt1:
  %7 = load %VarDef*, %VarDef** %v
  %8 = getelementptr inbounds %VarDef, %VarDef* %7, i32 0, i32 1 ; eval_access
  %9 = load %Type*, %Type** %8
  call void (%Type*, %Bool, %Bool) @printType (%Type* %9, %Bool 1, %Bool 1)
  ret void
}

define void @print_stmt_expr (%Value* %_e) {
  %e = alloca %Value*
  store %Value* %_e, %Value** %e

;stmt0:
  %1 = load %Value*, %Value** %e
  %2 = call %Value* (%Value*) @eval (%Value* %1)
  ret void
}

define void @print_stmt_let (%Value* %_e, %Value* %_x) {
  %e = alloca %Value*
  store %Value* %_e, %Value** %e
  %x = alloca %Value*
  store %Value* %_x, %Value** %x

;stmt0:
  %1 = load %Value*, %Value** %e
  %2 = call %Value* (%Value*) @eval (%Value* %1)
  %3 = call %Value* (%Value*) @load (%Value* %2)

;stmt1:
  %4 = load %Value*, %Value** %x
  %5 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 2 ; eval_access
  %6 = getelementptr inbounds %Storage, %Storage* %5, i32 0, i32 2 ; eval_access
  %7 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 2 ; eval_access
  %8 = getelementptr inbounds %Storage, %Storage* %7, i32 0, i32 2 ; eval_access
  %9 = load %Nat32, %Nat32* %8
  store %Nat32 %9, %Nat32* %6
  ret void
}

define void @print_stmt_if (%If* %_i) {
  %i = alloca %If*
  store %If* %_i, %If** %i

;stmt0:
  %1 = load %Nat32, %Nat32* @global_if_id

;stmt1:
  %2 = load %Nat32, %Nat32* @global_if_id
  %3 = add %Nat32 %2, 1
  store %Nat32 %3, %Nat32* @global_if_id

;stmt2:
  %4 = load %If*, %If** %i
  %5 = getelementptr inbounds %If, %If* %4, i32 0, i32 0 ; eval_access
  %6 = load %Value*, %Value** %5
  %7 = call %Value* (%Value*) @eval (%Value* %6)
  %8 = call %Value* (%Value*) @load (%Value* %7)

;stmt3:
  %9 = load %Unit*, %Unit** @fout
  %10 = bitcast [10 x %Nat8]* @func307_str1 to %Str
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10)

;stmt4:
  call void (%Value*) @print_value (%Value* %8)

;stmt5:
  %12 = load %Unit*, %Unit** @fout
  %13 = bitcast [35 x %Nat8]* @func307_str2 to %Str
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13, %Nat32 %1, %Nat32 %1)

;stmt6:
  %15 = load %Unit*, %Unit** @fout
  %16 = bitcast [10 x %Nat8]* @func307_str3 to %Str
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16, %Nat32 %1)

;stmt7:
  %18 = load %If*, %If** %i
  %19 = getelementptr inbounds %If, %If* %18, i32 0, i32 1 ; eval_access
  %20 = load %Stmt*, %Stmt** %19
  call void (%Stmt*) @print_stmt (%Stmt* %20)

;stmt8:
  %21 = load %Unit*, %Unit** @fout
  %22 = bitcast [23 x %Nat8]* @func307_str4 to %Str
  %23 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22, %Nat32 %1)

;stmt9:
  %24 = load %Unit*, %Unit** @fout
  %25 = bitcast [10 x %Nat8]* @func307_str5 to %Str
  %26 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25, %Nat32 %1)

;stmt10:
  %27 = load %If*, %If** %i
  %28 = getelementptr inbounds %If, %If* %27, i32 0, i32 2 ; eval_access
  %29 = load %Stmt*, %Stmt** %28
  %30 = bitcast %Stmt* %29 to %Unit*
  %31 = inttoptr %Nat32 0 to %Unit*
  %32 = icmp ne %Unit* %30, %31
  br i1 %32, label %then_0, label %else_0
then_0:

;stmt11:

;stmt12:
  %33 = load %If*, %If** %i
  %34 = getelementptr inbounds %If, %If* %33, i32 0, i32 2 ; eval_access
  %35 = load %Stmt*, %Stmt** %34
  call void (%Stmt*) @print_stmt (%Stmt* %35)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt13:
  %36 = load %Unit*, %Unit** @fout
  %37 = bitcast [23 x %Nat8]* @func307_str6 to %Str
  %38 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %36, %Str %37, %Nat32 %1)

;stmt14:
  %39 = load %Unit*, %Unit** @fout
  %40 = bitcast [11 x %Nat8]* @func307_str7 to %Str
  %41 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %39, %Str %40, %Nat32 %1)
  ret void
}

define void @print_stmt_while (%While* %_w) {
  %w = alloca %While*
  store %While* %_w, %While** %w

;stmt0:
  %1 = load %Nat32, %Nat32* @while_id

;stmt1:
  %2 = load %Nat32, %Nat32* @global_while_id
  store %Nat32 %2, %Nat32* @while_id

;stmt2:
  %3 = load %Nat32, %Nat32* @global_while_id
  %4 = add %Nat32 %3, 1
  store %Nat32 %4, %Nat32* @global_while_id

;stmt3:
  %5 = load %Unit*, %Unit** @fout
  %6 = bitcast [26 x %Nat8]* @func308_str1 to %Str
  %7 = load %Nat32, %Nat32* @while_id
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %5, %Str %6, %Nat32 %7)

;stmt4:
  %9 = load %Unit*, %Unit** @fout
  %10 = bitcast [14 x %Nat8]* @func308_str2 to %Str
  %11 = load %Nat32, %Nat32* @while_id
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10, %Nat32 %11)

;stmt5:
  %13 = load %While*, %While** %w
  %14 = getelementptr inbounds %While, %While* %13, i32 0, i32 0 ; eval_access
  %15 = load %Value*, %Value** %14
  %16 = call %Value* (%Value*) @eval (%Value* %15)
  %17 = call %Value* (%Value*) @load (%Value* %16)

;stmt6:
  %18 = load %Unit*, %Unit** @fout
  %19 = bitcast [10 x %Nat8]* @func308_str3 to %Str
  %20 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %18, %Str %19)

;stmt7:
  call void (%Value*) @print_value (%Value* %17)

;stmt8:
  %21 = load %Unit*, %Unit** @fout
  %22 = bitcast [36 x %Nat8]* @func308_str4 to %Str
  %23 = load %Nat32, %Nat32* @while_id
  %24 = load %Nat32, %Nat32* @while_id
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22, %Nat32 %23, %Nat32 %24)

;stmt9:
  %26 = load %Unit*, %Unit** @fout
  %27 = bitcast [10 x %Nat8]* @func308_str5 to %Str
  %28 = load %Nat32, %Nat32* @while_id
  %29 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %26, %Str %27, %Nat32 %28)

;stmt10:
  %30 = load %While*, %While** %w
  %31 = getelementptr inbounds %While, %While* %30, i32 0, i32 1 ; eval_access
  %32 = load %Stmt*, %Stmt** %31
  call void (%Stmt*) @print_stmt (%Stmt* %32)

;stmt11:
  %33 = load %Unit*, %Unit** @fout
  %34 = bitcast [26 x %Nat8]* @func308_str6 to %Str
  %35 = load %Nat32, %Nat32* @while_id
  %36 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %33, %Str %34, %Nat32 %35)

;stmt12:
  %37 = load %Unit*, %Unit** @fout
  %38 = bitcast [11 x %Nat8]* @func308_str7 to %Str
  %39 = load %Nat32, %Nat32* @while_id
  %40 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %37, %Str %38, %Nat32 %39)

;stmt13:
  store %Nat32 %1, %Nat32* @while_id
  ret void
}

define void @print_stmt_return (%Value* %_rv) {
  %rv = alloca %Value*
  store %Value* %_rv, %Value** %rv

;stmt0:
  %1 = load %Value*, %Value** %rv
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr %Nat32 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = call %Nat32 () @lab_get ()

;stmt3:
  %6 = bitcast [10 x %Nat8]* @func309_str1 to %Str
  call void (%Str) @o (%Str %6)

;stmt4:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = load %Value*, %Value** %rv
  %9 = call %Value* (%Value*) @eval (%Value* %8)
  %10 = call %Value* (%Value*) @load (%Value* %9)

;stmt6:
  %11 = load %Unit*, %Unit** @fout
  %12 = bitcast [8 x %Nat8]* @func309_str2 to %Str
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12)

;stmt7:
  %14 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1 ; eval_access
  %15 = load %Type*, %Type** %14
  call void (%Type*, %Bool, %Bool) @printType (%Type* %15, %Bool 1, %Bool 1)

;stmt8:
  call void () @space ()

;stmt9:
  call void (%Value*) @print_value (%Value* %10)

;stmt10:
  %16 = call %Nat32 () @lab_get ()
  ret void
}

define void @print_stmt_break () {

;stmt0:
  %1 = call %Nat32 () @lab_get ()

;stmt1:
  %2 = load %Unit*, %Unit** @fout
  %3 = bitcast [23 x %Nat8]* @func310_str1 to %Str
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @print_stmt_continue () {

;stmt0:
  %1 = call %Nat32 () @lab_get ()

;stmt1:
  %2 = load %Unit*, %Unit** @fout
  %3 = bitcast [26 x %Nat8]* @func311_str1 to %Str
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @print_stmt_goto (%Str %_l) {
  %l = alloca %Str
  store %Str %_l, %Str* %l

;stmt0:
  %1 = call %Nat32 () @lab_get ()

;stmt1:
  %2 = load %Unit*, %Unit** @fout
  %3 = bitcast [17 x %Nat8]* @func312_str1 to %Str
  %4 = load %Str, %Str* %l
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Str %4)
  ret void
}

define void @print_stmt_label (%Str %_l) {
  %l = alloca %Str
  store %Str %_l, %Str* %l

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [17 x %Nat8]* @func313_str1 to %Str
  %3 = load %Str, %Str* %l
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %3)

;stmt1:
  %5 = load %Unit*, %Unit** @fout
  %6 = bitcast [5 x %Nat8]* @func313_str2 to %Str
  %7 = load %Str, %Str* %l
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %5, %Str %6, %Str %7)
  ret void
}

define void @for_stmt (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Nat32, %Nat32* @blockno
  %2 = add %Nat32 %1, 1
  store %Nat32 %2, %Nat32* @blockno

;stmt1:
  %3 = load %Unit*, %Unit** %data
  %4 = bitcast %Unit* %3 to %Stmt*
  call void (%Stmt*) @print_stmt (%Stmt* %4)
  ret void
}

define void @print_block (%Block* %_b) {
  %b = alloca %Block*
  store %Block* %_b, %Block** %b

;stmt0:
  %1 = load %Block*, %Block** %b
  %2 = getelementptr inbounds %Block, %Block* %1, i32 0, i32 1 ; eval_access
  %3 = load %List*, %List** %2
  %4 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %3, %ListForeachHandler @for_stmt, %Unit* %4)
  ret void
}

define void @print_getelementptr_inline (%Value* %_v, %Nat32 %_ino) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ino = alloca %Nat32
  store %Nat32 %_ino, %Nat32* %ino

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [25 x %Nat8]* @func316_str1 to %Str
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  %4 = load %Value*, %Value** %v
  %5 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1 ; eval_access
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 7 ; eval_access
  %8 = getelementptr inbounds %TypePointer, %TypePointer* %7, i32 0, i32 0 ; eval_access
  %9 = load %Type*, %Type** %8
  call void (%Type*, %Bool, %Bool) @printType (%Type* %9, %Bool 1, %Bool 1)

;stmt2:
  call void () @comma ()

;stmt3:
  %10 = load %Value*, %Value** %v
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1 ; eval_access
  %12 = load %Type*, %Type** %11
  call void (%Type*, %Bool, %Bool) @printType (%Type* %12, %Bool 1, %Bool 1)

;stmt4:
  call void () @space ()

;stmt5:
  %13 = load %Value*, %Value** %v
  call void (%Value*) @print_value (%Value* %13)

;stmt6:
  %14 = load %Unit*, %Unit** @fout
  %15 = bitcast [17 x %Nat8]* @func316_str2 to %Str
  %16 = load %Nat32, %Nat32* %ino
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15, %Nat32 %16)
  ret void
}

define void @print_value (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2 ; eval_access
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 0 ; eval_access
  %4 = load %StorageClass, %StorageClass* %3

;stmt1:
  %5 = icmp eq %StorageClass %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Unit*, %Unit** @fout
  %7 = bitcast [3 x %Nat8]* @func317_str1 to %Str
  %8 = load %Value*, %Value** %v
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 2 ; eval_access
  %10 = getelementptr inbounds %Storage, %Storage* %9, i32 0, i32 1 ; eval_access
  %11 = load %Int64, %Int64* %10
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7, %Int64 %11)
  br label %endif_0
else_0:

;stmt4:
  %13 = icmp eq %StorageClass %4, 9
  %14 = icmp eq %StorageClass %4, 8
  %15 = or %Bool %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %16 = load %Unit*, %Unit** @fout
  %17 = bitcast [5 x %Nat8]* @func317_str2 to %Str
  %18 = load %Value*, %Value** %v
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 2 ; eval_access
  %20 = getelementptr inbounds %Storage, %Storage* %19, i32 0, i32 2 ; eval_access
  %21 = load %Nat32, %Nat32* %20
  %22 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %16, %Str %17, %Nat32 %21)
  br label %endif_1
else_1:

;stmt7:
  %23 = icmp eq %StorageClass %4, 7
  br i1 %23, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %24 = load %Unit*, %Unit** @fout
  %25 = bitcast [4 x %Nat8]* @func317_str3 to %Str
  %26 = load %Value*, %Value** %v
  %27 = getelementptr inbounds %Value, %Value* %26, i32 0, i32 2 ; eval_access
  %28 = getelementptr inbounds %Storage, %Storage* %27, i32 0, i32 3 ; eval_access
  %29 = load %Str, %Str* %28
  %30 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25, %Str %29)
  br label %endif_2
else_2:

;stmt10:
  %31 = icmp eq %StorageClass %4, 6
  br i1 %31, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %32 = load %Unit*, %Unit** @fout
  %33 = bitcast [5 x %Nat8]* @func317_str4 to %Str
  %34 = load %Value*, %Value** %v
  %35 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 2 ; eval_access
  %36 = getelementptr inbounds %Storage, %Storage* %35, i32 0, i32 3 ; eval_access
  %37 = load %Str, %Str* %36
  %38 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %32, %Str %33, %Str %37)
  br label %endif_3
else_3:

;stmt13:
  %39 = icmp eq %StorageClass %4, 2
  %40 = icmp eq %StorageClass %4, 4
  %41 = icmp eq %StorageClass %4, 3
  %42 = or %Bool %40, %41
  %43 = or %Bool %39, %42
  br i1 %43, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  %44 = load %Unit*, %Unit** @fout
  %45 = bitcast [4 x %Nat8]* @func317_str5 to %Str
  %46 = load %Value*, %Value** %v
  %47 = getelementptr inbounds %Value, %Value* %46, i32 0, i32 2 ; eval_access
  %48 = getelementptr inbounds %Storage, %Storage* %47, i32 0, i32 3 ; eval_access
  %49 = load %Str, %Str* %48
  %50 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %44, %Str %45, %Str %49)
  br label %endif_4
else_4:

;stmt16:
  %51 = icmp eq %StorageClass %4, 0
  br i1 %51, label %then_5, label %else_5
then_5:

;stmt17:

;stmt18:
  %52 = load %Unit*, %Unit** @fout
  %53 = bitcast [19 x %Nat8]* @func317_str6 to %Str
  %54 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %52, %Str %53)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  ret void
}

define %Value* @eval (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 0 ; eval_access
  %3 = load %ValueKind, %ValueKind* %2

;stmt1:
  %4 = icmp eq %ValueKind %3, 1
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = load %Value*, %Value** %v
  ret %Value* %5
  br label %endif_0
else_0:

;stmt4:
  %7 = icmp eq %ValueKind %3, 22
  br i1 %7, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %8 = load %Value*, %Value** %v
  %9 = call %Value* (%Value*) @eval_call (%Value* %8)
  ret %Value* %9
  br label %endif_1
else_1:

;stmt7:
  %11 = icmp eq %ValueKind %3, 23
  br i1 %11, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %12 = load %Value*, %Value** %v
  %13 = call %Value* (%Value*) @eval_index (%Value* %12)
  ret %Value* %13
  br label %endif_2
else_2:

;stmt10:
  %15 = icmp eq %ValueKind %3, 24
  br i1 %15, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %16 = load %Value*, %Value** %v
  %17 = call %Value* (%Value*) @eval_access (%Value* %16)
  ret %Value* %17
  br label %endif_3
else_3:

;stmt13:
  %19 = icmp eq %ValueKind %3, 2
  br i1 %19, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  %20 = load %Value*, %Value** %v
  %21 = call %Value* (%Value*) @eval_ref (%Value* %20)
  ret %Value* %21
  br label %endif_4
else_4:

;stmt16:
  %23 = icmp eq %ValueKind %3, 3
  br i1 %23, label %then_5, label %else_5
then_5:

;stmt17:

;stmt18:
  %24 = load %Value*, %Value** %v
  %25 = call %Value* (%Value*) @eval_deref (%Value* %24)
  ret %Value* %25
  br label %endif_5
else_5:

;stmt19:
  %27 = icmp eq %ValueKind %3, 5
  br i1 %27, label %then_6, label %else_6
then_6:

;stmt20:

;stmt21:
  %28 = load %Value*, %Value** %v
  %29 = call %Value* (%Value*) @eval_minus (%Value* %28)
  ret %Value* %29
  br label %endif_6
else_6:

;stmt22:
  %31 = icmp eq %ValueKind %3, 4
  br i1 %31, label %then_7, label %else_7
then_7:

;stmt23:

;stmt24:
  %32 = load %Value*, %Value** %v
  %33 = call %Value* (%Value*) @eval_not (%Value* %32)
  ret %Value* %33
  br label %endif_7
else_7:

;stmt25:
  %35 = icmp eq %ValueKind %3, 25
  br i1 %35, label %then_8, label %else_8
then_8:

;stmt26:

;stmt27:
  %36 = load %Value*, %Value** %v
  %37 = call %Value* (%Value*) @eval_cast (%Value* %36)
  ret %Value* %37
  br label %endif_8
else_8:
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt28:
  %39 = load %Value*, %Value** %v
  %40 = call %Value* (%Value*) @eval_bin (%Value* %39)
  ret %Value* %40
}

define %Value* @load (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2 ; eval_access
  %3 = call %Bool (%Storage*) @storageIsMutable (%Storage* %2)
  %4 = xor %Bool %3, 1
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = load %Value*, %Value** %v
  ret %Value* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %7 = call %Nat32 () @lab_get ()

;stmt4:
  %8 = load %Unit*, %Unit** @fout
  %9 = bitcast [16 x %Nat8]* @func319_str1 to %Str
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Nat32 %7)

;stmt5:
  %11 = load %Value*, %Value** %v
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 1 ; eval_access
  %13 = load %Type*, %Type** %12
  call void (%Type*, %Bool, %Bool) @printType (%Type* %13, %Bool 1, %Bool 1)

;stmt6:
  call void () @comma ()

;stmt7:
  %14 = load %Value*, %Value** %v
  %15 = getelementptr inbounds %Value, %Value* %14, i32 0, i32 1 ; eval_access
  %16 = load %Type*, %Type** %15
  call void (%Type*, %Bool, %Bool) @printType (%Type* %16, %Bool 1, %Bool 1)

;stmt8:
  %17 = bitcast [3 x %Nat8]* @func319_str2 to %Str
  call void (%Str) @o (%Str %17)

;stmt9:
  %18 = load %Value*, %Value** %v
  call void (%Value*) @print_value (%Value* %18)

;stmt10:
  %19 = load %Value*, %Value** %v
  %20 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 1 ; eval_access
  %21 = load %Type*, %Type** %20
  %22 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %21, %StorageClass 9, %Nat32 %7)
  ret %Value* %22
}

define void @eval_args (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = load %Unit*, %Unit** %ctx
  %4 = bitcast %Unit* %3 to %List*

;stmt2:
  %5 = call %Value* (%Value*) @eval (%Value* %2)
  %6 = call %Value* (%Value*) @load (%Value* %5)
  %7 = bitcast %Value* %6 to %Unit*
  %8 = call %Bool (%List*, %Unit*) @list_append (%List* %4, %Unit* %7)
  ret void
}

define void @print_args (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Bool, %Bool* @need_comma
  br i1 %1, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %2 = load %Unit*, %Unit** %data
  %3 = bitcast %Unit* %2 to %Value*

;stmt4:
  %4 = load %Unit*, %Unit** %ctx
  %5 = bitcast %Unit* %4 to %Node**

;stmt5:
  %6 = load %Node*, %Node** %5
  %7 = bitcast %Node* %6 to %Unit*
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %10 = load %Node*, %Node** %5
  %11 = getelementptr inbounds %Node, %Node* %10, i32 0, i32 3 ; eval_access
  %12 = load %Unit*, %Unit** %11
  %13 = bitcast %Unit* %12 to %Field*
  %14 = getelementptr inbounds %Field, %Field* %13, i32 0, i32 1 ; eval_access
  %15 = load %Type*, %Type** %14
  call void (%Type*, %Bool, %Bool) @printType (%Type* %15, %Bool 1, %Bool 1)

;stmt8:
  %16 = load %Node*, %Node** %5
  %17 = getelementptr inbounds %Node, %Node* %16, i32 0, i32 1 ; eval_access
  %18 = load %Node*, %Node** %17
  store %Node* %18, %Node** %5
  br label %endif_1
else_1:

;stmt9:

;stmt10:
  %19 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 1 ; eval_access
  %20 = load %Type*, %Type** %19
  call void (%Type*, %Bool, %Bool) @printType (%Type* %20, %Bool 1, %Bool 1)
  br label %endif_1
endif_1:

;stmt11:
  call void () @space ()

;stmt12:
  call void (%Value*) @print_value (%Value* %3)

;stmt13:
  store %Bool 1, %Bool* @need_comma
  ret void
}

define %Value* @eval_call (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)

;stmt1:
  %6 = call %Value* (%Value*) @load (%Value* %5)

;stmt2:
  %7 = call %List* () @map_new ()

;stmt3:
  %8 = load %Value*, %Value** %v
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 5 ; eval_access
  %10 = load %List*, %List** %9
  %11 = bitcast %List* %7 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %10, %ListForeachHandler @eval_args, %Unit* %11)

;stmt4:
  %retval_reg = alloca %Nat32

;stmt5:
  %12 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %13 = load %Type*, %Type** %12
  %14 = getelementptr inbounds %Type, %Type* %13, i32 0, i32 6 ; eval_access
  %15 = getelementptr inbounds %TypeFunc, %TypeFunc* %14, i32 0, i32 1 ; eval_access
  %16 = load %Type*, %Type** %15
  %17 = load %Type*, %Type** @typeUnit
  %18 = call %Bool (%Type*, %Type*) @type_eq (%Type* %16, %Type* %17)
  br i1 %18, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %19 = load %Unit*, %Unit** @fout
  %20 = bitcast [9 x %Nat8]* @func320_str1 to %Str
  %21 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %19, %Str %20)
  br label %endif_0
else_0:

;stmt8:

;stmt9:
  %22 = call %Nat32 () @lab_get ()
  store %Nat32 %22, %Nat32* %retval_reg

;stmt10:
  %23 = load %Unit*, %Unit** @fout
  %24 = bitcast [16 x %Nat8]* @func320_str2 to %Str
  %25 = load %Nat32, %Nat32* %retval_reg
  %26 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %23, %Str %24, %Nat32 %25)
  br label %endif_0
endif_0:

;stmt11:
  %27 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %28 = load %Type*, %Type** %27
  call void (%Type*, %Bool, %Bool) @printType (%Type* %28, %Bool 0, %Bool 0)

;stmt12:
  call void () @space ()

;stmt13:
  call void (%Value*) @print_value (%Value* %6)

;stmt14:
  %29 = bitcast [3 x %Nat8]* @func320_str3 to %Str
  call void (%Str) @o (%Str %29)

;stmt15:
  store %Bool 0, %Bool* @need_comma

;stmt16:
  %param_ln = alloca %Node*

;stmt17:
  %30 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %31 = load %Type*, %Type** %30
  %32 = getelementptr inbounds %Type, %Type* %31, i32 0, i32 6 ; eval_access
  %33 = getelementptr inbounds %TypeFunc, %TypeFunc* %32, i32 0, i32 0 ; eval_access
  %34 = load %List*, %List** %33
  %35 = getelementptr inbounds %List, %List* %34, i32 0, i32 0 ; eval_access
  %36 = load %Node*, %Node** %35
  store %Node* %36, %Node** %param_ln

;stmt18:
  %37 = getelementptr inbounds %Node*, %Node** %param_ln, i32 0 ; ref
  %38 = bitcast %Node** %37 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %7, %ListForeachHandler @print_args, %Unit* %38)

;stmt19:
  %39 = bitcast [2 x %Nat8]* @func320_str4 to %Str
  call void (%Str) @o (%Str %39)

;stmt20:
  %40 = load %Value*, %Value** %v
  %41 = getelementptr inbounds %Value, %Value* %40, i32 0, i32 1 ; eval_access
  %42 = load %Type*, %Type** %41
  %43 = load %Nat32, %Nat32* %retval_reg
  %44 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %42, %StorageClass 9, %Nat32 %43)
  ret %Value* %44
}

define %Value* @eval_index (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %a = alloca %Value*

;stmt1:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)
  store %Value* %5, %Value** %a

;stmt2:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 3 ; eval_access
  %8 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %7, i32 0, %Int32 1 ; eval_index
  %9 = load %Value*, %Value** %8
  %10 = call %Value* (%Value*) @eval (%Value* %9)
  %11 = call %Value* (%Value*) @load (%Value* %10)

;stmt3:
  %12 = load %Value*, %Value** %a
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 1 ; eval_access
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i32 0, i32 8 ; eval_access
  %16 = getelementptr inbounds %TypeArray, %TypeArray* %15, i32 0, i32 2 ; eval_access
  %17 = load %Bool, %Bool* %16
  br i1 %17, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %18 = load %Value*, %Value** %a
  %19 = call %Value* (%Value*) @load (%Value* %18)
  store %Value* %19, %Value** %a
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %20 = call %Nat32 () @lab_get ()

;stmt7:
  %21 = load %Unit*, %Unit** @fout
  %22 = bitcast [34 x %Nat8]* @func323_str1 to %Str
  %23 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22, %Nat32 %20)

;stmt8:
  %24 = load %Value*, %Value** %a
  %25 = getelementptr inbounds %Value, %Value* %24, i32 0, i32 1 ; eval_access
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Type, %Type* %26, i32 0, i32 8 ; eval_access
  %28 = getelementptr inbounds %TypeArray, %TypeArray* %27, i32 0, i32 2 ; eval_access
  %29 = load %Bool, %Bool* %28
  br i1 %29, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %30 = load %Value*, %Value** %v
  %31 = getelementptr inbounds %Value, %Value* %30, i32 0, i32 1 ; eval_access
  %32 = load %Type*, %Type** %31
  call void (%Type*, %Bool, %Bool) @printType (%Type* %32, %Bool 1, %Bool 1)
  br label %endif_1
else_1:

;stmt11:

;stmt12:
  %33 = load %Value*, %Value** %a
  %34 = getelementptr inbounds %Value, %Value* %33, i32 0, i32 1 ; eval_access
  %35 = load %Type*, %Type** %34
  call void (%Type*, %Bool, %Bool) @printType (%Type* %35, %Bool 1, %Bool 1)
  br label %endif_1
endif_1:

;stmt13:
  call void () @comma ()

;stmt14:
  %36 = load %Value*, %Value** %a
  %37 = getelementptr inbounds %Value, %Value* %36, i32 0, i32 1 ; eval_access
  %38 = load %Type*, %Type** %37
  call void (%Type*, %Bool, %Bool) @printType (%Type* %38, %Bool 1, %Bool 1)

;stmt15:
  %39 = load %Value*, %Value** %a
  %40 = getelementptr inbounds %Value, %Value* %39, i32 0, i32 1 ; eval_access
  %41 = load %Type*, %Type** %40
  %42 = getelementptr inbounds %Type, %Type* %41, i32 0, i32 8 ; eval_access
  %43 = getelementptr inbounds %TypeArray, %TypeArray* %42, i32 0, i32 2 ; eval_access
  %44 = load %Bool, %Bool* %43
  br i1 %44, label %then_2, label %else_2
then_2:

;stmt16:

;stmt17:
  call void () @space ()
  br label %endif_2
else_2:

;stmt18:

;stmt19:
  %45 = bitcast [3 x %Nat8]* @func323_str2 to %Str
  call void (%Str) @o (%Str %45)
  br label %endif_2
endif_2:

;stmt20:
  %46 = load %Value*, %Value** %a
  call void (%Value*) @print_value (%Value* %46)

;stmt21:
  %47 = load %Value*, %Value** %a
  %48 = getelementptr inbounds %Value, %Value* %47, i32 0, i32 1 ; eval_access
  %49 = load %Type*, %Type** %48
  %50 = getelementptr inbounds %Type, %Type* %49, i32 0, i32 8 ; eval_access
  %51 = getelementptr inbounds %TypeArray, %TypeArray* %50, i32 0, i32 2 ; eval_access
  %52 = load %Bool, %Bool* %51
  %53 = xor %Bool %52, 1
  br i1 %53, label %then_3, label %else_3
then_3:

;stmt22:

;stmt23:
  %54 = bitcast [8 x %Nat8]* @func323_str3 to %Str
  call void (%Str) @o (%Str %54)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt24:
  call void () @comma ()

;stmt25:
  %55 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 1 ; eval_access
  %56 = load %Type*, %Type** %55
  call void (%Type*, %Bool, %Bool) @printType (%Type* %56, %Bool 1, %Bool 1)

;stmt26:
  call void () @space ()

;stmt27:
  call void (%Value*) @print_value (%Value* %11)

;stmt28:
  %57 = bitcast [14 x %Nat8]* @func323_str4 to %Str
  call void (%Str) @o (%Str %57)

;stmt29:
  %58 = load %Value*, %Value** %v
  %59 = getelementptr inbounds %Value, %Value* %58, i32 0, i32 1 ; eval_access
  %60 = load %Type*, %Type** %59
  %61 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %60, %StorageClass 8, %Nat32 %20)
  ret %Value* %61
}

define %Value* @eval_access (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %s = alloca %Value*

;stmt1:
  %record_type = alloca %Type*

;stmt2:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)
  store %Value* %5, %Value** %s

;stmt3:
  %6 = load %Value*, %Value** %s
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 0 ; eval_access
  %10 = load %TypeKind, %TypeKind* %9
  %11 = icmp eq %TypeKind %10, 7
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %12 = load %Value*, %Value** %s
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 1 ; eval_access
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i32 0, i32 7 ; eval_access
  %16 = getelementptr inbounds %TypePointer, %TypePointer* %15, i32 0, i32 0 ; eval_access
  %17 = load %Type*, %Type** %16
  store %Type* %17, %Type** %record_type

;stmt6:
  %18 = load %Value*, %Value** %s
  %19 = call %Value* (%Value*) @load (%Value* %18)
  store %Value* %19, %Value** %s
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %20 = load %Value*, %Value** %s
  %21 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 1 ; eval_access
  %22 = load %Type*, %Type** %21
  store %Type* %22, %Type** %record_type
  br label %endif_0
endif_0:

;stmt9:
  %23 = load %Value*, %Value** %v
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 4 ; eval_access
  %25 = load %Str, %Str* %24
  %26 = bitcast %Str %25 to %Unit*
  %27 = inttoptr %Nat32 0 to %Unit*
  %28 = icmp ne %Unit* %26, %27
  %29 = bitcast [29 x %Nat8]* @func324_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %28, %Str %29)

;stmt10:
  %30 = load %Type*, %Type** %record_type
  %31 = load %Value*, %Value** %v
  %32 = getelementptr inbounds %Value, %Value* %31, i32 0, i32 4 ; eval_access
  %33 = load %Str, %Str* %32
  %34 = call %Field* (%Type*, %Str) @type_record_get_field (%Type* %30, %Str %33)
  %35 = getelementptr inbounds %Field, %Field* %34, i32 0, i32 2 ; eval_access
  %36 = load %Nat16, %Nat16* %35

;stmt11:
  %37 = call %Nat32 () @lab_get ()

;stmt12:
  %38 = load %Unit*, %Unit** @fout
  %39 = bitcast [34 x %Nat8]* @func324_str2 to %Str
  %40 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %38, %Str %39, %Nat32 %37)

;stmt13:
  %41 = load %Type*, %Type** %record_type
  call void (%Type*, %Bool, %Bool) @printType (%Type* %41, %Bool 1, %Bool 1)

;stmt14:
  call void () @comma ()

;stmt15:
  %42 = load %Type*, %Type** %record_type
  call void (%Type*, %Bool, %Bool) @printType (%Type* %42, %Bool 1, %Bool 1)

;stmt16:
  %43 = bitcast [3 x %Nat8]* @func324_str3 to %Str
  call void (%Str) @o (%Str %43)

;stmt17:
  %44 = load %Value*, %Value** %s
  call void (%Value*) @print_value (%Value* %44)

;stmt18:
  %45 = load %Unit*, %Unit** @fout
  %46 = bitcast [30 x %Nat8]* @func324_str4 to %Str
  %47 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %45, %Str %46, %Nat16 %36)

;stmt19:
  %48 = load %Value*, %Value** %v
  %49 = getelementptr inbounds %Value, %Value* %48, i32 0, i32 1 ; eval_access
  %50 = load %Type*, %Type** %49
  %51 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %50, %StorageClass 8, %Nat32 %37)
  ret %Value* %51
}

define %Value* @eval_ref (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)

;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 2 ; eval_access
  %7 = getelementptr inbounds %Storage, %Storage* %6, i32 0, i32 0 ; eval_access
  %8 = load %StorageClass, %StorageClass* %7
  %9 = icmp eq %StorageClass %8, 8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %10 = load %Value*, %Value** %v
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1 ; eval_access
  %12 = load %Type*, %Type** %11
  %13 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 2 ; eval_access
  %14 = getelementptr inbounds %Storage, %Storage* %13, i32 0, i32 2 ; eval_access
  %15 = load %Nat32, %Nat32* %14
  %16 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %12, %StorageClass 9, %Nat32 %15)
  ret %Value* %16
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %18 = call %Nat32 () @lab_get ()

;stmt5:
  %19 = load %Unit*, %Unit** @fout
  %20 = bitcast [34 x %Nat8]* @func325_str1 to %Str
  %21 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %19, %Str %20, %Nat32 %18)

;stmt6:
  %22 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1 ; eval_access
  %23 = load %Type*, %Type** %22
  call void (%Type*, %Bool, %Bool) @printType (%Type* %23, %Bool 1, %Bool 1)

;stmt7:
  call void () @comma ()

;stmt8:
  %24 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1 ; eval_access
  %25 = load %Type*, %Type** %24
  call void (%Type*, %Bool, %Bool) @printType (%Type* %25, %Bool 1, %Bool 1)

;stmt9:
  %26 = bitcast [3 x %Nat8]* @func325_str2 to %Str
  call void (%Str) @o (%Str %26)

;stmt10:
  call void (%Value*) @print_value (%Value* %5)

;stmt11:
  call void () @comma ()

;stmt12:
  %27 = bitcast [12 x %Nat8]* @func325_str3 to %Str
  call void (%Str) @o (%Str %27)

;stmt13:
  %28 = load %Value*, %Value** %v
  %29 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 1 ; eval_access
  %30 = load %Type*, %Type** %29
  %31 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %30, %StorageClass 9, %Nat32 %18)
  ret %Value* %31
}

define %Value* @eval_deref (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)
  %6 = call %Value* (%Value*) @load (%Value* %5)

;stmt1:
  %7 = load %Value*, %Value** %v
  %8 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 1 ; eval_access
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 2 ; eval_access
  %11 = getelementptr inbounds %Storage, %Storage* %10, i32 0, i32 2 ; eval_access
  %12 = load %Nat32, %Nat32* %11
  %13 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %9, %StorageClass 8, %Nat32 %12)
  ret %Value* %13
}

define %Value* @eval_not (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)
  %6 = call %Value* (%Value*) @load (%Value* %5)

;stmt1:
  %7 = call %Nat32 () @lab_get ()

;stmt2:
  %8 = load %Unit*, %Unit** @fout
  %9 = bitcast [15 x %Nat8]* @func327_str1 to %Str
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Nat32 %7)

;stmt3:
  %11 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %12 = load %Type*, %Type** %11
  call void (%Type*, %Bool, %Bool) @printType (%Type* %12, %Bool 1, %Bool 1)

;stmt4:
  call void () @space ()

;stmt5:
  call void (%Value*) @print_value (%Value* %6)

;stmt6:
  %13 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %14 = load %Type*, %Type** %13
  %15 = load %Type*, %Type** @typeBool
  %16 = call %Bool (%Type*, %Type*) @type_eq (%Type* %14, %Type* %15)
  br i1 %16, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %17 = bitcast [4 x %Nat8]* @func327_str2 to %Str
  call void (%Str) @o (%Str %17)
  br label %endif_0
else_0:

;stmt9:

;stmt10:
  %18 = bitcast [5 x %Nat8]* @func327_str3 to %Str
  call void (%Str) @o (%Str %18)
  br label %endif_0
endif_0:

;stmt11:
  %19 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %20 = load %Type*, %Type** %19
  %21 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %20, %StorageClass 9, %Nat32 %7)
  ret %Value* %21
}

define %Value* @eval_minus (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3 ; eval_access
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0 ; eval_index
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)
  %6 = call %Value* (%Value*) @load (%Value* %5)

;stmt1:
  %7 = call %Nat32 () @lab_get ()

;stmt2:
  %8 = load %Unit*, %Unit** @fout
  %9 = bitcast [19 x %Nat8]* @func328_str1 to %Str
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Nat32 %7)

;stmt3:
  %11 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %12 = load %Type*, %Type** %11
  call void (%Type*, %Bool, %Bool) @printType (%Type* %12, %Bool 1, %Bool 1)

;stmt4:
  %13 = load %Unit*, %Unit** @fout
  %14 = bitcast [3 x %Nat8]* @func328_str2 to %Str
  %15 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %13, %Str %14)

;stmt5:
  call void () @comma ()

;stmt6:
  call void (%Value*) @print_value (%Value* %6)

;stmt7:
  %16 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1 ; eval_access
  %17 = load %Type*, %Type** %16
  %18 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %17, %StorageClass 9, %Nat32 %7)
  ret %Value* %18
}

define %Value* @eval_cast (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %xx = alloca %Nat32

;stmt1:
  store %Nat32 0, %Nat32* %xx

;stmt2:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 7 ; eval_access
  %3 = load %Type*, %Type** %2

;stmt3:
  %4 = load %Value*, %Value** %v
  %5 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 3 ; eval_access
  %6 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %5, i32 0, %Int32 0 ; eval_index
  %7 = load %Value*, %Value** %6
  %8 = call %Value* (%Value*) @eval (%Value* %7)

;stmt4:
  %9 = call %Value* (%Value*) @load (%Value* %8)

;stmt5:
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 1 ; eval_access
  %11 = load %Type*, %Type** %10
  %12 = call %Bool (%Type*, %Type*) @type_eq (%Type* %11, %Type* %3)
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  ret %Value* %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %14 = call %Nat32 () @lab_get ()

;stmt9:
  %15 = load %Unit*, %Unit** @fout
  %16 = bitcast [11 x %Nat8]* @func329_str1 to %Str
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16, %Nat32 %14)

;stmt10:
  %18 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 1 ; eval_access
  %19 = load %Type*, %Type** %18
  %20 = getelementptr inbounds %Type, %Type* %19, i32 0, i32 0 ; eval_access
  %21 = load %TypeKind, %TypeKind* %20

;stmt11:
  %22 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0 ; eval_access
  %23 = load %TypeKind, %TypeKind* %22
  %24 = icmp eq %TypeKind %23, 8
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %25 = icmp eq %TypeKind %21, 3
  br i1 %25, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %26 = load %Unit*, %Unit** @fout
  %27 = bitcast [10 x %Nat8]* @func329_str2 to %Str
  %28 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %26, %Str %27)
  br label %endif_2
else_2:

;stmt16:

;stmt17:
  %29 = load %Unit*, %Unit** @fout
  %30 = bitcast [9 x %Nat8]* @func329_str3 to %Str
  %31 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %29, %Str %30)
  br label %endif_2
endif_2:
  br label %endif_1
else_1:

;stmt18:
  %32 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0 ; eval_access
  %33 = load %TypeKind, %TypeKind* %32
  %34 = icmp eq %TypeKind %33, 7
  %35 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0 ; eval_access
  %36 = load %TypeKind, %TypeKind* %35
  %37 = icmp eq %TypeKind %36, 4
  %38 = or %Bool %34, %37
  br i1 %38, label %then_3, label %else_3
then_3:

;stmt19:

;stmt20:
  %39 = icmp eq %TypeKind %21, 7
  %40 = icmp eq %TypeKind %21, 8
  %41 = icmp eq %TypeKind %21, 4
  %42 = or %Bool %40, %41
  %43 = or %Bool %39, %42
  br i1 %43, label %then_4, label %else_4
then_4:

;stmt21:

;stmt22:
  %44 = load %Unit*, %Unit** @fout
  %45 = bitcast [9 x %Nat8]* @func329_str4 to %Str
  %46 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %44, %Str %45)
  br label %endif_4
else_4:

;stmt23:

;stmt24:
  %47 = load %Unit*, %Unit** @fout
  %48 = bitcast [10 x %Nat8]* @func329_str5 to %Str
  %49 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %47, %Str %48)
  br label %endif_4
endif_4:
  br label %endif_3
else_3:

;stmt25:
  %50 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0 ; eval_access
  %51 = load %TypeKind, %TypeKind* %50
  %52 = icmp eq %TypeKind %51, 3
  br i1 %52, label %then_5, label %else_5
then_5:

;stmt26:

;stmt27:
  %53 = icmp eq %TypeKind %21, 3
  br i1 %53, label %then_6, label %else_6
then_6:

;stmt28:

;stmt29:
  %54 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 1 ; eval_access
  %55 = load %Type*, %Type** %54
  %56 = getelementptr inbounds %Type, %Type* %55, i32 0, i32 5 ; eval_access
  %57 = getelementptr inbounds %TypeBasic, %TypeBasic* %56, i32 0, i32 1 ; eval_access
  %58 = load %Nat32, %Nat32* %57
  %59 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5 ; eval_access
  %60 = getelementptr inbounds %TypeBasic, %TypeBasic* %59, i32 0, i32 1 ; eval_access
  %61 = load %Nat32, %Nat32* %60
  %62 = icmp ugt %Nat32 %58, %61
  br i1 %62, label %then_7, label %else_7
then_7:

;stmt30:

;stmt31:
  %63 = load %Unit*, %Unit** @fout
  %64 = bitcast [7 x %Nat8]* @func329_str6 to %Str
  %65 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %63, %Str %64)
  br label %endif_7
else_7:

;stmt32:
  %66 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 1 ; eval_access
  %67 = load %Type*, %Type** %66
  %68 = getelementptr inbounds %Type, %Type* %67, i32 0, i32 5 ; eval_access
  %69 = getelementptr inbounds %TypeBasic, %TypeBasic* %68, i32 0, i32 1 ; eval_access
  %70 = load %Nat32, %Nat32* %69
  %71 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5 ; eval_access
  %72 = getelementptr inbounds %TypeBasic, %TypeBasic* %71, i32 0, i32 1 ; eval_access
  %73 = load %Nat32, %Nat32* %72
  %74 = icmp ult %Nat32 %70, %73
  br i1 %74, label %then_8, label %else_8
then_8:

;stmt33:

;stmt34:
  %75 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5 ; eval_access
  %76 = getelementptr inbounds %TypeBasic, %TypeBasic* %75, i32 0, i32 3 ; eval_access
  %77 = load %Bool, %Bool* %76
  br i1 %77, label %then_9, label %else_9
then_9:

;stmt35:

;stmt36:
  %78 = load %Unit*, %Unit** @fout
  %79 = bitcast [2 x %Nat8]* @func329_str7 to %Str
  %80 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %78, %Str %79)
  br label %endif_9
else_9:

;stmt37:

;stmt38:
  %81 = load %Unit*, %Unit** @fout
  %82 = bitcast [2 x %Nat8]* @func329_str8 to %Str
  %83 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %81, %Str %82)
  br label %endif_9
endif_9:

;stmt39:
  %84 = load %Unit*, %Unit** @fout
  %85 = bitcast [5 x %Nat8]* @func329_str9 to %Str
  %86 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %84, %Str %85)
  br label %endif_8
else_8:

;stmt40:

;stmt41:
  %87 = load %Unit*, %Unit** @fout
  %88 = bitcast [9 x %Nat8]* @func329_str10 to %Str
  %89 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %87, %Str %88)
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
else_6:

;stmt42:
  %90 = icmp eq %TypeKind %21, 7
  br i1 %90, label %then_10, label %else_10
then_10:

;stmt43:

;stmt44:
  %91 = load %Unit*, %Unit** @fout
  %92 = bitcast [10 x %Nat8]* @func329_str11 to %Str
  %93 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %91, %Str %92)
  br label %endif_10
else_10:

;stmt45:
  %94 = icmp eq %TypeKind %21, 5
  br i1 %94, label %then_11, label %else_11
then_11:

;stmt46:

;stmt47:
  %95 = bitcast [9 x %Nat8]* @func329_str12 to %Str
  %96 = call %Nat64 (%Str) @get (%Str %95)
  %97 = trunc %Nat64 %96 to %Nat32
  %98 = mul %Nat32 %97, 8

;stmt48:
  %99 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5 ; eval_access
  %100 = getelementptr inbounds %TypeBasic, %TypeBasic* %99, i32 0, i32 1 ; eval_access
  %101 = load %Nat32, %Nat32* %100
  %102 = icmp ugt %Nat32 %98, %101
  br i1 %102, label %then_12, label %else_12
then_12:

;stmt49:

;stmt50:
  %103 = load %Unit*, %Unit** @fout
  %104 = bitcast [7 x %Nat8]* @func329_str13 to %Str
  %105 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %103, %Str %104)
  br label %endif_12
else_12:

;stmt51:
  %106 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5 ; eval_access
  %107 = getelementptr inbounds %TypeBasic, %TypeBasic* %106, i32 0, i32 1 ; eval_access
  %108 = load %Nat32, %Nat32* %107
  %109 = icmp ult %Nat32 %98, %108
  br i1 %109, label %then_13, label %else_13
then_13:

;stmt52:

;stmt53:
  %110 = load %Unit*, %Unit** @fout
  %111 = bitcast [6 x %Nat8]* @func329_str14 to %Str
  %112 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %110, %Str %111)
  br label %endif_13
else_13:

;stmt54:

;stmt55:
  %113 = load %Unit*, %Unit** @fout
  %114 = bitcast [9 x %Nat8]* @func329_str15 to %Str
  %115 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %113, %Str %114)
  br label %endif_13
endif_13:
  br label %endif_12
endif_12:
  br label %endif_11
else_11:

;stmt56:
  %116 = icmp eq %TypeKind %21, 8
  br i1 %116, label %then_14, label %else_14
then_14:

;stmt57:
  br label %endif_14
else_14:

;stmt58:

;stmt59:
  %117 = bitcast [18 x %Nat8]* @func329_str16 to %Str
  %118 = call %Int32 (%Str, ...) @printf (%Str %117, %TypeKind %21)

;stmt60:
  %119 = bitcast [33 x %Nat8]* @func329_str17 to %Str
  call void (%Str) @fatal (%Str %119)
  br label %endif_14
endif_14:
  br label %endif_11
endif_11:
  br label %endif_10
endif_10:
  br label %endif_6
endif_6:
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_3
endif_3:
  br label %endif_1
endif_1:

;stmt61:
  %120 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 1 ; eval_access
  %121 = load %Type*, %Type** %120
  call void (%Type*, %Bool, %Bool) @printType (%Type* %121, %Bool 1, %Bool 1)

;stmt62:
  call void () @space ()

;stmt63:
  call void (%Value*) @print_value (%Value* %9)

;stmt64:
  %122 = bitcast [5 x %Nat8]* @func329_str18 to %Str
  call void (%Str) @o (%Str %122)

;stmt65:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt66:
  %123 = load %Value*, %Value** %v
  %124 = getelementptr inbounds %Value, %Value* %123, i32 0, i32 1 ; eval_access
  %125 = load %Type*, %Type** %124
  %126 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %125, %StorageClass 9, %Nat32 %14)
  ret %Value* %126
}

define %Value* @eval_bin (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %o = alloca %Str

;stmt1:
  %1 = bitcast [7 x %Nat8]* @func330_str1 to %Str
  store %Str %1, %Str* %o

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 3 ; eval_access
  %4 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %3, i32 0, %Int32 0 ; eval_index
  %5 = load %Value*, %Value** %4
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1 ; eval_access
  %7 = load %Type*, %Type** %6
  %8 = getelementptr inbounds %Type, %Type* %7, i32 0, i32 5 ; eval_access
  %9 = getelementptr inbounds %TypeBasic, %TypeBasic* %8, i32 0, i32 3 ; eval_access
  %10 = load %Bool, %Bool* %9

;stmt3:
  %11 = load %Value*, %Value** %v
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 0 ; eval_access
  %13 = load %ValueKind, %ValueKind* %12

;stmt4:
  %14 = icmp eq %ValueKind %13, 6
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %15 = bitcast [4 x %Nat8]* @func330_str2 to %Str
  store %Str %15, %Str* %o
  br label %endif_0
else_0:

;stmt7:
  %16 = icmp eq %ValueKind %13, 7
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %17 = bitcast [4 x %Nat8]* @func330_str3 to %Str
  store %Str %17, %Str* %o
  br label %endif_1
else_1:

;stmt10:
  %18 = icmp eq %ValueKind %13, 8
  br i1 %18, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %19 = bitcast [4 x %Nat8]* @func330_str4 to %Str
  store %Str %19, %Str* %o
  br label %endif_2
else_2:

;stmt13:
  %20 = icmp eq %ValueKind %13, 9
  br i1 %20, label %then_3, label %else_3
then_3:

;stmt14:

;stmt15:
  br i1 %10, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %21 = bitcast [5 x %Nat8]* @func330_str5 to %Str
  store %Str %21, %Str* %o
  br label %endif_4
else_4:

;stmt18:

;stmt19:
  %22 = bitcast [5 x %Nat8]* @func330_str6 to %Str
  store %Str %22, %Str* %o
  br label %endif_4
endif_4:
  br label %endif_3
else_3:

;stmt20:
  %23 = icmp eq %ValueKind %13, 10
  br i1 %23, label %then_5, label %else_5
then_5:

;stmt21:

;stmt22:
  br i1 %10, label %then_6, label %else_6
then_6:

;stmt23:

;stmt24:
  %24 = bitcast [5 x %Nat8]* @func330_str7 to %Str
  store %Str %24, %Str* %o
  br label %endif_6
else_6:

;stmt25:

;stmt26:
  %25 = bitcast [5 x %Nat8]* @func330_str8 to %Str
  store %Str %25, %Str* %o
  br label %endif_6
endif_6:
  br label %endif_5
else_5:

;stmt27:
  %26 = icmp eq %ValueKind %13, 11
  br i1 %26, label %then_7, label %else_7
then_7:

;stmt28:

;stmt29:
  %27 = bitcast [3 x %Nat8]* @func330_str9 to %Str
  store %Str %27, %Str* %o
  br label %endif_7
else_7:

;stmt30:
  %28 = icmp eq %ValueKind %13, 12
  br i1 %28, label %then_8, label %else_8
then_8:

;stmt31:

;stmt32:
  %29 = bitcast [4 x %Nat8]* @func330_str10 to %Str
  store %Str %29, %Str* %o
  br label %endif_8
else_8:

;stmt33:
  %30 = icmp eq %ValueKind %13, 13
  br i1 %30, label %then_9, label %else_9
then_9:

;stmt34:

;stmt35:
  %31 = bitcast [4 x %Nat8]* @func330_str11 to %Str
  store %Str %31, %Str* %o
  br label %endif_9
else_9:

;stmt36:
  %32 = icmp eq %ValueKind %13, 14
  br i1 %32, label %then_10, label %else_10
then_10:

;stmt37:

;stmt38:
  %33 = bitcast [8 x %Nat8]* @func330_str12 to %Str
  store %Str %33, %Str* %o
  br label %endif_10
else_10:

;stmt39:
  %34 = icmp eq %ValueKind %13, 15
  br i1 %34, label %then_11, label %else_11
then_11:

;stmt40:

;stmt41:
  %35 = bitcast [8 x %Nat8]* @func330_str13 to %Str
  store %Str %35, %Str* %o
  br label %endif_11
else_11:

;stmt42:
  %36 = icmp eq %ValueKind %13, 16
  br i1 %36, label %then_12, label %else_12
then_12:

;stmt43:

;stmt44:
  br i1 %10, label %then_13, label %else_13
then_13:

;stmt45:

;stmt46:
  %37 = bitcast [9 x %Nat8]* @func330_str14 to %Str
  store %Str %37, %Str* %o
  br label %endif_13
else_13:

;stmt47:

;stmt48:
  %38 = bitcast [9 x %Nat8]* @func330_str15 to %Str
  store %Str %38, %Str* %o
  br label %endif_13
endif_13:
  br label %endif_12
else_12:

;stmt49:
  %39 = icmp eq %ValueKind %13, 17
  br i1 %39, label %then_14, label %else_14
then_14:

;stmt50:

;stmt51:
  br i1 %10, label %then_15, label %else_15
then_15:

;stmt52:

;stmt53:
  %40 = bitcast [9 x %Nat8]* @func330_str16 to %Str
  store %Str %40, %Str* %o
  br label %endif_15
else_15:

;stmt54:

;stmt55:
  %41 = bitcast [9 x %Nat8]* @func330_str17 to %Str
  store %Str %41, %Str* %o
  br label %endif_15
endif_15:
  br label %endif_14
else_14:

;stmt56:
  %42 = icmp eq %ValueKind %13, 18
  br i1 %42, label %then_16, label %else_16
then_16:

;stmt57:

;stmt58:
  br i1 %10, label %then_17, label %else_17
then_17:

;stmt59:

;stmt60:
  %43 = bitcast [9 x %Nat8]* @func330_str18 to %Str
  store %Str %43, %Str* %o
  br label %endif_17
else_17:

;stmt61:

;stmt62:
  %44 = bitcast [9 x %Nat8]* @func330_str19 to %Str
  store %Str %44, %Str* %o
  br label %endif_17
endif_17:
  br label %endif_16
else_16:

;stmt63:
  %45 = icmp eq %ValueKind %13, 19
  br i1 %45, label %then_18, label %else_18
then_18:

;stmt64:

;stmt65:
  br i1 %10, label %then_19, label %else_19
then_19:

;stmt66:

;stmt67:
  %46 = bitcast [9 x %Nat8]* @func330_str20 to %Str
  store %Str %46, %Str* %o
  br label %endif_19
else_19:

;stmt68:

;stmt69:
  %47 = bitcast [9 x %Nat8]* @func330_str21 to %Str
  store %Str %47, %Str* %o
  br label %endif_19
endif_19:
  br label %endif_18
else_18:

;stmt70:
  %48 = icmp eq %ValueKind %13, 20
  br i1 %48, label %then_20, label %else_20
then_20:

;stmt71:

;stmt72:
  %49 = bitcast [4 x %Nat8]* @func330_str22 to %Str
  store %Str %49, %Str* %o
  br label %endif_20
else_20:

;stmt73:
  %50 = icmp eq %ValueKind %13, 21
  br i1 %50, label %then_21, label %else_21
then_21:

;stmt74:

;stmt75:
  br i1 %10, label %then_22, label %else_22
then_22:

;stmt76:

;stmt77:
  %51 = bitcast [5 x %Nat8]* @func330_str23 to %Str
  store %Str %51, %Str* %o
  br label %endif_22
else_22:

;stmt78:

;stmt79:
  %52 = bitcast [5 x %Nat8]* @func330_str24 to %Str
  store %Str %52, %Str* %o
  br label %endif_22
endif_22:
  br label %endif_21
else_21:
  br label %endif_21
endif_21:
  br label %endif_20
endif_20:
  br label %endif_18
endif_18:
  br label %endif_16
endif_16:
  br label %endif_14
endif_14:
  br label %endif_12
endif_12:
  br label %endif_11
endif_11:
  br label %endif_10
endif_10:
  br label %endif_9
endif_9:
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_5
endif_5:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt80:
  %53 = load %Value*, %Value** %v
  %54 = getelementptr inbounds %Value, %Value* %53, i32 0, i32 3 ; eval_access
  %55 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %54, i32 0, %Int32 0 ; eval_index
  %56 = load %Value*, %Value** %55
  %57 = call %Value* (%Value*) @eval (%Value* %56)
  %58 = call %Value* (%Value*) @load (%Value* %57)

;stmt81:
  %59 = load %Value*, %Value** %v
  %60 = getelementptr inbounds %Value, %Value* %59, i32 0, i32 3 ; eval_access
  %61 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %60, i32 0, %Int32 1 ; eval_index
  %62 = load %Value*, %Value** %61
  %63 = call %Value* (%Value*) @eval (%Value* %62)
  %64 = call %Value* (%Value*) @load (%Value* %63)

;stmt82:
  %65 = call %Nat32 () @lab_get ()

;stmt83:
  %66 = load %Unit*, %Unit** @fout
  %67 = bitcast [14 x %Nat8]* @func330_str25 to %Str
  %68 = load %Str, %Str* %o
  %69 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %66, %Str %67, %Nat32 %65, %Str %68)

;stmt84:
  %70 = getelementptr inbounds %Value, %Value* %58, i32 0, i32 1 ; eval_access
  %71 = load %Type*, %Type** %70
  call void (%Type*, %Bool, %Bool) @printType (%Type* %71, %Bool 1, %Bool 1)

;stmt85:
  call void () @space ()

;stmt86:
  call void (%Value*) @print_value (%Value* %58)

;stmt87:
  call void () @comma ()

;stmt88:
  call void (%Value*) @print_value (%Value* %64)

;stmt89:
  %72 = load %Value*, %Value** %v
  %73 = getelementptr inbounds %Value, %Value* %72, i32 0, i32 1 ; eval_access
  %74 = load %Type*, %Type** %73
  %75 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %74, %StorageClass 9, %Nat32 %65)
  ret %Value* %75
}

define void @print_st (%Value* %_l, %Value* %_r) {
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r

;stmt0:
  %1 = load %Value*, %Value** %l
  %2 = call %Value* (%Value*) @eval (%Value* %1)

;stmt1:
  %3 = load %Value*, %Value** %r
  %4 = call %Value* (%Value*) @eval (%Value* %3)
  %5 = call %Value* (%Value*) @load (%Value* %4)

;stmt2:
  %6 = load %Unit*, %Unit** @fout
  %7 = bitcast [10 x %Nat8]* @func331_str1 to %Str
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1 ; eval_access
  %10 = load %Type*, %Type** %9
  call void (%Type*, %Bool, %Bool) @printType (%Type* %10, %Bool 1, %Bool 1)

;stmt4:
  call void () @space ()

;stmt5:
  call void (%Value*) @print_value (%Value* %5)

;stmt6:
  call void () @comma ()

;stmt7:
  %11 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1 ; eval_access
  %12 = load %Type*, %Type** %11
  call void (%Type*, %Bool, %Bool) @printType (%Type* %12, %Bool 1, %Bool 1)

;stmt8:
  %13 = bitcast [3 x %Nat8]* @func331_str2 to %Str
  call void (%Str) @o (%Str %13)

;stmt9:
  call void (%Value*) @print_value (%Value* %2)
  ret void
}

define %Value* @nv (%Type* %_t, %StorageClass %_c, %Nat32 %_reg) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %c = alloca %StorageClass
  store %StorageClass %_c, %StorageClass* %c
  %reg = alloca %Nat32
  store %Nat32 %_reg, %Nat32* %reg

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 144)
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = bitcast [12 x %Nat8]* @func332_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Value* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 144)

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 1 ; eval_access
  %10 = load %Type*, %Type** %t
  store %Type* %10, %Type** %9

;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2 ; eval_access
  %12 = getelementptr inbounds %Storage, %Storage* %11, i32 0, i32 0 ; eval_access
  %13 = load %StorageClass, %StorageClass* %c
  store %StorageClass %13, %StorageClass* %12

;stmt5:
  %14 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2 ; eval_access
  %15 = getelementptr inbounds %Storage, %Storage* %14, i32 0, i32 2 ; eval_access
  %16 = load %Nat32, %Nat32* %reg
  store %Nat32 %16, %Nat32* %15

;stmt6:
  ret %Value* %2
}

define void @typedef (%Str %_id, %Type* %_t) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [14 x %Nat8]* @func333_str1 to %Str
  %3 = load %Str, %Str* %id
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %3)

;stmt1:
  %5 = load %Type*, %Type** %t
  call void (%Type*, %Bool, %Bool) @printType (%Type* %5, %Bool 0, %Bool 1)
  ret void
}

define void @print_array_item (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = load %Bool, %Bool* @need_comma
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %4 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 1 ; eval_access
  %5 = load %Type*, %Type** %4
  call void (%Type*, %Bool, %Bool) @printType (%Type* %5, %Bool 1, %Bool 1)

;stmt5:
  call void () @space ()

;stmt6:
  call void (%Value*) @print_value (%Value* %2)

;stmt7:
  store %Bool 1, %Bool* @need_comma
  ret void
}

define void @arraydef (%Str %_id, %Type* %_t, %List* %_items) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %items = alloca %List*
  store %List* %_items, %List** %items

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [44 x %Nat8]* @func334_str1 to %Str
  %3 = load %Str, %Str* %id
  %4 = load %List*, %List** %items
  %5 = getelementptr inbounds %List, %List* %4, i32 0, i32 2 ; eval_access
  %6 = load %Nat64, %Nat64* %5
  %7 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %3, %Nat64 %6)

;stmt1:
  %8 = load %Type*, %Type** %t
  call void (%Type*, %Bool, %Bool) @printType (%Type* %8, %Bool 1, %Bool 1)

;stmt2:
  %9 = load %Unit*, %Unit** @fout
  %10 = bitcast [4 x %Nat8]* @func334_str2 to %Str
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10)

;stmt3:
  store %Bool 0, %Bool* @need_comma

;stmt4:
  %12 = load %List*, %List** %items
  %13 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %12, %ListForeachHandler @print_array_item, %Unit* %13)

;stmt5:
  %14 = load %Unit*, %Unit** @fout
  %15 = bitcast [12 x %Nat8]* @func334_str3 to %Str
  %16 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15)
  ret void
}

define void @stringdef (%Str %_id, %Nat32 %_len, %Str %_s) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %len = alloca %Nat32
  store %Nat32 %_len, %Nat32* %len
  %s = alloca %Str
  store %Str %_s, %Str* %s

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [50 x %Nat8]* @func336_str1 to %Str
  %3 = load %Str, %Str* %id
  %4 = load %Nat32, %Nat32* %len
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %3, %Nat32 %4)

;stmt1:
  %i = alloca %Nat32

;stmt2:
  store %Nat32 0, %Nat32* %i

;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt4:

;stmt5:
  %6 = load %Nat32, %Nat32* %i
  %7 = load %Str, %Str* %s
  %8 = getelementptr inbounds %Nat8, %Str %7, %Nat32 %6 ; eval_index
  %9 = load %Nat8, %Nat8* %8

;stmt6:
  %10 = load %Nat32, %Nat32* %i
  %11 = add %Nat32 %10, 1
  store %Nat32 %11, %Nat32* %i

;stmt7:
  %12 = icmp eq %Nat8 %9, 0
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt10:
  %14 = bitcast [2 x %Nat8]* @func336_str2 to %Str
  %15 = getelementptr inbounds %Nat8, %Str %14, %Int32 0 ; eval_index
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp eq %Nat8 %9, %16
  %18 = bitcast [2 x %Nat8]* @func336_str3 to %Str
  %19 = getelementptr inbounds %Nat8, %Str %18, %Int32 0 ; eval_index
  %20 = load %Nat8, %Nat8* %19
  %21 = icmp eq %Nat8 %9, %20
  %22 = bitcast [2 x %Nat8]* @func336_str4 to %Str
  %23 = getelementptr inbounds %Nat8, %Str %22, %Int32 0 ; eval_index
  %24 = load %Nat8, %Nat8* %23
  %25 = icmp eq %Nat8 %9, %24
  %26 = bitcast [2 x %Nat8]* @func336_str5 to %Str
  %27 = getelementptr inbounds %Nat8, %Str %26, %Int32 0 ; eval_index
  %28 = load %Nat8, %Nat8* %27
  %29 = icmp eq %Nat8 %9, %28
  %30 = bitcast [2 x %Nat8]* @func336_str6 to %Str
  %31 = getelementptr inbounds %Nat8, %Str %30, %Int32 0 ; eval_index
  %32 = load %Nat8, %Nat8* %31
  %33 = icmp eq %Nat8 %9, %32
  %34 = bitcast [2 x %Nat8]* @func336_str7 to %Str
  %35 = getelementptr inbounds %Nat8, %Str %34, %Int32 0 ; eval_index
  %36 = load %Nat8, %Nat8* %35
  %37 = icmp eq %Nat8 %9, %36
  %38 = bitcast [2 x %Nat8]* @func336_str8 to %Str
  %39 = getelementptr inbounds %Nat8, %Str %38, %Int32 0 ; eval_index
  %40 = load %Nat8, %Nat8* %39
  %41 = icmp eq %Nat8 %9, %40
  %42 = bitcast [2 x %Nat8]* @func336_str9 to %Str
  %43 = getelementptr inbounds %Nat8, %Str %42, %Int32 0 ; eval_index
  %44 = load %Nat8, %Nat8* %43
  %45 = icmp eq %Nat8 %9, %44
  %46 = or %Bool %41, %45
  %47 = or %Bool %37, %46
  %48 = or %Bool %33, %47
  %49 = or %Bool %29, %48
  %50 = or %Bool %25, %49
  %51 = or %Bool %21, %50
  %52 = or %Bool %17, %51
  br i1 %52, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %53 = load %Unit*, %Unit** @fout
  %54 = bitcast [6 x %Nat8]* @func336_str10 to %Str
  %55 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %53, %Str %54, %Nat8 %9)
  br label %endif_1
else_1:

;stmt13:

;stmt14:
  %56 = load %Unit*, %Unit** @fout
  %57 = bitcast [3 x %Nat8]* @func336_str11 to %Str
  %58 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %56, %Str %57, %Nat8 %9)
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt15:
  %59 = load %Unit*, %Unit** @fout
  %60 = bitcast [16 x %Nat8]* @func336_str12 to %Str
  %61 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %59, %Str %60, %Int32 0)
  ret void
}

define void @vardef (%Str %_id, %Type* %_t, %Value* %_v) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [15 x %Nat8]* @func337_str1 to %Str
  %3 = load %Str, %Str* %id
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %3)

;stmt1:
  %5 = load %Type*, %Type** %t
  call void (%Type*, %Bool, %Bool) @printType (%Type* %5, %Bool 1, %Bool 1)

;stmt2:
  call void () @space ()

;stmt3:
  %6 = load %Value*, %Value** %v
  %7 = bitcast %Value* %6 to %Unit*
  %8 = inttoptr %Nat32 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %10 = load %Value*, %Value** %v
  call void (%Value*) @print_value (%Value* %10)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %11 = bitcast [16 x %Nat8]* @func337_str2 to %Str
  call void (%Str) @o (%Str %11)
  br label %endif_0
endif_0:
  ret void
}

define void @vf_print_param (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Bool, %Bool* @need_comma
  br i1 %1, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %2 = load %Unit*, %Unit** @fout
  %3 = bitcast [3 x %Nat8]* @func339_str1 to %Str
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %5 = load %Unit*, %Unit** %data
  %6 = bitcast %Unit* %5 to %Field*
  %7 = getelementptr inbounds %Field, %Field* %6, i32 0, i32 1 ; eval_access
  %8 = load %Type*, %Type** %7
  call void (%Type*, %Bool, %Bool) @printType (%Type* %8, %Bool 1, %Bool 1)

;stmt4:
  %9 = load %Unit*, %Unit** @fout
  %10 = bitcast [7 x %Nat8]* @func339_str2 to %Str
  %11 = load %Unit*, %Unit** %data
  %12 = bitcast %Unit* %11 to %Field*
  %13 = getelementptr inbounds %Field, %Field* %12, i32 0, i32 0 ; eval_access
  %14 = load %Str, %Str* %13
  %15 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10, %Str %14)

;stmt5:
  store %Bool 1, %Bool* @need_comma
  ret void
}

define void @print_param_loc (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = load %Unit*, %Unit** @fout
  %4 = bitcast [18 x %Nat8]* @func340_str1 to %Str
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %6 = load %Str, %Str* %5
  %7 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4, %Str %6)

;stmt2:
  %8 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %9 = load %Type*, %Type** %8
  call void (%Type*, %Bool, %Bool) @printType (%Type* %9, %Bool 1, %Bool 1)

;stmt3:
  %10 = load %Unit*, %Unit** @fout
  %11 = bitcast [10 x %Nat8]* @func340_str2 to %Str
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11)

;stmt4:
  %13 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %14 = load %Type*, %Type** %13
  call void (%Type*, %Bool, %Bool) @printType (%Type* %14, %Bool 1, %Bool 1)

;stmt5:
  call void () @space ()

;stmt6:
  %15 = load %Unit*, %Unit** @fout
  %16 = bitcast [8 x %Nat8]* @func340_str3 to %Str
  %17 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %18 = load %Str, %Str* %17
  %19 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16, %Str %18)

;stmt7:
  %20 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1 ; eval_access
  %21 = load %Type*, %Type** %20
  call void (%Type*, %Bool, %Bool) @printType (%Type* %21, %Bool 1, %Bool 1)

;stmt8:
  %22 = bitcast [3 x %Nat8]* @func340_str4 to %Str
  call void (%Str) @o (%Str %22)

;stmt9:
  %23 = load %Unit*, %Unit** @fout
  %24 = bitcast [5 x %Nat8]* @func340_str5 to %Str
  %25 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0 ; eval_access
  %26 = load %Str, %Str* %25
  %27 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %23, %Str %24, %Str %26)
  ret void
}

define void @funcdef (%Str %_id, %Type* %_t, %Block* %_b) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %b = alloca %Block*
  store %Block* %_b, %Block** %b

;stmt0:
  call void () @lab_reset ()

;stmt1:
  %1 = call %Nat32 () @lab_get ()

;stmt2:
  %2 = load %Type*, %Type** %t
  %3 = bitcast %Type* %2 to %Unit*
  %4 = inttoptr %Nat32 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = bitcast [20 x %Nat8]* @func338_str1 to %Str
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt3:
  %7 = load %Block*, %Block** %b
  %8 = bitcast %Block* %7 to %Unit*
  %9 = inttoptr %Nat32 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %11 = bitcast [10 x %Nat8]* @func338_str2 to %Str
  call void (%Str) @o (%Str %11)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %12 = bitcast [10 x %Nat8]* @func338_str3 to %Str
  call void (%Str) @o (%Str %12)
  br label %endif_0
endif_0:

;stmt8:
  %13 = load %Type*, %Type** %t
  %14 = getelementptr inbounds %Type, %Type* %13, i32 0, i32 6 ; eval_access
  %15 = getelementptr inbounds %TypeFunc, %TypeFunc* %14, i32 0, i32 1 ; eval_access
  %16 = load %Type*, %Type** %15
  %17 = load %Type*, %Type** @typeUnit
  %18 = call %Bool (%Type*, %Type*) @type_eq (%Type* %16, %Type* %17)

;stmt9:
  br i1 %18, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %19 = bitcast [5 x %Nat8]* @func338_str4 to %Str
  call void (%Str) @o (%Str %19)
  br label %endif_1
else_1:

;stmt12:

;stmt13:
  %20 = load %Type*, %Type** %t
  %21 = getelementptr inbounds %Type, %Type* %20, i32 0, i32 6 ; eval_access
  %22 = getelementptr inbounds %TypeFunc, %TypeFunc* %21, i32 0, i32 1 ; eval_access
  %23 = load %Type*, %Type** %22
  call void (%Type*, %Bool, %Bool) @printType (%Type* %23, %Bool 1, %Bool 1)
  br label %endif_1
endif_1:

;stmt14:
  %24 = load %Unit*, %Unit** @fout
  %25 = bitcast [7 x %Nat8]* @func338_str5 to %Str
  %26 = load %Str, %Str* %id
  %27 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25, %Str %26)

;stmt15:
  store %Bool 0, %Bool* @need_comma

;stmt16:
  %28 = load %Type*, %Type** %t
  %29 = getelementptr inbounds %Type, %Type* %28, i32 0, i32 6 ; eval_access
  %30 = getelementptr inbounds %TypeFunc, %TypeFunc* %29, i32 0, i32 0 ; eval_access
  %31 = load %List*, %List** %30
  %32 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %31, %ListForeachHandler @vf_print_param, %Unit* %32)

;stmt17:
  %33 = load %Type*, %Type** %t
  %34 = getelementptr inbounds %Type, %Type* %33, i32 0, i32 6 ; eval_access
  %35 = getelementptr inbounds %TypeFunc, %TypeFunc* %34, i32 0, i32 2 ; eval_access
  %36 = load %Bool, %Bool* %35
  br i1 %36, label %then_2, label %else_2
then_2:

;stmt18:

;stmt19:
  %37 = bitcast [6 x %Nat8]* @func338_str6 to %Str
  call void (%Str) @o (%Str %37)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt20:
  %38 = bitcast [2 x %Nat8]* @func338_str7 to %Str
  call void (%Str) @o (%Str %38)

;stmt21:
  %39 = load %Block*, %Block** %b
  %40 = bitcast %Block* %39 to %Unit*
  %41 = inttoptr %Nat32 0 to %Unit*
  %42 = icmp ne %Unit* %40, %41
  br i1 %42, label %then_3, label %else_3
then_3:

;stmt22:

;stmt23:
  %43 = bitcast [3 x %Nat8]* @func338_str8 to %Str
  call void (%Str) @o (%Str %43)

;stmt24:
  %44 = load %Type*, %Type** %t
  %45 = getelementptr inbounds %Type, %Type* %44, i32 0, i32 6 ; eval_access
  %46 = getelementptr inbounds %TypeFunc, %TypeFunc* %45, i32 0, i32 0 ; eval_access
  %47 = load %List*, %List** %46
  %48 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %47, %ListForeachHandler @print_param_loc, %Unit* %48)

;stmt25:
  call void () @reset_local_labels ()

;stmt26:
  %49 = load %Block*, %Block** %b
  call void (%Block*) @print_block (%Block* %49)

;stmt27:
  br i1 %18, label %then_4, label %else_4
then_4:

;stmt28:

;stmt29:
  %50 = bitcast [12 x %Nat8]* @func338_str9 to %Str
  call void (%Str) @o (%Str %50)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:

;stmt30:
  %51 = bitcast [3 x %Nat8]* @func338_str10 to %Str
  call void (%Str) @o (%Str %51)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  ret void
}

define void @foreach_typedef (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %TypeDef*

;stmt1:
  %3 = getelementptr inbounds %TypeDef, %TypeDef* %2, i32 0, i32 0 ; eval_access
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %TypeDef, %TypeDef* %2, i32 0, i32 1 ; eval_access
  %6 = load %Type*, %Type** %5
  call void (%Str, %Type*) @typedef (%Str %4, %Type* %6)
  ret void
}

define void @foreach_constdef (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %ConstDef*

;stmt1:
  %3 = getelementptr inbounds %ConstDef, %ConstDef* %2, i32 0, i32 1 ; eval_access
  %4 = load %Value*, %Value** %3
  %5 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 2 ; eval_access
  %6 = getelementptr inbounds %Storage, %Storage* %5, i32 0, i32 0 ; eval_access
  %7 = load %StorageClass, %StorageClass* %6

;stmt2:
  %8 = icmp eq %StorageClass %7, 3
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %9 = getelementptr inbounds %ConstDef, %ConstDef* %2, i32 0, i32 0 ; eval_access
  %10 = load %Str, %Str* %9
  %11 = getelementptr inbounds %ConstDef, %ConstDef* %2, i32 0, i32 1 ; eval_access
  %12 = load %Value*, %Value** %11
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 2 ; eval_access
  %14 = getelementptr inbounds %Storage, %Storage* %13, i32 0, i32 4 ; eval_access
  %15 = getelementptr inbounds %String, %String* %14, i32 0, i32 1 ; eval_access
  %16 = load %Nat32, %Nat32* %15
  %17 = getelementptr inbounds %ConstDef, %ConstDef* %2, i32 0, i32 1 ; eval_access
  %18 = load %Value*, %Value** %17
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 2 ; eval_access
  %20 = getelementptr inbounds %Storage, %Storage* %19, i32 0, i32 4 ; eval_access
  %21 = getelementptr inbounds %String, %String* %20, i32 0, i32 0 ; eval_access
  %22 = load %Str, %Str* %21
  call void (%Str, %Nat32, %Str) @stringdef (%Str %10, %Nat32 %16, %Str %22)
  br label %endif_0
else_0:

;stmt5:
  %23 = icmp eq %StorageClass %7, 4
  br i1 %23, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %24 = getelementptr inbounds %ConstDef, %ConstDef* %2, i32 0, i32 0 ; eval_access
  %25 = load %Str, %Str* %24
  %26 = getelementptr inbounds %ConstDef, %ConstDef* %2, i32 0, i32 1 ; eval_access
  %27 = load %Value*, %Value** %26
  %28 = getelementptr inbounds %Value, %Value* %27, i32 0, i32 1 ; eval_access
  %29 = load %Type*, %Type** %28
  %30 = getelementptr inbounds %Type, %Type* %29, i32 0, i32 8 ; eval_access
  %31 = getelementptr inbounds %TypeArray, %TypeArray* %30, i32 0, i32 0 ; eval_access
  %32 = load %Type*, %Type** %31
  %33 = getelementptr inbounds %ConstDef, %ConstDef* %2, i32 0, i32 1 ; eval_access
  %34 = load %Value*, %Value** %33
  %35 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 2 ; eval_access
  %36 = getelementptr inbounds %Storage, %Storage* %35, i32 0, i32 5 ; eval_access
  %37 = load %List*, %List** %36
  call void (%Str, %Type*, %List*) @arraydef (%Str %25, %Type* %32, %List* %37)
  br label %endif_1
else_1:

;stmt8:
  %38 = icmp eq %StorageClass %7, 5
  br i1 %38, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %39 = bitcast [37 x %Nat8]* @func342_str1 to %Str
  %40 = inttoptr %Nat32 0 to %Unit*
  %41 = bitcast %Unit* %40 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %39, %TokenInfo* %41)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  ret void
}

define void @foreach_vardef (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %VarDef*

;stmt1:
  %3 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 0 ; eval_access
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 1 ; eval_access
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 2 ; eval_access
  %8 = load %Value*, %Value** %7
  call void (%Str, %Type*, %Value*) @vardef (%Str %4, %Type* %6, %Value* %8)
  ret void
}

define void @foreach_funcdef (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %FuncDef*

;stmt1:
  %3 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 0 ; eval_access
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 1 ; eval_access
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 2 ; eval_access
  %8 = load %Block*, %Block** %7
  call void (%Str, %Type*, %Block*) @funcdef (%Str %4, %Type* %6, %Block* %8)
  ret void
}

define void @print_assembly (%Assembly* %_a) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a

;stmt0:
  %1 = bitcast [20 x %Nat8]* @func345_str1 to %Str
  %2 = load %Assembly*, %Assembly** %a
  %3 = getelementptr inbounds %Assembly, %Assembly* %2, i32 0, i32 0 ; eval_access
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %4)

;stmt1:
  %6 = load %Unit*, %Unit** @fout
  %7 = bitcast [17 x %Nat8]* @func345_str2 to %Str
  %8 = load %Assembly*, %Assembly** %a
  %9 = getelementptr inbounds %Assembly, %Assembly* %8, i32 0, i32 0 ; eval_access
  %10 = load %Str, %Str* %9
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7, %Str %10)

;stmt2:
  %12 = bitcast [11 x %Nat8]* @func345_str3 to %Str
  call void (%Str) @o (%Str %12)

;stmt3:
  %13 = load %Assembly*, %Assembly** %a
  %14 = getelementptr inbounds %Assembly, %Assembly* %13, i32 0, i32 1 ; eval_access
  %15 = load %List*, %List** %14
  %16 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %15, %ListForeachHandler @foreach_typedef, %Unit* %16)

;stmt4:
  %17 = bitcast [12 x %Nat8]* @func345_str4 to %Str
  call void (%Str) @o (%Str %17)

;stmt5:
  %18 = load %Assembly*, %Assembly** %a
  %19 = getelementptr inbounds %Assembly, %Assembly* %18, i32 0, i32 2 ; eval_access
  %20 = load %List*, %List** %19
  %21 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %20, %ListForeachHandler @foreach_constdef, %Unit* %21)

;stmt6:
  %22 = bitcast [10 x %Nat8]* @func345_str5 to %Str
  call void (%Str) @o (%Str %22)

;stmt7:
  %23 = load %Assembly*, %Assembly** %a
  %24 = getelementptr inbounds %Assembly, %Assembly* %23, i32 0, i32 3 ; eval_access
  %25 = load %List*, %List** %24
  %26 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %25, %ListForeachHandler @foreach_vardef, %Unit* %26)

;stmt8:
  %27 = bitcast [11 x %Nat8]* @func345_str6 to %Str
  call void (%Str) @o (%Str %27)

;stmt9:
  %28 = load %Assembly*, %Assembly** %a
  %29 = getelementptr inbounds %Assembly, %Assembly* %28, i32 0, i32 4 ; eval_access
  %30 = load %List*, %List** %29
  %31 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %30, %ListForeachHandler @foreach_funcdef, %Unit* %31)
  ret void
}

define void @print_head (%Arch %_a) {
  %a = alloca %Arch
  store %Arch %_a, %Arch* %a

;stmt0:
  %1 = load %Arch, %Arch* %a
  %2 = icmp eq %Arch %1, 0
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %3 = load %Unit*, %Unit** @fout
  %4 = bitcast [61 x %Nat8]* @func346_str1 to %Str
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4)

;stmt3:
  %6 = load %Unit*, %Unit** @fout
  %7 = bitcast [46 x %Nat8]* @func346_str2 to %Str
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)
  br label %endif_0
else_0:

;stmt4:
  %9 = load %Arch, %Arch* %a
  %10 = icmp eq %Arch %9, 1
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %11 = load %Unit*, %Unit** @fout
  %12 = bitcast [71 x %Nat8]* @func346_str3 to %Str
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12)

;stmt7:
  %14 = load %Unit*, %Unit** @fout
  %15 = bitcast [47 x %Nat8]* @func346_str4 to %Str
  %16 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt8:
  %17 = load %Unit*, %Unit** @fout
  %18 = bitcast [2 x %Nat8]* @func346_str5 to %Str
  %19 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %17, %Str %18)
  ret void
}

define void @tshow (%Unit* %_k, %Unit* %_v, %Unit* %_ctx) {
  %k = alloca %Unit*
  store %Unit* %_k, %Unit** %k
  %v = alloca %Unit*
  store %Unit* %_v, %Unit** %v
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [13 x %Nat8]* @func348_str1 to %Str
  %3 = load %Unit*, %Unit** %k
  %4 = bitcast %Unit* %3 to %Str
  %5 = load %Unit*, %Unit** %v
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %4, %Unit* %5)
  ret void
}

define void @print_type_index (%List* %_index) {
  %index = alloca %List*
  store %List* %_index, %List** %index

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [15 x %Nat8]* @func347_str1 to %Str
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  %4 = load %List*, %List** %index
  %5 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %4, %MapForeachHandler @tshow, %Unit* %5)
  ret void
}

define void @vshow (%Unit* %_k, %Unit* %_v, %Unit* %_ctx) {
  %k = alloca %Unit*
  store %Unit* %_k, %Unit** %k
  %v = alloca %Unit*
  store %Unit* %_v, %Unit** %v
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %Unit*, %Unit** %v
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = load %Unit*, %Unit** @fout
  %4 = bitcast [14 x %Nat8]* @func350_str1 to %Str
  %5 = load %Unit*, %Unit** %k
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4, %Unit* %5, %Value* %2)

;stmt2:
  %7 = load %Unit*, %Unit** @fout
  %8 = bitcast [16 x %Nat8]* @func350_str2 to %Str
  %9 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 0 ; eval_access
  %10 = load %ValueKind, %ValueKind* %9
  %11 = call %Str (%ValueKind) @print_value_kind (%ValueKind %10)
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8, %Str %11)

;stmt3:
  %13 = load %Unit*, %Unit** @fout
  %14 = bitcast [25 x %Nat8]* @func350_str3 to %Str
  %15 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2 ; eval_access
  %16 = getelementptr inbounds %Storage, %Storage* %15, i32 0, i32 0 ; eval_access
  %17 = load %StorageClass, %StorageClass* %16
  %18 = call %Str (%StorageClass) @print_storage_class (%StorageClass %17)
  %19 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %13, %Str %14, %Str %18)

;stmt4:
  %20 = load %Unit*, %Unit** @fout
  %21 = bitcast [23 x %Nat8]* @func350_str4 to %Str
  %22 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2 ; eval_access
  %23 = getelementptr inbounds %Storage, %Storage* %22, i32 0, i32 2 ; eval_access
  %24 = load %Nat32, %Nat32* %23
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %20, %Str %21, %Nat32 %24)

;stmt5:
  %26 = load %Unit*, %Unit** @fout
  %27 = bitcast [5 x %Nat8]* @func350_str5 to %Str
  %28 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %26, %Str %27)
  ret void
}

define void @print_value_index (%List* %_index) {
  %index = alloca %List*
  store %List* %_index, %List** %index

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = bitcast [16 x %Nat8]* @func349_str1 to %Str
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  %4 = load %List*, %List** %index
  %5 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %4, %MapForeachHandler @vshow, %Unit* %5)
  ret void
}

define void @prt_itype (%Unit* %_k, %Unit* %_v, %Unit* %_ctx) {
  %k = alloca %Unit*
  store %Unit* %_k, %Unit** %k
  %v = alloca %Unit*
  store %Unit* %_v, %Unit** %v
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx

;stmt0:
  %1 = load %Unit*, %Unit** %k
  %2 = bitcast %Unit* %1 to %Str

;stmt1:
  %3 = load %Unit*, %Unit** %v
  %4 = bitcast %Unit* %3 to %Type*

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 5 ; eval_access
  %6 = getelementptr inbounds %TypeBasic, %TypeBasic* %5, i32 0, i32 2 ; eval_access
  %7 = load %Bool, %Bool* %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = load %Unit*, %Unit** @fout
  %9 = bitcast [17 x %Nat8]* @func352_str1 to %Str
  %10 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 5 ; eval_access
  %11 = getelementptr inbounds %TypeBasic, %TypeBasic* %10, i32 0, i32 1 ; eval_access
  %12 = load %Nat32, %Nat32* %11
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Str %2, %Nat32 %12)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @printer_init (%Arch %_a, %Str %_fname) {
  %a = alloca %Arch
  store %Arch %_a, %Arch* %a
  %fname = alloca %Str
  store %Str %_fname, %Str* %fname

;stmt0:
  %1 = load %Str, %Str* %fname
  %2 = bitcast [2 x %Nat8]* @func351_str1 to %Str
  %3 = call %Unit* (%Str, %Str) @fopen (%Str %1, %Str %2)
  store %Unit* %3, %Unit** @fout

;stmt1:
  %4 = load %Unit*, %Unit** @fout
  %5 = inttoptr %Nat32 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = bitcast [26 x %Nat8]* @func351_str2 to %Str
  call void (%Str) @fatal (%Str %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = load %Unit*, %Unit** @fout
  %9 = bitcast [29 x %Nat8]* @func351_str3 to %Str
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9)

;stmt5:
  %11 = load %Unit*, %Unit** @fout
  %12 = bitcast [45 x %Nat8]* @func351_str4 to %Str
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12)

;stmt6:
  %14 = load %Arch, %Arch* %a
  call void (%Arch) @print_head (%Arch %14)

;stmt7:
  %15 = load %Unit*, %Unit** @fout
  %16 = bitcast [19 x %Nat8]* @func351_str5 to %Str
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16)

;stmt8:
  %18 = load %Unit*, %Unit** @fout
  %19 = bitcast [18 x %Nat8]* @func351_str6 to %Str
  %20 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %18, %Str %19)

;stmt9:
  %21 = load %Unit*, %Unit** @fout
  %22 = bitcast [18 x %Nat8]* @func351_str7 to %Str
  %23 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22)

;stmt10:
  %24 = load %Unit*, %Unit** @fout
  %25 = bitcast [18 x %Nat8]* @func351_str8 to %Str
  %26 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25)

;stmt11:
  %27 = load %List*, %List** @globalTypeIndex
  %28 = inttoptr %Nat32 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %27, %MapForeachHandler @prt_itype, %Unit* %28)

;stmt12:
  %29 = load %Unit*, %Unit** @fout
  %30 = bitcast [2 x %Nat8]* @func351_str9 to %Str
  %31 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %29, %Str %30)
  ret void
}

define void @type_init () {

;stmt0:
  %1 = bitcast [5 x %Nat8]* @func353_str1 to %Str
  %2 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %1, %Nat32 1, %Nat32 0, %Bool 0, %Bool 0)
  store %Type* %2, %Type** @typeUnit

;stmt1:
  %3 = bitcast [5 x %Nat8]* @func353_str2 to %Str
  %4 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %3, %Nat32 1, %Nat32 1, %Bool 0, %Bool 0)
  store %Type* %4, %Type** @typeBool

;stmt2:
  %5 = bitcast [5 x %Nat8]* @func353_str3 to %Str
  %6 = load %Type*, %Type** @typeUnit
  call void (%Str, %Type*) @bind_type_builtin (%Str %5, %Type* %6)

;stmt3:
  %7 = bitcast [5 x %Nat8]* @func353_str4 to %Str
  %8 = load %Type*, %Type** @typeBool
  call void (%Str, %Type*) @bind_type_builtin (%Str %7, %Type* %8)

;stmt4:
  %9 = bitcast [5 x %Nat8]* @func353_str5 to %Str
  %10 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %9, %Nat32 1, %Nat32 8, %Bool 1, %Bool 1)

;stmt5:
  %11 = bitcast [6 x %Nat8]* @func353_str6 to %Str
  %12 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %11, %Nat32 2, %Nat32 16, %Bool 1, %Bool 1)

;stmt6:
  %13 = bitcast [6 x %Nat8]* @func353_str7 to %Str
  %14 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %13, %Nat32 4, %Nat32 32, %Bool 1, %Bool 1)

;stmt7:
  %15 = bitcast [6 x %Nat8]* @func353_str8 to %Str
  %16 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %15, %Nat32 8, %Nat32 64, %Bool 1, %Bool 1)

;stmt8:
  %17 = bitcast [7 x %Nat8]* @func353_str9 to %Str
  %18 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %17, %Nat32 16, %Nat32 128, %Bool 1, %Bool 1)

;stmt9:
  %19 = bitcast [7 x %Nat8]* @func353_str10 to %Str
  %20 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %19, %Nat32 32, %Nat32 256, %Bool 1, %Bool 1)

;stmt10:
  %21 = bitcast [7 x %Nat8]* @func353_str11 to %Str
  %22 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %21, %Nat32 64, %Nat32 512, %Bool 1, %Bool 1)

;stmt11:
  %23 = bitcast [8 x %Nat8]* @func353_str12 to %Str
  %24 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %23, %Nat32 128, %Nat32 1024, %Bool 1, %Bool 1)

;stmt12:
  %25 = bitcast [5 x %Nat8]* @func353_str13 to %Str
  %26 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %25, %Nat32 1, %Nat32 8, %Bool 1, %Bool 0)

;stmt13:
  %27 = bitcast [6 x %Nat8]* @func353_str14 to %Str
  %28 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %27, %Nat32 2, %Nat32 16, %Bool 1, %Bool 0)

;stmt14:
  %29 = bitcast [6 x %Nat8]* @func353_str15 to %Str
  %30 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %29, %Nat32 4, %Nat32 32, %Bool 1, %Bool 0)

;stmt15:
  %31 = bitcast [6 x %Nat8]* @func353_str16 to %Str
  %32 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %31, %Nat32 8, %Nat32 64, %Bool 1, %Bool 0)

;stmt16:
  %33 = bitcast [7 x %Nat8]* @func353_str17 to %Str
  %34 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %33, %Nat32 16, %Nat32 128, %Bool 1, %Bool 0)

;stmt17:
  %35 = bitcast [7 x %Nat8]* @func353_str18 to %Str
  %36 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %35, %Nat32 32, %Nat32 256, %Bool 1, %Bool 0)

;stmt18:
  %37 = bitcast [7 x %Nat8]* @func353_str19 to %Str
  %38 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %37, %Nat32 64, %Nat32 512, %Bool 1, %Bool 0)

;stmt19:
  %39 = bitcast [8 x %Nat8]* @func353_str20 to %Str
  %40 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %39, %Nat32 128, %Nat32 1024, %Bool 1, %Bool 0)

;stmt20:
  %41 = bitcast [6 x %Nat8]* @func353_str21 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %41, %Type* %16)

;stmt21:
  %42 = bitcast [6 x %Nat8]* @func353_str22 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %42, %Type* %32)

;stmt22:
  %43 = bitcast [6 x %Nat8]* @func353_str23 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %43, %Type* %14)

;stmt23:
  %44 = bitcast [6 x %Nat8]* @func353_str24 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %44, %Type* %30)

;stmt24:
  %45 = bitcast [5 x %Nat8]* @func353_str25 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %45, %Type* %10)

;stmt25:
  %46 = bitcast [5 x %Nat8]* @func353_str26 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %46, %Type* %26)

;stmt26:
  %47 = bitcast [6 x %Nat8]* @func353_str27 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %47, %Type* %12)

;stmt27:
  %48 = bitcast [6 x %Nat8]* @func353_str28 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %48, %Type* %28)

;stmt28:
  store %Type* %26, %Type** @typeChar

;stmt29:
  %49 = load %Type*, %Type** @typeChar
  %50 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %49, %Nat32 0, %Bool 1)
  store %Type* %50, %Type** @typeStr

;stmt30:
  %51 = load %Type*, %Type** @typeStr
  %52 = getelementptr inbounds %Type, %Type* %51, i32 0, i32 1 ; eval_access
  %53 = bitcast [4 x %Nat8]* @func353_str29 to %Str
  store %Str %53, %Str* %52

;stmt31:
  %54 = bitcast [4 x %Nat8]* @func353_str30 to %Str
  %55 = load %Type*, %Type** @typeStr
  call void (%Str, %Type*) @bind_type_builtin (%Str %54, %Type* %55)

;stmt32:
  %56 = bitcast [7 x %Nat8]* @func353_str31 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %56, %Type* %18)

;stmt33:
  %57 = bitcast [7 x %Nat8]* @func353_str32 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %57, %Type* %20)

;stmt34:
  %58 = bitcast [7 x %Nat8]* @func353_str33 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %58, %Type* %22)

;stmt35:
  %59 = bitcast [8 x %Nat8]* @func353_str34 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %59, %Type* %24)

;stmt36:
  %60 = bitcast [7 x %Nat8]* @func353_str35 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %60, %Type* %34)

;stmt37:
  %61 = bitcast [7 x %Nat8]* @func353_str36 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %61, %Type* %36)

;stmt38:
  %62 = bitcast [7 x %Nat8]* @func353_str37 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %62, %Type* %38)

;stmt39:
  %63 = bitcast [8 x %Nat8]* @func353_str38 to %Str
  call void (%Str, %Type*) @bind_type_builtin (%Str %63, %Type* %40)

;stmt40:
  %64 = load %Type*, %Type** @typeUnit
  %65 = call %Type* (%Type*) @type_pointer_new (%Type* %64)
  store %Type* %65, %Type** @typeFreePtr

;stmt41:
  store %Type* %14, %Type** @typeBaseInt

;stmt42:
  store %Type* %30, %Type** @typeBaseNat

;stmt43:
  store %Type* %30, %Type** @typeSizeof

;stmt44:
  store %Type* %12, %Type** @typeAlignof

;stmt45:
  store %Type* %12, %Type** @typeEnum
  ret void
}

define void @value_init () {

;stmt0:
  %1 = load %Type*, %Type** @typeBool
  %2 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %1, %Int64 0)

;stmt1:
  %3 = bitcast [6 x %Nat8]* @func354_str1 to %Str
  call void (%Str, %Value*) @bind_value_builtin (%Str %3, %Value* %2)

;stmt2:
  %4 = load %Type*, %Type** @typeBool
  %5 = call %Value* (%Type*, %Int64) @value_new_imm_const (%Type* %4, %Int64 1)

;stmt3:
  %6 = bitcast [5 x %Nat8]* @func354_str2 to %Str
  call void (%Str, %Value*) @bind_value_builtin (%Str %6, %Value* %5)
  ret void
}

define void @init () {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 512)
  %2 = bitcast %Unit* %1 to %Str
  store %Str %2, %Str* @pdir

;stmt1:
  %3 = load %Str, %Str* @pdir
  %4 = call %Str (%Str, %Nat32) @getcwd (%Str %3, %Nat32 512)

;stmt2:
  %5 = call %List* () @map_new ()
  store %List* %5, %List** @liblist

;stmt3:
  %6 = bitcast [10 x %Nat8]* @MINOR_LIB_ENV_VAR to %Str
  %7 = call %Str (%Str) @getenv (%Str %6)

;stmt4:
  %8 = bitcast %Str %7 to %Unit*
  %9 = inttoptr %Nat32 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %11 = bitcast [42 x %Nat8]* @func355_str1 to %Str
  call void (%Str) @fatal (%Str %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  call void (%Str) @liblist_add (%Str %7)

;stmt8:
  %12 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  %13 = bitcast [7 x %Nat8]* @func355_str2 to %Str
  call void (%Assembly*, %Str) @asm_init (%Assembly* %12, %Str %13)

;stmt9:
  %14 = call %List* () @map_new ()
  store %List* %14, %List** @globalTypeIndex

;stmt10:
  %15 = call %List* () @map_new ()
  store %List* %15, %List** @globalValueIndex

;stmt11:
  %16 = call %List* () @map_new ()
  store %List* %16, %List** @settings

;stmt12:
  %17 = bitcast [12 x %Nat8]* @func355_str3 to %Str
  call void (%Str, %Nat64) @set (%Str %17, %Nat64 64)

;stmt13:
  %18 = bitcast [14 x %Nat8]* @func355_str4 to %Str
  call void (%Str, %Nat64) @set (%Str %18, %Nat64 8)

;stmt14:
  %19 = bitcast [9 x %Nat8]* @func355_str5 to %Str
  call void (%Str, %Nat64) @set (%Str %19, %Nat64 1)

;stmt15:
  %20 = bitcast [9 x %Nat8]* @func355_str6 to %Str
  call void (%Str, %Nat64) @set (%Str %20, %Nat64 2)

;stmt16:
  %21 = bitcast [12 x %Nat8]* @func355_str7 to %Str
  call void (%Str, %Nat64) @set (%Str %21, %Nat64 8)

;stmt17:
  %22 = bitcast [12 x %Nat8]* @func355_str8 to %Str
  call void (%Str, %Nat64) @set (%Str %22, %Nat64 8)

;stmt18:
  %23 = bitcast [12 x %Nat8]* @func355_str9 to %Str
  call void (%Str, %Nat64) @set (%Str %23, %Nat64 0)

;stmt19:
  call void () @type_init ()

;stmt20:
  call void () @value_init ()
  ret void
}

define void @handle_ini (%Str %_fname) {
  %fname = alloca %Str
  store %Str %_fname, %Str* %fname

;stmt0:
  %1 = load %Str, %Str* %fname
  %2 = call %List* (%Str) @tokenize (%Str %1)

;stmt1:
  %3 = getelementptr inbounds %List, %List* %2, i32 0, i32 0 ; eval_access
  %4 = load %Node*, %Node** %3
  call void (%Node*) @sett (%Node* %4)

;stmt2:
  %5 = bitcast %List* %2 to %Unit*
  %6 = inttoptr %Nat32 0 to %Unit*
  %7 = icmp eq %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = bitcast [12 x %Nat8]* @func356_str1 to %Str
  %9 = inttoptr %Nat32 0 to %Unit*
  %10 = bitcast %Unit* %9 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %8, %TokenInfo* %10)

;stmt5:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %d = alloca %Nat64

;stmt9:
  call void () @skip_nl ()

;stmt10:
  %12 = call %Bool () @eof ()
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt13:
  %14 = call %Str () @parse_id ()

;stmt14:
  %15 = bitcast [2 x %Nat8]* @func356_str2 to %Str
  %16 = call %Bool (%Str) @need (%Str %15)

;stmt15:
  %17 = call %Token* () @ctok ()

;stmt16:
  %18 = getelementptr inbounds %Token, %Token* %17, i32 0, i32 0 ; eval_access
  %19 = load %TokenType, %TokenType* %18
  %20 = icmp eq %TokenType %19, 2
  br i1 %20, label %then_2, label %else_2
then_2:

;stmt17:

;stmt18:
  %21 = getelementptr inbounds %Token, %Token* %17, i32 0, i32 2 ; eval_access
  %22 = bitcast [0 x %Nat8]* %21 to %Unit*
  %23 = bitcast [5 x %Nat8]* @func356_str3 to %Str
  %24 = getelementptr inbounds %Nat64, %Nat64* %d, i32 0 ; ref
  %25 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %22, %Str %23, %Nat64* %24)

;stmt19:
  call void () @skip ()
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt20:
  %26 = bitcast [11 x %Nat8]* @func356_str4 to %Str
  %27 = load %Nat64, %Nat64* %d
  %28 = call %Int32 (%Str, ...) @printf (%Str %26, %Str %14, %Nat64 %27)

;stmt21:
  %29 = load %Nat64, %Nat64* %d
  call void (%Str, %Nat64) @set (%Str %14, %Nat64 %29)
  br label %continue_0
break_0:
  ret void
}

define %Int32 @main (%Int32 %_argc, %Str* %_argv) {
  %argc = alloca %Int32
  store %Int32 %_argc, %Int32* %argc
  %argv = alloca %Str*
  store %Str* %_argv, %Str** %argv

;stmt0:
  %1 = bitcast [11 x %Nat8]* @func357_str1 to %Str
  %2 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 0, %Int32 5)

;stmt1:
  call void () @init ()

;stmt2:
  %3 = bitcast [5 x %Nat8]* @func357_str2 to %Str
  %4 = call %Source* (%Str) @source_open (%Str %3)
  call void (%Source*) @parse (%Source* %4)

;stmt3:
  %5 = bitcast [11 x %Nat8]* @func357_str3 to %Str
  %6 = load %Nat32, %Nat32* @lines
  %7 = call %Int32 (%Str, ...) @printf (%Str %5, %Nat32 %6)

;stmt4:
  call void () @checkMain ()

;stmt5:
  %8 = load %Nat32, %Nat32* @errcnt
  %9 = icmp ugt %Nat32 %8, 0
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %10 = bitcast [12 x %Nat8]* @func357_str4 to %Str
  %11 = load %Nat32, %Nat32* @errcnt
  %12 = call %Int32 (%Str, ...) @printf (%Str %10, %Nat32 %11)

;stmt8:
  %13 = load %Nat32, %Nat32* @errcnt
  %14 = bitcast %Nat32 %13 to %Int32
  ret %Int32 %14
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  %arch = alloca %Arch

;stmt10:
  store %Arch 0, %Arch* %arch

;stmt11:
  %16 = load %Int32, %Int32* %argc
  %17 = icmp sgt %Int32 %16, 1
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %18 = load %Str*, %Str** %argv
  %19 = getelementptr inbounds %Str, %Str* %18, %Int32 1 ; eval_index
  %20 = load %Str, %Str* %19
  %21 = bitcast [15 x %Nat8]* @func357_str5 to %Str
  %22 = call %Int32 (%Str, %Str) @strcmp (%Str %20, %Str %21)
  %23 = icmp eq %Int32 %22, 0
  br i1 %23, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %24 = bitcast [16 x %Nat8]* @func357_str6 to %Str
  %25 = call %Int32 (%Str, ...) @printf (%Str %24)

;stmt16:
  store %Arch 1, %Arch* %arch
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt17:
  %26 = load %Arch, %Arch* %arch
  %27 = bitcast [8 x %Nat8]* @func357_str7 to %Str
  call void (%Arch, %Str) @printer_init (%Arch %26, %Str %27)

;stmt18:
  %28 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0 ; ref
  call void (%Assembly*) @print_assembly (%Assembly* %28)

;stmt19:
  %29 = load %Nat32, %Nat32* @errcnt
  %30 = icmp ne %Nat32 %29, 0
  %31 = sext %Bool %30 to %Int32
  ret %Int32 %31
}

define void @usage () {

;stmt0:
  %1 = bitcast [8 x %Nat8]* @func358_str1 to %Str
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %3 = bitcast [16 x %Nat8]* @func358_str2 to %Str
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
  ret void
}