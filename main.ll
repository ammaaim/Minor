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
%ListSearchHandler = type %Bool (%Unit*, %Unit*, %Nat32)*
%ListMapHandler = type %Unit* (%Unit*, %Unit*, %Nat32)*
%List = type {%Node*, %Node*, %Nat64}
%Map = type {%Node*, %Node*, %Nat64}
%MapForeachHandler = type void (%Unit*, %Unit*, %Unit*)*
%Settings = type {%Nat32, %Nat32, %Nat32, %Nat32, %Nat32, %Nat32}
%TokenType = type %Int16
%TokenInfo = type {%Str, %Nat32, %Nat16, %Nat16}
%Token = type {%TokenType, %TokenInfo, [0 x %Nat8]}
%State = type {%Int32, %TokenType, [256 x %Nat8], %Nat16, %Nat32, %Nat32, %Nat16, %Str, %Nat8}
%Rule = type %Bool (%Nat8)*
%SourceType = type %Int16
%SourceInfo = type {%SourceType, %Str, %Str}
%Source = type {%SourceInfo, %List*, %Node*}
%TypeBasic = type {%Str, %Nat32, %Bool, %Bool}
%TypeRecord = type {%List*, %Nat32}
%Field = type {%Str, %Type*, %Nat16, %TokenInfo*}
%FieldHandleContext = type {%Nat16, %Nat8, %Nat32}
%TypeEnum = type {%List*, %Nat32}
%EnumConstructor = type {%Str, %Int64, %TokenInfo*}
%TypeArray = type {%Type*, %Nat32, %Bool}
%TypePointer = type {%Type*}
%TypeFunc = type {%List*, %Type*, %Bool}
%TypeKind = type %Int16
%Type = type {%TypeKind, %Str, %Nat32, %Nat32, %Nat8, %TypeBasic, %TypeFunc, %TypePointer, %TypeArray, %TypeRecord, %TypeEnum, %TokenInfo*, %TokenInfo*, %TokenInfo*}
%Index = type {%List, %List}
%ValueParser = type %Value* ()*
%StmtParser = type %Stmt* (%TokenInfo*)*
%Block = type {%Block*, %Index, %List, %List, %TokenInfo*}
%Expr = type {%Value*, %Nat32}
%If = type {%Value*, %Stmt*, %Stmt*}
%While = type {%Value*, %Stmt*}
%VarDef = type {%Str, %Nat32, %Type*, %Value*, %TokenInfo*}
%StmtKind = type %Int16
%Stmt = type {%StmtKind, [2 x %Value*], %Block*, %Expr*, %VarDef*, %While*, %If*, %Str, %TokenInfo*}
%DefinitionKind = type %Int16
%Pad = type [3 x %Nat8]
%Definition = type {%DefinitionKind, %Str, %Pad, %StringDef, %Pad, %TypeDef, %Pad, %ConstDef, %Pad, %ArrayDef, %Pad, %FuncDef, %Pad, %AssemblyVarDef, %Pad, %AliasDef}
%TypeDef = type {%Type*}
%ConstDef = type {%Value*}
%StringDef = type {%Str, %Nat32}
%ArrayDef = type {%Type*, %Nat32, %List*}
%FuncDef = type {%Type*, %Block*}
%AssemblyVarDef = type {%Type*, %Value*}
%AliasDef = type {%Str, %Type*, %Str}
%Assembly = type {%Str, %List, %List, %List, %List, %List, %List}
%TypeParser = type %Type* ()*
%ValueUn = type {%Value*}
%ValueBin = type {%Value*, %Value*}
%ValueIndex = type {%Value*, %Value*}
%ValueAccess = type {%Value*, %Str}
%ValueCall = type {%Value*, %List*}
%ValueCast = type {%Value*, %Type*}
%ValueKind = type %Int16
%Value = type {%ValueKind, %Type*, %Int64, %Definition*, %VarDef*, %Field*, %Expr*, %ValueUn, %ValueBin, %ValueIndex, %ValueAccess, %ValueCast, %ValueCall, %Type*, %TokenInfo*, %TokenInfo*, %TokenInfo*}
%ModuleContext = type {%Source*, %Index, %List}
%Module = type {%Source*, %Index, %List}
%FuncContext = type {%Str, %Value*, %Block*, %Nat32, %Nat32, %Nat32, %Nat32, %Nat32}
%MetadataClass = type %Int16
%Metadata = type {%MetadataClass}
%OperandKind = type %Int16
%Operand = type {%OperandKind, %Type*, %Int64, %Str, %Nat32}
%Eval = type %Operand (%Value*)*
%Arguments = type {[64 x %Operand], %Nat16}
%Arch = type %Int16

;strings:

@.str._func7_str1 = private unnamed_addr constant [19 x i8] c"assert failed: %s\0A\00", align 1
@_func7_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func7_str1, i32 0, i32 0), align 8
@.str._func8_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_func8_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func8_str1, i32 0, i32 0), align 8
@.str._func42_str1 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@_func42_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func42_str1, i32 0, i32 0), align 8
@.str._func42_str2 = private unnamed_addr constant [2 x i8] c"Z\00", align 1
@_func42_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func42_str2, i32 0, i32 0), align 8
@.str._func42_str3 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@_func42_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func42_str3, i32 0, i32 0), align 8
@.str._func42_str4 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@_func42_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func42_str4, i32 0, i32 0), align 8
@.str._func43_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@_func43_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func43_str1, i32 0, i32 0), align 8
@.str._func43_str2 = private unnamed_addr constant [2 x i8] c"9\00", align 1
@_func43_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func43_str2, i32 0, i32 0), align 8
@.str._func45_str1 = private unnamed_addr constant [11 x i8] c"module=%s\0A\00", align 1
@_func45_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func45_str1, i32 0, i32 0), align 8
@.str._func45_str2 = private unnamed_addr constant [17 x i8] c"module not exist\00", align 1
@_func45_str2 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func45_str2, i32 0, i32 0), align 8
@.str._func47_str1 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@_func47_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func47_str1, i32 0, i32 0), align 8
@.str._func47_str2 = private unnamed_addr constant [16 x i8] c"too long token\0A\00", align 1
@_func47_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func47_str2, i32 0, i32 0), align 8
@.str._func48_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@_func48_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func48_str1, i32 0, i32 0), align 8
@.str._func48_str2 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@_func48_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func48_str2, i32 0, i32 0), align 8
@.str._func49_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@_func49_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func49_str1, i32 0, i32 0), align 8
@.str._func50_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_func50_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func50_str1, i32 0, i32 0), align 8
@.str._func50_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func50_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func50_str2, i32 0, i32 0), align 8
@.str._func51_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@_func51_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func51_str1, i32 0, i32 0), align 8
@.str._func51_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func51_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func51_str2, i32 0, i32 0), align 8
@.str._func52_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@_func52_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func52_str1, i32 0, i32 0), align 8
@.str._func52_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func52_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func52_str2, i32 0, i32 0), align 8
@.str._func53_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func53_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func53_str1, i32 0, i32 0), align 8
@.str._func54_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func54_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func54_str1, i32 0, i32 0), align 8
@.str._func55_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@_func55_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func55_str1, i32 0, i32 0), align 8
@.str._func57_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func57_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func57_str1, i32 0, i32 0), align 8
@.str._func58_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@_func58_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func58_str1, i32 0, i32 0), align 8
@.str._func58_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func58_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func58_str2, i32 0, i32 0), align 8
@.str._func58_str3 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func58_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func58_str3, i32 0, i32 0), align 8
@.str._func58_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@_func58_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func58_str4, i32 0, i32 0), align 8
@.str._func58_str5 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_func58_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func58_str5, i32 0, i32 0), align 8
@.str._func58_str6 = private unnamed_addr constant [2 x i8] c">\00", align 1
@_func58_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func58_str6, i32 0, i32 0), align 8
@.str._func58_str7 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@_func58_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func58_str7, i32 0, i32 0), align 8
@.str._func58_str8 = private unnamed_addr constant [2 x i8] c"!\00", align 1
@_func58_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func58_str8, i32 0, i32 0), align 8
@.str._func58_str9 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@_func58_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func58_str9, i32 0, i32 0), align 8
@.str._func58_str10 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@_func58_str10 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func58_str10, i32 0, i32 0), align 8
@.str._func59_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_func59_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func59_str1, i32 0, i32 0), align 8
@.str._func59_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func59_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func59_str2, i32 0, i32 0), align 8
@.str._func59_str3 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@_func59_str3 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func59_str3, i32 0, i32 0), align 8
@.str._func59_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func59_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func59_str4, i32 0, i32 0), align 8
@.str._func59_str5 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_func59_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func59_str5, i32 0, i32 0), align 8
@.str._func59_str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func59_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func59_str6, i32 0, i32 0), align 8
@.str._func60_str1 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@_func60_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str1, i32 0, i32 0), align 8
@.str._func60_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@_func60_str2 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func60_str2, i32 0, i32 0), align 8
@.str._func60_str3 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@_func60_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str3, i32 0, i32 0), align 8
@.str._func60_str4 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@_func60_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str4, i32 0, i32 0), align 8
@.str._func60_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func60_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str5, i32 0, i32 0), align 8
@.str._func60_str6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@_func60_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str6, i32 0, i32 0), align 8
@.str._func60_str7 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@_func60_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str7, i32 0, i32 0), align 8
@.str._func60_str8 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@_func60_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str8, i32 0, i32 0), align 8
@.str._func60_str9 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@_func60_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str9, i32 0, i32 0), align 8
@.str._func60_str10 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@_func60_str10 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str10, i32 0, i32 0), align 8
@.str._func60_str11 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@_func60_str11 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str11, i32 0, i32 0), align 8
@.str._func60_str12 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@_func60_str12 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str12, i32 0, i32 0), align 8
@.str._func60_str13 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@_func60_str13 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str13, i32 0, i32 0), align 8
@.str._func60_str14 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@_func60_str14 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str14, i32 0, i32 0), align 8
@.str._func60_str15 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@_func60_str15 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str15, i32 0, i32 0), align 8
@.str._func60_str16 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@_func60_str16 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str16, i32 0, i32 0), align 8
@.str._func60_str17 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@_func60_str17 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str17, i32 0, i32 0), align 8
@.str._func60_str18 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@_func60_str18 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str18, i32 0, i32 0), align 8
@.str._func60_str19 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@_func60_str19 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str19, i32 0, i32 0), align 8
@.str._func60_str20 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@_func60_str20 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func60_str20, i32 0, i32 0), align 8
@.str._func60_str21 = private unnamed_addr constant [17 x i8] c"too long string\0A\00", align 1
@_func60_str21 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func60_str21, i32 0, i32 0), align 8
@.str._func66_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_func66_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func66_str1, i32 0, i32 0), align 8
@.str._func66_str2 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@_func66_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func66_str2, i32 0, i32 0), align 8
@.str._func66_str3 = private unnamed_addr constant [8 x i8] c"/main.m\00", align 1
@_func66_str3 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func66_str3, i32 0, i32 0), align 8
@.str.E_TYPE_ERROR = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@E_TYPE_ERROR = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.E_TYPE_ERROR, i32 0, i32 0), align 8
@.str.E_EXPECTED_RETURN = private unnamed_addr constant [16 x i8] c"expected return\00", align 1
@E_EXPECTED_RETURN = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.E_EXPECTED_RETURN, i32 0, i32 0), align 8
@.str._func70_str1 = private unnamed_addr constant [23 x i8] c"\0A%c[0;%dminfo:%c[0m %s\00", align 1
@_func70_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func70_str1, i32 0, i32 0), align 8
@.str._func71_str1 = private unnamed_addr constant [35 x i8] c"\0A%c[0;%dmwarning%c[0m (%s:%d) : %s\00", align 1
@_func71_str1 = constant i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str._func71_str1, i32 0, i32 0), align 8
@.str._func71_str2 = private unnamed_addr constant [26 x i8] c"\0A%c[0;%dmwarning:%c[0m %s\00", align 1
@_func71_str2 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func71_str2, i32 0, i32 0), align 8
@.str._func71_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func71_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func71_str3, i32 0, i32 0), align 8
@.str._func72_str1 = private unnamed_addr constant [24 x i8] c"\0A%c[0;%dmerror:%c[0m %s\00", align 1
@_func72_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func72_str1, i32 0, i32 0), align 8
@.str._func72_str2 = private unnamed_addr constant [33 x i8] c"\0A%c[0;%dmerror%c[0m (%s:%d) : %s\00", align 1
@_func72_str2 = constant i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str._func72_str2, i32 0, i32 0), align 8
@.str._func72_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func72_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func72_str3, i32 0, i32 0), align 8
@.str._func72_str4 = private unnamed_addr constant [14 x i8] c"*** STOP ***\0A\00", align 1
@_func72_str4 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func72_str4, i32 0, i32 0), align 8
@.str._func73_str1 = private unnamed_addr constant [17 x i8] c"\0A%c[0;%dm%s%c[0m\00", align 1
@_func73_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func73_str1, i32 0, i32 0), align 8
@.str._func73_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func73_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func73_str2, i32 0, i32 0), align 8
@.str._func74_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func74_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func74_str1, i32 0, i32 0), align 8
@.str._func74_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func74_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func74_str2, i32 0, i32 0), align 8
@.str._func75_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func75_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func75_str1, i32 0, i32 0), align 8
@.str._func75_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@_func75_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func75_str2, i32 0, i32 0), align 8
@.str._func75_str3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@_func75_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func75_str3, i32 0, i32 0), align 8
@.str._func75_str4 = private unnamed_addr constant [15 x i8] c"%c[0;%dm^%c[0m\00", align 1
@_func75_str4 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func75_str4, i32 0, i32 0), align 8
@.str._func76_str1 = private unnamed_addr constant [24 x i8] c"%c[0;%dmfatal:%c[0m %s\0A\00", align 1
@_func76_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func76_str1, i32 0, i32 0), align 8
@.str._func77_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@_func77_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func77_str1, i32 0, i32 0), align 8
@.str._func77_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@_func77_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func77_str2, i32 0, i32 0), align 8
@.str._func77_str3 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func77_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func77_str3, i32 0, i32 0), align 8
@.str._func77_str4 = private unnamed_addr constant [14 x i8] c"<TypeUnknown>\00", align 1
@_func77_str4 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func77_str4, i32 0, i32 0), align 8
@.str._func77_str5 = private unnamed_addr constant [14 x i8] c"<TypeNumeric>\00", align 1
@_func77_str5 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func77_str5, i32 0, i32 0), align 8
@.str._func77_str6 = private unnamed_addr constant [31 x i8] c"unkn type kind %d, maybe func?\00", align 1
@_func77_str6 = constant i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str._func77_str6, i32 0, i32 0), align 8
@.str._func78_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@_func78_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func78_str1, i32 0, i32 0), align 8
@.str._func79_str1 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@_func79_str1 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func79_str1, i32 0, i32 0), align 8
@.str._func79_str2 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func79_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func79_str2, i32 0, i32 0), align 8
@.str._func78_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func78_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func78_str2, i32 0, i32 0), align 8
@.str._func78_str3 = private unnamed_addr constant [16 x i8] c"<record:0x%02x>\00", align 1
@_func78_str3 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func78_str3, i32 0, i32 0), align 8
@.str._func80_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func80_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func80_str1, i32 0, i32 0), align 8
@.str._func81_str1 = private unnamed_addr constant [7 x i8] c"<%%s> \00", align 1
@_func81_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func81_str1, i32 0, i32 0), align 8
@.str._func80_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func80_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func80_str2, i32 0, i32 0), align 8
@.str._func82_str1 = private unnamed_addr constant [3 x i8] c"[]\00", align 1
@_func82_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func82_str1, i32 0, i32 0), align 8
@.str._func82_str2 = private unnamed_addr constant [5 x i8] c"[%d]\00", align 1
@_func82_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func82_str2, i32 0, i32 0), align 8
@.str._func83_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@_func83_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func83_str1, i32 0, i32 0), align 8
@.str._func84_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func84_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func84_str1, i32 0, i32 0), align 8
@.str._func84_str2 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@_func84_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func84_str2, i32 0, i32 0), align 8
@.str._func83_str2 = private unnamed_addr constant [6 x i8] c") -> \00", align 1
@_func83_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func83_str2, i32 0, i32 0), align 8
@.str._func87_str1 = private unnamed_addr constant [10 x i8] c"field_new\00", align 1
@_func87_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func87_str1, i32 0, i32 0), align 8
@.str._func104_str1 = private unnamed_addr constant [13 x i8] c"unknown type\00", align 1
@_func104_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func104_str1, i32 0, i32 0), align 8
@.str._func107_str1 = private unnamed_addr constant [27 x i8] c"m2/type/func f1.id == Nil!\00", align 1
@_func107_str1 = constant i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str._func107_str1, i32 0, i32 0), align 8
@.str._func107_str2 = private unnamed_addr constant [27 x i8] c"m2/type/func f2.id == Nil!\00", align 1
@_func107_str2 = constant i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str._func107_str2, i32 0, i32 0), align 8
@.str._func110_str1 = private unnamed_addr constant [26 x i8] c"type_eq unknown type kind\00", align 1
@_func110_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func110_str1, i32 0, i32 0), align 8
@.str._func111_str1 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@_func111_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func111_str1, i32 0, i32 0), align 8
@.str._func111_str2 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@_func111_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func111_str2, i32 0, i32 0), align 8
@.str._func111_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@_func111_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func111_str3, i32 0, i32 0), align 8
@.str._func111_str4 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@_func111_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func111_str4, i32 0, i32 0), align 8
@.str._func111_str5 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@_func111_str5 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func111_str5, i32 0, i32 0), align 8
@.str._func111_str6 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@_func111_str6 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str6, i32 0, i32 0), align 8
@.str._func111_str7 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@_func111_str7 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str7, i32 0, i32 0), align 8
@.str._func111_str8 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@_func111_str8 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str8, i32 0, i32 0), align 8
@.str._func111_str9 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@_func111_str9 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str9, i32 0, i32 0), align 8
@.str._func111_str10 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@_func111_str10 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str10, i32 0, i32 0), align 8
@.str._func111_str11 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@_func111_str11 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str11, i32 0, i32 0), align 8
@.str._func111_str12 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@_func111_str12 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func111_str12, i32 0, i32 0), align 8
@.str._func111_str13 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@_func111_str13 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func111_str13, i32 0, i32 0), align 8
@.str._func111_str14 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@_func111_str14 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str14, i32 0, i32 0), align 8
@.str._func111_str15 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@_func111_str15 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str15, i32 0, i32 0), align 8
@.str._func111_str16 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@_func111_str16 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str16, i32 0, i32 0), align 8
@.str._func111_str17 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@_func111_str17 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str17, i32 0, i32 0), align 8
@.str._func111_str18 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@_func111_str18 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str18, i32 0, i32 0), align 8
@.str._func111_str19 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@_func111_str19 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str19, i32 0, i32 0), align 8
@.str._func111_str20 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@_func111_str20 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func111_str20, i32 0, i32 0), align 8
@.str._func111_str21 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@_func111_str21 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str21, i32 0, i32 0), align 8
@.str._func111_str22 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@_func111_str22 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str22, i32 0, i32 0), align 8
@.str._func111_str23 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@_func111_str23 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str23, i32 0, i32 0), align 8
@.str._func111_str24 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@_func111_str24 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str24, i32 0, i32 0), align 8
@.str._func111_str25 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@_func111_str25 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func111_str25, i32 0, i32 0), align 8
@.str._func111_str26 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@_func111_str26 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func111_str26, i32 0, i32 0), align 8
@.str._func111_str27 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@_func111_str27 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str27, i32 0, i32 0), align 8
@.str._func111_str28 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@_func111_str28 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func111_str28, i32 0, i32 0), align 8
@.str._func111_str29 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@_func111_str29 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func111_str29, i32 0, i32 0), align 8
@.str._func111_str30 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@_func111_str30 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func111_str30, i32 0, i32 0), align 8
@.str._func111_str31 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@_func111_str31 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str31, i32 0, i32 0), align 8
@.str._func111_str32 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@_func111_str32 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str32, i32 0, i32 0), align 8
@.str._func111_str33 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@_func111_str33 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str33, i32 0, i32 0), align 8
@.str._func111_str34 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@_func111_str34 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func111_str34, i32 0, i32 0), align 8
@.str._func111_str35 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@_func111_str35 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str35, i32 0, i32 0), align 8
@.str._func111_str36 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@_func111_str36 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str36, i32 0, i32 0), align 8
@.str._func111_str37 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@_func111_str37 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func111_str37, i32 0, i32 0), align 8
@.str._func111_str38 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@_func111_str38 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func111_str38, i32 0, i32 0), align 8
@.str._func112_str1 = private unnamed_addr constant [9 x i8] c"type_new\00", align 1
@_func112_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func112_str1, i32 0, i32 0), align 8
@.str._func118_str1 = private unnamed_addr constant [13 x i8] c"unknown type\00", align 1
@_func118_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func118_str1, i32 0, i32 0), align 8
@.str._func124_str1 = private unnamed_addr constant [44 x i8] c"type bind error: attempt to id redefinition\00", align 1
@_func124_str1 = constant i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str._func124_str1, i32 0, i32 0), align 8
@.str._func131_str1 = private unnamed_addr constant [45 x i8] c"value bind error: attempt to id redefinition\00", align 1
@_func131_str1 = constant i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str._func131_str1, i32 0, i32 0), align 8
@.str._func136_str1 = private unnamed_addr constant [5 x i8] c"self\00", align 1
@_func136_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func136_str1, i32 0, i32 0), align 8
@.str._func137_str1 = private unnamed_addr constant [6 x i8] c"%s.%u\00", align 1
@_func137_str1 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func137_str1, i32 0, i32 0), align 8
@.str._func138_str1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@_func138_str1 = constant i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str._func138_str1, i32 0, i32 0), align 8
@.str._func139_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@_func139_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func139_str1, i32 0, i32 0), align 8
@.str._func140_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@_func140_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func140_str1, i32 0, i32 0), align 8
@.str._func141_str1 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@_func141_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func141_str1, i32 0, i32 0), align 8
@.str._func142_str1 = private unnamed_addr constant [4 x i8] c"arr\00", align 1
@_func142_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func142_str1, i32 0, i32 0), align 8
@.str._func143_str1 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@_func143_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func143_str1, i32 0, i32 0), align 8
@.str._func144_str1 = private unnamed_addr constant [5 x i8] c"Type\00", align 1
@_func144_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func144_str1, i32 0, i32 0), align 8
@.str._func145_str1 = private unnamed_addr constant [24 x i8] c"expected constant value\00", align 1
@_func145_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func145_str1, i32 0, i32 0), align 8
@.str._func146_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@_func146_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func146_str1, i32 0, i32 0), align 8
@.str._func147_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@_func147_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func147_str1, i32 0, i32 0), align 8
@.str._func148_str1 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@_func148_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func148_str1, i32 0, i32 0), align 8
@.str._func149_str1 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@_func149_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func149_str1, i32 0, i32 0), align 8
@.str._func149_str2 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@_func149_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func149_str2, i32 0, i32 0), align 8
@.str._func150_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@_func150_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func150_str1, i32 0, i32 0), align 8
@.str._func150_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@_func150_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func150_str2, i32 0, i32 0), align 8
@.str._func150_str3 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@_func150_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func150_str3, i32 0, i32 0), align 8
@.str._func150_str4 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@_func150_str4 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func150_str4, i32 0, i32 0), align 8
@.str._func151_str1 = private unnamed_addr constant [3 x i8] c"<<\00", align 1
@_func151_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func151_str1, i32 0, i32 0), align 8
@.str._func151_str2 = private unnamed_addr constant [3 x i8] c">>\00", align 1
@_func151_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func151_str2, i32 0, i32 0), align 8
@.str._func152_str1 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@_func152_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func152_str1, i32 0, i32 0), align 8
@.str._func152_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@_func152_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func152_str2, i32 0, i32 0), align 8
@.str._func153_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func153_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func153_str1, i32 0, i32 0), align 8
@.str._func153_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_func153_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func153_str2, i32 0, i32 0), align 8
@.str._func153_str3 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@_func153_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func153_str3, i32 0, i32 0), align 8
@.str._func154_str1 = private unnamed_addr constant [3 x i8] c"to\00", align 1
@_func154_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func154_str1, i32 0, i32 0), align 8
@.str._func155_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func155_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func155_str1, i32 0, i32 0), align 8
@.str._func155_str2 = private unnamed_addr constant [2 x i8] c"&\00", align 1
@_func155_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func155_str2, i32 0, i32 0), align 8
@.str._func155_str3 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@_func155_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func155_str3, i32 0, i32 0), align 8
@.str._func155_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@_func155_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func155_str4, i32 0, i32 0), align 8
@.str._func155_str5 = private unnamed_addr constant [7 x i8] c"sizeof\00", align 1
@_func155_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func155_str5, i32 0, i32 0), align 8
@.str._func155_str6 = private unnamed_addr constant [23 x i8] c"sizeof expected <type>\00", align 1
@_func155_str6 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func155_str6, i32 0, i32 0), align 8
@.str._func155_str7 = private unnamed_addr constant [8 x i8] c"alignof\00", align 1
@_func155_str7 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func155_str7, i32 0, i32 0), align 8
@.str._func155_str8 = private unnamed_addr constant [24 x i8] c"alignof expected <type>\00", align 1
@_func155_str8 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func155_str8, i32 0, i32 0), align 8
@.str._func156_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@_func156_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func156_str1, i32 0, i32 0), align 8
@.str._func156_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func156_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func156_str2, i32 0, i32 0), align 8
@.str._func156_str3 = private unnamed_addr constant [3 x i8] c",)\00", align 1
@_func156_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func156_str3, i32 0, i32 0), align 8
@.str._func156_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func156_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func156_str4, i32 0, i32 0), align 8
@.str._func156_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func156_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func156_str5, i32 0, i32 0), align 8
@.str._func156_str6 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func156_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func156_str6, i32 0, i32 0), align 8
@.str._func156_str7 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func156_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func156_str7, i32 0, i32 0), align 8
@.str._func156_str8 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@_func156_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func156_str8, i32 0, i32 0), align 8
@.str._func156_str9 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@_func156_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func156_str9, i32 0, i32 0), align 8
@.str._func156_str10 = private unnamed_addr constant [2 x i8] c".\00", align 1
@_func156_str10 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func156_str10, i32 0, i32 0), align 8
@.str._func157_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@_func157_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func157_str1, i32 0, i32 0), align 8
@.str._func157_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func157_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func157_str2, i32 0, i32 0), align 8
@.str._func158_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@_func158_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func158_str1, i32 0, i32 0), align 8
@.str._func158_str2 = private unnamed_addr constant [6 x i8] c"array\00", align 1
@_func158_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func158_str2, i32 0, i32 0), align 8
@.str._func158_str3 = private unnamed_addr constant [24 x i8] c"term: unexpected token\0A\00", align 1
@_func158_str3 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func158_str3, i32 0, i32 0), align 8
@.str._func158_str4 = private unnamed_addr constant [7 x i8] c"tt=%d\0A\00", align 1
@_func158_str4 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func158_str4, i32 0, i32 0), align 8
@.str._func158_str5 = private unnamed_addr constant [12 x i8] c"token = %s\0A\00", align 1
@_func158_str5 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func158_str5, i32 0, i32 0), align 8
@.str._func160_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func160_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func160_str1, i32 0, i32 0), align 8
@.str._func160_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func160_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func160_str2, i32 0, i32 0), align 8
@.str._func160_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func160_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func160_str3, i32 0, i32 0), align 8
@.str._func160_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func160_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func160_str4, i32 0, i32 0), align 8
@.str._func161_str1 = private unnamed_addr constant [16 x i8] c"funcdef id fail\00", align 1
@_func161_str1 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func161_str1, i32 0, i32 0), align 8
@.str._func161_str2 = private unnamed_addr constant [18 x i8] c"funcdef type fail\00", align 1
@_func161_str2 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func161_str2, i32 0, i32 0), align 8
@.str._func161_str3 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func161_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func161_str3, i32 0, i32 0), align 8
@.str._func164_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@_func164_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func164_str1, i32 0, i32 0), align 8
@.str._func164_str2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@_func164_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func164_str2, i32 0, i32 0), align 8
@.str._func164_str3 = private unnamed_addr constant [5 x i8] c"%llx\00", align 1
@_func164_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func164_str3, i32 0, i32 0), align 8
@.str._func164_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@_func164_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func164_str4, i32 0, i32 0), align 8
@.str._func168_str1 = private unnamed_addr constant [21 x i8] c"block_new : b != Nil\00", align 1
@_func168_str1 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str._func168_str1, i32 0, i32 0), align 8
@.str._func169_str1 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func169_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func169_str1, i32 0, i32 0), align 8
@.str._func169_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@_func169_str2 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func169_str2, i32 0, i32 0), align 8
@.str._func169_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func169_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func169_str3, i32 0, i32 0), align 8
@.str._func173_str1 = private unnamed_addr constant [17 x i8] c"expr_new::malloc\00", align 1
@_func173_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func173_str1, i32 0, i32 0), align 8
@.str._func175_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func175_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func175_str1, i32 0, i32 0), align 8
@.str._func175_str2 = private unnamed_addr constant [25 x i8] c"stmt::fail_with_restore\0A\00", align 1
@_func175_str2 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str._func175_str2, i32 0, i32 0), align 8
@.str._func175_str3 = private unnamed_addr constant [10 x i8] c"YYY = %s\0A\00", align 1
@_func175_str3 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func175_str3, i32 0, i32 0), align 8
@.str._func178_str1 = private unnamed_addr constant [13 x i8] c"invalid lval\00", align 1
@_func178_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func178_str1, i32 0, i32 0), align 8
@.str._func178_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@_func178_str2 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func178_str2, i32 0, i32 0), align 8
@.str._func178_str3 = private unnamed_addr constant [9 x i8] c"LTYPE = \00", align 1
@_func178_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func178_str3, i32 0, i32 0), align 8
@.str._func178_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func178_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func178_str4, i32 0, i32 0), align 8
@.str._func178_str5 = private unnamed_addr constant [9 x i8] c"RTYPE = \00", align 1
@_func178_str5 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func178_str5, i32 0, i32 0), align 8
@.str._func178_str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func178_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func178_str6, i32 0, i32 0), align 8
@.str._func179_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func179_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func179_str1, i32 0, i32 0), align 8
@.str._func179_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func179_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func179_str2, i32 0, i32 0), align 8
@.str._func179_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@_func179_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func179_str3, i32 0, i32 0), align 8
@.str._func179_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func179_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func179_str4, i32 0, i32 0), align 8
@.str._func179_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@_func179_str5 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func179_str5, i32 0, i32 0), align 8
@.str._func179_str6 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func179_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func179_str6, i32 0, i32 0), align 8
@.str._func180_str1 = private unnamed_addr constant [25 x i8] c"expected Bool expression\00", align 1
@_func180_str1 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str._func180_str1, i32 0, i32 0), align 8
@.str._func181_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func181_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func181_str1, i32 0, i32 0), align 8
@.str._func181_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func181_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func181_str2, i32 0, i32 0), align 8
@.str._func182_str1 = private unnamed_addr constant [25 x i8] c"expected Bool expression\00", align 1
@_func182_str1 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str._func182_str1, i32 0, i32 0), align 8
@.str._func183_str1 = private unnamed_addr constant [27 x i8] c"expected return expression\00", align 1
@_func183_str1 = constant i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str._func183_str1, i32 0, i32 0), align 8
@.str._func185_str1 = private unnamed_addr constant [34 x i8] c"`break` outside any loop operator\00", align 1
@_func185_str1 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str._func185_str1, i32 0, i32 0), align 8
@.str._func186_str1 = private unnamed_addr constant [37 x i8] c"`continue` outside any loop operator\00", align 1
@_func186_str1 = constant i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str._func186_str1, i32 0, i32 0), align 8
@.str._func187_str1 = private unnamed_addr constant [15 x i8] c"expected label\00", align 1
@_func187_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func187_str1, i32 0, i32 0), align 8
@.str._func189_str1 = private unnamed_addr constant [9 x i8] c"stmt_new\00", align 1
@_func189_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func189_str1, i32 0, i32 0), align 8
@.str._func191_str1 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@_func191_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func191_str1, i32 0, i32 0), align 8
@.str._func191_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func191_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func191_str2, i32 0, i32 0), align 8
@.str._func191_str3 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@_func191_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func191_str3, i32 0, i32 0), align 8
@.str._func191_str4 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@_func191_str4 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func191_str4, i32 0, i32 0), align 8
@.str._func191_str5 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@_func191_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func191_str5, i32 0, i32 0), align 8
@.str._func191_str6 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@_func191_str6 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func191_str6, i32 0, i32 0), align 8
@.str._func191_str7 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@_func191_str7 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func191_str7, i32 0, i32 0), align 8
@.str._func191_str8 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@_func191_str8 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func191_str8, i32 0, i32 0), align 8
@.str._func191_str9 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@_func191_str9 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func191_str9, i32 0, i32 0), align 8
@.str._func191_str10 = private unnamed_addr constant [5 x i8] c"goto\00", align 1
@_func191_str10 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func191_str10, i32 0, i32 0), align 8
@.str._func191_str11 = private unnamed_addr constant [2 x i8] c":\00", align 1
@_func191_str11 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func191_str11, i32 0, i32 0), align 8
@.str._func197_str1 = private unnamed_addr constant [36 x i8] c"assembly::definition_new : x != Nil\00", align 1
@_func197_str1 = constant i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str._func197_str1, i32 0, i32 0), align 8
@.str._func204_str1 = private unnamed_addr constant [7 x i8] c"record\00", align 1
@_func204_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func204_str1, i32 0, i32 0), align 8
@.str._func204_str2 = private unnamed_addr constant [5 x i8] c"enum\00", align 1
@_func204_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func204_str2, i32 0, i32 0), align 8
@.str._func204_str3 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func204_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func204_str3, i32 0, i32 0), align 8
@.str._func204_str4 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@_func204_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func204_str4, i32 0, i32 0), align 8
@.str._func204_str5 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@_func204_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func204_str5, i32 0, i32 0), align 8
@.str._func204_str6 = private unnamed_addr constant [14 x i8] c"expected type\00", align 1
@_func204_str6 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func204_str6, i32 0, i32 0), align 8
@.str._func204_str7 = private unnamed_addr constant [8 x i8] c"tok=%s\0A\00", align 1
@_func204_str7 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func204_str7, i32 0, i32 0), align 8
@.str._func205_str1 = private unnamed_addr constant [12 x i8] c"expected id\00", align 1
@_func205_str1 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func205_str1, i32 0, i32 0), align 8
@.str._func206_str1 = private unnamed_addr constant [14 x i8] c"dofield error\00", align 1
@_func206_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func206_str1, i32 0, i32 0), align 8
@.str._func206_str2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func206_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func206_str2, i32 0, i32 0), align 8
@.str._func207_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func207_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func207_str1, i32 0, i32 0), align 8
@.str._func207_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func207_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func207_str2, i32 0, i32 0), align 8
@.str._func208_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func208_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func208_str1, i32 0, i32 0), align 8
@.str._func208_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func208_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func208_str2, i32 0, i32 0), align 8
@.str._func208_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func208_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func208_str3, i32 0, i32 0), align 8
@.str._func208_str4 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func208_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func208_str4, i32 0, i32 0), align 8
@.str._func209_str1 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@_func209_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func209_str1, i32 0, i32 0), align 8
@.str._func209_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@_func209_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func209_str2, i32 0, i32 0), align 8
@.str._func210_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func210_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func210_str1, i32 0, i32 0), align 8
@.str._func210_str2 = private unnamed_addr constant [3 x i8] c"->\00", align 1
@_func210_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func210_str2, i32 0, i32 0), align 8
@.str._func210_str3 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@_func210_str3 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func210_str3, i32 0, i32 0), align 8
@.str._func212_str1 = private unnamed_addr constant [15 x i8] c"ValueUndefined\00", align 1
@_func212_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func212_str1, i32 0, i32 0), align 8
@.str._func212_str2 = private unnamed_addr constant [9 x i8] c"ValueRef\00", align 1
@_func212_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str2, i32 0, i32 0), align 8
@.str._func212_str3 = private unnamed_addr constant [11 x i8] c"ValueDeref\00", align 1
@_func212_str3 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func212_str3, i32 0, i32 0), align 8
@.str._func212_str4 = private unnamed_addr constant [9 x i8] c"ValueNot\00", align 1
@_func212_str4 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str4, i32 0, i32 0), align 8
@.str._func212_str5 = private unnamed_addr constant [11 x i8] c"ValueMinus\00", align 1
@_func212_str5 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func212_str5, i32 0, i32 0), align 8
@.str._func212_str6 = private unnamed_addr constant [9 x i8] c"ValueShl\00", align 1
@_func212_str6 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str6, i32 0, i32 0), align 8
@.str._func212_str7 = private unnamed_addr constant [9 x i8] c"ValueShr\00", align 1
@_func212_str7 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str7, i32 0, i32 0), align 8
@.str._func212_str8 = private unnamed_addr constant [9 x i8] c"ValueAdd\00", align 1
@_func212_str8 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str8, i32 0, i32 0), align 8
@.str._func212_str9 = private unnamed_addr constant [9 x i8] c"ValueSub\00", align 1
@_func212_str9 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str9, i32 0, i32 0), align 8
@.str._func212_str10 = private unnamed_addr constant [9 x i8] c"ValueMul\00", align 1
@_func212_str10 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str10, i32 0, i32 0), align 8
@.str._func212_str11 = private unnamed_addr constant [9 x i8] c"ValueDiv\00", align 1
@_func212_str11 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str11, i32 0, i32 0), align 8
@.str._func212_str12 = private unnamed_addr constant [9 x i8] c"ValueMod\00", align 1
@_func212_str12 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str12, i32 0, i32 0), align 8
@.str._func212_str13 = private unnamed_addr constant [8 x i8] c"ValueOr\00", align 1
@_func212_str13 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func212_str13, i32 0, i32 0), align 8
@.str._func212_str14 = private unnamed_addr constant [9 x i8] c"ValueXor\00", align 1
@_func212_str14 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str14, i32 0, i32 0), align 8
@.str._func212_str15 = private unnamed_addr constant [9 x i8] c"ValueAnd\00", align 1
@_func212_str15 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func212_str15, i32 0, i32 0), align 8
@.str._func212_str16 = private unnamed_addr constant [8 x i8] c"ValueEq\00", align 1
@_func212_str16 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func212_str16, i32 0, i32 0), align 8
@.str._func212_str17 = private unnamed_addr constant [8 x i8] c"ValueNe\00", align 1
@_func212_str17 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func212_str17, i32 0, i32 0), align 8
@.str._func212_str18 = private unnamed_addr constant [8 x i8] c"ValueLt\00", align 1
@_func212_str18 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func212_str18, i32 0, i32 0), align 8
@.str._func212_str19 = private unnamed_addr constant [8 x i8] c"ValueGt\00", align 1
@_func212_str19 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func212_str19, i32 0, i32 0), align 8
@.str._func212_str20 = private unnamed_addr constant [8 x i8] c"ValueLe\00", align 1
@_func212_str20 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func212_str20, i32 0, i32 0), align 8
@.str._func212_str21 = private unnamed_addr constant [8 x i8] c"ValueGe\00", align 1
@_func212_str21 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func212_str21, i32 0, i32 0), align 8
@.str._func212_str22 = private unnamed_addr constant [10 x i8] c"ValueCall\00", align 1
@_func212_str22 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func212_str22, i32 0, i32 0), align 8
@.str._func212_str23 = private unnamed_addr constant [11 x i8] c"ValueIndex\00", align 1
@_func212_str23 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func212_str23, i32 0, i32 0), align 8
@.str._func212_str24 = private unnamed_addr constant [12 x i8] c"ValueAccess\00", align 1
@_func212_str24 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func212_str24, i32 0, i32 0), align 8
@.str._func212_str25 = private unnamed_addr constant [10 x i8] c"ValueCast\00", align 1
@_func212_str25 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func212_str25, i32 0, i32 0), align 8
@.str._func212_str26 = private unnamed_addr constant [13 x i8] c"ValueInvalid\00", align 1
@_func212_str26 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func212_str26, i32 0, i32 0), align 8
@.str._func212_str27 = private unnamed_addr constant [13 x i8] c"ValueUnknown\00", align 1
@_func212_str27 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func212_str27, i32 0, i32 0), align 8
@.str._func213_str1 = private unnamed_addr constant [13 x i8] c"value: %p {\0A\00", align 1
@_func213_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func213_str1, i32 0, i32 0), align 8
@.str._func213_str2 = private unnamed_addr constant [12 x i8] c"  kind: %s\0A\00", align 1
@_func213_str2 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func213_str2, i32 0, i32 0), align 8
@.str._func213_str3 = private unnamed_addr constant [9 x i8] c"  type: \00", align 1
@_func213_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func213_str3, i32 0, i32 0), align 8
@.str._func213_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func213_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func213_str4, i32 0, i32 0), align 8
@.str._func213_str5 = private unnamed_addr constant [11 x i8] c"  imm: %d\0A\00", align 1
@_func213_str5 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func213_str5, i32 0, i32 0), align 8
@.str._func213_str6 = private unnamed_addr constant [3 x i8] c"}\0A\00", align 1
@_func213_str6 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func213_str6, i32 0, i32 0), align 8
@.str._func215_str1 = private unnamed_addr constant [20 x i8] c"nat:: v.type == Nil\00", align 1
@_func215_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str._func215_str1, i32 0, i32 0), align 8
@.str._func215_str2 = private unnamed_addr constant [15 x i8] c"nat:: t == Nil\00", align 1
@_func215_str2 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func215_str2, i32 0, i32 0), align 8
@.str._func217_str1 = private unnamed_addr constant [40 x i8] c"value/un :: unknown value kind received\00", align 1
@_func217_str1 = constant i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str._func217_str1, i32 0, i32 0), align 8
@.str._func222_str1 = private unnamed_addr constant [26 x i8] c"cannot ref constant value\00", align 1
@_func222_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func222_str1, i32 0, i32 0), align 8
@.str._func222_str2 = private unnamed_addr constant [18 x i8] c"expected pointer\0A\00", align 1
@_func222_str2 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func222_str2, i32 0, i32 0), align 8
@.str._func225_str1 = private unnamed_addr constant [9 x i8] c"LTYPE = \00", align 1
@_func225_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func225_str1, i32 0, i32 0), align 8
@.str._func225_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func225_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func225_str2, i32 0, i32 0), align 8
@.str._func225_str3 = private unnamed_addr constant [9 x i8] c"RTYPE = \00", align 1
@_func225_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func225_str3, i32 0, i32 0), align 8
@.str._func225_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func225_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func225_str4, i32 0, i32 0), align 8
@.str._func225_str5 = private unnamed_addr constant [18 x i8] c"binary type error\00", align 1
@_func225_str5 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func225_str5, i32 0, i32 0), align 8
@.str._func226_str1 = private unnamed_addr constant [32 x i8] c"binImm :: unknown bin operation\00", align 1
@_func226_str1 = constant i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str._func226_str1, i32 0, i32 0), align 8
@.str._func232_str1 = private unnamed_addr constant [41 x i8] c"expected record / pointer to record type\00", align 1
@_func232_str1 = constant i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str._func232_str1, i32 0, i32 0), align 8
@.str._func232_str2 = private unnamed_addr constant [16 x i8] c"undefined field\00", align 1
@_func232_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func232_str2, i32 0, i32 0), align 8
@.str._func234_str1 = private unnamed_addr constant [19 x i8] c"undefined function\00", align 1
@_func234_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func234_str1, i32 0, i32 0), align 8
@.str._func234_str2 = private unnamed_addr constant [18 x i8] c"expected function\00", align 1
@_func234_str2 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func234_str2, i32 0, i32 0), align 8
@.str._func235_str1 = private unnamed_addr constant [21 x i8] c"not enough arguments\00", align 1
@_func235_str1 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str._func235_str1, i32 0, i32 0), align 8
@.str._func235_str2 = private unnamed_addr constant [19 x i8] c"too many arguments\00", align 1
@_func235_str2 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func235_str2, i32 0, i32 0), align 8
@.str._func235_str3 = private unnamed_addr constant [37 x i8] c"argument type not match param type: \00", align 1
@_func235_str3 = constant i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str._func235_str3, i32 0, i32 0), align 8
@.str._func235_str4 = private unnamed_addr constant [7 x i8] c"arg = \00", align 1
@_func235_str4 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func235_str4, i32 0, i32 0), align 8
@.str._func235_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func235_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func235_str5, i32 0, i32 0), align 8
@.str._func235_str6 = private unnamed_addr constant [7 x i8] c"par = \00", align 1
@_func235_str6 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func235_str6, i32 0, i32 0), align 8
@.str._func235_str7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func235_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func235_str7, i32 0, i32 0), align 8
@.str._func240_str1 = private unnamed_addr constant [20 x i8] c"sizeof unknown type\00", align 1
@_func240_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str._func240_str1, i32 0, i32 0), align 8
@.str._func242_str1 = private unnamed_addr constant [21 x i8] c"alignof unknown type\00", align 1
@_func242_str1 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str._func242_str1, i32 0, i32 0), align 8
@.str._func243_str1 = private unnamed_addr constant [6 x i8] c"False\00", align 1
@_func243_str1 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func243_str1, i32 0, i32 0), align 8
@.str._func243_str2 = private unnamed_addr constant [5 x i8] c"True\00", align 1
@_func243_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func243_str2, i32 0, i32 0), align 8
@.str._func243_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@_func243_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func243_str3, i32 0, i32 0), align 8
@.str._func243_str4 = private unnamed_addr constant [4 x i8] c"Nil\00", align 1
@_func243_str4 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func243_str4, i32 0, i32 0), align 8
@.str._func244_str1 = private unnamed_addr constant [21 x i8] c"value_new : v != Nil\00", align 1
@_func244_str1 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str._func244_str1, i32 0, i32 0), align 8
@.str._func245_str1 = private unnamed_addr constant [28 x i8] c"checkValue:: unknown v.kind\00", align 1
@_func245_str1 = constant i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str._func245_str1, i32 0, i32 0), align 8
@.str._func256_str1 = private unnamed_addr constant [18 x i8] c"when import = %s\0A\00", align 1
@_func256_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func256_str1, i32 0, i32 0), align 8
@.str._func256_str2 = private unnamed_addr constant [14 x i8] c"cannot import\00", align 1
@_func256_str2 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func256_str2, i32 0, i32 0), align 8
@.str._func256_str3 = private unnamed_addr constant [18 x i8] c"when import = %s\0A\00", align 1
@_func256_str3 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func256_str3, i32 0, i32 0), align 8
@.str._func256_str4 = private unnamed_addr constant [14 x i8] c"cannot import\00", align 1
@_func256_str4 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func256_str4, i32 0, i32 0), align 8
@.str._func259_str1 = private unnamed_addr constant [29 x i8] c"malloc(sizeof ModuleContext)\00", align 1
@_func259_str1 = constant i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str._func259_str1, i32 0, i32 0), align 8
@.str._func259_str2 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@_func259_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func259_str2, i32 0, i32 0), align 8
@.str._func259_str3 = private unnamed_addr constant [7 x i8] c"export\00", align 1
@_func259_str3 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func259_str3, i32 0, i32 0), align 8
@.str._func259_str4 = private unnamed_addr constant [13 x i8] c"> parse: %s\0A\00", align 1
@_func259_str4 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func259_str4, i32 0, i32 0), align 8
@.str._func259_str5 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@_func259_str5 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func259_str5, i32 0, i32 0), align 8
@.str._func259_str6 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@_func259_str6 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func259_str6, i32 0, i32 0), align 8
@.str._func259_str7 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@_func259_str7 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func259_str7, i32 0, i32 0), align 8
@.str._func259_str8 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@_func259_str8 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func259_str8, i32 0, i32 0), align 8
@.str._func259_str9 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@_func259_str9 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func259_str9, i32 0, i32 0), align 8
@.str._func259_str10 = private unnamed_addr constant [8 x i8] c"arghack\00", align 1
@_func259_str10 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func259_str10, i32 0, i32 0), align 8
@.str._func259_str11 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@_func259_str11 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func259_str11, i32 0, i32 0), align 8
@.str._func259_str12 = private unnamed_addr constant [11 x i8] c"nodecorate\00", align 1
@_func259_str12 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func259_str12, i32 0, i32 0), align 8
@.str._func259_str13 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@_func259_str13 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func259_str13, i32 0, i32 0), align 8
@.str._func259_str14 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@_func259_str14 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func259_str14, i32 0, i32 0), align 8
@.str._func259_str15 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@_func259_str15 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func259_str15, i32 0, i32 0), align 8
@.str._func259_str16 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@_func259_str16 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func259_str16, i32 0, i32 0), align 8
@.str._func259_str17 = private unnamed_addr constant [16 x i8] c"< end-parse %s\0A\00", align 1
@_func259_str17 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func259_str17, i32 0, i32 0), align 8
@.str._func260_str1 = private unnamed_addr constant [23 x i8] c"expected export string\00", align 1
@_func260_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func260_str1, i32 0, i32 0), align 8
@.str._func260_str2 = private unnamed_addr constant [12 x i8] c"export: %s\0A\00", align 1
@_func260_str2 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func260_str2, i32 0, i32 0), align 8
@.str._func261_str1 = private unnamed_addr constant [23 x i8] c"expected import string\00", align 1
@_func261_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func261_str1, i32 0, i32 0), align 8
@.str._func262_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func262_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func262_str1, i32 0, i32 0), align 8
@.str._func263_str1 = private unnamed_addr constant [14 x i8] c"parse-let %s\0A\00", align 1
@_func263_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func263_str1, i32 0, i32 0), align 8
@.str._func263_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func263_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func263_str2, i32 0, i32 0), align 8
@.str._func263_str3 = private unnamed_addr constant [15 x i8] c"end-parse-let\0A\00", align 1
@_func263_str3 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func263_str3, i32 0, i32 0), align 8
@.str._func263_str4 = private unnamed_addr constant [15 x i8] c"end-parse-let\0A\00", align 1
@_func263_str4 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func263_str4, i32 0, i32 0), align 8
@.str._func263_str5 = private unnamed_addr constant [15 x i8] c"end-parse-let\0A\00", align 1
@_func263_str5 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func263_str5, i32 0, i32 0), align 8
@.str._func264_str1 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@_func264_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func264_str1, i32 0, i32 0), align 8
@.str._func264_str2 = private unnamed_addr constant [24 x i8] c"attempt to redefinition\00", align 1
@_func264_str2 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func264_str2, i32 0, i32 0), align 8
@.str._func269_str1 = private unnamed_addr constant [25 x i8] c"attempt to redeclaration\00", align 1
@_func269_str1 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str._func269_str1, i32 0, i32 0), align 8
@.str._func269_str2 = private unnamed_addr constant [14 x i8] c"declared at: \00", align 1
@_func269_str2 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func269_str2, i32 0, i32 0), align 8
@.str._func270_str1 = private unnamed_addr constant [12 x i8] c"expected id\00", align 1
@_func270_str1 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func270_str1, i32 0, i32 0), align 8
@.str._func270_str2 = private unnamed_addr constant [9 x i8] c"tt = %d\0A\00", align 1
@_func270_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func270_str2, i32 0, i32 0), align 8
@.str._func270_str3 = private unnamed_addr constant [9 x i8] c"tx = %d\0A\00", align 1
@_func270_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func270_str3, i32 0, i32 0), align 8
@.str._func270_str4 = private unnamed_addr constant [14 x i8] c"instead '%s'\0A\00", align 1
@_func270_str4 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func270_str4, i32 0, i32 0), align 8
@.str._func271_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func271_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func271_str1, i32 0, i32 0), align 8
@.str._func271_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@_func271_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func271_str2, i32 0, i32 0), align 8
@.str._func278_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func278_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func278_str1, i32 0, i32 0), align 8
@.str._func282_str1 = private unnamed_addr constant [19 x i8] c"expected separator\00", align 1
@_func282_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func282_str1, i32 0, i32 0), align 8
@.str._func283_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func283_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func283_str1, i32 0, i32 0), align 8
@.str._func283_str2 = private unnamed_addr constant [2 x i8] c";\00", align 1
@_func283_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func283_str2, i32 0, i32 0), align 8
@.str._func283_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func283_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func283_str3, i32 0, i32 0), align 8
@.str._func283_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func283_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func283_str4, i32 0, i32 0), align 8
@.str._func284_str1 = private unnamed_addr constant [29 x i8] c"lex::skipto not implemented\0A\00", align 1
@_func284_str1 = constant i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str._func284_str1, i32 0, i32 0), align 8
@.str._func284_str2 = private unnamed_addr constant [12 x i8] c"tok = '%s'\0A\00", align 1
@_func284_str2 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func284_str2, i32 0, i32 0), align 8
@.str._func284_str3 = private unnamed_addr constant [18 x i8] c"skip_target = %s\0A\00", align 1
@_func284_str3 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func284_str3, i32 0, i32 0), align 8
@.str._func286_str1 = private unnamed_addr constant [18 x i8] c"unexpected symbol\00", align 1
@_func286_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func286_str1, i32 0, i32 0), align 8
@.str._func289_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@_func289_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func289_str1, i32 0, i32 0), align 8
@.str._func290_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func290_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func290_str1, i32 0, i32 0), align 8
@.str._func291_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@_func291_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func291_str1, i32 0, i32 0), align 8
@.str._func292_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func292_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func292_str1, i32 0, i32 0), align 8
@.str._func294_str1 = private unnamed_addr constant [10 x i8] c" !dbg !%u\00", align 1
@_func294_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func294_str1, i32 0, i32 0), align 8
@.str._func298_str1 = private unnamed_addr constant [26 x i8] c"prn/printType :: t = Nil\0A\00", align 1
@_func298_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func298_str1, i32 0, i32 0), align 8
@.str._func298_str2 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@_func298_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func298_str2, i32 0, i32 0), align 8
@.str._func298_str3 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@_func298_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func298_str3, i32 0, i32 0), align 8
@.str._func299_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func299_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func299_str1, i32 0, i32 0), align 8
@.str._func300_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func300_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func300_str1, i32 0, i32 0), align 8
@.str._func299_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func299_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func299_str2, i32 0, i32 0), align 8
@.str._func301_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func301_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func301_str1, i32 0, i32 0), align 8
@.str._func301_str2 = private unnamed_addr constant [7 x i8] c"[%d x \00", align 1
@_func301_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func301_str2, i32 0, i32 0), align 8
@.str._func301_str3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@_func301_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func301_str3, i32 0, i32 0), align 8
@.str._func302_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func302_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func302_str1, i32 0, i32 0), align 8
@.str._func303_str1 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@_func303_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func303_str1, i32 0, i32 0), align 8
@.str._func303_str2 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@_func303_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func303_str2, i32 0, i32 0), align 8
@.str._func304_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func304_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func304_str1, i32 0, i32 0), align 8
@.str._func303_str3 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@_func303_str3 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func303_str3, i32 0, i32 0), align 8
@.str._func303_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func303_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func303_str4, i32 0, i32 0), align 8
@.str._func303_str5 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func303_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func303_str5, i32 0, i32 0), align 8
@.str._func306_str1 = private unnamed_addr constant [11 x i8] c"\0A\0A;stmt%d:\00", align 1
@_func306_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func306_str1, i32 0, i32 0), align 8
@.str._func306_str2 = private unnamed_addr constant [19 x i8] c"print::StmtUnknown\00", align 1
@_func306_str2 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func306_str2, i32 0, i32 0), align 8
@.str._func307_str1 = private unnamed_addr constant [18 x i8] c"\0A  %%%d = alloca \00", align 1
@_func307_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func307_str1, i32 0, i32 0), align 8
@.str._func309_str1 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@_func309_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func309_str1, i32 0, i32 0), align 8
@.str._func309_str2 = private unnamed_addr constant [35 x i8] c", label %%then_%d, label %%else_%d\00", align 1
@_func309_str2 = constant i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str._func309_str2, i32 0, i32 0), align 8
@.str._func309_str3 = private unnamed_addr constant [10 x i8] c"\0Athen_%d:\00", align 1
@_func309_str3 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func309_str3, i32 0, i32 0), align 8
@.str._func309_str4 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@_func309_str4 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func309_str4, i32 0, i32 0), align 8
@.str._func309_str5 = private unnamed_addr constant [10 x i8] c"\0Aelse_%d:\00", align 1
@_func309_str5 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func309_str5, i32 0, i32 0), align 8
@.str._func309_str6 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@_func309_str6 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func309_str6, i32 0, i32 0), align 8
@.str._func309_str7 = private unnamed_addr constant [11 x i8] c"\0Aendif_%d:\00", align 1
@_func309_str7 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func309_str7, i32 0, i32 0), align 8
@.str._func310_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@_func310_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func310_str1, i32 0, i32 0), align 8
@.str._func310_str2 = private unnamed_addr constant [14 x i8] c"\0Acontinue_%d:\00", align 1
@_func310_str2 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func310_str2, i32 0, i32 0), align 8
@.str._func310_str3 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@_func310_str3 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func310_str3, i32 0, i32 0), align 8
@.str._func310_str4 = private unnamed_addr constant [36 x i8] c", label %%body_%d, label %%break_%d\00", align 1
@_func310_str4 = constant i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str._func310_str4, i32 0, i32 0), align 8
@.str._func310_str5 = private unnamed_addr constant [10 x i8] c"\0Abody_%d:\00", align 1
@_func310_str5 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func310_str5, i32 0, i32 0), align 8
@.str._func310_str6 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@_func310_str6 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func310_str6, i32 0, i32 0), align 8
@.str._func310_str7 = private unnamed_addr constant [11 x i8] c"\0Abreak_%d:\00", align 1
@_func310_str7 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func310_str7, i32 0, i32 0), align 8
@.str._func311_str1 = private unnamed_addr constant [10 x i8] c"\0Aret void\00", align 1
@_func311_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func311_str1, i32 0, i32 0), align 8
@.str._func311_str2 = private unnamed_addr constant [8 x i8] c"\0A  ret \00", align 1
@_func311_str2 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func311_str2, i32 0, i32 0), align 8
@.str._func312_str1 = private unnamed_addr constant [23 x i8] c"\0A  br label %%break_%d\00", align 1
@_func312_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func312_str1, i32 0, i32 0), align 8
@.str._func313_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@_func313_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func313_str1, i32 0, i32 0), align 8
@.str._func314_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@_func314_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func314_str1, i32 0, i32 0), align 8
@.str._func315_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@_func315_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func315_str1, i32 0, i32 0), align 8
@.str._func315_str2 = private unnamed_addr constant [5 x i8] c"\0A%s:\00", align 1
@_func315_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func315_str2, i32 0, i32 0), align 8
@.str._func319_str1 = private unnamed_addr constant [28 x i8] c"ValueUndefined in prn::eval\00", align 1
@_func319_str1 = constant i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str._func319_str1, i32 0, i32 0), align 8
@.str._func320_str1 = private unnamed_addr constant [9 x i8] c"\0A  call \00", align 1
@_func320_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func320_str1, i32 0, i32 0), align 8
@.str._func320_str2 = private unnamed_addr constant [16 x i8] c"\0A  %%%d = call \00", align 1
@_func320_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func320_str2, i32 0, i32 0), align 8
@.str._func320_str3 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@_func320_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func320_str3, i32 0, i32 0), align 8
@.str._func320_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func320_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func320_str4, i32 0, i32 0), align 8
@.str._func322_str1 = private unnamed_addr constant [24 x i8] c"\0A  %%%d = extractvalue \00", align 1
@_func322_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func322_str1, i32 0, i32 0), align 8
@.str._func322_str2 = private unnamed_addr constant [5 x i8] c", %u\00", align 1
@_func322_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func322_str2, i32 0, i32 0), align 8
@.str._func322_str3 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@_func322_str3 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str._func322_str3, i32 0, i32 0), align 8
@.str._func322_str4 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@_func322_str4 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func322_str4, i32 0, i32 0), align 8
@.str._func322_str5 = private unnamed_addr constant [8 x i8] c", i32 0\00", align 1
@_func322_str5 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func322_str5, i32 0, i32 0), align 8
@.str._func323_str1 = private unnamed_addr constant [29 x i8] c"print/expr:: v.field == Nil\0A\00", align 1
@_func323_str1 = constant i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str._func323_str1, i32 0, i32 0), align 8
@.str._func323_str2 = private unnamed_addr constant [24 x i8] c"\0A  %%%d = extractvalue \00", align 1
@_func323_str2 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func323_str2, i32 0, i32 0), align 8
@.str._func323_str3 = private unnamed_addr constant [5 x i8] c", %u\00", align 1
@_func323_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func323_str3, i32 0, i32 0), align 8
@.str._func323_str4 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@_func323_str4 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str._func323_str4, i32 0, i32 0), align 8
@.str._func323_str5 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@_func323_str5 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func323_str5, i32 0, i32 0), align 8
@.str._func323_str6 = private unnamed_addr constant [16 x i8] c", i32 0, i32 %u\00", align 1
@_func323_str6 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func323_str6, i32 0, i32 0), align 8
@.str._func324_str1 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@_func324_str1 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str._func324_str1, i32 0, i32 0), align 8
@.str._func324_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@_func324_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func324_str2, i32 0, i32 0), align 8
@.str._func324_str3 = private unnamed_addr constant [6 x i8] c"i32 0\00", align 1
@_func324_str3 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func324_str3, i32 0, i32 0), align 8
@.str._func326_str1 = private unnamed_addr constant [15 x i8] c"\0A  %%%d = xor \00", align 1
@_func326_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func326_str1, i32 0, i32 0), align 8
@.str._func326_str2 = private unnamed_addr constant [4 x i8] c", 1\00", align 1
@_func326_str2 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func326_str2, i32 0, i32 0), align 8
@.str._func326_str3 = private unnamed_addr constant [5 x i8] c", -1\00", align 1
@_func326_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func326_str3, i32 0, i32 0), align 8
@.str._func327_str1 = private unnamed_addr constant [19 x i8] c"\0A  %%%d = sub nsw \00", align 1
@_func327_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func327_str1, i32 0, i32 0), align 8
@.str._func327_str2 = private unnamed_addr constant [3 x i8] c" 0\00", align 1
@_func327_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func327_str2, i32 0, i32 0), align 8
@.str._func328_str1 = private unnamed_addr constant [11 x i8] c"\0A  %%%d = \00", align 1
@_func328_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func328_str1, i32 0, i32 0), align 8
@.str._func328_str2 = private unnamed_addr constant [7 x i8] c"<cast>\00", align 1
@_func328_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func328_str2, i32 0, i32 0), align 8
@.str._func328_str3 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@_func328_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func328_str3, i32 0, i32 0), align 8
@.str._func328_str4 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@_func328_str4 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func328_str4, i32 0, i32 0), align 8
@.str._func328_str5 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@_func328_str5 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func328_str5, i32 0, i32 0), align 8
@.str._func328_str6 = private unnamed_addr constant [9 x i8] c"inttoptr\00", align 1
@_func328_str6 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func328_str6, i32 0, i32 0), align 8
@.str._func328_str7 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@_func328_str7 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func328_str7, i32 0, i32 0), align 8
@.str._func328_str8 = private unnamed_addr constant [5 x i8] c"sext\00", align 1
@_func328_str8 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func328_str8, i32 0, i32 0), align 8
@.str._func328_str9 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@_func328_str9 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func328_str9, i32 0, i32 0), align 8
@.str._func328_str10 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@_func328_str10 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func328_str10, i32 0, i32 0), align 8
@.str._func328_str11 = private unnamed_addr constant [9 x i8] c"ptrtoint\00", align 1
@_func328_str11 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func328_str11, i32 0, i32 0), align 8
@.str._func328_str12 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@_func328_str12 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func328_str12, i32 0, i32 0), align 8
@.str._func328_str13 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@_func328_str13 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func328_str13, i32 0, i32 0), align 8
@.str._func328_str14 = private unnamed_addr constant [8 x i8] c"bitcast\00", align 1
@_func328_str14 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func328_str14, i32 0, i32 0), align 8
@.str._func328_str15 = private unnamed_addr constant [18 x i8] c"e.type.kind = %d\0A\00", align 1
@_func328_str15 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func328_str15, i32 0, i32 0), align 8
@.str._func328_str16 = private unnamed_addr constant [33 x i8] c"printer/expr/cast :: e.type.kind\00", align 1
@_func328_str16 = constant i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str._func328_str16, i32 0, i32 0), align 8
@.str._func328_str17 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@_func328_str17 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func328_str17, i32 0, i32 0), align 8
@.str._func328_str18 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@_func328_str18 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func328_str18, i32 0, i32 0), align 8
@.str._func329_str1 = private unnamed_addr constant [7 x i8] c"<oper>\00", align 1
@_func329_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func329_str1, i32 0, i32 0), align 8
@.str._func329_str2 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@_func329_str2 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func329_str2, i32 0, i32 0), align 8
@.str._func329_str3 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@_func329_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func329_str3, i32 0, i32 0), align 8
@.str._func329_str4 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@_func329_str4 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func329_str4, i32 0, i32 0), align 8
@.str._func329_str5 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@_func329_str5 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func329_str5, i32 0, i32 0), align 8
@.str._func329_str6 = private unnamed_addr constant [5 x i8] c"udiv\00", align 1
@_func329_str6 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func329_str6, i32 0, i32 0), align 8
@.str._func329_str7 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@_func329_str7 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func329_str7, i32 0, i32 0), align 8
@.str._func329_str8 = private unnamed_addr constant [5 x i8] c"urem\00", align 1
@_func329_str8 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func329_str8, i32 0, i32 0), align 8
@.str._func329_str9 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@_func329_str9 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func329_str9, i32 0, i32 0), align 8
@.str._func329_str10 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@_func329_str10 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func329_str10, i32 0, i32 0), align 8
@.str._func329_str11 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@_func329_str11 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func329_str11, i32 0, i32 0), align 8
@.str._func329_str12 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@_func329_str12 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func329_str12, i32 0, i32 0), align 8
@.str._func329_str13 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@_func329_str13 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func329_str13, i32 0, i32 0), align 8
@.str._func329_str14 = private unnamed_addr constant [9 x i8] c"icmp slt\00", align 1
@_func329_str14 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func329_str14, i32 0, i32 0), align 8
@.str._func329_str15 = private unnamed_addr constant [9 x i8] c"icmp ult\00", align 1
@_func329_str15 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func329_str15, i32 0, i32 0), align 8
@.str._func329_str16 = private unnamed_addr constant [9 x i8] c"icmp sgt\00", align 1
@_func329_str16 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func329_str16, i32 0, i32 0), align 8
@.str._func329_str17 = private unnamed_addr constant [9 x i8] c"icmp ugt\00", align 1
@_func329_str17 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func329_str17, i32 0, i32 0), align 8
@.str._func329_str18 = private unnamed_addr constant [9 x i8] c"icmp sle\00", align 1
@_func329_str18 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func329_str18, i32 0, i32 0), align 8
@.str._func329_str19 = private unnamed_addr constant [9 x i8] c"icmp ule\00", align 1
@_func329_str19 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func329_str19, i32 0, i32 0), align 8
@.str._func329_str20 = private unnamed_addr constant [9 x i8] c"icmp sge\00", align 1
@_func329_str20 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func329_str20, i32 0, i32 0), align 8
@.str._func329_str21 = private unnamed_addr constant [9 x i8] c"icmp uge\00", align 1
@_func329_str21 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func329_str21, i32 0, i32 0), align 8
@.str._func329_str22 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@_func329_str22 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func329_str22, i32 0, i32 0), align 8
@.str._func329_str23 = private unnamed_addr constant [5 x i8] c"ashr\00", align 1
@_func329_str23 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func329_str23, i32 0, i32 0), align 8
@.str._func329_str24 = private unnamed_addr constant [5 x i8] c"lshr\00", align 1
@_func329_str24 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func329_str24, i32 0, i32 0), align 8
@.str._func329_str25 = private unnamed_addr constant [14 x i8] c"\0A  %%%d = %s \00", align 1
@_func329_str25 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func329_str25, i32 0, i32 0), align 8
@.str._func330_str1 = private unnamed_addr constant [10 x i8] c"\0A  store \00", align 1
@_func330_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func330_str1, i32 0, i32 0), align 8
@.str._func330_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@_func330_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func330_str2, i32 0, i32 0), align 8
@.str._func332_str1 = private unnamed_addr constant [24 x i8] c"\0A  %%%d = inttoptr i64 \00", align 1
@_func332_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func332_str1, i32 0, i32 0), align 8
@.str._func332_str2 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@_func332_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func332_str2, i32 0, i32 0), align 8
@.str._func331_str1 = private unnamed_addr constant [16 x i8] c"\0A  %%%d = load \00", align 1
@_func331_str1 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func331_str1, i32 0, i32 0), align 8
@.str._func331_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@_func331_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func331_str2, i32 0, i32 0), align 8
@.str._func333_str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@_func333_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func333_str1, i32 0, i32 0), align 8
@.str._func333_str2 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@_func333_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func333_str2, i32 0, i32 0), align 8
@.str._func333_str3 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@_func333_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func333_str3, i32 0, i32 0), align 8
@.str._func333_str4 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@_func333_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func333_str4, i32 0, i32 0), align 8
@.str._func333_str5 = private unnamed_addr constant [17 x i8] c"<OperandInvalid>\00", align 1
@_func333_str5 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func333_str5, i32 0, i32 0), align 8
@.str._func334_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@_func334_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func334_str1, i32 0, i32 0), align 8
@.str._func335_str1 = private unnamed_addr constant [44 x i8] c"\0A@%s = private unnamed_addr constant [%d x \00", align 1
@_func335_str1 = constant i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str._func335_str1, i32 0, i32 0), align 8
@.str._func335_str2 = private unnamed_addr constant [4 x i8] c"] [\00", align 1
@_func335_str2 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func335_str2, i32 0, i32 0), align 8
@.str._func335_str3 = private unnamed_addr constant [12 x i8] c"], align 16\00", align 1
@_func335_str3 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func335_str3, i32 0, i32 0), align 8
@.str._func337_str1 = private unnamed_addr constant [55 x i8] c"\0A@.str.%s = private unnamed_addr constant [%d x i8] c\22\00", align 1
@_func337_str1 = constant i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str._func337_str1, i32 0, i32 0), align 8
@.str._func337_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func337_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func337_str2, i32 0, i32 0), align 8
@.str._func337_str3 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@_func337_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func337_str3, i32 0, i32 0), align 8
@.str._func337_str4 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@_func337_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func337_str4, i32 0, i32 0), align 8
@.str._func337_str5 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@_func337_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func337_str5, i32 0, i32 0), align 8
@.str._func337_str6 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@_func337_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func337_str6, i32 0, i32 0), align 8
@.str._func337_str7 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@_func337_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func337_str7, i32 0, i32 0), align 8
@.str._func337_str8 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@_func337_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func337_str8, i32 0, i32 0), align 8
@.str._func337_str9 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@_func337_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func337_str9, i32 0, i32 0), align 8
@.str._func337_str10 = private unnamed_addr constant [6 x i8] c"\5C%02X\00", align 1
@_func337_str10 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func337_str10, i32 0, i32 0), align 8
@.str._func337_str11 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@_func337_str11 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func337_str11, i32 0, i32 0), align 8
@.str._func337_str12 = private unnamed_addr constant [16 x i8] c"\5C%02d\22, align 1\00", align 1
@_func337_str12 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func337_str12, i32 0, i32 0), align 8
@.str._func337_str13 = private unnamed_addr constant [99 x i8] c"\0A@%s = constant i8* getelementptr inbounds ([%d x i8], [%d x i8]* @.str.%s, i32 0, i32 0), align 8\00", align 1
@_func337_str13 = constant i8* getelementptr inbounds ([99 x i8], [99 x i8]* @.str._func337_str13, i32 0, i32 0), align 8
@.str._func338_str1 = private unnamed_addr constant [15 x i8] c"\0A@%s = global \00", align 1
@_func338_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func338_str1, i32 0, i32 0), align 8
@.str._func338_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@_func338_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func338_str2, i32 0, i32 0), align 8
@.str._func339_str1 = private unnamed_addr constant [20 x i8] c"prn/funcdef t = Nil\00", align 1
@_func339_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str._func339_str1, i32 0, i32 0), align 8
@.str._func339_str2 = private unnamed_addr constant [9 x i8] c"\0Adeclare\00", align 1
@_func339_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func339_str2, i32 0, i32 0), align 8
@.str._func339_str3 = private unnamed_addr constant [9 x i8] c"\0A\0Adefine\00", align 1
@_func339_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func339_str3, i32 0, i32 0), align 8
@.str._func339_str4 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@_func339_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func339_str4, i32 0, i32 0), align 8
@.str._func339_str5 = private unnamed_addr constant [7 x i8] c" @%s (\00", align 1
@_func339_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func339_str5, i32 0, i32 0), align 8
@.str._func340_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func340_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func340_str1, i32 0, i32 0), align 8
@.str._func339_str6 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@_func339_str6 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func339_str6, i32 0, i32 0), align 8
@.str._func339_str7 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func339_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func339_str7, i32 0, i32 0), align 8
@.str._func339_str8 = private unnamed_addr constant [3 x i8] c" {\00", align 1
@_func339_str8 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func339_str8, i32 0, i32 0), align 8
@.str._func339_str9 = private unnamed_addr constant [12 x i8] c"\0A  ret void\00", align 1
@_func339_str9 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func339_str9, i32 0, i32 0), align 8
@.str._func339_str10 = private unnamed_addr constant [3 x i8] c"\0A}\00", align 1
@_func339_str10 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func339_str10, i32 0, i32 0), align 8
@.str._func341_str1 = private unnamed_addr constant [14 x i8] c"\0A@%s = alias \00", align 1
@_func341_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func341_str1, i32 0, i32 0), align 8
@.str._func341_str2 = private unnamed_addr constant [6 x i8] c"* @%s\00", align 1
@_func341_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func341_str2, i32 0, i32 0), align 8
@.str._func342_str1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@_func342_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func342_str1, i32 0, i32 0), align 8
@.str._func342_str2 = private unnamed_addr constant [26 x i8] c"cannot create output file\00", align 1
@_func342_str2 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func342_str2, i32 0, i32 0), align 8
@.str._func342_str3 = private unnamed_addr constant [29 x i8] c"; clang out2.ll && ./a.out\0A\0A\00", align 1
@_func342_str3 = constant i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str._func342_str3, i32 0, i32 0), align 8
@.str._func342_str4 = private unnamed_addr constant [45 x i8] c"; llc out2.ll ; for create .s file from .ll\0A\00", align 1
@_func342_str4 = constant i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str._func342_str4, i32 0, i32 0), align 8
@.str._func342_str5 = private unnamed_addr constant [19 x i8] c"%%Enum = type i32\0A\00", align 1
@_func342_str5 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func342_str5, i32 0, i32 0), align 8
@.str._func342_str6 = private unnamed_addr constant [18 x i8] c"%%Bool = type i1\0A\00", align 1
@_func342_str6 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func342_str6, i32 0, i32 0), align 8
@.str._func342_str7 = private unnamed_addr constant [18 x i8] c"%%Unit = type i1\0A\00", align 1
@_func342_str7 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func342_str7, i32 0, i32 0), align 8
@.str._func342_str8 = private unnamed_addr constant [18 x i8] c"%%Str = type i8*\0A\00", align 1
@_func342_str8 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func342_str8, i32 0, i32 0), align 8
@.str._func343_str1 = private unnamed_addr constant [17 x i8] c"%%%s = type i%d\0A\00", align 1
@_func343_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func343_str1, i32 0, i32 0), align 8
@.str._func342_str9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func342_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func342_str9, i32 0, i32 0), align 8
@.str._func344_str1 = private unnamed_addr constant [20 x i8] c"print_assembly: %s\0A\00", align 1
@_func344_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str._func344_str1, i32 0, i32 0), align 8
@.str._func344_str2 = private unnamed_addr constant [17 x i8] c"\0A; assembly: %s\0A\00", align 1
@_func344_str2 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func344_str2, i32 0, i32 0), align 8
@.str._func344_str3 = private unnamed_addr constant [11 x i8] c"\0A\0A;types:\0A\00", align 1
@_func344_str3 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func344_str3, i32 0, i32 0), align 8
@.str._func344_str4 = private unnamed_addr constant [13 x i8] c"\0A\0A;strings:\0A\00", align 1
@_func344_str4 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func344_str4, i32 0, i32 0), align 8
@.str._func346_str1 = private unnamed_addr constant [9 x i8] c"NIL: %s\0A\00", align 1
@_func346_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func346_str1, i32 0, i32 0), align 8
@.str._func344_str5 = private unnamed_addr constant [12 x i8] c"\0A\0A;arrays:\0A\00", align 1
@_func344_str5 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func344_str5, i32 0, i32 0), align 8
@.str._func344_str6 = private unnamed_addr constant [10 x i8] c"\0A\0A;vars:\0A\00", align 1
@_func344_str6 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func344_str6, i32 0, i32 0), align 8
@.str._func344_str7 = private unnamed_addr constant [11 x i8] c"\0A\0A;funcs:\0A\00", align 1
@_func344_str7 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func344_str7, i32 0, i32 0), align 8
@.str._func344_str8 = private unnamed_addr constant [13 x i8] c"\0A\0A;aliases:\0A\00", align 1
@_func344_str8 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func344_str8, i32 0, i32 0), align 8
@.str._func344_str9 = private unnamed_addr constant [14 x i8] c"\0A\0A;metadata:\0A\00", align 1
@_func344_str9 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func344_str9, i32 0, i32 0), align 8
@.str._func351_str1 = private unnamed_addr constant [61 x i8] c"target datalayout = \22e-m:o-i64:64-f80:128-n8:16:32:64-S128\22\0A\00", align 1
@_func351_str1 = constant i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str._func351_str1, i32 0, i32 0), align 8
@.str._func351_str2 = private unnamed_addr constant [46 x i8] c"target triple = \22x86_64-apple-macosx10.14.0\22\0A\00", align 1
@_func351_str2 = constant i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str._func351_str2, i32 0, i32 0), align 8
@.str._func351_str3 = private unnamed_addr constant [71 x i8] c"target datalayout = \22e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\22\0A\00", align 1
@_func351_str3 = constant i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str._func351_str3, i32 0, i32 0), align 8
@.str._func351_str4 = private unnamed_addr constant [47 x i8] c"target triple = \22thumbv7em-unknown-none-eabi\22\0A\00", align 1
@_func351_str4 = constant i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str._func351_str4, i32 0, i32 0), align 8
@.str._func351_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func351_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func351_str5, i32 0, i32 0), align 8
@.str._func352_str1 = private unnamed_addr constant [15 x i8] c"\0A;type_index:\0A\00", align 1
@_func352_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func352_str1, i32 0, i32 0), align 8
@.str._func353_str1 = private unnamed_addr constant [13 x i8] c";* %s -> %p\0A\00", align 1
@_func353_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func353_str1, i32 0, i32 0), align 8
@.str._func354_str1 = private unnamed_addr constant [16 x i8] c"\0A;value_index:\0A\00", align 1
@_func354_str1 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func354_str1, i32 0, i32 0), align 8
@.str._func355_str1 = private unnamed_addr constant [14 x i8] c"\0A;#%s -> %p {\00", align 1
@_func355_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func355_str1, i32 0, i32 0), align 8
@.str._func355_str2 = private unnamed_addr constant [16 x i8] c"\0A;  v.kind = %s\00", align 1
@_func355_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func355_str2, i32 0, i32 0), align 8
@.str._func355_str3 = private unnamed_addr constant [5 x i8] c"\0A;}\0A\00", align 1
@_func355_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func355_str3, i32 0, i32 0), align 8
@.str.MINOR_LIB_ENV_VAR = private unnamed_addr constant [10 x i8] c"MINOR_LIB\00", align 1
@MINOR_LIB_ENV_VAR = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.MINOR_LIB_ENV_VAR, i32 0, i32 0), align 8
@.str._func356_str1 = private unnamed_addr constant [42 x i8] c"enviroment variable MINOR_LIB not defined\00", align 1
@_func356_str1 = constant i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str._func356_str1, i32 0, i32 0), align 8
@.str._func356_str2 = private unnamed_addr constant [7 x i8] c"<asm0>\00", align 1
@_func356_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func356_str2, i32 0, i32 0), align 8
@.str._func357_str1 = private unnamed_addr constant [17 x i8] c"readConfig = %s\0A\00", align 1
@_func357_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func357_str1, i32 0, i32 0), align 8
@.str._func357_str2 = private unnamed_addr constant [7 x i8] c"config\00", align 1
@_func357_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func357_str2, i32 0, i32 0), align 8
@.str._func357_str3 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func357_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func357_str3, i32 0, i32 0), align 8
@.str._func357_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@_func357_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func357_str4, i32 0, i32 0), align 8
@.str._func357_str5 = private unnamed_addr constant [11 x i8] c"%s = %lld\0A\00", align 1
@_func357_str5 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func357_str5, i32 0, i32 0), align 8
@.str._func358_str1 = private unnamed_addr constant [16 x i8] c"checkModule %s\0A\00", align 1
@_func358_str1 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func358_str1, i32 0, i32 0), align 8
@.str._func358_str2 = private unnamed_addr constant [20 x i8] c"end-checkModule %s\0A\00", align 1
@_func358_str2 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str._func358_str2, i32 0, i32 0), align 8
@.str._func363_str1 = private unnamed_addr constant [11 x i8] c"m2 v%d.%d\0A\00", align 1
@_func363_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func363_str1, i32 0, i32 0), align 8
@.str._func363_str2 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@_func363_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func363_str2, i32 0, i32 0), align 8
@.str._func363_str3 = private unnamed_addr constant [11 x i8] c"lines: %d\0A\00", align 1
@_func363_str3 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func363_str3, i32 0, i32 0), align 8
@.str._func363_str4 = private unnamed_addr constant [12 x i8] c"error : %d\0A\00", align 1
@_func363_str4 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func363_str4, i32 0, i32 0), align 8
@.str._func363_str5 = private unnamed_addr constant [8 x i8] c"main.ll\00", align 1
@_func363_str5 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func363_str5, i32 0, i32 0), align 8
@.str._func364_str1 = private unnamed_addr constant [7 x i8] c"-arch=\00", align 1
@_func364_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func364_str1, i32 0, i32 0), align 8
@.str._func364_str2 = private unnamed_addr constant [10 x i8] c"cortex-m3\00", align 1
@_func364_str2 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func364_str2, i32 0, i32 0), align 8
@.str._func364_str3 = private unnamed_addr constant [4 x i8] c"x64\00", align 1
@_func364_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func364_str3, i32 0, i32 0), align 8
@.str._func364_str4 = private unnamed_addr constant [21 x i8] c"unknown architecture\00", align 1
@_func364_str4 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str._func364_str4, i32 0, i32 0), align 8
@.str._func364_str5 = private unnamed_addr constant [6 x i8] c"-lib=\00", align 1
@_func364_str5 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func364_str5, i32 0, i32 0), align 8
@.str._func364_str6 = private unnamed_addr constant [7 x i8] c"-conf=\00", align 1
@_func364_str6 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func364_str6, i32 0, i32 0), align 8
@.str._func365_str1 = private unnamed_addr constant [8 x i8] c"usage:\0A\00", align 1
@_func365_str1 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func365_str1, i32 0, i32 0), align 8
@.str._func365_str2 = private unnamed_addr constant [25 x i8] c"  -lib=/path/to/lib/dir\0A\00", align 1
@_func365_str2 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str._func365_str2, i32 0, i32 0), align 8
@.str._func365_str3 = private unnamed_addr constant [24 x i8] c"  -arch=x86, cortex-m3\0A\00", align 1
@_func365_str3 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func365_str3, i32 0, i32 0), align 8
@.str._func365_str4 = private unnamed_addr constant [16 x i8] c"  m2 <target>\0A\0A\00", align 1
@_func365_str4 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func365_str4, i32 0, i32 0), align 8
@.str._func367_str1 = private unnamed_addr constant [5 x i8] c"* %s\00", align 1
@_func367_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func367_str1, i32 0, i32 0), align 8
@.str._func367_str2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@_func367_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func367_str2, i32 0, i32 0), align 8
@.str._func367_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func367_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func367_str3, i32 0, i32 0), align 8
@.str._func369_str1 = private unnamed_addr constant [8 x i8] c"VAL: %s\00", align 1
@_func369_str1 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func369_str1, i32 0, i32 0), align 8
@.str._func369_str2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@_func369_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func369_str2, i32 0, i32 0), align 8
@.str._func369_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func369_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func369_str3, i32 0, i32 0), align 8

;arrays:


;vars:

@cfg = global %Settings zeroinitializer
@arch = global %Arch zeroinitializer
@settings = global %List* zeroinitializer
@lstate = global %State zeroinitializer
@lines = global %Nat32 zeroinitializer
@pdir = global %Str zeroinitializer
@liblist = global %List zeroinitializer
@warncnt = global %Nat32 zeroinitializer
@errcnt = global %Nat32 zeroinitializer
@needs = global %Bool zeroinitializer
@typeUnknown = global %Type* zeroinitializer
@typeUnit = global %Type* zeroinitializer
@typeBool = global %Type* zeroinitializer
@typeChar = global %Type* zeroinitializer
@typeStr = global %Type* zeroinitializer
@typeEnum = global %Type* zeroinitializer
@typeBaseInt = global %Type* zeroinitializer
@typeFreePtr = global %Type* zeroinitializer
@typeNumeric = global %Type* zeroinitializer
@uid = global %Nat32 zeroinitializer
@builtinIndex = global %Index zeroinitializer
@func_uid = global %Nat32 zeroinitializer
@str_uid = global %Nat32 zeroinitializer
@arr_uid = global %Nat32 zeroinitializer
@var_uid = global %Nat32 zeroinitializer
@type_uid = global %Nat32 zeroinitializer
@imports = global %List zeroinitializer
@old_mctx = global %ModuleContext* zeroinitializer
@fctx = global %FuncContext zeroinitializer
@asm0 = global %Assembly zeroinitializer
@comments = global %Bool zeroinitializer
@fout = global %Unit* zeroinitializer
@lab = global %Nat32 zeroinitializer
@md = global %Nat32 zeroinitializer
@md_list = global %List zeroinitializer
@if_id = global %Nat32 zeroinitializer
@global_while_id = global %Nat32 zeroinitializer
@old_while_id = global %Nat32 zeroinitializer
@blockno = global %Nat32 zeroinitializer
@stmtno = global %Nat32 zeroinitializer

;funcs:

declare %Unit* @malloc (%Nat32)
declare %Unit* @memset (%Unit*, %Nat8, %Nat32)
declare %Unit* @memcpy (%Unit*, %Unit*, %Nat32)
declare %Int32 @memcmp (%Unit*, %Unit*, %Nat32)
declare void @free (%Unit*)
declare %Int32 @putchar (%Int8)
declare %Int32 @strcmp (%Str, %Str)
declare %Int32 @strncmp (%Str, %Str, %Nat32)
declare %Nat8* @strcpy (%Str, %Str)
declare %Nat32 @strlen (%Str)
declare %Int32 @printf (%Str, ...)
declare %Int32 @scanf (%Str, ...)
declare %Int32 @sscanf (%Unit*, %Str, ...)
declare %Int32 @sprintf (%Unit*, %Str, ...)
declare %Int32 @chdir (%Str)
declare %Unit* @fopen (%Str, %Str)
declare %Int32 @fprintf (%Unit*, %Str, ...)
declare %Int32 @fseek (%Unit*, %Int64, %Int32)
declare %Int32 @fclose (%Unit*)
declare %Int32 @open (%Str, %Int32)
declare %Int32 @read (%Int32, %Nat8*, %Nat32)
declare %Int32 @write (%Int32, %Nat8*, %Nat32)
declare %Int64 @lseek (%Int32, %Int64, %Int32)
declare %Int32 @close (%Int32)
declare void @exit (%Int32)
declare %Unit* @opendir (%Str)
declare %Int32 @closedir (%Unit*)
declare %Str @getcwd (%Str, %Nat32)
declare %Str @getenv (%Str)

define %Str @str_new (%Nat32) {

;stmt0:
  %2 = add %Nat32 %0, 1
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 %2)
  %4 = bitcast %Unit* %3 to %Str
  ret %Str %4
}

define %Str @dup (%Str) {

;stmt0:
  %2 = call %Nat32 (%Str) @strlen (%Str %0)

;stmt1:
  %3 = call %Str (%Nat32) @str_new (%Nat32 %2)

;stmt2:
  %4 = call %Nat8* (%Str, %Str) @strcpy (%Str %3, %Str %0)

;stmt3:
  ret %Str %3
}

define %Str @cat (%Str, %Str) {

;stmt0:
  %3 = call %Nat32 (%Str) @strlen (%Str %0)

;stmt1:
  %4 = call %Nat32 (%Str) @strlen (%Str %1)

;stmt2:
  %5 = add %Nat32 %3, %4

;stmt3:
  %6 = call %Str (%Nat32) @str_new (%Nat32 %5)

;stmt4:
  %7 = getelementptr inbounds %Nat8, %Str %6, %Int32 0
  %8 = bitcast %Nat8* %7 to %Str
  %9 = call %Nat8* (%Str, %Str) @strcpy (%Str %8, %Str %0)

;stmt5:
  %10 = getelementptr inbounds %Nat8, %Str %6, %Nat32 %3
  %11 = bitcast %Nat8* %10 to %Str
  %12 = call %Nat8* (%Str, %Str) @strcpy (%Str %11, %Str %1)

;stmt6:
  %13 = getelementptr inbounds %Nat8, %Str %6, %Nat32 %5
  store %Nat8 0, %Nat8* %13

;stmt7:
  ret %Str %6
}

define %Str @cat3 (%Str, %Str, %Str) {

;stmt0:
  %4 = call %Nat32 (%Str) @strlen (%Str %0)

;stmt1:
  %5 = call %Nat32 (%Str) @strlen (%Str %1)

;stmt2:
  %6 = call %Nat32 (%Str) @strlen (%Str %2)

;stmt3:
  %7 = add %Nat32 %4, %5

;stmt4:
  %8 = add %Nat32 %7, %6

;stmt5:
  %9 = call %Str (%Nat32) @str_new (%Nat32 %8)

;stmt6:
  %10 = getelementptr inbounds %Nat8, %Str %9, %Int32 0
  %11 = bitcast %Nat8* %10 to %Str
  %12 = call %Nat8* (%Str, %Str) @strcpy (%Str %11, %Str %0)

;stmt7:
  %13 = getelementptr inbounds %Nat8, %Str %9, %Nat32 %4
  %14 = bitcast %Nat8* %13 to %Str
  %15 = call %Nat8* (%Str, %Str) @strcpy (%Str %14, %Str %1)

;stmt8:
  %16 = getelementptr inbounds %Nat8, %Str %9, %Nat32 %7
  %17 = bitcast %Nat8* %16 to %Str
  %18 = call %Nat8* (%Str, %Str) @strcpy (%Str %17, %Str %2)

;stmt9:
  %19 = getelementptr inbounds %Nat8, %Str %9, %Nat32 %8
  store %Nat8 0, %Nat8* %19

;stmt10:
  ret %Str %9
}

define %Str @cat4 (%Str, %Str, %Str, %Str) {

;stmt0:
  %5 = call %Nat32 (%Str) @strlen (%Str %0)

;stmt1:
  %6 = call %Nat32 (%Str) @strlen (%Str %1)

;stmt2:
  %7 = call %Nat32 (%Str) @strlen (%Str %2)

;stmt3:
  %8 = call %Nat32 (%Str) @strlen (%Str %3)

;stmt4:
  %9 = add %Nat32 %5, %6

;stmt5:
  %10 = add %Nat32 %9, %7

;stmt6:
  %11 = add %Nat32 %10, %8

;stmt7:
  %12 = call %Str (%Nat32) @str_new (%Nat32 %11)

;stmt8:
  %13 = getelementptr inbounds %Nat8, %Str %12, %Int32 0
  %14 = bitcast %Nat8* %13 to %Str
  %15 = call %Nat8* (%Str, %Str) @strcpy (%Str %14, %Str %0)

;stmt9:
  %16 = getelementptr inbounds %Nat8, %Str %12, %Nat32 %5
  %17 = bitcast %Nat8* %16 to %Str
  %18 = call %Nat8* (%Str, %Str) @strcpy (%Str %17, %Str %1)

;stmt10:
  %19 = getelementptr inbounds %Nat8, %Str %12, %Nat32 %9
  %20 = bitcast %Nat8* %19 to %Str
  %21 = call %Nat8* (%Str, %Str) @strcpy (%Str %20, %Str %2)

;stmt11:
  %22 = getelementptr inbounds %Nat8, %Str %12, %Nat32 %10
  %23 = bitcast %Nat8* %22 to %Str
  %24 = call %Nat8* (%Str, %Str) @strcpy (%Str %23, %Str %3)

;stmt12:
  %25 = getelementptr inbounds %Nat8, %Str %12, %Nat32 %11
  store %Nat8 0, %Nat8* %25

;stmt13:
  ret %Str %12
}

define %Str @cat5 (%Str, %Str, %Str, %Str, %Str) {

;stmt0:
  %6 = call %Nat32 (%Str) @strlen (%Str %0)

;stmt1:
  %7 = call %Nat32 (%Str) @strlen (%Str %1)

;stmt2:
  %8 = call %Nat32 (%Str) @strlen (%Str %2)

;stmt3:
  %9 = call %Nat32 (%Str) @strlen (%Str %3)

;stmt4:
  %10 = call %Nat32 (%Str) @strlen (%Str %4)

;stmt5:
  %11 = add %Nat32 %6, %7

;stmt6:
  %12 = add %Nat32 %11, %8

;stmt7:
  %13 = add %Nat32 %12, %9

;stmt8:
  %14 = add %Nat32 %13, %10

;stmt9:
  %15 = call %Str (%Nat32) @str_new (%Nat32 %14)

;stmt10:
  %16 = getelementptr inbounds %Nat8, %Str %15, %Int32 0
  %17 = bitcast %Nat8* %16 to %Str
  %18 = call %Nat8* (%Str, %Str) @strcpy (%Str %17, %Str %0)

;stmt11:
  %19 = getelementptr inbounds %Nat8, %Str %15, %Nat32 %6
  %20 = bitcast %Nat8* %19 to %Str
  %21 = call %Nat8* (%Str, %Str) @strcpy (%Str %20, %Str %1)

;stmt12:
  %22 = getelementptr inbounds %Nat8, %Str %15, %Nat32 %11
  %23 = bitcast %Nat8* %22 to %Str
  %24 = call %Nat8* (%Str, %Str) @strcpy (%Str %23, %Str %2)

;stmt13:
  %25 = getelementptr inbounds %Nat8, %Str %15, %Nat32 %12
  %26 = bitcast %Nat8* %25 to %Str
  %27 = call %Nat8* (%Str, %Str) @strcpy (%Str %26, %Str %3)

;stmt14:
  %28 = getelementptr inbounds %Nat8, %Str %15, %Nat32 %13
  %29 = bitcast %Nat8* %28 to %Str
  %30 = call %Nat8* (%Str, %Str) @strcpy (%Str %29, %Str %4)

;stmt15:
  %31 = getelementptr inbounds %Nat8, %Str %15, %Nat32 %14
  store %Nat8 0, %Nat8* %31

;stmt16:
  ret %Str %15
}

define void @assert (%Bool, %Str) {

;stmt0:
  %3 = xor %Bool %0, 1
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = load %Str, %Str* @_func7_str1
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %1)

;stmt3:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Nat32 @prepart (%Str) {

;stmt0:
  %2 = alloca %Nat32

;stmt1:
  %3 = alloca %Nat32

;stmt2:
  store %Nat32 0, %Nat32* %2

;stmt3:
  store %Nat32 0, %Nat32* %3

;stmt4:
  br label %continue_0
continue_0:
  %4 = load %Nat32, %Nat32* %3
  %5 = getelementptr inbounds %Nat8, %Str %0, %Nat32 %4
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp ne %Nat8 %6, 0
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %8 = load %Nat32, %Nat32* %3
  %9 = getelementptr inbounds %Nat8, %Str %0, %Nat32 %8
  %10 = load %Nat8, %Nat8* %9
  %11 = load %Str, %Str* @_func8_str1
  %12 = getelementptr inbounds %Nat8, %Str %11, %Int32 0
  %13 = load %Nat8, %Nat8* %12
  %14 = icmp eq %Nat8 %10, %13
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %15 = load %Nat32, %Nat32* %3
  %16 = add %Nat32 %15, 1
  store %Nat32 %16, %Nat32* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  %17 = load %Nat32, %Nat32* %3
  %18 = add %Nat32 %17, 1
  store %Nat32 %18, %Nat32* %3
  br label %continue_0
break_0:

;stmt10:
  %19 = load %Nat32, %Nat32* %2
  ret %Nat32 %19
}

define %Str @getprefix (%Str) {

;stmt0:
  %2 = call %Nat32 (%Str) @prepart (%Str %0)

;stmt1:
  %3 = add %Nat32 %2, 1
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 %3)
  %5 = bitcast %Unit* %4 to %Str

;stmt2:
  %6 = bitcast %Str %5 to %Unit*
  %7 = bitcast %Str %0 to %Unit*
  %8 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %6, %Unit* %7, %Nat32 %2)

;stmt3:
  %9 = getelementptr inbounds %Nat8, %Str %5, %Nat32 %2
  store %Nat8 0, %Nat8* %9

;stmt4:
  ret %Str %5
}

define %Str @get_last (%Str) {

;stmt0:
  %2 = call %Nat32 (%Str) @prepart (%Str %0)

;stmt1:
  %3 = call %Nat32 (%Str) @strlen (%Str %0)
  %4 = sub %Nat32 %3, %2

;stmt2:
  %5 = add %Nat32 %4, 1
  %6 = call %Unit* (%Nat32) @malloc (%Nat32 %5)
  %7 = bitcast %Unit* %6 to %Str

;stmt3:
  %8 = bitcast %Str %7 to %Unit*
  %9 = getelementptr inbounds %Nat8, %Str %0, %Nat32 %2
  %10 = bitcast %Nat8* %9 to %Unit*
  %11 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %8, %Unit* %10, %Nat32 %4)

;stmt4:
  %12 = getelementptr inbounds %Nat8, %Str %7, %Nat32 %4
  store %Nat8 0, %Nat8* %12

;stmt5:
  ret %Str %7
}

define %Bool @exists (%Str) {

;stmt0:
  %2 = call %Int32 (%Str, %Int32) @open (%Str %0, %Int32 0)

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

define %Bool @isdir (%Str) {

;stmt0:
  %2 = call %Unit* (%Str) @opendir (%Str %0)

;stmt1:
  %3 = inttoptr i64 0 to %Unit*
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

define void @node_init (%Node*) {

;stmt0:
  %2 = bitcast %Node* %0 to %Unit*
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

define void @node_append (%Node*, %Node*) {

;stmt0:
  %3 = getelementptr inbounds %Node, %Node* %0, i32 0, i32 1
  %4 = load %Node*, %Node** %3

;stmt1:
  %5 = bitcast %Node* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 1
  store %Node* %4, %Node** %8

;stmt4:
  %9 = getelementptr inbounds %Node, %Node* %4, i32 0, i32 0
  store %Node* %1, %Node** %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %10 = getelementptr inbounds %Node, %Node* %0, i32 0, i32 1
  store %Node* %1, %Node** %10

;stmt6:
  %11 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 0
  store %Node* %0, %Node** %11
  ret void
}

define void @node_exclude (%Node*) {

;stmt0:
  %2 = getelementptr inbounds %Node, %Node* %0, i32 0, i32 0
  %3 = load %Node*, %Node** %2

;stmt1:
  %4 = getelementptr inbounds %Node, %Node* %0, i32 0, i32 1
  %5 = load %Node*, %Node** %4

;stmt2:
  %6 = bitcast %Node* %3 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %9 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 1
  store %Node* %5, %Node** %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %10 = bitcast %Node* %5 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %13 = getelementptr inbounds %Node, %Node* %5, i32 0, i32 0
  store %Node* %3, %Node** %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @node_foreach (%Node*, %NodeForeachHandler, %Unit*) {

;stmt0:
  %4 = bitcast %Node* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %8 = alloca %Node*

;stmt4:
  store %Node* %0, %Node** %8

;stmt5:
  %9 = alloca %Nat32

;stmt6:
  store %Nat32 0, %Nat32* %9

;stmt7:
  br label %continue_0
continue_0:
  %10 = load %Node*, %Node** %8
  %11 = bitcast %Node* %10 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %14 = load %Node*, %Node** %8
  %15 = load %Nat32, %Nat32* %9
  call void (%Node*, %Unit*, %Nat32) %1 (%Node* %14, %Unit* %2, %Nat32 %15)

;stmt10:
  %16 = load %Node*, %Node** %8
  %17 = getelementptr inbounds %Node, %Node* %16, i32 0, i32 1
  %18 = load %Node*, %Node** %17
  store %Node* %18, %Node** %8

;stmt11:
  %19 = load %Nat32, %Nat32* %9
  %20 = add %Nat32 %19, 1
  store %Nat32 %20, %Nat32* %9
  br label %continue_0
break_0:
  ret void
}

define %Node* @node_search (%Node*, %NodeSearchHandler, %Unit*) {

;stmt0:
  %4 = bitcast %Node* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = inttoptr i64 0 to %Node*
  ret %Node* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = alloca %Node*

;stmt4:
  store %Node* %0, %Node** %9

;stmt5:
  %10 = alloca %Nat32

;stmt6:
  store %Nat32 0, %Nat32* %10

;stmt7:
  br label %continue_0
continue_0:
  %11 = load %Node*, %Node** %9
  %12 = bitcast %Node* %11 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  br i1 %14, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %15 = load %Node*, %Node** %9
  %16 = load %Nat32, %Nat32* %10
  %17 = call %Bool (%Node*, %Unit*, %Nat32) %1 (%Node* %15, %Unit* %2, %Nat32 %16)
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %18 = load %Node*, %Node** %9
  ret %Node* %18
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %20 = load %Node*, %Node** %9
  %21 = getelementptr inbounds %Node, %Node* %20, i32 0, i32 1
  %22 = load %Node*, %Node** %21
  store %Node* %22, %Node** %9

;stmt13:
  %23 = load %Nat32, %Nat32* %10
  %24 = add %Nat32 %23, 1
  store %Nat32 %24, %Nat32* %10
  br label %continue_0
break_0:

;stmt14:
  %25 = inttoptr i64 0 to %Node*
  ret %Node* %25
}

define %Bool @_func20 (%Node*, %Unit*, %Nat32) {

;stmt0:
  %4 = getelementptr inbounds %Node, %Node* %0, i32 0, i32 3
  %5 = load %Unit*, %Unit** %4
  %6 = icmp eq %Unit* %5, %1
  ret %Bool %6
}

define %Node* @node_search_by_data (%Node*, %Unit*) {

;stmt0:
  %3 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %0, %NodeSearchHandler @_func20, %Unit* %1)
  ret %Node* %3
}

define void @list_init (%List*) {

;stmt0:
  %2 = bitcast %List* %0 to %Unit*
  %3 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %2, %Nat8 0, %Nat32 24)
  ret void
}

define %List* @list_new () {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %List*

;stmt1:
  call void (%List*) @list_init (%List* %2)

;stmt2:
  ret %List* %2
}

define %Bool @list_append (%List*, %Unit*) {

;stmt0:
  %3 = bitcast %List* %0 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp eq %Unit* %1, %6
  %8 = or %Bool %5, %7
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
  %11 = getelementptr inbounds %Node, %Node* %10, i32 0, i32 3
  store %Unit* %1, %Unit** %11

;stmt5:
  %12 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %13 = load %Node*, %Node** %12
  %14 = bitcast %Node* %13 to %Unit*
  %15 = inttoptr i64 0 to %Unit*
  %16 = icmp eq %Unit* %14, %15
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %17 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  store %Node* %10, %Node** %17
  br label %endif_1
else_1:

;stmt8:

;stmt9:
  %18 = getelementptr inbounds %List, %List* %0, i32 0, i32 1
  %19 = load %Node*, %Node** %18
  call void (%Node*, %Node*) @node_append (%Node* %19, %Node* %10)
  br label %endif_1
endif_1:

;stmt10:
  %20 = getelementptr inbounds %List, %List* %0, i32 0, i32 1
  store %Node* %10, %Node** %20

;stmt11:
  %21 = getelementptr inbounds %List, %List* %0, i32 0, i32 2
  %22 = getelementptr inbounds %List, %List* %0, i32 0, i32 2
  %23 = load %Nat64, %Nat64* %22
  %24 = add %Nat64 %23, 1
  store %Nat64 %24, %Nat64* %21

;stmt12:
  ret %Bool 1
}

define %Bool @list_extend (%List*, %List*) {

;stmt0:
  %3 = bitcast %List* %0 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  %6 = bitcast %List* %1 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %5, %8
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
  %11 = getelementptr inbounds %List, %List* %0, i32 0, i32 1
  %12 = load %Node*, %Node** %11

;stmt4:
  %13 = getelementptr inbounds %List, %List* %0, i32 0, i32 2
  %14 = getelementptr inbounds %List, %List* %0, i32 0, i32 2
  %15 = load %Nat64, %Nat64* %14
  %16 = getelementptr inbounds %List, %List* %1, i32 0, i32 2
  %17 = load %Nat64, %Nat64* %16
  %18 = add %Nat64 %15, %17
  store %Nat64 %18, %Nat64* %13

;stmt5:
  %19 = bitcast %Node* %12 to %Unit*
  %20 = inttoptr i64 0 to %Unit*
  %21 = icmp eq %Unit* %19, %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %22 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %23 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %24 = load %Node*, %Node** %23
  store %Node* %24, %Node** %22

;stmt8:
  %25 = getelementptr inbounds %List, %List* %0, i32 0, i32 1
  %26 = getelementptr inbounds %List, %List* %1, i32 0, i32 1
  %27 = load %Node*, %Node** %26
  store %Node* %27, %Node** %25

;stmt9:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %29 = getelementptr inbounds %Node, %Node* %12, i32 0, i32 1
  %30 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %31 = load %Node*, %Node** %30
  store %Node* %31, %Node** %29

;stmt11:
  %32 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %33 = load %Node*, %Node** %32
  %34 = bitcast %Node* %33 to %Unit*
  %35 = inttoptr i64 0 to %Unit*
  %36 = icmp ne %Unit* %34, %35
  %37 = getelementptr inbounds %List, %List* %1, i32 0, i32 1
  %38 = load %Node*, %Node** %37
  %39 = bitcast %Node* %38 to %Unit*
  %40 = inttoptr i64 0 to %Unit*
  %41 = icmp ne %Unit* %39, %40
  %42 = and %Bool %36, %41
  br i1 %42, label %then_2, label %else_2
then_2:

;stmt12:

;stmt13:
  %43 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %44 = load %Node*, %Node** %43
  %45 = getelementptr inbounds %Node, %Node* %44, i32 0, i32 0
  store %Node* %12, %Node** %45

;stmt14:
  %46 = getelementptr inbounds %List, %List* %0, i32 0, i32 1
  %47 = getelementptr inbounds %List, %List* %1, i32 0, i32 1
  %48 = load %Node*, %Node** %47
  store %Node* %48, %Node** %46
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt15:
  ret %Bool 1
}

define %Bool @list_subst (%List*, %Unit*, %Unit*) {

;stmt0:
  %4 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %5 = load %Node*, %Node** %4
  %6 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %5, %Unit* %1)

;stmt1:
  %7 = bitcast %Node* %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %11 = getelementptr inbounds %Node, %Node* %6, i32 0, i32 3
  store %Unit* %2, %Unit** %11

;stmt5:
  ret %Bool 1
}

define void @list_node_remove (%List*, %Node*) {

;stmt0:
  %3 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 0
  %4 = load %Node*, %Node** %3

;stmt1:
  %5 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 1
  %6 = load %Node*, %Node** %5

;stmt2:
  call void (%Node*) @node_exclude (%Node* %1)

;stmt3:
  %7 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %8 = load %Node*, %Node** %7
  %9 = icmp eq %Node* %8, %1
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %10 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  store %Node* %6, %Node** %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %11 = getelementptr inbounds %List, %List* %0, i32 0, i32 1
  %12 = load %Node*, %Node** %11
  %13 = icmp eq %Node* %12, %1
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %14 = getelementptr inbounds %List, %List* %0, i32 0, i32 1
  store %Node* %4, %Node** %14
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %15 = bitcast %Node* %1 to %Unit*
  call void (%Unit*) @free (%Unit* %15)

;stmt10:
  %16 = getelementptr inbounds %List, %List* %0, i32 0, i32 2
  %17 = getelementptr inbounds %List, %List* %0, i32 0, i32 2
  %18 = load %Nat64, %Nat64* %17
  %19 = sub %Nat64 %18, 1
  store %Nat64 %19, %Nat64* %16
  ret void
}

define %Bool @list_remove (%List*, %Unit*) {

;stmt0:
  %3 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %4 = load %Node*, %Node** %3
  %5 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %4, %Unit* %1)

;stmt1:
  %6 = bitcast %Node* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
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
  call void (%List*, %Node*) @list_node_remove (%List* %0, %Node* %5)

;stmt5:
  ret %Bool 1
}

define void @list_foreach (%List*, %ListForeachHandler, %Unit*) {

;stmt0:
  %4 = alloca %Nat32

;stmt1:
  store %Nat32 0, %Nat32* %4

;stmt2:
  %5 = alloca %Node*

;stmt3:
  %6 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %7 = load %Node*, %Node** %6
  store %Node* %7, %Node** %5

;stmt4:
  br label %continue_0
continue_0:
  %8 = load %Node*, %Node** %5
  %9 = bitcast %Node* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %12 = load %Node*, %Node** %5
  %13 = getelementptr inbounds %Node, %Node* %12, i32 0, i32 3
  %14 = load %Unit*, %Unit** %13
  %15 = load %Nat32, %Nat32* %4
  call void (%Unit*, %Unit*, %Nat32) %1 (%Unit* %14, %Unit* %2, %Nat32 %15)

;stmt7:
  %16 = load %Node*, %Node** %5
  %17 = getelementptr inbounds %Node, %Node* %16, i32 0, i32 1
  %18 = load %Node*, %Node** %17
  store %Node* %18, %Node** %5

;stmt8:
  %19 = load %Nat32, %Nat32* %4
  %20 = add %Nat32 %19, 1
  store %Nat32 %20, %Nat32* %4
  br label %continue_0
break_0:
  ret void
}

define void @list_foreach2 (%List*, %List*, %ListForeachHandler2, %Unit*) {

;stmt0:
  %5 = alloca %Node*

;stmt1:
  %6 = alloca %Node*

;stmt2:
  %7 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %8 = load %Node*, %Node** %7
  store %Node* %8, %Node** %5

;stmt3:
  %9 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %10 = load %Node*, %Node** %9
  store %Node* %10, %Node** %6

;stmt4:
  %11 = alloca %Nat32

;stmt5:
  store %Nat32 0, %Nat32* %11

;stmt6:
  br label %continue_0
continue_0:
  %12 = load %Node*, %Node** %5
  %13 = bitcast %Node* %12 to %Unit*
  %14 = inttoptr i64 0 to %Unit*
  %15 = icmp ne %Unit* %13, %14
  %16 = load %Node*, %Node** %6
  %17 = bitcast %Node* %16 to %Unit*
  %18 = inttoptr i64 0 to %Unit*
  %19 = icmp ne %Unit* %17, %18
  %20 = and %Bool %15, %19
  br i1 %20, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %21 = load %Node*, %Node** %5
  %22 = getelementptr inbounds %Node, %Node* %21, i32 0, i32 3
  %23 = load %Unit*, %Unit** %22
  %24 = load %Node*, %Node** %6
  %25 = getelementptr inbounds %Node, %Node* %24, i32 0, i32 3
  %26 = load %Unit*, %Unit** %25
  %27 = load %Nat32, %Nat32* %11
  call void (%Unit*, %Unit*, %Unit*, %Nat32) %2 (%Unit* %23, %Unit* %26, %Unit* %3, %Nat32 %27)

;stmt9:
  %28 = load %Node*, %Node** %5
  %29 = getelementptr inbounds %Node, %Node* %28, i32 0, i32 1
  %30 = load %Node*, %Node** %29
  store %Node* %30, %Node** %5

;stmt10:
  %31 = load %Node*, %Node** %6
  %32 = getelementptr inbounds %Node, %Node* %31, i32 0, i32 1
  %33 = load %Node*, %Node** %32
  store %Node* %33, %Node** %6

;stmt11:
  %34 = load %Nat32, %Nat32* %11
  %35 = add %Nat32 %34, 1
  store %Nat32 %35, %Nat32* %11
  br label %continue_0
break_0:
  ret void
}

define %Bool @list_compare (%List*, %List*, %ListCompareHandler, %Unit*) {

;stmt0:
  %5 = getelementptr inbounds %List, %List* %0, i32 0, i32 2
  %6 = load %Nat64, %Nat64* %5
  %7 = getelementptr inbounds %List, %List* %1, i32 0, i32 2
  %8 = load %Nat64, %Nat64* %7
  %9 = icmp ne %Nat64 %6, %8
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
  %11 = alloca %Node*

;stmt4:
  %12 = alloca %Node*

;stmt5:
  %13 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %14 = load %Node*, %Node** %13
  store %Node* %14, %Node** %11

;stmt6:
  %15 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %16 = load %Node*, %Node** %15
  store %Node* %16, %Node** %12

;stmt7:
  %17 = alloca %Nat32

;stmt8:
  store %Nat32 0, %Nat32* %17

;stmt9:
  br label %continue_0
continue_0:
  %18 = load %Node*, %Node** %11
  %19 = bitcast %Node* %18 to %Unit*
  %20 = inttoptr i64 0 to %Unit*
  %21 = icmp ne %Unit* %19, %20
  %22 = load %Node*, %Node** %12
  %23 = bitcast %Node* %22 to %Unit*
  %24 = inttoptr i64 0 to %Unit*
  %25 = icmp ne %Unit* %23, %24
  %26 = and %Bool %21, %25
  br i1 %26, label %body_0, label %break_0
body_0:

;stmt10:

;stmt11:
  %27 = load %Node*, %Node** %11
  %28 = getelementptr inbounds %Node, %Node* %27, i32 0, i32 3
  %29 = load %Unit*, %Unit** %28
  %30 = load %Node*, %Node** %12
  %31 = getelementptr inbounds %Node, %Node* %30, i32 0, i32 3
  %32 = load %Unit*, %Unit** %31
  %33 = load %Nat32, %Nat32* %17
  %34 = call %Bool (%Unit*, %Unit*, %Unit*, %Nat32) %2 (%Unit* %29, %Unit* %32, %Unit* %3, %Nat32 %33)
  %35 = xor %Bool %34, 1
  br i1 %35, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  ret %Bool 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt14:
  %37 = load %Node*, %Node** %11
  %38 = getelementptr inbounds %Node, %Node* %37, i32 0, i32 1
  %39 = load %Node*, %Node** %38
  store %Node* %39, %Node** %11

;stmt15:
  %40 = load %Node*, %Node** %12
  %41 = getelementptr inbounds %Node, %Node* %40, i32 0, i32 1
  %42 = load %Node*, %Node** %41
  store %Node* %42, %Node** %12

;stmt16:
  %43 = load %Nat32, %Nat32* %17
  %44 = add %Nat32 %43, 1
  store %Nat32 %44, %Nat32* %17
  br label %continue_0
break_0:

;stmt17:
  ret %Bool 1
}

define %Unit* @list_search (%List*, %ListSearchHandler, %Unit*) {

;stmt0:
  %4 = bitcast %List* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = inttoptr i64 0 to %Unit*
  ret %Unit* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = alloca %Node*

;stmt4:
  %10 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %11 = load %Node*, %Node** %10
  store %Node* %11, %Node** %9

;stmt5:
  %12 = alloca %Nat32

;stmt6:
  store %Nat32 0, %Nat32* %12

;stmt7:
  br label %continue_0
continue_0:
  %13 = load %Node*, %Node** %9
  %14 = bitcast %Node* %13 to %Unit*
  %15 = inttoptr i64 0 to %Unit*
  %16 = icmp ne %Unit* %14, %15
  br i1 %16, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %17 = load %Node*, %Node** %9
  %18 = getelementptr inbounds %Node, %Node* %17, i32 0, i32 3
  %19 = load %Unit*, %Unit** %18
  %20 = load %Nat32, %Nat32* %12
  %21 = call %Bool (%Unit*, %Unit*, %Nat32) %1 (%Unit* %19, %Unit* %2, %Nat32 %20)
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %22 = load %Node*, %Node** %9
  %23 = getelementptr inbounds %Node, %Node* %22, i32 0, i32 3
  %24 = load %Unit*, %Unit** %23
  ret %Unit* %24
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %26 = load %Node*, %Node** %9
  %27 = getelementptr inbounds %Node, %Node* %26, i32 0, i32 1
  %28 = load %Node*, %Node** %27
  store %Node* %28, %Node** %9

;stmt13:
  %29 = load %Nat32, %Nat32* %12
  %30 = add %Nat32 %29, 1
  store %Nat32 %30, %Nat32* %12
  br label %continue_0
break_0:

;stmt14:
  %31 = inttoptr i64 0 to %Unit*
  ret %Unit* %31
}

define %List* @list_map (%List*, %ListMapHandler, %Unit*) {

;stmt0:
  %4 = bitcast %List* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = inttoptr i64 0 to %List*
  ret %List* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = alloca %Nat32

;stmt4:
  store %Nat32 0, %Nat32* %9

;stmt5:
  %10 = alloca %Node*

;stmt6:
  %11 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %12 = load %Node*, %Node** %11
  store %Node* %12, %Node** %10

;stmt7:
  %13 = call %List* () @list_new ()

;stmt8:
  br label %continue_0
continue_0:
  %14 = load %Node*, %Node** %10
  %15 = bitcast %Node* %14 to %Unit*
  %16 = inttoptr i64 0 to %Unit*
  %17 = icmp ne %Unit* %15, %16
  br i1 %17, label %body_0, label %break_0
body_0:

;stmt9:

;stmt10:
  %18 = load %Node*, %Node** %10
  %19 = getelementptr inbounds %Node, %Node* %18, i32 0, i32 3
  %20 = load %Unit*, %Unit** %19
  %21 = load %Nat32, %Nat32* %9
  %22 = call %Unit* (%Unit*, %Unit*, %Nat32) %1 (%Unit* %20, %Unit* %2, %Nat32 %21)

;stmt11:
  %23 = inttoptr i64 0 to %Unit*
  %24 = icmp ne %Unit* %22, %23
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %25 = call %Bool (%List*, %Unit*) @list_append (%List* %13, %Unit* %22)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt14:
  %26 = load %Nat32, %Nat32* %9
  %27 = add %Nat32 %26, 1
  store %Nat32 %27, %Nat32* %9

;stmt15:
  %28 = load %Node*, %Node** %10
  %29 = getelementptr inbounds %Node, %Node* %28, i32 0, i32 1
  %30 = load %Node*, %Node** %29
  store %Node* %30, %Node** %10
  br label %continue_0
break_0:

;stmt16:
  ret %List* %13
}

define %Bool @map_append (%List*, %Str, %Unit*) {

;stmt0:
  %4 = bitcast %List* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = bitcast %Str %1 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp eq %Unit* %2, %10
  %12 = or %Bool %9, %11
  %13 = or %Bool %6, %12
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
  %16 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 2
  %17 = bitcast %Str %1 to %Unit*
  store %Unit* %17, %Unit** %16

;stmt5:
  %18 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 3
  store %Unit* %2, %Unit** %18

;stmt6:
  %19 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %20 = load %Node*, %Node** %19
  %21 = bitcast %Node* %20 to %Unit*
  %22 = inttoptr i64 0 to %Unit*
  %23 = icmp eq %Unit* %21, %22
  br i1 %23, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %24 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  store %Node* %15, %Node** %24
  br label %endif_1
else_1:

;stmt9:

;stmt10:
  %25 = getelementptr inbounds %List, %List* %0, i32 0, i32 1
  %26 = load %Node*, %Node** %25
  call void (%Node*, %Node*) @node_append (%Node* %26, %Node* %15)
  br label %endif_1
endif_1:

;stmt11:
  %27 = getelementptr inbounds %List, %List* %0, i32 0, i32 1
  store %Node* %15, %Node** %27

;stmt12:
  %28 = getelementptr inbounds %List, %List* %0, i32 0, i32 2
  %29 = getelementptr inbounds %List, %List* %0, i32 0, i32 2
  %30 = load %Nat64, %Nat64* %29
  %31 = add %Nat64 %30, 1
  store %Nat64 %31, %Nat64* %28

;stmt13:
  ret %Bool 1
}

define %Bool @f (%Node*, %Unit*, %Nat32) {

;stmt0:
  %4 = getelementptr inbounds %Node, %Node* %0, i32 0, i32 2
  %5 = load %Unit*, %Unit** %4
  %6 = bitcast %Unit* %5 to %Str
  %7 = bitcast %Unit* %1 to %Str
  %8 = call %Int32 (%Str, %Str) @strcmp (%Str %6, %Str %7)
  %9 = icmp eq %Int32 %8, 0
  ret %Bool %9
}

define %Node* @map_list_node_get (%List*, %Str) {

;stmt0:
  %3 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %4 = load %Node*, %Node** %3
  %5 = bitcast %Str %1 to %Unit*
  %6 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %4, %NodeSearchHandler @f, %Unit* %5)
  ret %Node* %6
}

define void @map_reset (%List*, %Str, %Unit*) {

;stmt0:
  %4 = call %Node* (%List*, %Str) @map_list_node_get (%List* %0, %Str %1)

;stmt1:
  %5 = getelementptr inbounds %Node, %Node* %4, i32 0, i32 3
  store %Unit* %2, %Unit** %5
  ret void
}

define %Unit* @map_remove (%List*, %Str) {

;stmt0:
  %3 = call %Node* (%List*, %Str) @map_list_node_get (%List* %0, %Str %1)

;stmt1:
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = inttoptr i64 0 to %Unit*
  ret %Unit* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %9 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 3
  %10 = load %Unit*, %Unit** %9

;stmt5:
  call void (%List*, %Node*) @list_node_remove (%List* %0, %Node* %3)

;stmt6:
  ret %Unit* %10
}

define %Unit* @map_get (%List*, %Str) {

;stmt0:
  %3 = call %Node* (%List*, %Str) @map_list_node_get (%List* %0, %Str %1)

;stmt1:
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 3
  %8 = load %Unit*, %Unit** %7
  ret %Unit* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %10 = inttoptr i64 0 to %Unit*
  ret %Unit* %10
}

define void @map_foreach (%List*, %MapForeachHandler, %Unit*) {

;stmt0:
  %4 = alloca %Node*

;stmt1:
  %5 = getelementptr inbounds %List, %List* %0, i32 0, i32 0
  %6 = load %Node*, %Node** %5
  store %Node* %6, %Node** %4

;stmt2:
  br label %continue_0
continue_0:
  %7 = load %Node*, %Node** %4
  %8 = bitcast %Node* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  br i1 %10, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %11 = load %Node*, %Node** %4
  %12 = getelementptr inbounds %Node, %Node* %11, i32 0, i32 2
  %13 = load %Unit*, %Unit** %12
  %14 = load %Node*, %Node** %4
  %15 = getelementptr inbounds %Node, %Node* %14, i32 0, i32 3
  %16 = load %Unit*, %Unit** %15
  call void (%Unit*, %Unit*, %Unit*) %1 (%Unit* %13, %Unit* %16, %Unit* %2)

;stmt5:
  %17 = load %Node*, %Node** %4
  %18 = getelementptr inbounds %Node, %Node* %17, i32 0, i32 1
  %19 = load %Node*, %Node** %18
  store %Node* %19, %Node** %4
  br label %continue_0
break_0:
  ret void
}

define void @set (%Str, %Nat64) {

;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 8)
  %4 = bitcast %Unit* %3 to %Nat64*

;stmt1:
  store %Nat64 %1, %Nat64* %4

;stmt2:
  %5 = load %List*, %List** @settings
  %6 = call %Unit* (%List*, %Str) @map_get (%List* %5, %Str %0)

;stmt3:
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  call void (%Unit*) @free (%Unit* %6)

;stmt6:
  %9 = load %List*, %List** @settings
  %10 = bitcast %Nat64* %4 to %Unit*
  %11 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %9, %Str %0, %Unit* %10)
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %12 = load %List*, %List** @settings
  %13 = bitcast %Nat64* %4 to %Unit*
  call void (%List*, %Str, %Unit*) @map_reset (%List* %12, %Str %0, %Unit* %13)
  br label %endif_0
endif_0:
  ret void
}

define %Nat64 @get (%Str) {

;stmt0:
  %2 = load %List*, %List** @settings
  %3 = call %Unit* (%List*, %Str) @map_get (%List* %2, %Str %0)
  %4 = bitcast %Unit* %3 to %Nat64*

;stmt1:
  %5 = load %Nat64, %Nat64* %4
  ret %Nat64 %5
}

define %Bool @isalpha (%Nat8) {

;stmt0:
  %2 = load %Str, %Str* @_func42_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp uge %Nat8 %0, %4
  %6 = load %Str, %Str* @_func42_str2
  %7 = getelementptr inbounds %Nat8, %Str %6, %Int32 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp ule %Nat8 %0, %8
  %10 = and %Bool %5, %9
  %11 = load %Str, %Str* @_func42_str3
  %12 = getelementptr inbounds %Nat8, %Str %11, %Int32 0
  %13 = load %Nat8, %Nat8* %12
  %14 = icmp uge %Nat8 %0, %13
  %15 = load %Str, %Str* @_func42_str4
  %16 = getelementptr inbounds %Nat8, %Str %15, %Int32 0
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp ule %Nat8 %0, %17
  %19 = and %Bool %14, %18
  %20 = or %Bool %10, %19
  ret %Bool %20
}

define %Bool @isdigit (%Nat8) {

;stmt0:
  %2 = load %Str, %Str* @_func43_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp uge %Nat8 %0, %4
  %6 = load %Str, %Str* @_func43_str2
  %7 = getelementptr inbounds %Nat8, %Str %6, %Int32 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp ule %Nat8 %0, %8
  %10 = and %Bool %5, %9
  ret %Bool %10
}

define %Bool @isalnum (%Nat8) {

;stmt0:
  %2 = call %Bool (%Nat8) @isalpha (%Nat8 %0)
  %3 = call %Bool (%Nat8) @isdigit (%Nat8 %0)
  %4 = or %Bool %2, %3
  ret %Bool %4
}

define void @lex_init (%Str) {

;stmt0:
  %2 = call %Bool (%Str) @exists (%Str %0)
  %3 = xor %Bool %2, 1
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = load %Str, %Str* @_func45_str1
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %0)

;stmt3:
  %6 = load %Str, %Str* @_func45_str2
  call void (%Str) @fatal (%Str %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 0
  %8 = call %Int32 (%Str, %Int32) @open (%Str %0, %Int32 0)
  store %Int32 %8, %Int32* %7

;stmt5:
  %9 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 7
  store %Str %0, %Str* %9

;stmt6:
  %10 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5
  store %Nat32 1, %Nat32* %10

;stmt7:
  %11 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  store %Nat16 1, %Nat16* %11
  ret void
}

define %Nat8 @getcc () {

;stmt0:
  %1 = alloca %Nat8

;stmt1:
  %2 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp ne %Nat8 %3, 0
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8
  %6 = load %Nat8, %Nat8* %5
  store %Nat8 %6, %Nat8* %1

;stmt4:
  %7 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8
  store %Nat8 0, %Nat8* %7
  br label %endif_0
else_0:

;stmt5:

;stmt6:
  %8 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 0
  %9 = load %Int32, %Int32* %8
  %10 = getelementptr inbounds %Nat8, %Nat8* %1, i32 0
  %11 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %9, %Nat8* %10, %Nat32 1)

;stmt7:
  %12 = icmp eq %Int32 %11, 0
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  ret %Nat8 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %14 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  %15 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  %16 = load %Nat16, %Nat16* %15
  %17 = add %Nat16 %16, 1
  store %Nat16 %17, %Nat16* %14
  br label %endif_0
endif_0:

;stmt11:
  %18 = load %Nat8, %Nat8* %1
  ret %Nat8 %18
}

define void @fill (%Rule) {

;stmt0:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt1:

;stmt2:
  %2 = call %Nat8 () @getcc ()

;stmt3:
  %3 = icmp eq %Nat8 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %4 = load %Str, %Str* @_func47_str1
  call void (%Str) @fatal (%Str %4)

;stmt6:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %5 = call %Bool (%Nat8) %0 (%Nat8 %2)
  br i1 %5, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %6 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %7 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %8 = load %Nat32, %Nat32* %7
  %9 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %6, i32 0, %Nat32 %8
  store %Nat8 %2, %Nat8* %9

;stmt10:
  %10 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %11 = load %Nat32, %Nat32* %10
  %12 = icmp uge %Nat32 %11, 255
  br i1 %12, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %13 = load %Str, %Str* @_func47_str2
  call void (%Str) @fatal (%Str %13)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt13:
  %14 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %15 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %16 = load %Nat32, %Nat32* %15
  %17 = add %Nat32 %16, 1
  store %Nat32 %17, %Nat32* %14
  br label %endif_1
else_1:

;stmt14:

;stmt15:
  call void (%Nat8) @lex_putback (%Nat8 %2)

;stmt16:
  %18 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %19 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %20 = load %Nat32, %Nat32* %19
  %21 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %18, i32 0, %Nat32 %20
  store %Nat8 0, %Nat8* %21

;stmt17:
  br label %break_0
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
  ret void
}

define %Bool @blank (%Nat8) {

;stmt0:
  %2 = load %Str, %Str* @_func48_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %0, %4
  %6 = load %Str, %Str* @_func48_str2
  %7 = getelementptr inbounds %Nat8, %Str %6, %Int32 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %0, %8
  %10 = or %Bool %5, %9
  ret %Bool %10
}

define %Bool @minus (%Nat8) {

;stmt0:
  %2 = load %Str, %Str* @_func49_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %0, %4
  ret %Bool %5
}

define %Bool @slash (%Nat8) {

;stmt0:
  %2 = load %Str, %Str* @_func50_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %0, %4
  %6 = load %Str, %Str* @_func50_str2
  %7 = getelementptr inbounds %Nat8, %Str %6, %Int32 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %0, %8
  %10 = or %Bool %5, %9
  ret %Bool %10
}

define %Bool @rarrow (%Nat8) {

;stmt0:
  %2 = load %Str, %Str* @_func51_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %0, %4
  %6 = load %Str, %Str* @_func51_str2
  %7 = getelementptr inbounds %Nat8, %Str %6, %Int32 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %0, %8
  %10 = or %Bool %5, %9
  ret %Bool %10
}

define %Bool @larrow (%Nat8) {

;stmt0:
  %2 = load %Str, %Str* @_func52_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %0, %4
  %6 = load %Str, %Str* @_func52_str2
  %7 = getelementptr inbounds %Nat8, %Str %6, %Int32 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %0, %8
  %10 = or %Bool %5, %9
  ret %Bool %10
}

define %Bool @eq (%Nat8) {

;stmt0:
  %2 = load %Str, %Str* @_func53_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %0, %4
  ret %Bool %5
}

define %Bool @bang (%Nat8) {

;stmt0:
  %2 = load %Str, %Str* @_func54_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %0, %4
  ret %Bool %5
}

define %Bool @id (%Nat8) {

;stmt0:
  %2 = call %Bool (%Nat8) @isalnum (%Nat8 %0)
  %3 = load %Str, %Str* @_func55_str1
  %4 = getelementptr inbounds %Nat8, %Str %3, %Int32 0
  %5 = load %Nat8, %Nat8* %4
  %6 = icmp eq %Nat8 %0, %5
  %7 = or %Bool %2, %6
  ret %Bool %7
}

define %Bool @digit (%Nat8) {

;stmt0:
  %2 = call %Bool (%Nat8) @isalnum (%Nat8 %0)
  ret %Bool %2
}

define %Bool @cpp_com (%Nat8) {

;stmt0:
  %2 = load %Str, %Str* @_func57_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp ne %Nat8 %0, %4
  ret %Bool %5
}

define %TokenType @gettoken () {

;stmt0:
  %1 = alloca %Nat8

;stmt1:
  br label %again
again:

;stmt2:
  %2 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  %3 = load %TokenType, %TokenType* %2
  %4 = icmp eq %TokenType %3, 7
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  call void () @linecnt ()

;stmt5:
  %5 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  store %Nat16 0, %Nat16* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %6 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 0, %TokenType* %6

;stmt7:
  %7 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  store %Nat32 0, %Nat32* %7

;stmt8:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt9:

;stmt10:
  %8 = call %Nat8 () @getcc ()
  store %Nat8 %8, %Nat8* %1

;stmt11:
  %9 = load %Nat8, %Nat8* %1
  %10 = call %Bool (%Nat8) @blank (%Nat8 %9)
  %11 = xor %Bool %10, 1
  br i1 %11, label %then_1, label %else_1
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
  %13 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 6
  %14 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  %15 = load %Nat16, %Nat16* %14
  store %Nat16 %15, %Nat16* %13

;stmt15:
  %16 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %17 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %16, i32 0, %Int32 0
  %18 = load %Nat8, %Nat8* %1
  store %Nat8 %18, %Nat8* %17

;stmt16:
  %19 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  store %Nat32 1, %Nat32* %19

;stmt17:
  %20 = load %Nat8, %Nat8* %1
  %21 = call %Bool (%Nat8) @isalpha (%Nat8 %20)
  %22 = load %Nat8, %Nat8* %1
  %23 = load %Str, %Str* @_func58_str1
  %24 = getelementptr inbounds %Nat8, %Str %23, %Int32 0
  %25 = load %Nat8, %Nat8* %24
  %26 = icmp eq %Nat8 %22, %25
  %27 = or %Bool %21, %26
  br i1 %27, label %then_2, label %else_2
then_2:

;stmt18:

;stmt19:
  %28 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 1, %TokenType* %28

;stmt20:
  call void (%Rule) @fill (%Rule @id)
  br label %endif_2
else_2:

;stmt21:
  %29 = load %Nat8, %Nat8* %1
  %30 = call %Bool (%Nat8) @isdigit (%Nat8 %29)
  br i1 %30, label %then_3, label %else_3
then_3:

;stmt22:

;stmt23:
  %31 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 2, %TokenType* %31

;stmt24:
  call void (%Rule) @fill (%Rule @digit)
  br label %endif_3
else_3:

;stmt25:

;stmt26:
  %32 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 3, %TokenType* %32

;stmt27:
  %33 = load %Nat8, %Nat8* %1
  %34 = load %Str, %Str* @_func58_str2
  %35 = getelementptr inbounds %Nat8, %Str %34, %Int32 0
  %36 = load %Nat8, %Nat8* %35
  %37 = icmp eq %Nat8 %33, %36
  br i1 %37, label %then_4, label %else_4
then_4:

;stmt28:

;stmt29:
  %38 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 7, %TokenType* %38
  br label %endif_4
else_4:

;stmt30:
  %39 = load %Nat8, %Nat8* %1
  %40 = load %Str, %Str* @_func58_str3
  %41 = getelementptr inbounds %Nat8, %Str %40, %Int32 0
  %42 = load %Nat8, %Nat8* %41
  %43 = icmp eq %Nat8 %39, %42
  br i1 %43, label %then_5, label %else_5
then_5:

;stmt31:

;stmt32:
  call void (%Rule) @fill (%Rule @eq)
  br label %endif_5
else_5:

;stmt33:
  %44 = load %Nat8, %Nat8* %1
  %45 = load %Str, %Str* @_func58_str4
  %46 = getelementptr inbounds %Nat8, %Str %45, %Int32 0
  %47 = load %Nat8, %Nat8* %46
  %48 = icmp eq %Nat8 %44, %47
  br i1 %48, label %then_6, label %else_6
then_6:

;stmt34:

;stmt35:
  call void (%Rule) @fill (%Rule @minus)
  br label %endif_6
else_6:

;stmt36:
  %49 = load %Nat8, %Nat8* %1
  %50 = load %Str, %Str* @_func58_str5
  %51 = getelementptr inbounds %Nat8, %Str %50, %Int32 0
  %52 = load %Nat8, %Nat8* %51
  %53 = icmp eq %Nat8 %49, %52
  br i1 %53, label %then_7, label %else_7
then_7:

;stmt37:

;stmt38:
  call void () @xslash ()
  br label %endif_7
else_7:

;stmt39:
  %54 = load %Nat8, %Nat8* %1
  %55 = load %Str, %Str* @_func58_str6
  %56 = getelementptr inbounds %Nat8, %Str %55, %Int32 0
  %57 = load %Nat8, %Nat8* %56
  %58 = icmp eq %Nat8 %54, %57
  br i1 %58, label %then_8, label %else_8
then_8:

;stmt40:

;stmt41:
  call void (%Rule) @fill (%Rule @rarrow)
  br label %endif_8
else_8:

;stmt42:
  %59 = load %Nat8, %Nat8* %1
  %60 = load %Str, %Str* @_func58_str7
  %61 = getelementptr inbounds %Nat8, %Str %60, %Int32 0
  %62 = load %Nat8, %Nat8* %61
  %63 = icmp eq %Nat8 %59, %62
  br i1 %63, label %then_9, label %else_9
then_9:

;stmt43:

;stmt44:
  call void (%Rule) @fill (%Rule @larrow)
  br label %endif_9
else_9:

;stmt45:
  %64 = load %Nat8, %Nat8* %1
  %65 = load %Str, %Str* @_func58_str8
  %66 = getelementptr inbounds %Nat8, %Str %65, %Int32 0
  %67 = load %Nat8, %Nat8* %66
  %68 = icmp eq %Nat8 %64, %67
  br i1 %68, label %then_10, label %else_10
then_10:

;stmt46:

;stmt47:
  call void (%Rule) @fill (%Rule @bang)
  br label %endif_10
else_10:

;stmt48:
  %69 = load %Nat8, %Nat8* %1
  %70 = load %Str, %Str* @_func58_str9
  %71 = getelementptr inbounds %Nat8, %Str %70, %Int32 0
  %72 = load %Nat8, %Nat8* %71
  %73 = icmp eq %Nat8 %69, %72
  br i1 %73, label %then_11, label %else_11
then_11:

;stmt49:

;stmt50:
  %74 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 5, %TokenType* %74

;stmt51:
  call void (%Rule) @fill (%Rule @id)
  br label %endif_11
else_11:

;stmt52:
  %75 = load %Nat8, %Nat8* %1
  %76 = load %Str, %Str* @_func58_str10
  %77 = getelementptr inbounds %Nat8, %Str %76, %Int32 0
  %78 = load %Nat8, %Nat8* %77
  %79 = icmp eq %Nat8 %75, %78
  br i1 %79, label %then_12, label %else_12
then_12:

;stmt53:

;stmt54:
  call void () @string ()
  br label %endif_12
else_12:

;stmt55:
  %80 = load %Nat8, %Nat8* %1
  %81 = icmp eq %Nat8 %80, 0
  br i1 %81, label %then_13, label %else_13
then_13:

;stmt56:

;stmt57:
  %82 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 0, %TokenType* %82

;stmt58:
  %83 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %84 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %83, i32 0, %Int32 0
  store %Nat8 0, %Nat8* %84

;stmt59:
  %85 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  store %Nat32 0, %Nat32* %85

;stmt60:
  ret %TokenType 0
  br label %endif_13
else_13:

;stmt61:
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

;stmt62:
  %87 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %88 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %89 = load %Nat32, %Nat32* %88
  %90 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %87, i32 0, %Nat32 %89
  store %Nat8 0, %Nat8* %90

;stmt63:
  %91 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  %92 = load %TokenType, %TokenType* %91
  ret %TokenType %92
}

define void @xslash () {

;stmt0:
  %1 = alloca %Nat8

;stmt1:
  %2 = call %Nat8 () @getcc ()

;stmt2:
  %3 = load %Str, %Str* @_func59_str1
  %4 = getelementptr inbounds %Nat8, %Str %3, %Int32 0
  %5 = load %Nat8, %Nat8* %4
  %6 = icmp eq %Nat8 %2, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  call void (%Nat8) @lex_putback (%Nat8 %2)

;stmt5:
  call void (%Rule) @fill (%Rule @cpp_com)

;stmt6:
  %7 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 6, %TokenType* %7
  br label %endif_0
else_0:

;stmt7:
  %8 = load %Str, %Str* @_func59_str2
  %9 = getelementptr inbounds %Nat8, %Str %8, %Int32 0
  %10 = load %Nat8, %Nat8* %9
  %11 = icmp eq %Nat8 %2, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %12 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 6, %TokenType* %12

;stmt10:
  %13 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %14 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %13, i32 0, %Int32 0
  store %Nat8 0, %Nat8* %14

;stmt11:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt12:

;stmt13:
  %15 = call %Nat8 () @getcc ()
  store %Nat8 %15, %Nat8* %1

;stmt14:
  %16 = load %Nat8, %Nat8* %1
  %17 = icmp eq %Nat8 %16, 0
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  %18 = load %Str, %Str* @_func59_str3
  call void (%Str) @fatal (%Str %18)
  br label %endif_2
else_2:

;stmt17:
  %19 = load %Nat8, %Nat8* %1
  %20 = load %Str, %Str* @_func59_str4
  %21 = getelementptr inbounds %Nat8, %Str %20, %Int32 0
  %22 = load %Nat8, %Nat8* %21
  %23 = icmp eq %Nat8 %19, %22
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt18:

;stmt19:
  %24 = call %Nat8 () @getcc ()
  store %Nat8 %24, %Nat8* %1

;stmt20:
  %25 = load %Nat8, %Nat8* %1
  %26 = load %Str, %Str* @_func59_str5
  %27 = getelementptr inbounds %Nat8, %Str %26, %Int32 0
  %28 = load %Nat8, %Nat8* %27
  %29 = icmp eq %Nat8 %25, %28
  br i1 %29, label %then_4, label %else_4
then_4:

;stmt21:

;stmt22:
  %30 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %31 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %32 = load %Nat32, %Nat32* %31
  %33 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %30, i32 0, %Nat32 %32
  store %Nat8 0, %Nat8* %33

;stmt23:
ret void
  br label %endif_4
else_4:

;stmt24:

;stmt25:
  %35 = load %Nat8, %Nat8* %1
  call void (%Nat8) @lex_putback (%Nat8 %35)
  br label %endif_4
endif_4:
  br label %endif_3
else_3:

;stmt26:
  %36 = load %Nat8, %Nat8* %1
  %37 = load %Str, %Str* @_func59_str6
  %38 = getelementptr inbounds %Nat8, %Str %37, %Int32 0
  %39 = load %Nat8, %Nat8* %38
  %40 = icmp eq %Nat8 %36, %39
  br i1 %40, label %then_5, label %else_5
then_5:

;stmt27:

;stmt28:
  call void () @linecnt ()
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %continue_0
break_0:
  br label %endif_1
else_1:

;stmt29:

;stmt30:
  call void (%Nat8) @lex_putback (%Nat8 %2)

;stmt31:
  call void (%Rule) @fill (%Rule @slash)
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  ret void
}

define void @string () {

;stmt0:
  %1 = alloca %Nat8

;stmt1:
  %2 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 4, %TokenType* %2

;stmt2:
  %3 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  store %Nat32 0, %Nat32* %3

;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt4:

;stmt5:
  %4 = call %Nat8 () @getcc ()
  store %Nat8 %4, %Nat8* %1

;stmt6:
  %5 = load %Nat8, %Nat8* %1
  %6 = load %Str, %Str* @_func60_str1
  %7 = getelementptr inbounds %Nat8, %Str %6, %Int32 0
  %8 = load %Nat8, %Nat8* %7
  %9 = icmp eq %Nat8 %5, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  br label %break_0
  br label %endif_0
else_0:

;stmt9:
  %11 = load %Nat8, %Nat8* %1
  %12 = icmp eq %Nat8 %11, 0
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %13 = load %Str, %Str* @_func60_str2
  call void (%Str) @fatal (%Str %13)
  br label %endif_1
else_1:

;stmt12:

;stmt13:
  %14 = load %Nat8, %Nat8* %1
  %15 = load %Str, %Str* @_func60_str3
  %16 = getelementptr inbounds %Nat8, %Str %15, %Int32 0
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp eq %Nat8 %14, %17
  br i1 %18, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %19 = call %Nat8 () @getcc ()
  store %Nat8 %19, %Nat8* %1

;stmt16:
  %20 = load %Nat8, %Nat8* %1
  %21 = load %Str, %Str* @_func60_str4
  %22 = getelementptr inbounds %Nat8, %Str %21, %Int32 0
  %23 = load %Nat8, %Nat8* %22
  %24 = icmp eq %Nat8 %20, %23
  br i1 %24, label %then_3, label %else_3
then_3:

;stmt17:

;stmt18:
  %25 = load %Str, %Str* @_func60_str5
  %26 = getelementptr inbounds %Nat8, %Str %25, %Int32 0
  %27 = load %Nat8, %Nat8* %26
  store %Nat8 %27, %Nat8* %1
  br label %endif_3
else_3:

;stmt19:
  %28 = load %Nat8, %Nat8* %1
  %29 = load %Str, %Str* @_func60_str6
  %30 = getelementptr inbounds %Nat8, %Str %29, %Int32 0
  %31 = load %Nat8, %Nat8* %30
  %32 = icmp eq %Nat8 %28, %31
  br i1 %32, label %then_4, label %else_4
then_4:

;stmt20:

;stmt21:
  %33 = load %Str, %Str* @_func60_str7
  %34 = getelementptr inbounds %Nat8, %Str %33, %Int32 0
  %35 = load %Nat8, %Nat8* %34
  store %Nat8 %35, %Nat8* %1
  br label %endif_4
else_4:

;stmt22:
  %36 = load %Nat8, %Nat8* %1
  %37 = load %Str, %Str* @_func60_str8
  %38 = getelementptr inbounds %Nat8, %Str %37, %Int32 0
  %39 = load %Nat8, %Nat8* %38
  %40 = icmp eq %Nat8 %36, %39
  br i1 %40, label %then_5, label %else_5
then_5:

;stmt23:

;stmt24:
  %41 = load %Str, %Str* @_func60_str9
  %42 = getelementptr inbounds %Nat8, %Str %41, %Int32 0
  %43 = load %Nat8, %Nat8* %42
  store %Nat8 %43, %Nat8* %1
  br label %endif_5
else_5:

;stmt25:
  %44 = load %Nat8, %Nat8* %1
  %45 = load %Str, %Str* @_func60_str10
  %46 = getelementptr inbounds %Nat8, %Str %45, %Int32 0
  %47 = load %Nat8, %Nat8* %46
  %48 = icmp eq %Nat8 %44, %47
  br i1 %48, label %then_6, label %else_6
then_6:

;stmt26:

;stmt27:
  %49 = load %Str, %Str* @_func60_str11
  %50 = getelementptr inbounds %Nat8, %Str %49, %Int32 0
  %51 = load %Nat8, %Nat8* %50
  store %Nat8 %51, %Nat8* %1
  br label %endif_6
else_6:

;stmt28:
  %52 = load %Nat8, %Nat8* %1
  %53 = load %Str, %Str* @_func60_str12
  %54 = getelementptr inbounds %Nat8, %Str %53, %Int32 0
  %55 = load %Nat8, %Nat8* %54
  %56 = icmp eq %Nat8 %52, %55
  br i1 %56, label %then_7, label %else_7
then_7:

;stmt29:

;stmt30:
  %57 = load %Str, %Str* @_func60_str13
  %58 = getelementptr inbounds %Nat8, %Str %57, %Int32 0
  %59 = load %Nat8, %Nat8* %58
  store %Nat8 %59, %Nat8* %1
  br label %endif_7
else_7:

;stmt31:
  %60 = load %Nat8, %Nat8* %1
  %61 = load %Str, %Str* @_func60_str14
  %62 = getelementptr inbounds %Nat8, %Str %61, %Int32 0
  %63 = load %Nat8, %Nat8* %62
  %64 = icmp eq %Nat8 %60, %63
  br i1 %64, label %then_8, label %else_8
then_8:

;stmt32:

;stmt33:
  %65 = load %Str, %Str* @_func60_str15
  %66 = getelementptr inbounds %Nat8, %Str %65, %Int32 0
  %67 = load %Nat8, %Nat8* %66
  store %Nat8 %67, %Nat8* %1
  br label %endif_8
else_8:

;stmt34:
  %68 = load %Nat8, %Nat8* %1
  %69 = load %Str, %Str* @_func60_str16
  %70 = getelementptr inbounds %Nat8, %Str %69, %Int32 0
  %71 = load %Nat8, %Nat8* %70
  %72 = icmp eq %Nat8 %68, %71
  br i1 %72, label %then_9, label %else_9
then_9:

;stmt35:

;stmt36:
  %73 = load %Str, %Str* @_func60_str17
  %74 = getelementptr inbounds %Nat8, %Str %73, %Int32 0
  %75 = load %Nat8, %Nat8* %74
  store %Nat8 %75, %Nat8* %1
  br label %endif_9
else_9:

;stmt37:
  %76 = load %Nat8, %Nat8* %1
  %77 = load %Str, %Str* @_func60_str18
  %78 = getelementptr inbounds %Nat8, %Str %77, %Int32 0
  %79 = load %Nat8, %Nat8* %78
  %80 = icmp eq %Nat8 %76, %79
  br i1 %80, label %then_10, label %else_10
then_10:

;stmt38:

;stmt39:
  %81 = load %Str, %Str* @_func60_str19
  %82 = getelementptr inbounds %Nat8, %Str %81, %Int32 0
  %83 = load %Nat8, %Nat8* %82
  store %Nat8 %83, %Nat8* %1
  br label %endif_10
else_10:

;stmt40:
  %84 = load %Nat8, %Nat8* %1
  %85 = load %Str, %Str* @_func60_str20
  %86 = getelementptr inbounds %Nat8, %Str %85, %Int32 0
  %87 = load %Nat8, %Nat8* %86
  %88 = icmp eq %Nat8 %84, %87
  br i1 %88, label %then_11, label %else_11
then_11:

;stmt41:

;stmt42:
  store %Nat8 0, %Nat8* %1
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
  %89 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %90 = load %Nat32, %Nat32* %89
  %91 = icmp uge %Nat32 %90, 255
  br i1 %91, label %then_12, label %else_12
then_12:

;stmt44:

;stmt45:
  %92 = load %Str, %Str* @_func60_str21
  call void (%Str) @fatal (%Str %92)
  br label %endif_12
else_12:
  br label %endif_12
endif_12:

;stmt46:
  %93 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %94 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %95 = load %Nat32, %Nat32* %94
  %96 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %93, i32 0, %Nat32 %95
  %97 = load %Nat8, %Nat8* %1
  store %Nat8 %97, %Nat8* %96

;stmt47:
  %98 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %99 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %100 = load %Nat32, %Nat32* %99
  %101 = add %Nat32 %100, 1
  store %Nat32 %101, %Nat32* %98
  br label %continue_0
break_0:
  ret void
}

define %List* @tokenize (%Str) {

;stmt0:
  %2 = call %List* () @list_new ()

;stmt1:
  call void (%Str) @lex_init (%Str %0)

;stmt2:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %3 = call %TokenType () @gettoken ()

;stmt5:
  %4 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %5 = load %Nat32, %Nat32* %4
  %6 = trunc %Nat32 %5 to %Nat16
  %7 = add %Nat16 %6, 1

;stmt6:
  %8 = zext %Nat16 %7 to %Nat32
  %9 = add %Nat32 40, %8
  %10 = call %Unit* (%Nat32) @malloc (%Nat32 %9)
  %11 = bitcast %Unit* %10 to %Token*

;stmt7:
  %12 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 0
  %13 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  %14 = load %TokenType, %TokenType* %13
  store %TokenType %14, %TokenType* %12

;stmt8:
  %15 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1
  %16 = getelementptr inbounds %TokenInfo, %TokenInfo* %15, i32 0, i32 3
  %17 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %18 = load %Nat32, %Nat32* %17
  %19 = trunc %Nat32 %18 to %Nat16
  store %Nat16 %19, %Nat16* %16

;stmt9:
  %20 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1
  %21 = getelementptr inbounds %TokenInfo, %TokenInfo* %20, i32 0, i32 0
  %22 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 7
  %23 = load %Str, %Str* %22
  store %Str %23, %Str* %21

;stmt10:
  %24 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1
  %25 = getelementptr inbounds %TokenInfo, %TokenInfo* %24, i32 0, i32 1
  %26 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5
  %27 = load %Nat32, %Nat32* %26
  store %Nat32 %27, %Nat32* %25

;stmt11:
  %28 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1
  %29 = getelementptr inbounds %TokenInfo, %TokenInfo* %28, i32 0, i32 2
  %30 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 6
  %31 = load %Nat16, %Nat16* %30
  store %Nat16 %31, %Nat16* %29

;stmt12:
  %32 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 2
  %33 = bitcast [0 x %Nat8]* %32 to %Unit*
  %34 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %35 = bitcast [256 x %Nat8]* %34 to %Unit*
  %36 = zext %Nat16 %7 to %Nat32
  %37 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %33, %Unit* %35, %Nat32 %36)

;stmt13:
  %38 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 2
  %39 = add %Nat16 %7, 1
  %40 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %38, i32 0, %Nat16 %39
  store %Nat8 0, %Nat8* %40

;stmt14:
  %41 = bitcast %Token* %11 to %Unit*
  %42 = call %Bool (%List*, %Unit*) @list_append (%List* %2, %Unit* %41)

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
  %46 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5
  %47 = load %Nat32, %Nat32* %46
  %48 = add %Nat32 %45, %47
  store %Nat32 %48, %Nat32* @lines

;stmt19:
  ret %List* %2
}

define void @linecnt () {

;stmt0:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5
  %2 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5
  %3 = load %Nat32, %Nat32* %2
  %4 = add %Nat32 %3, 1
  store %Nat32 %4, %Nat32* %1
  ret void
}

define void @lex_putback (%Nat8) {

;stmt0:
  %2 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8
  store %Nat8 %0, %Nat8* %2
  ret void
}

define %Str @cwd () {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 512)

;stmt1:
  %2 = bitcast %Unit* %1 to %Str
  %3 = call %Str (%Str, %Nat32) @getcwd (%Str %2, %Nat32 512)

;stmt2:
  ret %Str %3
}

define void @liblist_add (%Str) {

;stmt0:
  %2 = getelementptr inbounds %List, %List* @liblist, i32 0
  %3 = bitcast %Str %0 to %Unit*
  %4 = call %Bool (%List*, %Unit*) @list_append (%List* %2, %Unit* %3)
  ret void
}

define %SourceInfo @getSourceInfoFrom (%Str, %Str) {

;stmt0:
  %3 = load %Str, %Str* @_func66_str1
  %4 = call %Str (%Str, %Str, %Str) @cat3 (%Str %0, %Str %3, %Str %1)

;stmt1:
  %5 = alloca %SourceInfo

;stmt2:
  %6 = getelementptr inbounds %SourceInfo, %SourceInfo* %5, i32 0, i32 0
  store %SourceType 0, %SourceType* %6

;stmt3:
  %7 = getelementptr inbounds %SourceInfo, %SourceInfo* %5, i32 0, i32 1
  store %Str %1, %Str* %7

;stmt4:
  %8 = getelementptr inbounds %SourceInfo, %SourceInfo* %5, i32 0, i32 2
  %9 = inttoptr i64 0 to %Str
  store %Str %9, %Str* %8

;stmt5:
  %10 = load %Str, %Str* @_func66_str2
  %11 = call %Str (%Str, %Str) @cat (%Str %4, %Str %10)

;stmt6:
  %12 = call %Bool (%Str) @exists (%Str %11)
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %13 = call %Str (%Str) @getprefix (%Str %11)
  %14 = call %Int32 (%Str) @chdir (%Str %13)

;stmt9:
  %15 = getelementptr inbounds %SourceInfo, %SourceInfo* %5, i32 0, i32 0
  store %SourceType 1, %SourceType* %15

;stmt10:
  %16 = getelementptr inbounds %SourceInfo, %SourceInfo* %5, i32 0, i32 2
  store %Str %11, %Str* %16

;stmt11:
  %17 = load %SourceInfo, %SourceInfo* %5
  ret %SourceInfo %17
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt12:
  %19 = load %Str, %Str* @_func66_str3
  %20 = call %Str (%Str, %Str) @cat (%Str %4, %Str %19)

;stmt13:
  %21 = call %Bool (%Str) @exists (%Str %20)
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt14:

;stmt15:
  %22 = call %Str (%Str) @getprefix (%Str %20)
  %23 = call %Int32 (%Str) @chdir (%Str %22)

;stmt16:
  %24 = getelementptr inbounds %SourceInfo, %SourceInfo* %5, i32 0, i32 0
  store %SourceType 1, %SourceType* %24

;stmt17:
  %25 = getelementptr inbounds %SourceInfo, %SourceInfo* %5, i32 0, i32 2
  store %Str %20, %Str* %25

;stmt18:
  %26 = load %SourceInfo, %SourceInfo* %5
  ret %SourceInfo %26
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt19:
  %28 = load %SourceInfo, %SourceInfo* %5
  ret %SourceInfo %28
}

define %Bool @search_in_lib (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Str

;stmt1:
  %5 = bitcast %Unit* %1 to %Str

;stmt2:
  %6 = call %SourceInfo (%Str, %Str) @getSourceInfoFrom (%Str %4, %Str %5)

;stmt3:
  %7 = extractvalue %SourceInfo %6, 0
  %8 = icmp ne %SourceType %7, 0
  ret %Bool %8
}

define %SourceInfo @getSourceInfo (%Str) {

;stmt0:
  %2 = alloca [512 x %Nat8]

;stmt1:
  %3 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %2, i32 0, %Int32 0
  %4 = bitcast %Nat8* %3 to %Str
  %5 = call %Str (%Str, %Nat32) @getcwd (%Str %4, %Nat32 512)

;stmt2:
  %6 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %2, i32 0, %Int32 0
  %7 = bitcast %Nat8* %6 to %Str
  %8 = call %SourceInfo (%Str, %Str) @getSourceInfoFrom (%Str %7, %Str %0)

;stmt3:
  %9 = extractvalue %SourceInfo %8, 0
  %10 = icmp ne %SourceType %9, 0
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  ret %SourceInfo %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %12 = load %Str, %Str* @pdir
  %13 = call %SourceInfo (%Str, %Str) @getSourceInfoFrom (%Str %12, %Str %0)

;stmt7:
  %14 = extractvalue %SourceInfo %13, 0
  %15 = icmp ne %SourceType %14, 0
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  ret %SourceInfo %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %17 = getelementptr inbounds %List, %List* @liblist, i32 0
  %18 = bitcast %Str %0 to %Unit*
  %19 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %17, %ListSearchHandler @search_in_lib, %Unit* %18)
  %20 = bitcast %Unit* %19 to %Str

;stmt11:
  %21 = bitcast %Str %20 to %Unit*
  %22 = inttoptr i64 0 to %Unit*
  %23 = icmp ne %Unit* %21, %22
  br i1 %23, label %then_2, label %else_2
then_2:

;stmt12:

;stmt13:
  %24 = call %SourceInfo (%Str, %Str) @getSourceInfoFrom (%Str %20, %Str %0)
  ret %SourceInfo %24
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt14:
  %26 = alloca %SourceInfo

;stmt15:
  %27 = getelementptr inbounds %SourceInfo, %SourceInfo* %26, i32 0, i32 0
  store %SourceType 0, %SourceType* %27

;stmt16:
  %28 = getelementptr inbounds %SourceInfo, %SourceInfo* %26, i32 0, i32 1
  store %Str %0, %Str* %28

;stmt17:
  %29 = getelementptr inbounds %SourceInfo, %SourceInfo* %26, i32 0, i32 2
  %30 = inttoptr i64 0 to %Str
  store %Str %30, %Str* %29

;stmt18:
  %31 = load %SourceInfo, %SourceInfo* %26
  ret %SourceInfo %31
}

define %Source* @openSource (%SourceInfo) {

;stmt0:
  %2 = extractvalue %SourceInfo %0, 0
  %3 = icmp eq %SourceType %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = inttoptr i64 0 to %Source*
  ret %Source* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %6 = call %Unit* (%Nat32) @malloc (%Nat32 40)
  %7 = bitcast %Unit* %6 to %Source*

;stmt4:
  %8 = extractvalue %SourceInfo %0, 2
  %9 = call %List* (%Str) @tokenize (%Str %8)

;stmt5:
  %10 = getelementptr inbounds %Source, %Source* %7, i32 0, i32 1
  store %List* %9, %List** %10

;stmt6:
  %11 = getelementptr inbounds %Source, %Source* %7, i32 0, i32 2
  %12 = getelementptr inbounds %List, %List* %9, i32 0, i32 0
  %13 = load %Node*, %Node** %12
  store %Node* %13, %Node** %11

;stmt7:
  %14 = getelementptr inbounds %Source, %Source* %7, i32 0, i32 0
  store %SourceInfo %0, %SourceInfo* %14

;stmt8:
  ret %Source* %7
}

define void @info (%Str) {

;stmt0:
  %2 = load %Str, %Str* @_func70_str1
  %3 = call %Int32 (%Str, ...) @printf (%Str %2, %Int32 27, %Int32 36, %Int32 27, %Str %0)
  ret void
}

define void @warning (%Str, %TokenInfo*) {

;stmt0:
  %3 = bitcast %TokenInfo* %1 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = load %Str, %Str* @_func71_str1
  %7 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i32 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i32 0, i32 1
  %10 = load %Nat32, %Nat32* %9
  %11 = call %Int32 (%Str, ...) @printf (%Str %6, %Int32 27, %Int32 34, %Int32 27, %Str %8, %Nat32 %10, %Str %0)

;stmt3:
  call void (%TokenInfo*) @show (%TokenInfo* %1)
  br label %endif_0
else_0:

;stmt4:

;stmt5:
  %12 = load %Str, %Str* @_func71_str2
  %13 = call %Int32 (%Str, ...) @printf (%Str %12, %Int32 27, %Int32 34, %Int32 27, %Str %0)
  br label %endif_0
endif_0:

;stmt6:
  %14 = load %Str, %Str* @_func71_str3
  %15 = call %Int32 (%Str, ...) @printf (%Str %14)

;stmt7:
  %16 = load %Nat32, %Nat32* @warncnt
  %17 = add %Nat32 %16, 1
  store %Nat32 %17, %Nat32* @warncnt
  ret void
}

define void @error (%Str, %TokenInfo*) {

;stmt0:
  %3 = bitcast %TokenInfo* %1 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = load %Str, %Str* @_func72_str1
  %7 = call %Int32 (%Str, ...) @printf (%Str %6, %Int32 27, %Int32 35, %Int32 27, %Str %0)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %8 = load %Str, %Str* @_func72_str2
  %9 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i32 0, i32 0
  %10 = load %Str, %Str* %9
  %11 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i32 0, i32 1
  %12 = load %Nat32, %Nat32* %11
  %13 = call %Int32 (%Str, ...) @printf (%Str %8, %Int32 27, %Int32 35, %Int32 27, %Str %10, %Nat32 %12, %Str %0)

;stmt5:
  call void (%TokenInfo*) @show (%TokenInfo* %1)
  br label %endif_0
endif_0:

;stmt6:
  %14 = load %Str, %Str* @_func72_str3
  %15 = call %Int32 (%Str, ...) @printf (%Str %14)

;stmt7:
  %16 = load %Nat32, %Nat32* @errcnt
  %17 = add %Nat32 %16, 1
  store %Nat32 %17, %Nat32* @errcnt

;stmt8:
  %18 = load %Nat32, %Nat32* @errcnt
  %19 = icmp ugt %Nat32 %18, 20
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %20 = load %Str, %Str* @_func72_str4
  %21 = call %Int32 (%Str, ...) @printf (%Str %20)

;stmt11:
  call void (%Int32) @exit (%Int32 -1)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @rem (%Str, %TokenInfo*) {

;stmt0:
  %3 = load %Str, %Str* @_func73_str1
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Int32 27, %Int32 33, %Str %0, %Int32 27)

;stmt1:
  %5 = bitcast %TokenInfo* %1 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  call void (%TokenInfo*) @show (%TokenInfo* %1)

;stmt4:
  %8 = load %Str, %Str* @_func73_str2
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @gline (%Nat8*, %TokenInfo*) {

;stmt0:
  %3 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, %Int32) @open (%Str %4, %Int32 0)

;stmt1:
  %6 = icmp slt %Int32 %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i32 0, i32 1
  %9 = load %Nat32, %Nat32* %8

;stmt5:
  %10 = alloca %Nat8

;stmt6:
  %11 = alloca %Nat32

;stmt7:
  %12 = alloca %Nat32

;stmt8:
  store %Nat32 1, %Nat32* %11

;stmt9:
  store %Nat32 0, %Nat32* %12

;stmt10:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt11:

;stmt12:
  %13 = load %Nat32, %Nat32* %11
  %14 = icmp eq %Nat32 %13, %9
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt13:

;stmt14:
  br label %continue_1
continue_1:
  br i1 1, label %body_1, label %break_1
body_1:

;stmt15:

;stmt16:
  %15 = getelementptr inbounds %Nat8, %Nat8* %10, i32 0
  %16 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %5, %Nat8* %15, %Nat32 1)
  %17 = icmp eq %Int32 %16, 0
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt17:

;stmt18:
  br label %exit
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt19:
  %19 = load %Nat32, %Nat32* %12
  %20 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %19
  %21 = load %Nat8, %Nat8* %10
  store %Nat8 %21, %Nat8* %20

;stmt20:
  %22 = load %Nat32, %Nat32* %12
  %23 = add %Nat32 %22, 1
  store %Nat32 %23, %Nat32* %12

;stmt21:
  %24 = load %Nat8, %Nat8* %10
  %25 = load %Str, %Str* @_func74_str1
  %26 = getelementptr inbounds %Nat8, %Str %25, %Int32 0
  %27 = load %Nat8, %Nat8* %26
  %28 = icmp eq %Nat8 %24, %27
  br i1 %28, label %then_3, label %else_3
then_3:

;stmt22:

;stmt23:
  br label %exit
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
  %30 = getelementptr inbounds %Nat8, %Nat8* %10, i32 0
  %31 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %5, %Nat8* %30, %Nat32 1)

;stmt26:
  %32 = load %Nat8, %Nat8* %10
  %33 = load %Str, %Str* @_func74_str2
  %34 = getelementptr inbounds %Nat8, %Str %33, %Int32 0
  %35 = load %Nat8, %Nat8* %34
  %36 = icmp eq %Nat8 %32, %35
  br i1 %36, label %then_4, label %else_4
then_4:

;stmt27:

;stmt28:
  %37 = load %Nat32, %Nat32* %11
  %38 = add %Nat32 %37, 1
  store %Nat32 %38, %Nat32* %11
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt29:
  br label %exit
exit:

;stmt30:
  %39 = call %Int32 (%Int32) @close (%Int32 %5)

;stmt31:
  %40 = load %Nat32, %Nat32* %12
  %41 = getelementptr inbounds %Nat8, %Nat8* %0, %Nat32 %40
  store %Nat8 0, %Nat8* %41

;stmt32:
ret void
  ret void
}

define void @show (%TokenInfo*) {

;stmt0:
  %2 = load %Str, %Str* @_func75_str1
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)

;stmt1:
  %4 = alloca [512 x %Nat8]

;stmt2:
  %5 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i32 0, %Int32 0
  %6 = bitcast %Nat8* %5 to %Unit*
  %7 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %6, %Nat8 0, %Nat32 512)

;stmt3:
  %8 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i32 0, %Int32 0
  %9 = bitcast %Nat8* %8 to %Nat8*
  call void (%Nat8*, %TokenInfo*) @gline (%Nat8* %9, %TokenInfo* %0)

;stmt4:
  %10 = load %Str, %Str* @_func75_str2
  %11 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i32 0, %Int32 0
  %12 = call %Int32 (%Str, ...) @printf (%Str %10, %Nat8* %11)

;stmt5:
  %13 = alloca %Nat16

;stmt6:
  store %Nat16 1, %Nat16* %13

;stmt7:
  br label %continue_0
continue_0:
  %14 = load %Nat16, %Nat16* %13
  %15 = getelementptr inbounds %TokenInfo, %TokenInfo* %0, i32 0, i32 2
  %16 = load %Nat16, %Nat16* %15
  %17 = icmp ult %Nat16 %14, %16
  br i1 %17, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %18 = load %Str, %Str* @_func75_str3
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)

;stmt10:
  %20 = load %Nat16, %Nat16* %13
  %21 = add %Nat16 %20, 1
  store %Nat16 %21, %Nat16* %13
  br label %continue_0
break_0:

;stmt11:
  %22 = load %Str, %Str* @_func75_str4
  %23 = call %Int32 (%Str, ...) @printf (%Str %22, %Int32 27, %Int32 32, %Int32 27)
  ret void
}

define void @fatal (%Str) {

;stmt0:
  %2 = load %Str, %Str* @_func76_str1
  %3 = call %Int32 (%Str, ...) @printf (%Str %2, %Int32 27, %Int32 31, %Int32 27, %Str %0)

;stmt1:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define void @prttype (%Type*) {

;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 1
  %3 = load %Str, %Str* %2
  %4 = bitcast %Str %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = load %Str, %Str* @_func77_str1
  %8 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 1
  %9 = load %Str, %Str* %8
  %10 = call %Int32 (%Str, ...) @printf (%Str %7, %Str %9)

;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %12 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12

;stmt5:
  %14 = icmp eq %TypeKind %13, 2
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %15 = load %Str, %Str* @_func77_str2
  %16 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 5
  %17 = getelementptr inbounds %TypeBasic, %TypeBasic* %16, i32 0, i32 0
  %18 = load %Str, %Str* %17
  %19 = call %Int32 (%Str, ...) @printf (%Str %15, %Str %18)
  br label %endif_1
else_1:

;stmt8:
  %20 = icmp eq %TypeKind %13, 6
  br i1 %20, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %21 = load %Str, %Str* @_func77_str3
  %22 = call %Int32 (%Str, ...) @printf (%Str %21)

;stmt11:
  %23 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 7
  %24 = getelementptr inbounds %TypePointer, %TypePointer* %23, i32 0, i32 0
  %25 = load %Type*, %Type** %24
  call void (%Type*) @prttype (%Type* %25)
  br label %endif_2
else_2:

;stmt12:
  %26 = icmp eq %TypeKind %13, 7
  br i1 %26, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  call void (%Type*) @print_type_array (%Type* %0)
  br label %endif_3
else_3:

;stmt15:
  %27 = icmp eq %TypeKind %13, 5
  br i1 %27, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  call void (%Type*) @print_type_record (%Type* %0)
  br label %endif_4
else_4:

;stmt18:
  %28 = icmp eq %TypeKind %13, 4
  br i1 %28, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  call void (%Type*) @print_type_enum (%Type* %0)
  br label %endif_5
else_5:

;stmt21:
  %29 = icmp eq %TypeKind %13, 3
  br i1 %29, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %30 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 6
  call void (%TypeFunc*) @print_type_func (%TypeFunc* %30)
  br label %endif_6
else_6:

;stmt24:
  %31 = icmp eq %TypeKind %13, 0
  br i1 %31, label %then_7, label %else_7
then_7:

;stmt25:

;stmt26:
  %32 = load %Str, %Str* @_func77_str4
  %33 = call %Int32 (%Str, ...) @printf (%Str %32)
  br label %endif_7
else_7:

;stmt27:
  %34 = icmp eq %TypeKind %13, 1
  br i1 %34, label %then_8, label %else_8
then_8:

;stmt28:

;stmt29:
  %35 = load %Str, %Str* @_func77_str5
  %36 = call %Int32 (%Str, ...) @printf (%Str %35)
  br label %endif_8
else_8:

;stmt30:

;stmt31:
  %37 = load %Str, %Str* @_func77_str6
  %38 = call %Int32 (%Str, ...) @printf (%Str %37, %TypeKind %13)

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

define void @print_field (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = load %Str, %Str* @_func79_str1
  %5 = bitcast %Unit* %0 to %Field*
  %6 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 0
  %7 = load %Str, %Str* %6
  %8 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %7)

;stmt1:
  %9 = bitcast %Unit* %0 to %Field*
  %10 = getelementptr inbounds %Field, %Field* %9, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*) @prttype (%Type* %11)

;stmt2:
  %12 = load %Str, %Str* @_func79_str2
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)
  ret void
}

define void @print_type_record (%Type*) {

;stmt0:
  %2 = load %Str, %Str* @_func78_str1
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)

;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 9
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %4, i32 0, i32 0
  %6 = load %List*, %List** %5
  %7 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %6, %ListForeachHandler @print_field, %Unit* %7)

;stmt2:
  %8 = load %Str, %Str* @_func78_str2
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)

;stmt3:
  %10 = load %Str, %Str* @_func78_str3
  %11 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 9
  %12 = getelementptr inbounds %TypeRecord, %TypeRecord* %11, i32 0, i32 1
  %13 = load %Nat32, %Nat32* %12
  %14 = call %Int32 (%Str, ...) @printf (%Str %10, %Nat32 %13)
  ret void
}

define void @print_cons (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = load %Str, %Str* @_func81_str1
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
  ret void
}

define void @print_type_enum (%Type*) {

;stmt0:
  %2 = load %Str, %Str* @_func80_str1
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)

;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 10
  %5 = getelementptr inbounds %TypeEnum, %TypeEnum* %4, i32 0, i32 0
  %6 = load %List*, %List** %5
  %7 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %6, %ListForeachHandler @print_cons, %Unit* %7)

;stmt2:
  %8 = load %Str, %Str* @_func80_str2
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  ret void
}

define void @print_type_array (%Type*) {

;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 8
  %3 = getelementptr inbounds %TypeArray, %TypeArray* %2, i32 0, i32 2
  %4 = load %Bool, %Bool* %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = load %Str, %Str* @_func82_str1
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %7 = load %Str, %Str* @_func82_str2
  %8 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 8
  %9 = getelementptr inbounds %TypeArray, %TypeArray* %8, i32 0, i32 1
  %10 = load %Nat32, %Nat32* %9
  %11 = call %Int32 (%Str, ...) @printf (%Str %7, %Nat32 %10)
  br label %endif_0
endif_0:

;stmt5:
  %12 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 8
  %13 = getelementptr inbounds %TypeArray, %TypeArray* %12, i32 0, i32 0
  %14 = load %Type*, %Type** %13
  call void (%Type*) @prttype (%Type* %14)
  ret void
}

define void @print_params (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = load %Bool, %Bool* @needs
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Str, %Str* @_func84_str1
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
  br label %endif_0
else_0:

;stmt4:

;stmt5:
  store %Bool 1, %Bool* @needs
  br label %endif_0
endif_0:

;stmt6:
  %8 = load %Str, %Str* @_func84_str2
  %9 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0
  %10 = load %Str, %Str* %9
  %11 = call %Int32 (%Str, ...) @printf (%Str %8, %Str %10)

;stmt7:
  %12 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
  %13 = load %Type*, %Type** %12
  call void (%Type*) @prttype (%Type* %13)
  ret void
}

define void @print_type_func (%TypeFunc*) {

;stmt0:
  %2 = load %Str, %Str* @_func83_str1
  %3 = call %Int32 (%Str, ...) @printf (%Str %2)

;stmt1:
  store %Bool 0, %Bool* @needs

;stmt2:
  %4 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i32 0, i32 0
  %5 = load %List*, %List** %4
  %6 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %5, %ListForeachHandler @print_params, %Unit* %6)

;stmt3:
  %7 = load %Str, %Str* @_func83_str2
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)

;stmt4:
  %9 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i32 0, i32 1
  %10 = load %Type*, %Type** %9
  call void (%Type*) @prttype (%Type* %10)
  ret void
}

define %Type* @type_basic_new (%Str, %Nat32, %Nat32, %Bool, %Bool) {

;stmt0:
  %6 = call %Type* (%TypeKind) @type_new (%TypeKind 2)

;stmt1:
  %7 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 3
  store %Nat32 %1, %Nat32* %7

;stmt2:
  %8 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 2
  store %Nat32 %1, %Nat32* %8

;stmt3:
  %9 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 1
  store %Str %0, %Str* %9

;stmt4:
  %10 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 5
  %11 = getelementptr inbounds %TypeBasic, %TypeBasic* %10, i32 0, i32 0
  store %Str %0, %Str* %11

;stmt5:
  %12 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 5
  %13 = getelementptr inbounds %TypeBasic, %TypeBasic* %12, i32 0, i32 1
  store %Nat32 %2, %Nat32* %13

;stmt6:
  %14 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 5
  %15 = getelementptr inbounds %TypeBasic, %TypeBasic* %14, i32 0, i32 2
  store %Bool %3, %Bool* %15

;stmt7:
  %16 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 5
  %17 = getelementptr inbounds %TypeBasic, %TypeBasic* %16, i32 0, i32 3
  store %Bool %4, %Bool* %17

;stmt8:
  ret %Type* %6
}

define %Bool @type_basic_eq (%TypeBasic*, %TypeBasic*) {

;stmt0:
  %3 = getelementptr inbounds %TypeBasic, %TypeBasic* %0, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %TypeBasic, %TypeBasic* %1, i32 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = call %Int32 (%Str, %Str) @strcmp (%Str %4, %Str %6)
  %8 = icmp eq %Int32 %7, 0
  ret %Bool %8
}

define %Field* @field_new (%Str, %Type*, %TokenInfo*) {

;stmt0:
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %5 = bitcast %Unit* %4 to %Field*

;stmt1:
  %6 = bitcast %Field* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  %9 = load %Str, %Str* @_func87_str1
  call void (%Bool, %Str) @assert (%Bool %8, %Str %9)

;stmt2:
  %10 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 0
  store %Str %0, %Str* %10

;stmt3:
  %11 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 1
  store %Type* %1, %Type** %11

;stmt4:
  %12 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 2
  store %Nat16 0, %Nat16* %12

;stmt5:
  %13 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 3
  store %TokenInfo* %2, %TokenInfo** %13

;stmt6:
  ret %Field* %5
}

define void @fpost (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
  %6 = load %Type*, %Type** %5

;stmt2:
  %7 = bitcast %Unit* %1 to %FieldHandleContext*

;stmt3:
  %8 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 2
  %9 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %7, i32 0, i32 0
  %10 = load %Nat16, %Nat16* %9
  store %Nat16 %10, %Nat16* %8

;stmt4:
  %11 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %7, i32 0, i32 0
  %12 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %7, i32 0, i32 0
  %13 = load %Nat16, %Nat16* %12
  %14 = add %Nat16 %13, 1
  store %Nat16 %14, %Nat16* %11

;stmt5:
  %15 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %7, i32 0, i32 2
  %16 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %7, i32 0, i32 2
  %17 = load %Nat32, %Nat32* %16
  %18 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 3
  %19 = load %Nat32, %Nat32* %18
  %20 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %7, i32 0, i32 1
  %21 = load %Nat8, %Nat8* %20
  %22 = call %Nat32 (%Nat32, %Nat8) @alignment (%Nat32 %19, %Nat8 %21)
  %23 = add %Nat32 %17, %22
  store %Nat32 %23, %Nat32* %15
  ret void
}

define %Type* @type_record_new (%List*) {

;stmt0:
  %2 = call %Type* (%TypeKind) @type_new (%TypeKind 5)

;stmt1:
  %3 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 9
  %4 = getelementptr inbounds %TypeRecord, %TypeRecord* %3, i32 0, i32 1
  %5 = call %Nat32 () @get_uid ()
  store %Nat32 %5, %Nat32* %4

;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 9
  %7 = getelementptr inbounds %TypeRecord, %TypeRecord* %6, i32 0, i32 0
  store %List* %0, %List** %7

;stmt3:
  %8 = alloca %FieldHandleContext

;stmt4:
  %9 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %8, i32 0, i32 2
  store %Nat32 0, %Nat32* %9

;stmt5:
  %10 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %8, i32 0, i32 0
  store %Nat16 0, %Nat16* %10

;stmt6:
  %11 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %8, i32 0, i32 1
  %12 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 4
  %13 = load %Nat8, %Nat8* %12
  store %Nat8 %13, %Nat8* %11

;stmt7:
  %14 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 9
  %15 = getelementptr inbounds %TypeRecord, %TypeRecord* %14, i32 0, i32 0
  %16 = load %List*, %List** %15
  %17 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %8, i32 0
  %18 = bitcast %FieldHandleContext* %17 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %16, %ListForeachHandler @fpost, %Unit* %18)

;stmt8:
  %19 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 3
  %20 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %8, i32 0, i32 2
  %21 = load %Nat32, %Nat32* %20
  store %Nat32 %21, %Nat32* %19

;stmt9:
  ret %Type* %2
}

define %Bool @fsearch (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = bitcast %Unit* %1 to %Str

;stmt2:
  %6 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0
  %7 = load %Str, %Str* %6
  %8 = call %Int32 (%Str, %Str) @strcmp (%Str %7, %Str %5)
  %9 = icmp eq %Int32 %8, 0
  ret %Bool %9
}

define %Field* @type_record_get_field (%Type*, %Str) {

;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 9
  %4 = getelementptr inbounds %TypeRecord, %TypeRecord* %3, i32 0, i32 0
  %5 = load %List*, %List** %4
  %6 = bitcast %Str %1 to %Unit*
  %7 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %5, %ListSearchHandler @fsearch, %Unit* %6)
  %8 = bitcast %Unit* %7 to %Field*
  ret %Field* %8
}

define %Bool @check_fields (%Unit*, %Unit*, %Unit*, %Nat32) {

;stmt0:
  %5 = bitcast %Unit* %0 to %Field*

;stmt1:
  %6 = bitcast %Unit* %1 to %Field*

;stmt2:
  %7 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %Field, %Field* %6, i32 0, i32 0
  %10 = load %Str, %Str* %9
  %11 = call %Int32 (%Str, %Str) @strcmp (%Str %8, %Str %10)
  %12 = icmp ne %Int32 %11, 0
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %14 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 1
  %15 = load %Type*, %Type** %14
  %16 = getelementptr inbounds %Field, %Field* %6, i32 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = call %Bool (%Type*, %Type*) @type_eq (%Type* %15, %Type* %17)
  ret %Bool %18
}

define %Bool @type_record_eq (%TypeRecord*, %TypeRecord*) {

;stmt0:
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %0, i32 0, i32 0
  %4 = load %List*, %List** %3
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %1, i32 0, i32 0
  %6 = load %List*, %List** %5
  %7 = inttoptr i64 0 to %Unit*
  %8 = call %Bool (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %4, %List* %6, %ListCompareHandler @check_fields, %Unit* %7)
  ret %Bool %8
}

define void @foreach_struct_field (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*
  ret void
}

define void @typeRecordCheck (%TypeRecord*) {

;stmt0:
  %2 = getelementptr inbounds %TypeRecord, %TypeRecord* %0, i32 0, i32 0
  %3 = load %List*, %List** %2
  %4 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %3, %ListForeachHandler @foreach_struct_field, %Unit* %4)
  ret void
}

define void @create_constructor (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %EnumConstructor*

;stmt1:
  %5 = bitcast %Unit* %1 to %Type*

;stmt2:
  %6 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %4, i32 0, i32 1
  %7 = load %Int64, %Int64* %6
  %8 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %4, i32 0, i32 2
  %9 = load %TokenInfo*, %TokenInfo** %8
  %10 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %5, %Int64 %7, %TokenInfo* %9)

;stmt3:
  %11 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %4, i32 0, i32 0
  %12 = load %Str, %Str* %11
  call void (%Str, %Value*) @bind_value (%Str %12, %Value* %10)
  ret void
}

define %Type* @type_enum_new (%List*) {

;stmt0:
  %2 = call %Type* (%TypeKind) @type_new (%TypeKind 4)

;stmt1:
  %3 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 10
  %4 = getelementptr inbounds %TypeEnum, %TypeEnum* %3, i32 0, i32 1
  %5 = call %Nat32 () @get_uid ()
  store %Nat32 %5, %Nat32* %4

;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 3
  %7 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 3
  %8 = load %Nat32, %Nat32* %7
  store %Nat32 %8, %Nat32* %6

;stmt3:
  %9 = bitcast %Type* %2 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %0, %ListForeachHandler @create_constructor, %Unit* %9)

;stmt4:
  ret %Type* %2
}

define %Bool @type_enum_eq (%TypeEnum*, %TypeEnum*) {

;stmt0:
  %3 = getelementptr inbounds %TypeEnum, %TypeEnum* %0, i32 0, i32 1
  %4 = load %Nat32, %Nat32* %3
  %5 = getelementptr inbounds %TypeEnum, %TypeEnum* %1, i32 0, i32 1
  %6 = load %Nat32, %Nat32* %5
  %7 = icmp eq %Nat32 %4, %6
  ret %Bool %7
}

define %Type* @type_array_new (%Type*, %Nat32, %Bool) {

;stmt0:
  %4 = call %Type* (%TypeKind) @type_new (%TypeKind 7)

;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 8
  %6 = getelementptr inbounds %TypeArray, %TypeArray* %5, i32 0, i32 0
  store %Type* %0, %Type** %6

;stmt2:
  %7 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 8
  %8 = getelementptr inbounds %TypeArray, %TypeArray* %7, i32 0, i32 1
  store %Nat32 %1, %Nat32* %8

;stmt3:
  %9 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 8
  %10 = getelementptr inbounds %TypeArray, %TypeArray* %9, i32 0, i32 2
  store %Bool %2, %Bool* %10

;stmt4:
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %11 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 3
  %12 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  %13 = load %Nat32, %Nat32* %12
  store %Nat32 %13, %Nat32* %11
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %14 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 3
  %15 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 3
  %16 = load %Nat32, %Nat32* %15
  %17 = mul %Nat32 %1, %16
  store %Nat32 %17, %Nat32* %14
  br label %endif_0
endif_0:

;stmt9:
  ret %Type* %4
}

define %Bool @type_array_eq (%TypeArray*, %TypeArray*) {

;stmt0:
  %3 = getelementptr inbounds %TypeArray, %TypeArray* %0, i32 0, i32 0
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %1, i32 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = call %Bool (%Type*, %Type*) @type_eq (%Type* %4, %Type* %6)
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
  %10 = getelementptr inbounds %TypeArray, %TypeArray* %0, i32 0, i32 2
  %11 = load %Bool, %Bool* %10
  %12 = getelementptr inbounds %TypeArray, %TypeArray* %1, i32 0, i32 2
  %13 = load %Bool, %Bool* %12
  %14 = and %Bool %11, %13
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %16 = getelementptr inbounds %TypeArray, %TypeArray* %0, i32 0, i32 2
  %17 = load %Bool, %Bool* %16
  %18 = getelementptr inbounds %TypeArray, %TypeArray* %1, i32 0, i32 2
  %19 = load %Bool, %Bool* %18
  %20 = or %Bool %17, %19
  br i1 %20, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  ret %Bool 0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt9:
  %22 = getelementptr inbounds %TypeArray, %TypeArray* %0, i32 0, i32 1
  %23 = load %Nat32, %Nat32* %22
  %24 = getelementptr inbounds %TypeArray, %TypeArray* %1, i32 0, i32 1
  %25 = load %Nat32, %Nat32* %24
  %26 = icmp eq %Nat32 %23, %25
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
  ret %Bool 0
}

define void @typeArrayCheck (%TypeArray*) {

;stmt0:
  %2 = getelementptr inbounds %TypeArray, %TypeArray* %0, i32 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*) @typeCheck (%Type* %3)
  ret void
}

define %Type* @type_pointer_new (%Type*) {

;stmt0:
  %2 = call %Type* (%TypeKind) @type_new (%TypeKind 6)

;stmt1:
  %3 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 7
  %4 = getelementptr inbounds %TypePointer, %TypePointer* %3, i32 0, i32 0
  store %Type* %0, %Type** %4

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 3
  %6 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  %7 = load %Nat32, %Nat32* %6
  store %Nat32 %7, %Nat32* %5

;stmt3:
  ret %Type* %2
}

define %Bool @type_pointer_eq (%TypePointer*, %TypePointer*) {

;stmt0:
  %3 = getelementptr inbounds %TypePointer, %TypePointer* %0, i32 0, i32 0
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %TypePointer, %TypePointer* %1, i32 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = call %Bool (%Type*, %Type*) @type_eq (%Type* %4, %Type* %6)
  ret %Bool %7
}

define void @typePointerCheck (%TypePointer*) {

;stmt0:
  %2 = getelementptr inbounds %TypePointer, %TypePointer* %0, i32 0, i32 0
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = load %Str, %Str* @_func104_str1
  %8 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 13
  %9 = load %TokenInfo*, %TokenInfo** %8
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %9)
  br label %endif_0
else_0:

;stmt4:

;stmt5:
  call void (%Type*) @typeCheck (%Type* %3)
  br label %endif_0
endif_0:
  ret void
}

define %Type* @type_func_new (%List*, %Type*, %Bool) {

;stmt0:
  %4 = call %Type* (%TypeKind) @type_new (%TypeKind 3)

;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 3
  %6 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  %7 = load %Nat32, %Nat32* %6
  store %Nat32 %7, %Nat32* %5

;stmt2:
  %8 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 6
  %9 = getelementptr inbounds %TypeFunc, %TypeFunc* %8, i32 0, i32 0
  store %List* %0, %List** %9

;stmt3:
  %10 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 6
  %11 = getelementptr inbounds %TypeFunc, %TypeFunc* %10, i32 0, i32 1
  store %Type* %1, %Type** %11

;stmt4:
  %12 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 6
  %13 = getelementptr inbounds %TypeFunc, %TypeFunc* %12, i32 0, i32 2
  store %Bool %2, %Bool* %13

;stmt5:
  ret %Type* %4
}

define %Bool @check_param (%Unit*, %Unit*, %Unit*, %Nat32) {

;stmt0:
  %5 = bitcast %Unit* %0 to %Field*

;stmt1:
  %6 = bitcast %Unit* %1 to %Field*

;stmt2:
  %7 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = bitcast %Str %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  %12 = load %Str, %Str* @_func107_str1
  call void (%Bool, %Str) @assert (%Bool %11, %Str %12)

;stmt3:
  %13 = getelementptr inbounds %Field, %Field* %6, i32 0, i32 0
  %14 = load %Str, %Str* %13
  %15 = bitcast %Str %14 to %Unit*
  %16 = inttoptr i64 0 to %Unit*
  %17 = icmp ne %Unit* %15, %16
  %18 = load %Str, %Str* @_func107_str2
  call void (%Bool, %Str) @assert (%Bool %17, %Str %18)

;stmt4:
  %19 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 0
  %20 = load %Str, %Str* %19
  %21 = getelementptr inbounds %Field, %Field* %6, i32 0, i32 0
  %22 = load %Str, %Str* %21
  %23 = call %Int32 (%Str, %Str) @strcmp (%Str %20, %Str %22)
  %24 = icmp ne %Int32 %23, 0
  br i1 %24, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %26 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 1
  %27 = load %Type*, %Type** %26
  %28 = getelementptr inbounds %Field, %Field* %6, i32 0, i32 1
  %29 = load %Type*, %Type** %28
  %30 = call %Bool (%Type*, %Type*) @type_eq (%Type* %27, %Type* %29)
  ret %Bool %30
}

define %Bool @type_function_eq (%TypeFunc*, %TypeFunc*) {

;stmt0:
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i32 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i32 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = call %Bool (%Type*, %Type*) @type_eq (%Type* %4, %Type* %6)
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
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i32 0, i32 0
  %11 = load %List*, %List** %10
  %12 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i32 0, i32 0
  %13 = load %List*, %List** %12
  %14 = inttoptr i64 0 to %Unit*
  %15 = call %Bool (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %11, %List* %13, %ListCompareHandler @check_param, %Unit* %14)
  ret %Bool %15
}

define void @foreach_func_param (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
  %6 = load %Type*, %Type** %5
  call void (%Type*) @typeCheck (%Type* %6)
  ret void
}

define void @typeFuncCheck (%TypeFunc*) {

;stmt0:
  %2 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i32 0, i32 1
  %3 = load %Type*, %Type** %2
  call void (%Type*) @typeCheck (%Type* %3)

;stmt1:
  %4 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i32 0, i32 0
  %5 = load %List*, %List** %4
  %6 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %5, %ListForeachHandler @foreach_func_param, %Unit* %6)
  ret void
}

define %Bool @type_eq (%Type*, %Type*) {

;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  %7 = icmp ne %TypeKind %4, %6
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
  %9 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 1
  %10 = load %Str, %Str* %9
  %11 = bitcast %Str %10 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  %14 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 1
  %15 = load %Str, %Str* %14
  %16 = bitcast %Str %15 to %Unit*
  %17 = inttoptr i64 0 to %Unit*
  %18 = icmp ne %Unit* %16, %17
  %19 = and %Bool %13, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %20 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 1
  %21 = load %Str, %Str* %20
  %22 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 1
  %23 = load %Str, %Str* %22
  %24 = call %Int32 (%Str, %Str) @strcmp (%Str %21, %Str %23)
  %25 = icmp eq %Int32 %24, 0
  br i1 %25, label %then_2, label %else_2
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
  %27 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 0
  %28 = load %TypeKind, %TypeKind* %27

;stmt9:
  %29 = icmp eq %TypeKind %28, 2
  br i1 %29, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %30 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 5
  %31 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5
  %32 = call %Bool (%TypeBasic*, %TypeBasic*) @type_basic_eq (%TypeBasic* %30, %TypeBasic* %31)
  ret %Bool %32
  br label %endif_3
else_3:

;stmt12:
  %34 = icmp eq %TypeKind %28, 6
  br i1 %34, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %35 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 7
  %36 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 7
  %37 = call %Bool (%TypePointer*, %TypePointer*) @type_pointer_eq (%TypePointer* %35, %TypePointer* %36)
  ret %Bool %37
  br label %endif_4
else_4:

;stmt15:
  %39 = icmp eq %TypeKind %28, 7
  br i1 %39, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %40 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 8
  %41 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8
  %42 = call %Bool (%TypeArray*, %TypeArray*) @type_array_eq (%TypeArray* %40, %TypeArray* %41)
  ret %Bool %42
  br label %endif_5
else_5:

;stmt18:
  %44 = icmp eq %TypeKind %28, 3
  br i1 %44, label %then_6, label %else_6
then_6:

;stmt19:

;stmt20:
  %45 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 6
  %46 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6
  %47 = call %Bool (%TypeFunc*, %TypeFunc*) @type_function_eq (%TypeFunc* %45, %TypeFunc* %46)
  ret %Bool %47
  br label %endif_6
else_6:

;stmt21:
  %49 = icmp eq %TypeKind %28, 5
  br i1 %49, label %then_7, label %else_7
then_7:

;stmt22:

;stmt23:
  %50 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 9
  %51 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 9
  %52 = call %Bool (%TypeRecord*, %TypeRecord*) @type_record_eq (%TypeRecord* %50, %TypeRecord* %51)
  ret %Bool %52
  br label %endif_7
else_7:

;stmt24:
  %54 = icmp eq %TypeKind %28, 4
  br i1 %54, label %then_8, label %else_8
then_8:

;stmt25:

;stmt26:
  %55 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 10
  %56 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 10
  %57 = call %Bool (%TypeEnum*, %TypeEnum*) @type_enum_eq (%TypeEnum* %55, %TypeEnum* %56)
  ret %Bool %57
  br label %endif_8
else_8:

;stmt27:
  %59 = icmp eq %TypeKind %28, 1
  br i1 %59, label %then_9, label %else_9
then_9:

;stmt28:

;stmt29:
  %60 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %61 = load %TypeKind, %TypeKind* %60
  %62 = icmp eq %TypeKind %61, 1
  ret %Bool %62
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
  %64 = load %Str, %Str* @_func110_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %64)

;stmt31:
  ret %Bool 0
}

define void @type_init () {

;stmt0:
  %1 = load %Str, %Str* @_func111_str1
  %2 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %1, %Nat32 1, %Nat32 0, %Bool 0, %Bool 0)
  store %Type* %2, %Type** @typeUnit

;stmt1:
  %3 = load %Str, %Str* @_func111_str2
  %4 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %3, %Nat32 1, %Nat32 1, %Bool 0, %Bool 0)
  store %Type* %4, %Type** @typeBool

;stmt2:
  %5 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %6 = load %Str, %Str* @_func111_str3
  %7 = load %Type*, %Type** @typeUnit
  %8 = bitcast %Type* %7 to %Unit*
  %9 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %5, %Str %6, %Unit* %8)

;stmt3:
  %10 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %11 = load %Str, %Str* @_func111_str4
  %12 = load %Type*, %Type** @typeBool
  %13 = bitcast %Type* %12 to %Unit*
  %14 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %10, %Str %11, %Unit* %13)

;stmt4:
  %15 = load %Str, %Str* @_func111_str5
  %16 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %15, %Nat32 1, %Nat32 8, %Bool 1, %Bool 1)

;stmt5:
  %17 = load %Str, %Str* @_func111_str6
  %18 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %17, %Nat32 2, %Nat32 16, %Bool 1, %Bool 1)

;stmt6:
  %19 = load %Str, %Str* @_func111_str7
  %20 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %19, %Nat32 4, %Nat32 32, %Bool 1, %Bool 1)

;stmt7:
  %21 = load %Str, %Str* @_func111_str8
  %22 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %21, %Nat32 8, %Nat32 64, %Bool 1, %Bool 1)

;stmt8:
  %23 = load %Str, %Str* @_func111_str9
  %24 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %23, %Nat32 16, %Nat32 128, %Bool 1, %Bool 1)

;stmt9:
  %25 = load %Str, %Str* @_func111_str10
  %26 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %25, %Nat32 32, %Nat32 256, %Bool 1, %Bool 1)

;stmt10:
  %27 = load %Str, %Str* @_func111_str11
  %28 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %27, %Nat32 64, %Nat32 512, %Bool 1, %Bool 1)

;stmt11:
  %29 = load %Str, %Str* @_func111_str12
  %30 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %29, %Nat32 128, %Nat32 1024, %Bool 1, %Bool 1)

;stmt12:
  %31 = load %Str, %Str* @_func111_str13
  %32 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %31, %Nat32 1, %Nat32 8, %Bool 1, %Bool 0)

;stmt13:
  %33 = load %Str, %Str* @_func111_str14
  %34 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %33, %Nat32 2, %Nat32 16, %Bool 1, %Bool 0)

;stmt14:
  %35 = load %Str, %Str* @_func111_str15
  %36 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %35, %Nat32 4, %Nat32 32, %Bool 1, %Bool 0)

;stmt15:
  %37 = load %Str, %Str* @_func111_str16
  %38 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %37, %Nat32 8, %Nat32 64, %Bool 1, %Bool 0)

;stmt16:
  %39 = load %Str, %Str* @_func111_str17
  %40 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %39, %Nat32 16, %Nat32 128, %Bool 1, %Bool 0)

;stmt17:
  %41 = load %Str, %Str* @_func111_str18
  %42 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %41, %Nat32 32, %Nat32 256, %Bool 1, %Bool 0)

;stmt18:
  %43 = load %Str, %Str* @_func111_str19
  %44 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %43, %Nat32 64, %Nat32 512, %Bool 1, %Bool 0)

;stmt19:
  %45 = load %Str, %Str* @_func111_str20
  %46 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %45, %Nat32 128, %Nat32 1024, %Bool 1, %Bool 0)

;stmt20:
  %47 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %48 = load %Str, %Str* @_func111_str21
  %49 = bitcast %Type* %22 to %Unit*
  %50 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %47, %Str %48, %Unit* %49)

;stmt21:
  %51 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %52 = load %Str, %Str* @_func111_str22
  %53 = bitcast %Type* %38 to %Unit*
  %54 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %51, %Str %52, %Unit* %53)

;stmt22:
  %55 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %56 = load %Str, %Str* @_func111_str23
  %57 = bitcast %Type* %20 to %Unit*
  %58 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %55, %Str %56, %Unit* %57)

;stmt23:
  %59 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %60 = load %Str, %Str* @_func111_str24
  %61 = bitcast %Type* %36 to %Unit*
  %62 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %59, %Str %60, %Unit* %61)

;stmt24:
  %63 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %64 = load %Str, %Str* @_func111_str25
  %65 = bitcast %Type* %16 to %Unit*
  %66 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %63, %Str %64, %Unit* %65)

;stmt25:
  %67 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %68 = load %Str, %Str* @_func111_str26
  %69 = bitcast %Type* %32 to %Unit*
  %70 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %67, %Str %68, %Unit* %69)

;stmt26:
  %71 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %72 = load %Str, %Str* @_func111_str27
  %73 = bitcast %Type* %18 to %Unit*
  %74 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %71, %Str %72, %Unit* %73)

;stmt27:
  %75 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %76 = load %Str, %Str* @_func111_str28
  %77 = bitcast %Type* %34 to %Unit*
  %78 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %75, %Str %76, %Unit* %77)

;stmt28:
  store %Type* %32, %Type** @typeChar

;stmt29:
  %79 = load %Type*, %Type** @typeChar
  %80 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %79, %Nat32 0, %Bool 1)
  store %Type* %80, %Type** @typeStr

;stmt30:
  %81 = load %Type*, %Type** @typeStr
  %82 = getelementptr inbounds %Type, %Type* %81, i32 0, i32 1
  %83 = load %Str, %Str* @_func111_str29
  store %Str %83, %Str* %82

;stmt31:
  %84 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %85 = load %Str, %Str* @_func111_str30
  %86 = load %Type*, %Type** @typeStr
  %87 = bitcast %Type* %86 to %Unit*
  %88 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %84, %Str %85, %Unit* %87)

;stmt32:
  %89 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %90 = load %Str, %Str* @_func111_str31
  %91 = bitcast %Type* %24 to %Unit*
  %92 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %89, %Str %90, %Unit* %91)

;stmt33:
  %93 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %94 = load %Str, %Str* @_func111_str32
  %95 = bitcast %Type* %26 to %Unit*
  %96 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %93, %Str %94, %Unit* %95)

;stmt34:
  %97 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %98 = load %Str, %Str* @_func111_str33
  %99 = bitcast %Type* %28 to %Unit*
  %100 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %97, %Str %98, %Unit* %99)

;stmt35:
  %101 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %102 = load %Str, %Str* @_func111_str34
  %103 = bitcast %Type* %30 to %Unit*
  %104 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %101, %Str %102, %Unit* %103)

;stmt36:
  %105 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %106 = load %Str, %Str* @_func111_str35
  %107 = bitcast %Type* %40 to %Unit*
  %108 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %105, %Str %106, %Unit* %107)

;stmt37:
  %109 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %110 = load %Str, %Str* @_func111_str36
  %111 = bitcast %Type* %42 to %Unit*
  %112 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %109, %Str %110, %Unit* %111)

;stmt38:
  %113 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %114 = load %Str, %Str* @_func111_str37
  %115 = bitcast %Type* %44 to %Unit*
  %116 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %113, %Str %114, %Unit* %115)

;stmt39:
  %117 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %118 = load %Str, %Str* @_func111_str38
  %119 = bitcast %Type* %46 to %Unit*
  %120 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %117, %Str %118, %Unit* %119)

;stmt40:
  %121 = call %Type* (%TypeKind) @type_new (%TypeKind 0)
  store %Type* %121, %Type** @typeUnknown

;stmt41:
  %122 = load %Type*, %Type** @typeUnit
  %123 = call %Type* (%Type*) @type_pointer_new (%Type* %122)
  store %Type* %123, %Type** @typeFreePtr

;stmt42:
  %124 = call %Type* (%TypeKind) @type_new (%TypeKind 1)
  store %Type* %124, %Type** @typeNumeric

;stmt43:
  store %Type* %20, %Type** @typeBaseInt

;stmt44:
  store %Type* %18, %Type** @typeEnum
  ret void
}

define %Type* @type_new (%TypeKind) {

;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 184)
  %3 = bitcast %Unit* %2 to %Type*

;stmt1:
  %4 = bitcast %Type* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  %7 = load %Str, %Str* @_func112_str1
  call void (%Bool, %Str) @assert (%Bool %6, %Str %7)

;stmt2:
  %8 = bitcast %Type* %3 to %Unit*
  %9 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %8, %Nat8 0, %Nat32 184)

;stmt3:
  %10 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  store %TypeKind %0, %TypeKind* %10

;stmt4:
  %11 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 4
  %12 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 1
  %13 = load %Nat32, %Nat32* %12
  %14 = trunc %Nat32 %13 to %Nat8
  store %Nat8 %14, %Nat8* %11

;stmt5:
  ret %Type* %3
}

define %Bool @typeIsReference (%Type*) {

;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2

;stmt1:
  %4 = icmp eq %TypeKind %3, 6
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %6 = icmp eq %TypeKind %3, 7
  br i1 %6, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %7 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 8
  %8 = getelementptr inbounds %TypeArray, %TypeArray* %7, i32 0, i32 2
  %9 = load %Bool, %Bool* %8
  ret %Bool %9
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  ret %Bool 0
}

define %Bool @typeIsDefinedArray (%Type*) {

;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp ne %TypeKind %3, 7
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
  %6 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 8
  %7 = getelementptr inbounds %TypeArray, %TypeArray* %6, i32 0, i32 2
  %8 = load %Bool, %Bool* %7
  %9 = xor %Bool %8, 1
  ret %Bool %9
}

define %Bool @type_is_basic_integer (%Type*) {

;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 2
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 5
  %6 = getelementptr inbounds %TypeBasic, %TypeBasic* %5, i32 0, i32 2
  %7 = load %Bool, %Bool* %6
  ret %Bool %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  ret %Bool 0
}

define %Nat32 @get_uid () {

;stmt0:
  %1 = load %Nat32, %Nat32* @uid

;stmt1:
  %2 = load %Nat32, %Nat32* @uid
  %3 = add %Nat32 %2, 1
  store %Nat32 %3, %Nat32* @uid

;stmt2:
  ret %Nat32 %1
}

define %Nat32 @alignment (%Nat32, %Nat8) {

;stmt0:
  %3 = alloca %Nat32

;stmt1:
  store %Nat32 %0, %Nat32* %3

;stmt2:
  br label %continue_0
continue_0:
  %4 = load %Nat32, %Nat32* %3
  %5 = zext %Nat8 %1 to %Nat32
  %6 = urem %Nat32 %4, %5
  %7 = icmp ne %Nat32 %6, 0
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %8 = load %Nat32, %Nat32* %3
  %9 = add %Nat32 %8, 1
  store %Nat32 %9, %Nat32* %3
  br label %continue_0
break_0:

;stmt5:
  %10 = load %Nat32, %Nat32* %3
  ret %Nat32 %10
}

define void @typeCheck (%Type*) {

;stmt0:
  %2 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2

;stmt1:
  %4 = icmp eq %TypeKind %3, 6
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 7
  call void (%TypePointer*) @typePointerCheck (%TypePointer* %5)
  br label %endif_0
else_0:

;stmt4:
  %6 = icmp eq %TypeKind %3, 7
  br i1 %6, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %7 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 8
  call void (%TypeArray*) @typeArrayCheck (%TypeArray* %7)
  br label %endif_1
else_1:

;stmt7:
  %8 = icmp eq %TypeKind %3, 3
  br i1 %8, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %9 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 6
  call void (%TypeFunc*) @typeFuncCheck (%TypeFunc* %9)
  br label %endif_2
else_2:

;stmt10:
  %10 = icmp eq %TypeKind %3, 5
  br i1 %10, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %11 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 9
  call void (%TypeRecord*) @typeRecordCheck (%TypeRecord* %11)
  br label %endif_3
else_3:

;stmt13:
  %12 = icmp eq %TypeKind %3, 0
  br i1 %12, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  %13 = load %Str, %Str* @_func118_str1
  %14 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 13
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %15)
  br label %endif_4
else_4:
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

define void @index_init (%Index*) {

;stmt0:
  %2 = getelementptr inbounds %Index, %Index* %0, i32 0, i32 0
  call void (%List*) @list_init (%List* %2)

;stmt1:
  %3 = getelementptr inbounds %Index, %Index* %0, i32 0, i32 1
  call void (%List*) @list_init (%List* %3)
  ret void
}

define void @index_type_append (%Index*, %Str, %Type*) {

;stmt0:
  %4 = getelementptr inbounds %Index, %Index* %0, i32 0, i32 0
  %5 = bitcast %Type* %2 to %Unit*
  %6 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %1, %Unit* %5)
  ret void
}

define void @index_value_append (%Index*, %Str, %Value*) {

;stmt0:
  %4 = getelementptr inbounds %Index, %Index* %0, i32 0, i32 1
  %5 = bitcast %Value* %2 to %Unit*
  %6 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %1, %Unit* %5)
  ret void
}

define %Type* @index_get_type (%Index*, %Str) {

;stmt0:
  %3 = getelementptr inbounds %Index, %Index* %0, i32 0, i32 0
  %4 = call %Unit* (%List*, %Str) @map_get (%List* %3, %Str %1)
  %5 = bitcast %Unit* %4 to %Type*
  ret %Type* %5
}

define %Value* @index_get_value (%Index*, %Str) {

;stmt0:
  %3 = getelementptr inbounds %Index, %Index* %0, i32 0, i32 1
  %4 = call %Unit* (%List*, %Str) @map_get (%List* %3, %Str %1)
  %5 = bitcast %Unit* %4 to %Value*
  ret %Value* %5
}

define void @add_type (%Index*, %Str, %Type*) {

;stmt0:
  %4 = call %Type* (%Index*, %Str) @index_get_type (%Index* %0, %Str %1)

;stmt1:
  %5 = bitcast %Type* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %9 = load %TypeKind, %TypeKind* %8
  %10 = icmp ne %TypeKind %9, 0
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %11 = load %Str, %Str* @_func124_str1
  %12 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 13
  %13 = load %TokenInfo*, %TokenInfo** %12
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %13)

;stmt6:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  %15 = bitcast %Type* %4 to %Unit*
  %16 = bitcast %Type* %2 to %Unit*
  %17 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %15, %Unit* %16, %Nat32 184)

;stmt8:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  call void (%Index*, %Str, %Type*) @index_type_append (%Index* %0, %Str %1, %Type* %2)
  ret void
}

define %Bool @search_type_in_import (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %ModuleContext*

;stmt1:
  %5 = bitcast %Unit* %1 to %Str

;stmt2:
  %6 = getelementptr inbounds %ModuleContext, %ModuleContext* %4, i32 0, i32 1
  %7 = call %Type* (%Index*, %Str) @index_get_type (%Index* %6, %Str %5)
  %8 = bitcast %Type* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  ret %Bool %10
}

define %Type* @get_type (%Str) {

;stmt0:
  %2 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0
  %3 = call %Type* (%Index*, %Str) @index_get_type (%Index* %2, %Str %0)

;stmt1:
  %4 = bitcast %Type* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Type* %3
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = alloca %Block*

;stmt5:
  %9 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %10 = load %Block*, %Block** %9
  store %Block* %10, %Block** %8

;stmt6:
  br label %continue_0
continue_0:
  %11 = load %Block*, %Block** %8
  %12 = bitcast %Block* %11 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  br i1 %14, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %15 = load %Block*, %Block** %8
  %16 = getelementptr inbounds %Block, %Block* %15, i32 0, i32 1
  %17 = call %Type* (%Index*, %Str) @index_get_type (%Index* %16, %Str %0)

;stmt9:
  %18 = bitcast %Type* %17 to %Unit*
  %19 = inttoptr i64 0 to %Unit*
  %20 = icmp ne %Unit* %18, %19
  br i1 %20, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  ret %Type* %17
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %22 = load %Block*, %Block** %8
  %23 = getelementptr inbounds %Block, %Block* %22, i32 0, i32 0
  %24 = load %Block*, %Block** %23
  store %Block* %24, %Block** %8
  br label %continue_0
break_0:

;stmt13:
  %25 = load %ModuleContext*, %ModuleContext** @old_mctx
  %26 = getelementptr inbounds %ModuleContext, %ModuleContext* %25, i32 0, i32 1
  %27 = call %Type* (%Index*, %Str) @index_get_type (%Index* %26, %Str %0)

;stmt14:
  %28 = bitcast %Type* %27 to %Unit*
  %29 = inttoptr i64 0 to %Unit*
  %30 = icmp ne %Unit* %28, %29
  br i1 %30, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  ret %Type* %27
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt17:
  %32 = load %ModuleContext*, %ModuleContext** @old_mctx
  %33 = getelementptr inbounds %ModuleContext, %ModuleContext* %32, i32 0, i32 2
  %34 = bitcast %Str %0 to %Unit*
  %35 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %33, %ListSearchHandler @search_type_in_import, %Unit* %34)
  %36 = bitcast %Unit* %35 to %ModuleContext*

;stmt18:
  %37 = bitcast %ModuleContext* %36 to %Unit*
  %38 = inttoptr i64 0 to %Unit*
  %39 = icmp ne %Unit* %37, %38
  br i1 %39, label %then_3, label %else_3
then_3:

;stmt19:

;stmt20:
  %40 = getelementptr inbounds %ModuleContext, %ModuleContext* %36, i32 0, i32 1
  %41 = call %Type* (%Index*, %Str) @index_get_type (%Index* %40, %Str %0)
  ret %Type* %41
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt21:
  %43 = inttoptr i64 0 to %Type*
  ret %Type* %43
}

define void @bind_value (%Str, %Value*) {

;stmt0:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %4 = load %Block*, %Block** %3
  %5 = bitcast %Block* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %8 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %9 = load %Block*, %Block** %8
  call void (%Block*, %Str, %Value*) @bind_value_in_block (%Block* %9, %Str %0, %Value* %1)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  call void (%Str, %Value*) @bind_value_global (%Str %0, %Value* %1)
  br label %endif_0
endif_0:
  ret void
}

define void @bind_value_in_block (%Block*, %Str, %Value*) {

;stmt0:
  %4 = getelementptr inbounds %Block, %Block* %0, i32 0, i32 1
  call void (%Index*, %Str, %Value*) @add_value (%Index* %4, %Str %1, %Value* %2)
  ret void
}

define void @bind_value_local (%Str, %Value*) {

;stmt0:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %4 = load %Block*, %Block** %3
  %5 = getelementptr inbounds %Block, %Block* %4, i32 0, i32 1
  call void (%Index*, %Str, %Value*) @add_value (%Index* %5, %Str %0, %Value* %1)
  ret void
}

define void @bind_value_global (%Str, %Value*) {

;stmt0:
  %3 = load %ModuleContext*, %ModuleContext** @old_mctx
  %4 = getelementptr inbounds %ModuleContext, %ModuleContext* %3, i32 0, i32 1
  call void (%Index*, %Str, %Value*) @add_value (%Index* %4, %Str %0, %Value* %1)
  ret void
}

define void @add_value (%Index*, %Str, %Value*) {

;stmt0:
  %4 = call %Value* (%Index*, %Str) @index_get_value (%Index* %0, %Str %1)

;stmt1:
  %5 = bitcast %Value* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 0
  %9 = load %ValueKind, %ValueKind* %8
  %10 = icmp ne %ValueKind %9, 1
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %11 = load %Str, %Str* @_func131_str1
  %12 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 16
  %13 = load %TokenInfo*, %TokenInfo** %12
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %13)

;stmt6:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  %15 = bitcast %Value* %4 to %Unit*
  %16 = bitcast %Value* %2 to %Unit*
  %17 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %15, %Unit* %16, %Nat32 176)

;stmt8:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  call void (%Index*, %Str, %Value*) @index_value_append (%Index* %0, %Str %1, %Value* %2)
  ret void
}

define %Bool @search_value_in_import (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %ModuleContext*

;stmt1:
  %5 = bitcast %Unit* %1 to %Str

;stmt2:
  %6 = getelementptr inbounds %ModuleContext, %ModuleContext* %4, i32 0, i32 1
  %7 = call %Value* (%Index*, %Str) @index_get_value (%Index* %6, %Str %5)
  %8 = bitcast %Value* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  ret %Bool %10
}

define %Value* @get_value (%Str) {

;stmt0:
  %2 = call %Value* (%Str) @get_value_local (%Str %0)

;stmt1:
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
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
  %7 = call %Value* (%Str) @get_value_global (%Str %0)

;stmt5:
  %8 = bitcast %Value* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  ret %Value* %7
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt8:
  %12 = call %Value* (%Str) @get_value_builtin (%Str %0)

;stmt9:
  %13 = bitcast %Value* %12 to %Unit*
  %14 = inttoptr i64 0 to %Unit*
  %15 = icmp ne %Unit* %13, %14
  br i1 %15, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  ret %Value* %12
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt12:
  %17 = load %ModuleContext*, %ModuleContext** @old_mctx
  %18 = getelementptr inbounds %ModuleContext, %ModuleContext* %17, i32 0, i32 2
  %19 = bitcast %Str %0 to %Unit*
  %20 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %18, %ListSearchHandler @search_value_in_import, %Unit* %19)
  %21 = bitcast %Unit* %20 to %ModuleContext*

;stmt13:
  %22 = bitcast %ModuleContext* %21 to %Unit*
  %23 = inttoptr i64 0 to %Unit*
  %24 = icmp ne %Unit* %22, %23
  br i1 %24, label %then_3, label %else_3
then_3:

;stmt14:

;stmt15:
  %25 = getelementptr inbounds %ModuleContext, %ModuleContext* %21, i32 0, i32 1
  %26 = call %Value* (%Index*, %Str) @index_get_value (%Index* %25, %Str %0)
  ret %Value* %26
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt16:
  %28 = inttoptr i64 0 to %Value*
  ret %Value* %28
}

define %Value* @get_value_local (%Str) {

;stmt0:
  %2 = alloca %Block*

;stmt1:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %4 = load %Block*, %Block** %3
  store %Block* %4, %Block** %2

;stmt2:
  br label %continue_0
continue_0:
  %5 = load %Block*, %Block** %2
  %6 = bitcast %Block* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  br i1 %8, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %9 = load %Block*, %Block** %2
  %10 = getelementptr inbounds %Block, %Block* %9, i32 0, i32 1
  %11 = call %Value* (%Index*, %Str) @index_get_value (%Index* %10, %Str %0)

;stmt5:
  %12 = bitcast %Value* %11 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  ret %Value* %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %16 = load %Block*, %Block** %2
  %17 = getelementptr inbounds %Block, %Block* %16, i32 0, i32 0
  %18 = load %Block*, %Block** %17
  store %Block* %18, %Block** %2

;stmt9:
  %19 = load %Block*, %Block** %2
  %20 = bitcast %Block* %19 to %Unit*
  %21 = inttoptr i64 0 to %Unit*
  %22 = icmp eq %Unit* %20, %21
  br i1 %22, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %23 = inttoptr i64 0 to %Value*
  ret %Value* %23
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt12:
  %25 = inttoptr i64 0 to %Value*
  ret %Value* %25
}

define %Value* @get_value_global (%Str) {

;stmt0:
  %2 = load %ModuleContext*, %ModuleContext** @old_mctx
  %3 = getelementptr inbounds %ModuleContext, %ModuleContext* %2, i32 0, i32 1
  %4 = call %Value* (%Index*, %Str) @index_get_value (%Index* %3, %Str %0)
  ret %Value* %4
}

define %Value* @get_value_builtin (%Str) {

;stmt0:
  %2 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0
  %3 = call %Value* (%Index*, %Str) @index_get_value (%Index* %2, %Str %0)

;stmt1:
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = load %Str, %Str* @_func136_str1
  %8 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %7)
  %9 = icmp eq %Int32 %8, 0
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %10 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %11 = load %Value*, %Value** %10
  ret %Value* %11
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  ret %Value* %3
}

define %Str @get_suid (%Str, %Nat32) {

;stmt0:
  %3 = call %Nat32 (%Str) @strlen (%Str %0)
  %4 = add %Nat32 %3, 8
  %5 = add %Nat32 %4, 1
  %6 = call %Str (%Nat32) @str_new (%Nat32 %5)

;stmt1:
  %7 = bitcast %Str %6 to %Unit*
  %8 = load %Str, %Str* @_func137_str1
  %9 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %7, %Str %8, %Str %0, %Nat32 %1)

;stmt2:
  ret %Str %6
}

define %Str @get_prefix () {

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %2 = load %Value*, %Value** %1
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %7 = load %Str, %Str* %6
  %8 = call %Str (%Str) @dup (%Str %7)
  ret %Str %8
  br label %endif_0
else_0:

;stmt3:
  br label %endif_0
endif_0:

;stmt4:
  %10 = load %Str, %Str* @_func138_str1
  ret %Str %10
}

define %Str @get_name (%Str, %Nat32*) {

;stmt0:
  %3 = call %Str () @get_prefix ()

;stmt1:
  %4 = alloca %Str

;stmt2:
  %5 = load %Nat32, %Nat32* %1
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* %1

;stmt3:
  %7 = load %Nat32, %Nat32* %1
  %8 = call %Str (%Str, %Nat32) @get_suid (%Str %0, %Nat32 %7)
  store %Str %8, %Str* %4

;stmt4:
  %9 = load %Str, %Str* @_func139_str1
  %10 = load %Str, %Str* %4
  %11 = call %Str (%Str, %Str, %Str) @cat3 (%Str %3, %Str %9, %Str %10)
  ret %Str %11
}

define %Str @get_name_func () {

;stmt0:
  %1 = load %Str, %Str* @_func140_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @func_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_str () {

;stmt0:
  %1 = alloca %Nat32*

;stmt1:
  %2 = getelementptr inbounds %Nat32, %Nat32* @str_uid, i32 0
  store %Nat32* %2, %Nat32** %1

;stmt2:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %4 = load %Value*, %Value** %3
  %5 = bitcast %Value* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 5
  store %Nat32* %8, %Nat32** %1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = load %Str, %Str* @_func141_str1
  %10 = load %Nat32*, %Nat32** %1
  %11 = call %Str (%Str, %Nat32*) @get_name (%Str %9, %Nat32* %10)
  ret %Str %11
}

define %Str @get_name_arr () {

;stmt0:
  %1 = load %Str, %Str* @_func142_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @arr_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_var () {

;stmt0:
  %1 = load %Str, %Str* @_func143_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @var_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_type () {

;stmt0:
  %1 = load %Str, %Str* @_func144_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @type_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Value* @cexpr () {

;stmt0:
  %1 = call %Value* () @hier1 ()

;stmt1:
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
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
  %6 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp ne %ValueKind %7, 2
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %9 = load %Str, %Str* @_func145_str1
  %10 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 16
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)

;stmt7:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt8:
  ret %Value* %1

;stmt9:
  br label %fail
fail:

;stmt10:
  %14 = inttoptr i64 0 to %Value*
  ret %Value* %14
}

define %Value* @hier1 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Value* () @hier2 ()
  store %Value* %2, %Value** %1

;stmt2:
  %3 = load %Value*, %Value** %1
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt6:
  %11 = load %Str, %Str* @_func146_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %13 = load %Value*, %Value** %1

;stmt10:
  %14 = call %Value* () @hier1 ()

;stmt11:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 17, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %16 = load %Value*, %Value** %1
  ret %Value* %16
}

define %Value* @hier2 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Value* () @hier3 ()
  store %Value* %2, %Value** %1

;stmt2:
  %3 = load %Value*, %Value** %1
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt6:
  %11 = load %Str, %Str* @_func147_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %13 = load %Value*, %Value** %1

;stmt10:
  %14 = call %Value* () @hier2 ()

;stmt11:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 18, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %16 = load %Value*, %Value** %1
  ret %Value* %16
}

define %Value* @hier3 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Value* () @hier4 ()
  store %Value* %2, %Value** %1

;stmt2:
  %3 = load %Value*, %Value** %1
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt6:
  %11 = load %Str, %Str* @_func148_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %13 = load %Value*, %Value** %1

;stmt10:
  %14 = call %Value* () @hier3 ()

;stmt11:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 19, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %16 = load %Value*, %Value** %1
  ret %Value* %16
}

define %Value* @hier4 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Value* () @hier5 ()
  store %Value* %2, %Value** %1

;stmt2:
  %3 = load %Value*, %Value** %1
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
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
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt8:
  %11 = load %Str, %Str* @_func149_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %13 = load %Value*, %Value** %1

;stmt12:
  %14 = call %Value* () @hier4 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 20, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %1
  br label %endif_1
else_1:

;stmt14:
  %16 = load %Str, %Str* @_func149_str2
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %18 = load %Value*, %Value** %1

;stmt18:
  %19 = call %Value* () @hier4 ()

;stmt19:
  %20 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 21, %Value* %18, %Value* %19, %TokenInfo* %10)
  store %Value* %20, %Value** %1
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
  %22 = load %Value*, %Value** %1
  ret %Value* %22
}

define %Value* @hier5 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Value* () @hier6 ()
  store %Value* %2, %Value** %1

;stmt2:
  %3 = load %Value*, %Value** %1
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
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
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt8:
  %11 = load %Str, %Str* @_func150_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %13 = load %Value*, %Value** %1

;stmt12:
  %14 = call %Value* () @hier6 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 22, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %1
  br label %endif_1
else_1:

;stmt14:
  %16 = load %Str, %Str* @_func150_str2
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %18 = load %Value*, %Value** %1

;stmt18:
  %19 = call %Value* () @hier6 ()

;stmt19:
  %20 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 23, %Value* %18, %Value* %19, %TokenInfo* %10)
  store %Value* %20, %Value** %1
  br label %endif_2
else_2:

;stmt20:
  %21 = load %Str, %Str* @_func150_str3
  %22 = call %Bool (%Str) @match (%Str %21)
  br i1 %22, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  call void () @skip_nl ()

;stmt23:
  %23 = load %Value*, %Value** %1

;stmt24:
  %24 = call %Value* () @hier6 ()

;stmt25:
  %25 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 24, %Value* %23, %Value* %24, %TokenInfo* %10)
  store %Value* %25, %Value** %1
  br label %endif_3
else_3:

;stmt26:
  %26 = load %Str, %Str* @_func150_str4
  %27 = call %Bool (%Str) @match (%Str %26)
  br i1 %27, label %then_4, label %else_4
then_4:

;stmt27:

;stmt28:
  call void () @skip_nl ()

;stmt29:
  %28 = load %Value*, %Value** %1

;stmt30:
  %29 = call %Value* () @hier6 ()

;stmt31:
  %30 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 25, %Value* %28, %Value* %29, %TokenInfo* %10)
  store %Value* %30, %Value** %1
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
  %32 = load %Value*, %Value** %1
  ret %Value* %32
}

define %Value* @hier6 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Value* () @hier7 ()
  store %Value* %2, %Value** %1

;stmt2:
  %3 = load %Value*, %Value** %1
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
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
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt8:
  %11 = load %Str, %Str* @_func151_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %13 = load %Value*, %Value** %1

;stmt12:
  %14 = call %Value* () @hier7 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @shift (%ValueKind 26, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %1
  br label %endif_1
else_1:

;stmt14:
  %16 = load %Str, %Str* @_func151_str2
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %18 = load %Value*, %Value** %1

;stmt18:
  %19 = call %Value* () @hier7 ()

;stmt19:
  %20 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @shift (%ValueKind 27, %Value* %18, %Value* %19, %TokenInfo* %10)
  store %Value* %20, %Value** %1
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
  %22 = load %Value*, %Value** %1
  ret %Value* %22
}

define %Value* @hier7 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Value* () @hier8 ()
  store %Value* %2, %Value** %1

;stmt2:
  %3 = load %Value*, %Value** %1
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
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
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt8:
  %11 = load %Str, %Str* @_func152_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %13 = load %Value*, %Value** %1

;stmt12:
  %14 = call %Value* () @hier8 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 12, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %1
  br label %endif_1
else_1:

;stmt14:
  %16 = load %Str, %Str* @_func152_str2
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %18 = load %Value*, %Value** %1

;stmt18:
  %19 = call %Value* () @hier8 ()

;stmt19:
  %20 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 13, %Value* %18, %Value* %19, %TokenInfo* %10)
  store %Value* %20, %Value** %1
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
  %22 = load %Value*, %Value** %1
  ret %Value* %22
}

define %Value* @hier8 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Value* () @hier9 ()
  store %Value* %2, %Value** %1

;stmt2:
  %3 = load %Value*, %Value** %1
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
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
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt8:
  %11 = load %Str, %Str* @_func153_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %13 = load %Value*, %Value** %1

;stmt12:
  %14 = call %Value* () @hier9 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 14, %Value* %13, %Value* %14, %TokenInfo* %10)
  store %Value* %15, %Value** %1
  br label %endif_1
else_1:

;stmt14:
  %16 = load %Str, %Str* @_func153_str2
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %18 = load %Value*, %Value** %1

;stmt18:
  %19 = call %Value* () @hier9 ()

;stmt19:
  %20 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 15, %Value* %18, %Value* %19, %TokenInfo* %10)
  store %Value* %20, %Value** %1
  br label %endif_2
else_2:

;stmt20:
  %21 = load %Str, %Str* @_func153_str3
  %22 = call %Bool (%Str) @match (%Str %21)
  br i1 %22, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  call void () @skip_nl ()

;stmt23:
  %23 = load %Value*, %Value** %1

;stmt24:
  %24 = call %Value* () @hier9 ()

;stmt25:
  %25 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 16, %Value* %23, %Value* %24, %TokenInfo* %10)
  store %Value* %25, %Value** %1
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
  %27 = load %Value*, %Value** %1
  ret %Value* %27
}

define %Value* @hier9 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Value* () @hier10 ()
  store %Value* %2, %Value** %1

;stmt2:
  %3 = load %Value*, %Value** %1
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt6:
  %11 = load %Str, %Str* @_func154_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %13 = call %Type* () @parse_type ()

;stmt9:
  %14 = load %Value*, %Value** %1
  %15 = call %Value* (%Value*, %Type*, %TokenInfo*) @cast (%Value* %14, %Type* %13, %TokenInfo* %10)
  store %Value* %15, %Value** %1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %16 = load %Value*, %Value** %1
  ret %Value* %16
}

define %Value* @hier10 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Token* () @ctok ()
  %3 = getelementptr inbounds %Token, %Token* %2, i32 0, i32 1

;stmt2:
  %4 = load %Str, %Str* @_func155_str1
  %5 = call %Bool (%Str) @match (%Str %4)
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = call %Value* () @hier10 ()

;stmt5:
  %7 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 9, %Value* %6, %TokenInfo* %3)
  store %Value* %7, %Value** %1
  br label %endif_0
else_0:

;stmt6:
  %8 = load %Str, %Str* @_func155_str2
  %9 = call %Bool (%Str) @match (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %10 = call %Value* () @hier11 ()

;stmt9:
  %11 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 8, %Value* %10, %TokenInfo* %3)
  store %Value* %11, %Value** %1
  br label %endif_1
else_1:

;stmt10:
  %12 = load %Str, %Str* @_func155_str3
  %13 = call %Bool (%Str) @match (%Str %12)
  br i1 %13, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %14 = call %Value* () @hier10 ()

;stmt13:
  %15 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 10, %Value* %14, %TokenInfo* %3)
  store %Value* %15, %Value** %1
  br label %endif_2
else_2:

;stmt14:
  %16 = load %Str, %Str* @_func155_str4
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_3, label %else_3
then_3:

;stmt15:

;stmt16:
  %18 = call %Value* () @hier10 ()

;stmt17:
  %19 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 11, %Value* %18, %TokenInfo* %3)
  store %Value* %19, %Value** %1
  br label %endif_3
else_3:

;stmt18:
  %20 = load %Str, %Str* @_func155_str5
  %21 = call %Bool (%Str) @match (%Str %20)
  br i1 %21, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %22 = call %Token* () @ctok ()
  %23 = getelementptr inbounds %Token, %Token* %22, i32 0, i32 1

;stmt21:
  %24 = call %Type* () @parse_type ()

;stmt22:
  %25 = bitcast %Type* %24 to %Unit*
  %26 = inttoptr i64 0 to %Unit*
  %27 = icmp eq %Unit* %25, %26
  br i1 %27, label %then_5, label %else_5
then_5:

;stmt23:

;stmt24:
  %28 = load %Str, %Str* @_func155_str6
  call void (%Str, %TokenInfo*) @error (%Str %28, %TokenInfo* %23)

;stmt25:
  %29 = inttoptr i64 0 to %Value*
  ret %Value* %29
  br label %endif_5
else_5:
  br label %endif_5
endif_5:

;stmt26:
  %31 = call %Value* (%Type*, %TokenInfo*) @size_of (%Type* %24, %TokenInfo* %3)
  store %Value* %31, %Value** %1
  br label %endif_4
else_4:

;stmt27:
  %32 = load %Str, %Str* @_func155_str7
  %33 = call %Bool (%Str) @match (%Str %32)
  br i1 %33, label %then_6, label %else_6
then_6:

;stmt28:

;stmt29:
  %34 = call %Token* () @ctok ()
  %35 = getelementptr inbounds %Token, %Token* %34, i32 0, i32 1

;stmt30:
  %36 = call %Type* () @parse_type ()

;stmt31:
  %37 = bitcast %Type* %36 to %Unit*
  %38 = inttoptr i64 0 to %Unit*
  %39 = icmp eq %Unit* %37, %38
  br i1 %39, label %then_7, label %else_7
then_7:

;stmt32:

;stmt33:
  %40 = load %Str, %Str* @_func155_str8
  call void (%Str, %TokenInfo*) @error (%Str %40, %TokenInfo* %35)

;stmt34:
  %41 = inttoptr i64 0 to %Value*
  ret %Value* %41
  br label %endif_7
else_7:
  br label %endif_7
endif_7:

;stmt35:
  %43 = call %Value* (%Type*, %TokenInfo*) @align_of (%Type* %36, %TokenInfo* %3)
  store %Value* %43, %Value** %1
  br label %endif_6
else_6:

;stmt36:

;stmt37:
  %44 = call %Value* () @hier11 ()
  store %Value* %44, %Value** %1
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

;stmt38:
  %45 = load %Value*, %Value** %1
  ret %Value* %45
}

define %Value* @hier11 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Value* () @hier12 ()
  store %Value* %2, %Value** %1

;stmt2:
  %3 = load %Value*, %Value** %1
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
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
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt8:
  %11 = load %Str, %Str* @_func156_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %13 = call %List* () @list_new ()

;stmt11:
  br label %continue_1
continue_1:
  %14 = load %Str, %Str* @_func156_str2
  %15 = call %Bool (%Str) @match (%Str %14)
  %16 = xor %Bool %15, 1
  br i1 %16, label %body_1, label %break_1
body_1:

;stmt12:

;stmt13:
  %17 = call %Value* () @hier1 ()

;stmt14:
  %18 = bitcast %Value* %17 to %Unit*
  %19 = inttoptr i64 0 to %Unit*
  %20 = icmp eq %Unit* %18, %19
  br i1 %20, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  %21 = load %Str, %Str* @_func156_str3
  call void (%Str) @skipto (%Str %21)

;stmt17:
  %22 = load %Str, %Str* @_func156_str4
  %23 = call %Bool (%Str) @match (%Str %22)
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt18:

;stmt19:
  br label %continue_1
  br label %endif_3
else_3:

;stmt20:
  %25 = load %Str, %Str* @_func156_str5
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
  %28 = inttoptr i64 0 to %Value*
  ret %Value* %28
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt25:
  %30 = bitcast %Value* %17 to %Unit*
  %31 = call %Bool (%List*, %Unit*) @list_append (%List* %13, %Unit* %30)

;stmt26:
  %32 = load %Str, %Str* @_func156_str6
  %33 = call %Bool (%Str) @match (%Str %32)
  %34 = xor %Bool %33, 1
  br i1 %34, label %then_5, label %else_5
then_5:

;stmt27:

;stmt28:
  %35 = load %Str, %Str* @_func156_str7
  %36 = call %Bool (%Str) @need (%Str %35)
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
  %38 = load %Value*, %Value** %1
  %39 = call %Value* (%Value*, %List*, %TokenInfo*) @call (%Value* %38, %List* %13, %TokenInfo* %10)
  store %Value* %39, %Value** %1
  br label %endif_1
else_1:

;stmt32:
  %40 = load %Str, %Str* @_func156_str8
  %41 = call %Bool (%Str) @match (%Str %40)
  br i1 %41, label %then_6, label %else_6
then_6:

;stmt33:

;stmt34:
  %42 = call %Value* () @hier1 ()

;stmt35:
  %43 = load %Str, %Str* @_func156_str9
  %44 = call %Bool (%Str) @match (%Str %43)

;stmt36:
  %45 = load %Value*, %Value** %1
  %46 = call %Value* (%Value*, %Value*, %TokenInfo*) @indx (%Value* %45, %Value* %42, %TokenInfo* %10)
  store %Value* %46, %Value** %1
  br label %endif_6
else_6:

;stmt37:
  %47 = load %Str, %Str* @_func156_str10
  %48 = call %Bool (%Str) @match (%Str %47)
  br i1 %48, label %then_7, label %else_7
then_7:

;stmt38:

;stmt39:
  %49 = call %Str () @parseId ()

;stmt40:
  %50 = load %Value*, %Value** %1
  %51 = call %Value* (%Value*, %Str, %TokenInfo*) @access (%Value* %50, %Str %49, %TokenInfo* %10)
  store %Value* %51, %Value** %1
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
  %53 = load %Value*, %Value** %1
  ret %Value* %53
}

define %Value* @hier12 () {

;stmt0:
  %1 = alloca %Value*

;stmt1:
  %2 = call %Token* () @ctok ()
  %3 = getelementptr inbounds %Token, %Token* %2, i32 0, i32 1

;stmt2:
  %4 = load %Str, %Str* @_func157_str1
  %5 = call %Bool (%Str) @match (%Str %4)
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = call %Value* () @hier1 ()
  store %Value* %6, %Value** %1

;stmt5:
  %7 = load %Str, %Str* @_func157_str2
  %8 = call %Bool (%Str) @need (%Str %7)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %9 = call %Value* () @term ()
  store %Value* %9, %Value** %1
  br label %endif_0
endif_0:

;stmt8:
  %10 = load %Value*, %Value** %1
  ret %Value* %10
}

define %Value* @term () {

;stmt0:
  %1 = call %Token* () @ctok ()

;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %3 = load %TokenType, %TokenType* %2

;stmt2:
  %4 = alloca %Value*

;stmt3:
  %5 = inttoptr i64 0 to %Value*
  store %Value* %5, %Value** %4

;stmt4:
  %6 = icmp eq %TokenType %3, 1
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %7 = load %Str, %Str* @_func158_str1
  %8 = call %Bool (%Str) @match (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %9 = call %Value* () @term_func ()
  store %Value* %9, %Value** %4
  br label %endif_1
else_1:

;stmt9:
  %10 = load %Str, %Str* @_func158_str2
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %12 = call %Value* () @term_arr ()
  store %Value* %12, %Value** %4
  br label %endif_2
else_2:

;stmt12:

;stmt13:
  %13 = call %Value* () @term_id ()
  store %Value* %13, %Value** %4
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
  store %Value* %15, %Value** %4
  br label %endif_3
else_3:

;stmt17:
  %16 = icmp eq %TokenType %3, 4
  br i1 %16, label %then_4, label %else_4
then_4:

;stmt18:

;stmt19:
  %17 = call %Value* () @term_str ()
  store %Value* %17, %Value** %4
  br label %endif_4
else_4:

;stmt20:
  %18 = icmp eq %TokenType %3, 5
  br i1 %18, label %then_5, label %else_5
then_5:

;stmt21:

;stmt22:
  %19 = call %Value* () @term_hash ()
  store %Value* %19, %Value** %4
  br label %endif_5
else_5:

;stmt23:

;stmt24:
  %20 = load %Str, %Str* @_func158_str3
  %21 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %20, %TokenInfo* %21)

;stmt25:
  %22 = load %Str, %Str* @_func158_str4
  %23 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %24 = load %TokenType, %TokenType* %23
  %25 = call %Int32 (%Str, ...) @printf (%Str %22, %TokenType %24)

;stmt26:
  %26 = load %Str, %Str* @_func158_str5
  %27 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2
  %28 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %27, i32 0, %Int32 0
  %29 = call %Int32 (%Str, ...) @printf (%Str %26, %Nat8* %28)
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_0
endif_0:

;stmt27:
  %30 = load %Value*, %Value** %4
  %31 = bitcast %Value* %30 to %Unit*
  %32 = inttoptr i64 0 to %Unit*
  %33 = icmp ne %Unit* %31, %32
  br i1 %33, label %then_6, label %else_6
then_6:

;stmt28:

;stmt29:
  %34 = load %Value*, %Value** %4
  %35 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 16
  %36 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1
  store %TokenInfo* %36, %TokenInfo** %35
  br label %endif_6
else_6:
  br label %endif_6
endif_6:

;stmt30:
  %37 = load %Value*, %Value** %4
  ret %Value* %37
}

define %Value* @term_str () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Token* () @ctok ()
  %4 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2
  %5 = bitcast [0 x %Nat8]* %4 to %Str

;stmt2:
  %6 = call %Nat32 (%Str) @strlen (%Str %5)
  %7 = add %Nat32 %6, 1

;stmt3:
  %8 = call %Str (%Str) @dup (%Str %5)

;stmt4:
  call void () @skip ()

;stmt5:
  %9 = call %Str () @get_name_str ()

;stmt6:
  %10 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 4, %TokenInfo* %2)

;stmt7:
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 3
  %12 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %13 = call %Definition* (%Assembly*, %Str, %Str, %Nat32) @asmStringAdd (%Assembly* %12, %Str %9, %Str %8, %Nat32 %7)
  store %Definition* %13, %Definition** %11

;stmt8:
  %14 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %15 = load %Type*, %Type** @typeStr
  store %Type* %15, %Type** %14

;stmt9:
  ret %Value* %10
}

define %Value* @term_arr () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Type* () @parse_type ()

;stmt2:
  %4 = load %Str, %Str* @_func160_str1
  %5 = call %Bool (%Str) @need (%Str %4)

;stmt3:
  %6 = call %List* () @list_new ()

;stmt4:
  %7 = alloca %Nat32

;stmt5:
  store %Nat32 0, %Nat32* %7

;stmt6:
  br label %continue_0
continue_0:
  %8 = load %Str, %Str* @_func160_str2
  %9 = call %Bool (%Str) @match (%Str %8)
  %10 = xor %Bool %9, 1
  br i1 %10, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %11 = call %Value* () @cexpr ()

;stmt9:
  %12 = bitcast %Value* %11 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp eq %Unit* %12, %13
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt10:

;stmt11:
  %15 = load %Str, %Str* @_func160_str3
  %16 = call %Bool (%Str) @match (%Str %15)

;stmt12:
  br label %continue_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt13:
  %18 = load %Type*, %Type** @typeBaseInt
  %19 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %11, %Type* %18)

;stmt14:
  %20 = load %Nat32, %Nat32* %7
  %21 = add %Nat32 %20, 1
  store %Nat32 %21, %Nat32* %7

;stmt15:
  %22 = bitcast %Value* %19 to %Unit*
  %23 = call %Bool (%List*, %Unit*) @list_append (%List* %6, %Unit* %22)

;stmt16:
  %24 = load %Str, %Str* @_func160_str4
  %25 = call %Bool (%Str) @match (%Str %24)
  br label %continue_0
break_0:

;stmt17:
  %26 = call %Str () @get_name_arr ()

;stmt18:
  %27 = load %Nat32, %Nat32* %7
  %28 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %3, %Nat32 %27, %Bool 0)

;stmt19:
  %29 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 3, %TokenInfo* %2)

;stmt20:
  %30 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 3
  %31 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %32 = call %Definition* (%Assembly*, %Str, %Type*, %List*) @asmArrayAdd (%Assembly* %31, %Str %26, %Type* %28, %List* %6)
  store %Definition* %32, %Definition** %30

;stmt21:
  %33 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 1
  store %Type* %28, %Type** %33

;stmt22:
  %34 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 15
  store %TokenInfo* %2, %TokenInfo** %34

;stmt23:
  ret %Value* %29
}

define void @getparam (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = bitcast %Unit* %1 to %Block*

;stmt2:
  %6 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 3
  %7 = load %TokenInfo*, %TokenInfo** %6
  %8 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 5, %TokenInfo* %7)

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 5
  store %Field* %4, %Field** %9

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 1
  %11 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  store %Type* %12, %Type** %10

;stmt5:
  %13 = getelementptr inbounds %Block, %Block* %5, i32 0, i32 1
  %14 = getelementptr inbounds %Index, %Index* %13, i32 0, i32 1
  %15 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0
  %16 = load %Str, %Str* %15
  %17 = bitcast %Value* %8 to %Unit*
  %18 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %14, %Str %16, %Unit* %17)
  ret void
}

define %Value* @term_func () {

;stmt0:
  %1 = load %FuncContext, %FuncContext* @fctx

;stmt1:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %3 = load %Block*, %Block** %2

;stmt2:
  %4 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %5 = inttoptr i64 0 to %Value*
  store %Value* %5, %Value** %4

;stmt3:
  %6 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %7 = inttoptr i64 0 to %Block*
  store %Block* %7, %Block** %6

;stmt4:
  %8 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3
  store %Nat32 0, %Nat32* %8

;stmt5:
  %9 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 4
  store %Nat32 0, %Nat32* %9

;stmt6:
  %10 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 5
  store %Nat32 0, %Nat32* %10

;stmt7:
  %11 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 6
  store %Nat32 0, %Nat32* %11

;stmt8:
  %12 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 7
  store %Nat32 0, %Nat32* %12

;stmt9:
  %13 = call %Token* () @ctok ()
  %14 = getelementptr inbounds %Token, %Token* %13, i32 0, i32 1

;stmt10:
  %15 = call %Str () @get_name_func ()

;stmt11:
  %16 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  store %Str %15, %Str* %16

;stmt12:
  %17 = bitcast %Str %15 to %Unit*
  %18 = inttoptr i64 0 to %Unit*
  %19 = icmp eq %Unit* %17, %18
  br i1 %19, label %then_0, label %else_0
then_0:

;stmt13:

;stmt14:
  %20 = load %Str, %Str* @_func161_str1
  %21 = call %Int32 (%Str, ...) @printf (%Str %20)

;stmt15:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt16:
  %23 = call %Type* () @parse_type ()

;stmt17:
  %24 = bitcast %Type* %23 to %Unit*
  %25 = inttoptr i64 0 to %Unit*
  %26 = icmp eq %Unit* %24, %25
  br i1 %26, label %then_1, label %else_1
then_1:

;stmt18:

;stmt19:
  %27 = load %Str, %Str* @_func161_str2
  %28 = call %Int32 (%Str, ...) @printf (%Str %27)

;stmt20:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt21:
  %30 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 3, %TokenInfo* %14)

;stmt22:
  %31 = bitcast %Block* %3 to %Unit*
  %32 = inttoptr i64 0 to %Unit*
  %33 = icmp ne %Unit* %31, %32
  br i1 %33, label %then_2, label %else_2
then_2:

;stmt23:

;stmt24:
  %34 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 3
  %35 = bitcast %Value* %30 to %Unit*
  %36 = call %Bool (%List*, %Unit*) @list_append (%List* %34, %Unit* %35)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt25:
  %37 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  store %Value* %30, %Value** %37

;stmt26:
  %38 = getelementptr inbounds %Value, %Value* %30, i32 0, i32 1
  store %Type* %23, %Type** %38

;stmt27:
  %39 = getelementptr inbounds %Value, %Value* %30, i32 0, i32 15
  store %TokenInfo* %14, %TokenInfo** %39

;stmt28:
  %40 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  store %Value* %30, %Value** %40

;stmt29:
  %41 = inttoptr i64 0 to %Block*
  %42 = call %Block* (%Block*) @block_new (%Block* %41)

;stmt30:
  %43 = getelementptr inbounds %Type, %Type* %23, i32 0, i32 6
  %44 = getelementptr inbounds %TypeFunc, %TypeFunc* %43, i32 0, i32 0
  %45 = load %List*, %List** %44
  %46 = bitcast %Block* %42 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %45, %ListForeachHandler @getparam, %Unit* %46)

;stmt31:
  %47 = load %Str, %Str* @_func161_str3
  %48 = call %Bool (%Str) @need (%Str %47)

;stmt32:
  %49 = call %Block* (%Block*) @doblock (%Block* %42)

;stmt33:
  %50 = getelementptr inbounds %Value, %Value* %30, i32 0, i32 3
  %51 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %52 = call %Definition* (%Assembly*, %Str, %Type*, %Block*) @asmFuncAdd (%Assembly* %51, %Str %15, %Type* %23, %Block* %49)
  store %Definition* %52, %Definition** %50

;stmt34:
  %53 = getelementptr inbounds %Type, %Type* %23, i32 0, i32 6
  %54 = getelementptr inbounds %TypeFunc, %TypeFunc* %53, i32 0, i32 1
  %55 = load %Type*, %Type** %54
  %56 = load %Type*, %Type** @typeUnit
  %57 = call %Bool (%Type*, %Type*) @type_eq (%Type* %55, %Type* %56)
  %58 = xor %Bool %57, 1
  br i1 %58, label %then_3, label %else_3
then_3:

;stmt35:

;stmt36:
  %59 = getelementptr inbounds %Block, %Block* %49, i32 0, i32 2
  %60 = getelementptr inbounds %List, %List* %59, i32 0, i32 2
  %61 = load %Nat64, %Nat64* %60
  %62 = icmp eq %Nat64 %61, 0
  br i1 %62, label %then_4, label %else_4
then_4:

;stmt37:

;stmt38:
  %63 = load %Str, %Str* @E_EXPECTED_RETURN
  call void (%Str, %TokenInfo*) @error (%Str %63, %TokenInfo* %14)
  br label %endif_4
else_4:

;stmt39:

;stmt40:
  %64 = getelementptr inbounds %Block, %Block* %49, i32 0, i32 2
  %65 = getelementptr inbounds %List, %List* %64, i32 0, i32 1
  %66 = load %Node*, %Node** %65
  %67 = getelementptr inbounds %Node, %Node* %66, i32 0, i32 3
  %68 = load %Unit*, %Unit** %67
  %69 = bitcast %Unit* %68 to %Stmt*

;stmt41:
  %70 = getelementptr inbounds %Stmt, %Stmt* %69, i32 0, i32 0
  %71 = load %StmtKind, %StmtKind* %70
  %72 = icmp ne %StmtKind %71, 6
  br i1 %72, label %then_5, label %else_5
then_5:

;stmt42:

;stmt43:
  %73 = load %Str, %Str* @E_EXPECTED_RETURN
  %74 = getelementptr inbounds %Stmt, %Stmt* %69, i32 0, i32 8
  %75 = load %TokenInfo*, %TokenInfo** %74
  call void (%Str, %TokenInfo*) @error (%Str %73, %TokenInfo* %75)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt44:
  store %FuncContext %1, %FuncContext* @fctx

;stmt45:
  ret %Value* %30

;stmt46:
  br label %fail
fail:

;stmt47:
  store %FuncContext %1, %FuncContext* @fctx

;stmt48:
  %77 = inttoptr i64 0 to %Value*
  ret %Value* %77
}

define %Value* @term_id () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Str () @parseId ()

;stmt2:
  %4 = bitcast %Str %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = inttoptr i64 0 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Value* (%Str) @get_value (%Str %3)

;stmt6:
  %10 = bitcast %Value* %9 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp eq %Unit* %10, %11
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %13 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 1, %TokenInfo* %2)

;stmt9:
  %14 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 14
  store %TokenInfo* %2, %TokenInfo** %14

;stmt10:
  call void (%Str, %Value*) @bind_value_global (%Str %3, %Value* %13)

;stmt11:
  ret %Value* %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  ret %Value* %9

;stmt13:
  br label %fail
fail:

;stmt14:
  %17 = inttoptr i64 0 to %Value*
  ret %Value* %17
}

define %Value* @term_num () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = alloca %Int64

;stmt2:
  %4 = call %Token* () @ctok ()

;stmt3:
  %5 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 2
  %6 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %5, i32 0, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = load %Str, %Str* @_func164_str1
  %9 = getelementptr inbounds %Nat8, %Str %8, %Int32 0
  %10 = load %Nat8, %Nat8* %9
  %11 = icmp eq %Nat8 %7, %10
  %12 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 2
  %13 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %12, i32 0, %Int32 1
  %14 = load %Nat8, %Nat8* %13
  %15 = load %Str, %Str* @_func164_str2
  %16 = getelementptr inbounds %Nat8, %Str %15, %Int32 0
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp eq %Nat8 %14, %17
  %19 = and %Bool %11, %18
  br i1 %19, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %20 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 2
  %21 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %20, i32 0, %Int32 2
  %22 = bitcast %Nat8* %21 to %Unit*
  %23 = load %Str, %Str* @_func164_str3
  %24 = getelementptr inbounds %Int64, %Int64* %3, i32 0
  %25 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %22, %Str %23, %Int64* %24)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %26 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 2
  %27 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %26, i32 0, %Int32 0
  %28 = bitcast %Nat8* %27 to %Unit*
  %29 = load %Str, %Str* @_func164_str4
  %30 = getelementptr inbounds %Int64, %Int64* %3, i32 0
  %31 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %28, %Str %29, %Int64* %30)
  br label %endif_0
endif_0:

;stmt8:
  call void () @skip ()

;stmt9:
  %32 = load %Type*, %Type** @typeNumeric
  %33 = load %Int64, %Int64* %3
  %34 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %32, %Int64 %33, %TokenInfo* %2)

;stmt10:
  %35 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 15
  store %TokenInfo* %2, %TokenInfo** %35

;stmt11:
  ret %Value* %34
}

define %Value* @term_hash () {

;stmt0:
  %1 = inttoptr i64 0 to %Value*
  ret %Value* %1
}

define void @stmtLetCheck (%Stmt*) {

;stmt0:
  %2 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 3
  %3 = load %Expr*, %Expr** %2
  %4 = getelementptr inbounds %Expr, %Expr* %3, i32 0, i32 0
  %5 = load %Value*, %Value** %4
  %6 = call %Type* (%Value*) @checkValue (%Value* %5)
  ret void
}

define %Stmt* @stmtBlock (%TokenInfo*) {

;stmt0:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %3 = load %Block*, %Block** %2
  %4 = call %Block* (%Block*) @doblock (%Block* %3)

;stmt1:
  %5 = bitcast %Block* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp eq %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %10 = getelementptr inbounds %Block, %Block* %4, i32 0, i32 4
  store %TokenInfo* %0, %TokenInfo** %10

;stmt5:
  %11 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 1, %TokenInfo* %0)

;stmt6:
  %12 = getelementptr inbounds %Stmt, %Stmt* %11, i32 0, i32 2
  store %Block* %4, %Block** %12

;stmt7:
  ret %Stmt* %11
}

define %Block* @block_new (%Block*) {

;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 112)
  %3 = bitcast %Unit* %2 to %Block*

;stmt1:
  %4 = bitcast %Block* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  %7 = load %Str, %Str* @_func168_str1
  call void (%Bool, %Str) @assert (%Bool %6, %Str %7)

;stmt2:
  %8 = bitcast %Block* %3 to %Unit*
  %9 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %8, %Nat8 0, %Nat32 112)

;stmt3:
  %10 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 0
  store %Block* %0, %Block** %10

;stmt4:
  %11 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 1
  call void (%Index*) @index_init (%Index* %11)

;stmt5:
  %12 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 2
  call void (%List*) @list_init (%List* %12)

;stmt6:
  %13 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 3
  call void (%List*) @list_init (%List* %13)

;stmt7:
  ret %Block* %3
}

define %Block* @doblock (%Block*) {

;stmt0:
  %2 = call %Block* (%Block*) @block_new (%Block* %0)

;stmt1:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %4 = load %Block*, %Block** %3

;stmt2:
  %5 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  store %Block* %2, %Block** %5

;stmt3:
  br label %continue_0
continue_0:
  %6 = load %Str, %Str* @_func169_str1
  %7 = call %Bool (%Str) @match (%Str %6)
  %8 = xor %Bool %7, 1
  br i1 %8, label %body_0, label %break_0
body_0:

;stmt4:

;stmt5:
  call void () @skip_nl ()

;stmt6:
  %9 = call %Bool () @eof ()
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %10 = load %Str, %Str* @_func169_str2
  call void (%Str) @fatal (%Str %10)

;stmt9:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt10:
  %12 = load %Str, %Str* @_func169_str3
  %13 = call %Bool (%Str) @match (%Str %12)
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  br label %break_0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt13:
  %15 = call %Stmt* () @stmtParse ()

;stmt14:
  %16 = bitcast %Stmt* %15 to %Unit*
  %17 = inttoptr i64 0 to %Unit*
  %18 = icmp ne %Unit* %16, %17
  br i1 %18, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  %19 = call %Bool () @sep ()

;stmt17:
  call void (%Stmt*) @stmtAdd (%Stmt* %15)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %continue_0
break_0:

;stmt18:
  %20 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  store %Block* %4, %Block** %20

;stmt19:
  ret %Block* %2
}

define void @chkf (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Value*

;stmt1:
  call void (%Value*) @checkFunc (%Value* %4)
  ret void
}

define void @chkb (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Stmt*

;stmt1:
  call void (%Stmt*) @stmtCheck (%Stmt* %4)
  ret void
}

define void @stmtBlockCheck (%Block*) {

;stmt0:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %3 = load %Block*, %Block** %2

;stmt1:
  %4 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  store %Block* %0, %Block** %4

;stmt2:
  %5 = getelementptr inbounds %Block, %Block* %0, i32 0, i32 3
  %6 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %5, %ListForeachHandler @chkf, %Unit* %6)

;stmt3:
  %7 = getelementptr inbounds %Block, %Block* %0, i32 0, i32 2
  %8 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %7, %ListForeachHandler @chkb, %Unit* %8)

;stmt4:
  %9 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  store %Block* %3, %Block** %9
  ret void
}

define %Expr* @expr_new (%Value*) {

;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %3 = bitcast %Unit* %2 to %Expr*

;stmt1:
  %4 = bitcast %Expr* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  %7 = load %Str, %Str* @_func173_str1
  call void (%Bool, %Str) @assert (%Bool %6, %Str %7)

;stmt2:
  %8 = bitcast %Expr* %3 to %Unit*
  %9 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %8, %Nat8 0, %Nat32 16)

;stmt3:
  %10 = getelementptr inbounds %Expr, %Expr* %3, i32 0, i32 0
  store %Value* %0, %Value** %10

;stmt4:
  ret %Expr* %3
}

define %Stmt* @stmt_expr_new (%Value*, %TokenInfo*) {

;stmt0:
  %3 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 0, %TokenInfo* %1)

;stmt1:
  %4 = getelementptr inbounds %Stmt, %Stmt* %3, i32 0, i32 3
  %5 = call %Expr* (%Value*) @expr_new (%Value* %0)
  store %Expr* %5, %Expr** %4

;stmt2:
  %6 = getelementptr inbounds %Stmt, %Stmt* %3, i32 0, i32 8
  %7 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %8 = load %TokenInfo*, %TokenInfo** %7
  store %TokenInfo* %8, %TokenInfo** %6

;stmt3:
  ret %Stmt* %3
}

define %Stmt* @stmtExpr () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Value* () @hier1 ()

;stmt2:
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  br label %fail_with_restore
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt6:
  %10 = load %Str, %Str* @_func175_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  %12 = xor %Bool %11, 1
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %13 = call %Stmt* (%Value*, %TokenInfo*) @stmt_expr_new (%Value* %3, %TokenInfo* %2)
  ret %Stmt* %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %15 = call %Value* () @hier1 ()

;stmt10:
  %16 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @assign (%Value* %3, %Value* %15, %TokenInfo* %9)
  ret %Stmt* %16

;stmt11:
  br label %fail_with_restore
fail_with_restore:

;stmt12:
  %18 = load %Str, %Str* @_func175_str2
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)

;stmt13:
  %20 = load %Str, %Str* @_func175_str3
  %21 = call %Token* () @ctok ()
  %22 = getelementptr inbounds %Token, %Token* %21, i32 0, i32 2
  %23 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %22, i32 0, %Int32 0
  %24 = call %Int32 (%Str, ...) @printf (%Str %20, %Nat8* %23)

;stmt14:
  %25 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %25

;stmt15:
  br label %fail
fail:

;stmt16:
  %27 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %27
}

define void @stmtExprCheck (%Expr*) {

;stmt0:
  %2 = getelementptr inbounds %Expr, %Expr* %0, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %Type* (%Value*) @checkValue (%Value* %3)
  ret void
}

define %Stmt* @assign (%Value*, %Value*, %TokenInfo*) {

;stmt0:
  %4 = bitcast %Value* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = bitcast %Value* %1 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  %10 = or %Bool %6, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %11 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %13 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @stmt_new_assign (%Value* %0, %Value* %1, %TokenInfo* %2)
  ret %Stmt* %13
}

define void @stmtAssignCheck (%Stmt*) {

;stmt0:
  %2 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 1
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 1
  %6 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %5, i32 0, %Int32 1
  %7 = load %Value*, %Value** %6

;stmt2:
  %8 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt3:
  %9 = call %Type* (%Value*) @checkValue (%Value* %7)

;stmt4:
  %10 = call %Bool (%Value*) @valueIsReadonly (%Value* %4)
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %11 = load %Str, %Str* @_func178_str1
  %12 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 16
  %13 = load %TokenInfo*, %TokenInfo** %12
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %13)

;stmt7:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %15 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %16 = load %Type*, %Type** %15
  %17 = call %Value* (%Value*, %Type*) @nat (%Value* %7, %Type* %16)

;stmt9:
  %18 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = call %Bool (%Type*, %Type*) @type_eq (%Type* %8, %Type* %19)
  %21 = xor %Bool %20, 1
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %22 = load %Str, %Str* @_func178_str2
  %23 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 8
  %24 = load %TokenInfo*, %TokenInfo** %23
  call void (%Str, %TokenInfo*) @error (%Str %22, %TokenInfo* %24)

;stmt12:
  %25 = load %Str, %Str* @_func178_str3
  %26 = call %Int32 (%Str, ...) @printf (%Str %25)

;stmt13:
  call void (%Type*) @prttype (%Type* %8)

;stmt14:
  %27 = load %Str, %Str* @_func178_str4
  %28 = call %Int32 (%Str, ...) @printf (%Str %27)

;stmt15:
  %29 = load %Str, %Str* @_func178_str5
  %30 = call %Int32 (%Str, ...) @printf (%Str %29)

;stmt16:
  %31 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 1
  %32 = load %Type*, %Type** %31
  call void (%Type*) @prttype (%Type* %32)

;stmt17:
  %33 = load %Str, %Str* @_func178_str6
  %34 = call %Int32 (%Str, ...) @printf (%Str %33)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt18:
  %35 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 1
  %36 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %35, i32 0, %Int32 1
  store %Value* %17, %Value** %36
  ret void
}

define %Stmt* @stmtIf (%TokenInfo*) {

;stmt0:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %3 = bitcast %Unit* %2 to %If*

;stmt1:
  %4 = getelementptr inbounds %If, %If* %3, i32 0, i32 0
  %5 = call %Value* () @hier1 ()
  store %Value* %5, %Value** %4

;stmt2:
  %6 = load %Str, %Str* @_func179_str1
  %7 = call %Bool (%Str) @match (%Str %6)

;stmt3:
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt4:
  %10 = load %Str, %Str* @_func179_str2
  %11 = call %Bool (%Str) @need (%Str %10)

;stmt5:
  %12 = getelementptr inbounds %If, %If* %3, i32 0, i32 1
  %13 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %9)
  store %Stmt* %13, %Stmt** %12

;stmt6:
  %14 = load %Str, %Str* @_func179_str3
  %15 = call %Bool (%Str) @match (%Str %14)
  br i1 %15, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %16 = load %Str, %Str* @_func179_str4
  %17 = call %Bool (%Str) @match (%Str %16)

;stmt9:
  %18 = call %Token* () @ctok ()
  %19 = getelementptr inbounds %Token, %Token* %18, i32 0, i32 1

;stmt10:
  %20 = load %Str, %Str* @_func179_str5
  %21 = call %Bool (%Str) @match (%Str %20)
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %22 = getelementptr inbounds %If, %If* %3, i32 0, i32 2
  %23 = call %Stmt* (%TokenInfo*) @stmtIf (%TokenInfo* %19)
  store %Stmt* %23, %Stmt** %22
  br label %endif_1
else_1:

;stmt13:

;stmt14:
  %24 = load %Str, %Str* @_func179_str6
  %25 = call %Bool (%Str) @need (%Str %24)

;stmt15:
  %26 = getelementptr inbounds %If, %If* %3, i32 0, i32 2
  %27 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %19)
  store %Stmt* %27, %Stmt** %26
  br label %endif_1
endif_1:
  br label %endif_0
else_0:

;stmt16:

;stmt17:
  %28 = getelementptr inbounds %If, %If* %3, i32 0, i32 2
  %29 = inttoptr i64 0 to %Stmt*
  store %Stmt* %29, %Stmt** %28
  br label %endif_0
endif_0:

;stmt18:
  %30 = getelementptr inbounds %If, %If* %3, i32 0, i32 0
  %31 = load %Value*, %Value** %30
  %32 = bitcast %Value* %31 to %Unit*
  %33 = inttoptr i64 0 to %Unit*
  %34 = icmp eq %Unit* %32, %33
  %35 = getelementptr inbounds %If, %If* %3, i32 0, i32 1
  %36 = load %Stmt*, %Stmt** %35
  %37 = bitcast %Stmt* %36 to %Unit*
  %38 = inttoptr i64 0 to %Unit*
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
  %42 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 4, %TokenInfo* %0)

;stmt22:
  %43 = getelementptr inbounds %Stmt, %Stmt* %42, i32 0, i32 6
  store %If* %3, %If** %43

;stmt23:
  %44 = getelementptr inbounds %Stmt, %Stmt* %42, i32 0, i32 8
  store %TokenInfo* %0, %TokenInfo** %44

;stmt24:
  ret %Stmt* %42

;stmt25:
  br label %fail
fail:

;stmt26:
  %46 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %46
}

define void @stmtIfCheck (%Stmt*) {

;stmt0:
  %2 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 6
  %3 = load %If*, %If** %2

;stmt1:
  %4 = getelementptr inbounds %If, %If* %3, i32 0, i32 0
  %5 = load %Value*, %Value** %4
  %6 = call %Type* (%Value*) @checkValue (%Value* %5)

;stmt2:
  %7 = bitcast %Type* %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
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
  %13 = load %Str, %Str* @_func180_str1
  %14 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 13
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
  %16 = getelementptr inbounds %If, %If* %3, i32 0, i32 1
  %17 = load %Stmt*, %Stmt** %16
  call void (%Stmt*) @stmtCheck (%Stmt* %17)

;stmt8:
  %18 = getelementptr inbounds %If, %If* %3, i32 0, i32 2
  %19 = load %Stmt*, %Stmt** %18
  call void (%Stmt*) @stmtCheck (%Stmt* %19)
  ret void
}

define %Stmt* @stmtWhile (%TokenInfo*) {

;stmt0:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3
  %4 = load %Nat32, %Nat32* %3
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* %2

;stmt1:
  %6 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %7 = bitcast %Unit* %6 to %While*

;stmt2:
  %8 = getelementptr inbounds %While, %While* %7, i32 0, i32 0
  %9 = call %Value* () @hier1 ()
  store %Value* %9, %Value** %8

;stmt3:
  %10 = load %Str, %Str* @_func181_str1
  %11 = call %Bool (%Str) @match (%Str %10)

;stmt4:
  %12 = call %Token* () @ctok ()
  %13 = getelementptr inbounds %Token, %Token* %12, i32 0, i32 1

;stmt5:
  %14 = load %Str, %Str* @_func181_str2
  %15 = call %Bool (%Str) @need (%Str %14)

;stmt6:
  %16 = getelementptr inbounds %While, %While* %7, i32 0, i32 1
  %17 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %13)
  store %Stmt* %17, %Stmt** %16

;stmt7:
  %18 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3
  %19 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3
  %20 = load %Nat32, %Nat32* %19
  %21 = sub %Nat32 %20, 1
  store %Nat32 %21, %Nat32* %18

;stmt8:
  %22 = getelementptr inbounds %While, %While* %7, i32 0, i32 0
  %23 = load %Value*, %Value** %22
  %24 = bitcast %Value* %23 to %Unit*
  %25 = inttoptr i64 0 to %Unit*
  %26 = icmp eq %Unit* %24, %25
  %27 = getelementptr inbounds %While, %While* %7, i32 0, i32 1
  %28 = load %Stmt*, %Stmt** %27
  %29 = bitcast %Stmt* %28 to %Unit*
  %30 = inttoptr i64 0 to %Unit*
  %31 = icmp eq %Unit* %29, %30
  %32 = or %Bool %26, %31
  br i1 %32, label %then_0, label %else_0
then_0:

;stmt9:

;stmt10:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt11:
  %34 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 5, %TokenInfo* %0)

;stmt12:
  %35 = getelementptr inbounds %Stmt, %Stmt* %34, i32 0, i32 5
  store %While* %7, %While** %35

;stmt13:
  %36 = getelementptr inbounds %Stmt, %Stmt* %34, i32 0, i32 8
  store %TokenInfo* %0, %TokenInfo** %36

;stmt14:
  ret %Stmt* %34

;stmt15:
  br label %fail
fail:

;stmt16:
  %38 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3
  %39 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3
  %40 = load %Nat32, %Nat32* %39
  %41 = sub %Nat32 %40, 1
  store %Nat32 %41, %Nat32* %38

;stmt17:
  %42 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %42
}

define void @stmtWhileCheck (%Stmt*) {

;stmt0:
  %2 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 5
  %3 = load %While*, %While** %2

;stmt1:
  %4 = getelementptr inbounds %While, %While* %3, i32 0, i32 0
  %5 = load %Value*, %Value** %4
  %6 = call %Type* (%Value*) @checkValue (%Value* %5)

;stmt2:
  %7 = bitcast %Type* %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
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
  %13 = load %Str, %Str* @_func182_str1
  %14 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 13
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
  %16 = getelementptr inbounds %While, %While* %3, i32 0, i32 1
  %17 = load %Stmt*, %Stmt** %16
  call void (%Stmt*) @stmtCheck (%Stmt* %17)
  ret void
}

define %Stmt* @stmtReturn (%TokenInfo*) {

;stmt0:
  %2 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 6, %TokenInfo* %0)

;stmt1:
  %3 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 8
  store %TokenInfo* %0, %TokenInfo** %3

;stmt2:
  %4 = call %Bool () @separator ()
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  ret %Stmt* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %6 = call %Token* () @ctok ()
  %7 = getelementptr inbounds %Token, %Token* %6, i32 0, i32 1

;stmt6:
  %8 = call %Value* () @hier1 ()

;stmt7:
  %9 = bitcast %Value* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp eq %Unit* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %12 = load %Str, %Str* @_func183_str1
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %7)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %13 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 1
  %14 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %13, i32 0, %Int32 0
  store %Value* %8, %Value** %14

;stmt11:
  ret %Stmt* %2

;stmt12:
  br label %fail
fail:

;stmt13:
  %16 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %16
}

define void @stmtReturnCheck (%Stmt*) {

;stmt0:
  %2 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 1
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = bitcast %Value* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt4:
  %9 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %10 = load %Value*, %Value** %9
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = getelementptr inbounds %Type, %Type* %12, i32 0, i32 6
  %14 = getelementptr inbounds %TypeFunc, %TypeFunc* %13, i32 0, i32 1
  %15 = load %Type*, %Type** %14

;stmt5:
  %16 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 1
  %17 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %16, i32 0, %Int32 0
  %18 = call %Value* (%Value*, %Type*) @nat (%Value* %4, %Type* %15)
  store %Value* %18, %Value** %17
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Stmt* @stmtBreak (%TokenInfo*) {

;stmt0:
  %2 = call %Bool () @sep ()

;stmt1:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Str, %Str* @_func185_str1
  %7 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 7, %TokenInfo* %0)
  ret %Stmt* %8
}

define %Stmt* @stmtContinue (%TokenInfo*) {

;stmt0:
  %2 = call %Bool () @sep ()

;stmt1:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Str, %Str* @_func186_str1
  %7 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 8, %TokenInfo* %0)
  ret %Stmt* %8
}

define %Stmt* @stmtGoto (%TokenInfo*) {

;stmt0:
  %2 = call %Str () @parseId ()

;stmt1:
  %3 = bitcast %Str %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Str, %Str* @_func187_str1
  %7 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %7)

;stmt4:
  %8 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %10 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 9, %TokenInfo* %0)

;stmt6:
  %11 = getelementptr inbounds %Stmt, %Stmt* %10, i32 0, i32 7
  store %Str %2, %Str* %11

;stmt7:
  %12 = getelementptr inbounds %Stmt, %Stmt* %10, i32 0, i32 8
  store %TokenInfo* %0, %TokenInfo** %12

;stmt8:
  ret %Stmt* %10
}

define void @stmtAdd (%Stmt*) {

;stmt0:
  %2 = bitcast %Stmt* %0 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %6 = load %Block*, %Block** %5
  %7 = getelementptr inbounds %Block, %Block* %6, i32 0, i32 2
  %8 = bitcast %Stmt* %0 to %Unit*
  %9 = call %Bool (%List*, %Unit*) @list_append (%List* %7, %Unit* %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Stmt* @stmtNew (%StmtKind, %TokenInfo*) {

;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 80)
  %4 = bitcast %Unit* %3 to %Stmt*

;stmt1:
  %5 = bitcast %Stmt* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  %8 = load %Str, %Str* @_func189_str1
  call void (%Bool, %Str) @assert (%Bool %7, %Str %8)

;stmt2:
  %9 = bitcast %Stmt* %4 to %Unit*
  %10 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %9, %Nat8 0, %Nat32 80)

;stmt3:
  %11 = getelementptr inbounds %Stmt, %Stmt* %4, i32 0, i32 0
  store %StmtKind %0, %StmtKind* %11

;stmt4:
  %12 = getelementptr inbounds %Stmt, %Stmt* %4, i32 0, i32 8
  store %TokenInfo* %1, %TokenInfo** %12

;stmt5:
  ret %Stmt* %4
}

define %Stmt* @stmtLabelNew (%Str, %TokenInfo*) {

;stmt0:
  %3 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 10, %TokenInfo* %1)

;stmt1:
  %4 = getelementptr inbounds %Stmt, %Stmt* %3, i32 0, i32 7
  store %Str %0, %Str* %4

;stmt2:
  ret %Stmt* %3
}

define %Stmt* @stmtParse () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = load %Str, %Str* @_func191_str1
  %4 = call %Bool (%Str) @match (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = call %Stmt* () @parseLet ()
  ret %Stmt* %5

;stmt4:
  %7 = call %Bool () @sep ()
  br label %endif_0
else_0:

;stmt5:
  %8 = load %Str, %Str* @_func191_str2
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
  %12 = load %Str, %Str* @_func191_str3
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
  %16 = load %Str, %Str* @_func191_str4
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
  %20 = load %Str, %Str* @_func191_str5
  %21 = call %Bool (%Str) @match (%Str %20)
  br i1 %21, label %then_4, label %else_4
then_4:

;stmt15:

;stmt16:
  %22 = call %Stmt* (%TokenInfo*) @stmtReturn (%TokenInfo* %2)
  ret %Stmt* %22
  br label %endif_4
else_4:

;stmt17:
  %24 = load %Str, %Str* @_func191_str6
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
  %28 = load %Str, %Str* @_func191_str7
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
  %32 = load %Str, %Str* @_func191_str8
  %33 = call %Bool (%Str) @match (%Str %32)
  br i1 %33, label %then_7, label %else_7
then_7:

;stmt24:

;stmt25:
  call void () @parseVardef ()

;stmt26:
  %34 = call %Bool () @sep ()

;stmt27:
  %35 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %35
  br label %endif_7
else_7:

;stmt28:
  %37 = load %Str, %Str* @_func191_str9
  %38 = call %Bool (%Str) @match (%Str %37)
  br i1 %38, label %then_8, label %else_8
then_8:

;stmt29:

;stmt30:
  call void () @parseTypedef ()

;stmt31:
  %39 = call %Bool () @sep ()

;stmt32:
  %40 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %40
  br label %endif_8
else_8:

;stmt33:
  %42 = load %Str, %Str* @_func191_str10
  %43 = call %Bool (%Str) @match (%Str %42)
  br i1 %43, label %then_9, label %else_9
then_9:

;stmt34:

;stmt35:
  %44 = call %Stmt* (%TokenInfo*) @stmtGoto (%TokenInfo* %2)
  ret %Stmt* %44
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
  %46 = call %Node* () @gett ()

;stmt37:
  %47 = call %Token* () @ctok ()
  %48 = getelementptr inbounds %Token, %Token* %47, i32 0, i32 0
  %49 = load %TokenType, %TokenType* %48
  %50 = icmp eq %TokenType %49, 1
  br i1 %50, label %then_10, label %else_10
then_10:

;stmt38:

;stmt39:
  %51 = call %Str () @parseId ()

;stmt40:
  %52 = call %Token* () @ctok ()
  %53 = getelementptr inbounds %Token, %Token* %52, i32 0, i32 1

;stmt41:
  %54 = load %Str, %Str* @_func191_str11
  %55 = call %Bool (%Str) @match (%Str %54)
  br i1 %55, label %then_11, label %else_11
then_11:

;stmt42:

;stmt43:
  %56 = call %Stmt* (%Str, %TokenInfo*) @stmtLabelNew (%Str %51, %TokenInfo* %53)
  ret %Stmt* %56
  br label %endif_11
else_11:

;stmt44:

;stmt45:
  call void (%Node*) @sett (%Node* %46)
  br label %endif_11
endif_11:
  br label %endif_10
else_10:
  br label %endif_10
endif_10:

;stmt46:
  %58 = call %Stmt* () @stmtExpr ()

;stmt47:
  %59 = bitcast %Stmt* %58 to %Unit*
  %60 = inttoptr i64 0 to %Unit*
  %61 = icmp eq %Unit* %59, %60
  br i1 %61, label %then_12, label %else_12
then_12:

;stmt48:

;stmt49:
  call void () @stmt_restore ()
  br label %endif_12
else_12:
  br label %endif_12
endif_12:

;stmt50:
  ret %Stmt* %58
}

define void @stmt_restore () {

;stmt0:
  call void () @skip ()
  ret void
}

define %Stmt* @stmt_new_vardef (%Str, %Type*, %Value*, %TokenInfo*) {

;stmt0:
  %5 = call %Unit* (%Nat32) @malloc (%Nat32 40)
  %6 = bitcast %Unit* %5 to %VarDef*

;stmt1:
  %7 = getelementptr inbounds %VarDef, %VarDef* %6, i32 0, i32 0
  store %Str %0, %Str* %7

;stmt2:
  %8 = getelementptr inbounds %VarDef, %VarDef* %6, i32 0, i32 3
  store %Value* %2, %Value** %8

;stmt3:
  %9 = getelementptr inbounds %VarDef, %VarDef* %6, i32 0, i32 2
  store %Type* %1, %Type** %9

;stmt4:
  %10 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 2, %TokenInfo* %3)

;stmt5:
  %11 = getelementptr inbounds %Stmt, %Stmt* %10, i32 0, i32 4
  store %VarDef* %6, %VarDef** %11

;stmt6:
  %12 = getelementptr inbounds %Stmt, %Stmt* %10, i32 0, i32 8
  store %TokenInfo* %3, %TokenInfo** %12

;stmt7:
  ret %Stmt* %10
}

define %Stmt* @stmt_new_assign (%Value*, %Value*, %TokenInfo*) {

;stmt0:
  %4 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 3, %TokenInfo* %2)

;stmt1:
  %5 = getelementptr inbounds %Stmt, %Stmt* %4, i32 0, i32 1
  %6 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %5, i32 0, %Int32 0
  store %Value* %0, %Value** %6

;stmt2:
  %7 = getelementptr inbounds %Stmt, %Stmt* %4, i32 0, i32 1
  %8 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %7, i32 0, %Int32 1
  store %Value* %1, %Value** %8

;stmt3:
  %9 = getelementptr inbounds %Stmt, %Stmt* %4, i32 0, i32 8
  store %TokenInfo* %2, %TokenInfo** %9

;stmt4:
  ret %Stmt* %4
}

define void @stmtCheck (%Stmt*) {

;stmt0:
  %2 = bitcast %Stmt* %0 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
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
  %6 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 0
  %7 = load %StmtKind, %StmtKind* %6

;stmt4:
  %8 = icmp eq %StmtKind %7, 0
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %9 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 3
  %10 = load %Expr*, %Expr** %9
  call void (%Expr*) @stmtExprCheck (%Expr* %10)
  br label %endif_1
else_1:

;stmt7:
  %11 = icmp eq %StmtKind %7, 3
  br i1 %11, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  call void (%Stmt*) @stmtAssignCheck (%Stmt* %0)
  br label %endif_2
else_2:

;stmt10:
  %12 = icmp eq %StmtKind %7, 1
  br i1 %12, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %13 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 2
  %14 = load %Block*, %Block** %13
  call void (%Block*) @stmtBlockCheck (%Block* %14)
  br label %endif_3
else_3:

;stmt13:
  %15 = icmp eq %StmtKind %7, 4
  br i1 %15, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  call void (%Stmt*) @stmtIfCheck (%Stmt* %0)
  br label %endif_4
else_4:

;stmt16:
  %16 = icmp eq %StmtKind %7, 5
  br i1 %16, label %then_5, label %else_5
then_5:

;stmt17:

;stmt18:
  call void (%Stmt*) @stmtWhileCheck (%Stmt* %0)
  br label %endif_5
else_5:

;stmt19:
  %17 = icmp eq %StmtKind %7, 6
  br i1 %17, label %then_6, label %else_6
then_6:

;stmt20:

;stmt21:
  call void (%Stmt*) @stmtReturnCheck (%Stmt* %0)
  br label %endif_6
else_6:
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

define void @asmInit (%Assembly*, %Str) {

;stmt0:
  %3 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 0
  store %Str %1, %Str* %3
  ret void
}

define %Definition* @definition_new (%DefinitionKind, %Str) {

;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 184)
  %4 = bitcast %Unit* %3 to %Definition*

;stmt1:
  %5 = bitcast %Definition* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  %8 = load %Str, %Str* @_func197_str1
  call void (%Bool, %Str) @assert (%Bool %7, %Str %8)

;stmt2:
  %9 = bitcast %Definition* %4 to %Unit*
  %10 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %9, %Nat8 0, %Nat32 184)

;stmt3:
  %11 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 0
  store %DefinitionKind %0, %DefinitionKind* %11

;stmt4:
  %12 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 1
  store %Str %1, %Str* %12

;stmt5:
  ret %Definition* %4
}

define %Definition* @asmTypedefAdd (%Assembly*, %Str, %Type*) {

;stmt0:
  %4 = call %Definition* (%DefinitionKind, %Str) @definition_new (%DefinitionKind 0, %Str %1)

;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 5
  %6 = getelementptr inbounds %TypeDef, %TypeDef* %5, i32 0, i32 0
  store %Type* %2, %Type** %6

;stmt2:
  %7 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 1
  %8 = bitcast %Definition* %4 to %Unit*
  %9 = call %Bool (%List*, %Unit*) @list_append (%List* %7, %Unit* %8)

;stmt3:
  ret %Definition* %4
}

define %Definition* @asmStringAdd (%Assembly*, %Str, %Str, %Nat32) {

;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @definition_new (%DefinitionKind 2, %Str %1)

;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 3
  %7 = getelementptr inbounds %StringDef, %StringDef* %6, i32 0, i32 0
  store %Str %2, %Str* %7

;stmt2:
  %8 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 3
  %9 = getelementptr inbounds %StringDef, %StringDef* %8, i32 0, i32 1
  store %Nat32 %3, %Nat32* %9

;stmt3:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 4
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call %Bool (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)

;stmt4:
  ret %Definition* %5
}

define %Definition* @asmArrayAdd (%Assembly*, %Str, %Type*, %List*) {

;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @definition_new (%DefinitionKind 3, %Str %1)

;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 9
  %7 = getelementptr inbounds %ArrayDef, %ArrayDef* %6, i32 0, i32 0
  store %Type* %2, %Type** %7

;stmt2:
  %8 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 9
  %9 = getelementptr inbounds %ArrayDef, %ArrayDef* %8, i32 0, i32 2
  store %List* %3, %List** %9

;stmt3:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 3
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call %Bool (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)

;stmt4:
  ret %Definition* %5
}

define %Definition* @asmFuncAdd (%Assembly*, %Str, %Type*, %Block*) {

;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @definition_new (%DefinitionKind 4, %Str %1)

;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 11
  %7 = getelementptr inbounds %FuncDef, %FuncDef* %6, i32 0, i32 0
  store %Type* %2, %Type** %7

;stmt2:
  %8 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 11
  %9 = getelementptr inbounds %FuncDef, %FuncDef* %8, i32 0, i32 1
  store %Block* %3, %Block** %9

;stmt3:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 6
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call %Bool (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)

;stmt4:
  ret %Definition* %5
}

define %Definition* @asmVarAdd (%Assembly*, %Str, %Type*, %Value*) {

;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @definition_new (%DefinitionKind 5, %Str %1)

;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 13
  %7 = getelementptr inbounds %AssemblyVarDef, %AssemblyVarDef* %6, i32 0, i32 1
  store %Value* %3, %Value** %7

;stmt2:
  %8 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 13
  %9 = getelementptr inbounds %AssemblyVarDef, %AssemblyVarDef* %8, i32 0, i32 0
  store %Type* %2, %Type** %9

;stmt3:
  %10 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 5
  %11 = bitcast %Definition* %5 to %Unit*
  %12 = call %Bool (%List*, %Unit*) @list_append (%List* %10, %Unit* %11)

;stmt4:
  ret %Definition* %5
}

define %Definition* @asmAliasAdd (%Assembly*, %Str, %Type*, %Str) {

;stmt0:
  %5 = call %Definition* (%DefinitionKind, %Str) @definition_new (%DefinitionKind 6, %Str %1)

;stmt1:
  %6 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 15
  %7 = getelementptr inbounds %AliasDef, %AliasDef* %6, i32 0, i32 0
  store %Str %1, %Str* %7

;stmt2:
  %8 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 15
  %9 = getelementptr inbounds %AliasDef, %AliasDef* %8, i32 0, i32 1
  store %Type* %2, %Type** %9

;stmt3:
  %10 = getelementptr inbounds %Definition, %Definition* %5, i32 0, i32 15
  %11 = getelementptr inbounds %AliasDef, %AliasDef* %10, i32 0, i32 2
  store %Str %3, %Str* %11

;stmt4:
  %12 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 2
  %13 = bitcast %Definition* %5 to %Unit*
  %14 = call %Bool (%List*, %Unit*) @list_append (%List* %12, %Unit* %13)

;stmt5:
  ret %Definition* %5
}

define %Type* @parse_type () {

;stmt0:
  %1 = alloca %Type*

;stmt1:
  %2 = inttoptr i64 0 to %Type*
  store %Type* %2, %Type** %1

;stmt2:
  %3 = call %Token* () @ctok ()

;stmt3:
  %4 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 1

;stmt4:
  %5 = call %Token* () @ctok ()
  %6 = getelementptr inbounds %Token, %Token* %5, i32 0, i32 0
  %7 = load %TokenType, %TokenType* %6
  %8 = icmp eq %TokenType %7, 1
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %9 = load %Str, %Str* @_func204_str1
  %10 = call %Bool (%Str) @match (%Str %9)
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %11 = call %Type* () @parse_type_record ()
  store %Type* %11, %Type** %1
  br label %endif_1
else_1:

;stmt9:
  %12 = load %Str, %Str* @_func204_str2
  %13 = call %Bool (%Str) @match (%Str %12)
  br i1 %13, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %14 = call %Type* () @parse_type_enum ()
  store %Type* %14, %Type** %1
  br label %endif_2
else_2:

;stmt12:

;stmt13:
  %15 = call %Type* () @parse_type_named ()
  store %Type* %15, %Type** %1
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:

;stmt14:

;stmt15:
  %16 = load %Str, %Str* @_func204_str3
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_3, label %else_3
then_3:

;stmt16:

;stmt17:
  %18 = call %Type* () @parse_type ()

;stmt18:
  %19 = bitcast %Type* %18 to %Unit*
  %20 = inttoptr i64 0 to %Unit*
  %21 = icmp eq %Unit* %19, %20
  br i1 %21, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %22 = inttoptr i64 0 to %Type*
  ret %Type* %22
  br label %endif_4
else_4:
  br label %endif_4
endif_4:

;stmt21:
  %24 = call %Type* (%Type*) @type_pointer_new (%Type* %18)
  store %Type* %24, %Type** %1
  br label %endif_3
else_3:

;stmt22:
  %25 = load %Str, %Str* @_func204_str4
  %26 = call %Bool (%Str) @match (%Str %25)
  br i1 %26, label %then_5, label %else_5
then_5:

;stmt23:

;stmt24:
  %27 = call %Type* () @parse_type_array ()
  store %Type* %27, %Type** %1
  br label %endif_5
else_5:

;stmt25:
  %28 = load %Str, %Str* @_func204_str5
  %29 = call %Bool (%Str) @match (%Str %28)
  br i1 %29, label %then_6, label %else_6
then_6:

;stmt26:

;stmt27:
  %30 = call %Type* () @parse_type_func ()
  store %Type* %30, %Type** %1
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
  %31 = load %Type*, %Type** %1
  %32 = bitcast %Type* %31 to %Unit*
  %33 = inttoptr i64 0 to %Unit*
  %34 = icmp eq %Unit* %32, %33
  br i1 %34, label %then_7, label %else_7
then_7:

;stmt29:

;stmt30:
  %35 = load %Str, %Str* @_func204_str6
  call void (%Str, %TokenInfo*) @error (%Str %35, %TokenInfo* %4)

;stmt31:
  %36 = load %Str, %Str* @_func204_str7
  %37 = call %Token* () @ctok ()
  %38 = getelementptr inbounds %Token, %Token* %37, i32 0, i32 2
  %39 = load [0 x %Nat8], [0 x %Nat8]* %38
  %40 = call %Int32 (%Str, ...) @printf (%Str %36, [0 x %Nat8] %39)
  br label %endif_7
else_7:

;stmt32:

;stmt33:
  %41 = load %Type*, %Type** %1
  %42 = getelementptr inbounds %Type, %Type* %41, i32 0, i32 0
  %43 = load %TypeKind, %TypeKind* %42
  %44 = icmp eq %TypeKind %43, 5
  %45 = load %Type*, %Type** %1
  %46 = getelementptr inbounds %Type, %Type* %45, i32 0, i32 0
  %47 = load %TypeKind, %TypeKind* %46
  %48 = icmp eq %TypeKind %47, 7
  %49 = or %Bool %44, %48
  br i1 %49, label %then_8, label %else_8
then_8:

;stmt34:

;stmt35:
  %50 = load %Type*, %Type** %1
  %51 = getelementptr inbounds %Type, %Type* %50, i32 0, i32 2
  %52 = load %Type*, %Type** %1
  %53 = getelementptr inbounds %Type, %Type* %52, i32 0, i32 3
  %54 = load %Nat32, %Nat32* %53
  store %Nat32 %54, %Nat32* %51
  br label %endif_8
else_8:
  br label %endif_8
endif_8:

;stmt36:
  %55 = load %Type*, %Type** %1
  %56 = getelementptr inbounds %Type, %Type* %55, i32 0, i32 3
  %57 = load %Type*, %Type** %1
  %58 = getelementptr inbounds %Type, %Type* %57, i32 0, i32 3
  %59 = load %Nat32, %Nat32* %58
  %60 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 1
  %61 = load %Nat32, %Nat32* %60
  %62 = trunc %Nat32 %61 to %Nat8
  %63 = call %Nat32 (%Nat32, %Nat8) @alignment (%Nat32 %59, %Nat8 %62)
  store %Nat32 %63, %Nat32* %56

;stmt37:
  %64 = load %Type*, %Type** %1
  %65 = getelementptr inbounds %Type, %Type* %64, i32 0, i32 12
  store %TokenInfo* %4, %TokenInfo** %65

;stmt38:
  %66 = load %Type*, %Type** %1
  %67 = getelementptr inbounds %Type, %Type* %66, i32 0, i32 13
  store %TokenInfo* %4, %TokenInfo** %67
  br label %endif_7
endif_7:

;stmt39:
  %68 = load %Type*, %Type** %1
  ret %Type* %68
}

define %Type* @parse_type_named () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Str () @parseId ()

;stmt2:
  %4 = bitcast %Str %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = load %Str, %Str* @_func205_str1
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %2)

;stmt5:
  %8 = inttoptr i64 0 to %Type*
  ret %Type* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %10 = call %Type* (%Str) @get_type (%Str %3)

;stmt7:
  %11 = bitcast %Type* %10 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  ret %Type* %10
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %15 = call %Type* (%TypeKind) @type_new (%TypeKind 0)

;stmt11:
  %16 = getelementptr inbounds %Type, %Type* %15, i32 0, i32 11
  store %TokenInfo* %2, %TokenInfo** %16

;stmt12:
  %17 = load %ModuleContext*, %ModuleContext** @old_mctx
  %18 = getelementptr inbounds %ModuleContext, %ModuleContext* %17, i32 0, i32 1
  call void (%Index*, %Str, %Type*) @add_type (%Index* %18, %Str %3, %Type* %15)

;stmt13:
  ret %Type* %15
}

define %List* @parse_fields (%Str) {

;stmt0:
  %2 = call %List* () @list_new ()

;stmt1:
  call void () @skip_nl ()

;stmt2:
  br label %continue_0
continue_0:
  %3 = call %Bool (%Str) @match (%Str %0)
  %4 = xor %Bool %3, 1
  br i1 %4, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  call void () @skip_nl ()

;stmt5:
  %5 = call %Token* () @ctok ()
  %6 = getelementptr inbounds %Token, %Token* %5, i32 0, i32 1

;stmt6:
  %7 = call %List* () @parseField ()

;stmt7:
  %8 = bitcast %List* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  %11 = load %Str, %Str* @_func206_str1
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %6)

;stmt10:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt11:
  %13 = load %Str, %Str* @_func206_str2
  %14 = call %Bool (%Str) @match (%Str %13)

;stmt12:
  call void () @skip_nl ()

;stmt13:
  %15 = call %Bool (%List*, %List*) @list_extend (%List* %2, %List* %7)
  br label %continue_0
break_0:

;stmt14:
  ret %List* %2

;stmt15:
  br label %fail
fail:

;stmt16:
  %17 = inttoptr i64 0 to %List*
  ret %List* %17
}

define %Type* @parse_type_record () {

;stmt0:
  %1 = load %Str, %Str* @_func207_str1
  %2 = call %Bool (%Str) @need (%Str %1)

;stmt1:
  %3 = load %Str, %Str* @_func207_str2
  %4 = call %List* (%Str) @parse_fields (%Str %3)

;stmt2:
  %5 = call %Type* (%List*) @type_record_new (%List* %4)
  ret %Type* %5
}

define %Type* @parse_type_enum () {

;stmt0:
  %1 = call %List* () @list_new ()

;stmt1:
  %2 = alloca %Int64

;stmt2:
  store %Int64 0, %Int64* %2

;stmt3:
  %3 = load %Str, %Str* @_func208_str1
  %4 = call %Bool (%Str) @need (%Str %3)

;stmt4:
  call void () @skip_nl ()

;stmt5:
  br label %continue_0
continue_0:
  %5 = load %Str, %Str* @_func208_str2
  %6 = call %Bool (%Str) @match (%Str %5)
  %7 = xor %Bool %6, 1
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  call void () @skip_nl ()

;stmt8:
  %8 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %9 = bitcast %Unit* %8 to %EnumConstructor*

;stmt9:
  %10 = call %Token* () @ctok ()
  %11 = getelementptr inbounds %Token, %Token* %10, i32 0, i32 1

;stmt10:
  %12 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %9, i32 0, i32 0
  %13 = call %Str () @parseId ()
  store %Str %13, %Str* %12

;stmt11:
  %14 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %9, i32 0, i32 1
  %15 = load %Int64, %Int64* %2
  store %Int64 %15, %Int64* %14

;stmt12:
  %16 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %9, i32 0, i32 2
  store %TokenInfo* %11, %TokenInfo** %16

;stmt13:
  %17 = bitcast %EnumConstructor* %9 to %Unit*
  %18 = call %Bool (%List*, %Unit*) @list_append (%List* %1, %Unit* %17)

;stmt14:
  %19 = load %Int64, %Int64* %2
  %20 = add %Int64 %19, 1
  store %Int64 %20, %Int64* %2

;stmt15:
  %21 = load %Str, %Str* @_func208_str3
  %22 = call %Bool (%Str) @match (%Str %21)
  %23 = xor %Bool %22, 1
  br i1 %23, label %then_0, label %else_0
then_0:

;stmt16:

;stmt17:
  call void () @skip_nl ()

;stmt18:
  %24 = load %Str, %Str* @_func208_str4
  %25 = call %Bool (%Str) @need (%Str %24)

;stmt19:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  br label %continue_0
break_0:

;stmt20:
  call void () @skip_nl ()

;stmt21:
  %27 = call %Type* (%List*) @type_enum_new (%List* %1)
  ret %Type* %27
}

define %Type* @parse_type_array () {

;stmt0:
  %1 = load %Str, %Str* @_func209_str1
  %2 = call %Bool (%Str) @match (%Str %1)
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %3 = call %Type* () @parse_type ()

;stmt3:
  %4 = bitcast %Type* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
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
  %12 = inttoptr i64 0 to %Unit*
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
  %15 = load %Str, %Str* @_func209_str2
  %16 = call %Bool (%Str) @need (%Str %15)

;stmt12:
  %17 = call %Type* () @parse_type ()

;stmt13:
  %18 = bitcast %Type* %17 to %Unit*
  %19 = inttoptr i64 0 to %Unit*
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
  %22 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 2
  %23 = load %Int64, %Int64* %22
  %24 = trunc %Int64 %23 to %Nat32
  %25 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %17, %Nat32 %24, %Bool 0)
  ret %Type* %25

;stmt17:
  br label %fail
fail:

;stmt18:
  %27 = inttoptr i64 0 to %Type*
  ret %Type* %27
}

define void @set_param_offset (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = bitcast %Unit* %1 to %Nat16*

;stmt2:
  %6 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 2
  %7 = load %Nat16, %Nat16* %5
  store %Nat16 %7, %Nat16* %6

;stmt3:
  %8 = load %Nat16, %Nat16* %5
  %9 = add %Nat16 %8, 1
  store %Nat16 %9, %Nat16* %5
  ret void
}

define %Type* @parse_type_func () {

;stmt0:
  %1 = load %Str, %Str* @_func210_str1
  %2 = call %List* (%Str) @parse_fields (%Str %1)

;stmt1:
  %3 = alloca %Nat16

;stmt2:
  store %Nat16 0, %Nat16* %3

;stmt3:
  %4 = getelementptr inbounds %Nat16, %Nat16* %3, i32 0
  %5 = bitcast %Nat16* %4 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %2, %ListForeachHandler @set_param_offset, %Unit* %5)

;stmt4:
  %6 = load %Str, %Str* @_func210_str2
  %7 = call %Bool (%Str) @need (%Str %6)

;stmt5:
  %8 = call %Type* () @parse_type ()

;stmt6:
  %9 = bitcast %List* %2 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp eq %Unit* %9, %10
  %12 = bitcast %Type* %8 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp eq %Unit* %12, %13
  %15 = or %Bool %11, %14
  br i1 %15, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %16 = inttoptr i64 0 to %Type*
  ret %Type* %16
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  %18 = load %Str, %Str* @_func210_str3
  %19 = call %Nat64 (%Str) @get (%Str %18)
  %20 = icmp eq %Nat64 %19, 1

;stmt10:
  %21 = call %Type* (%List*, %Type*, %Bool) @type_func_new (%List* %2, %Type* %8, %Bool %20)
  ret %Type* %21
}

define %Str @print_value_kind (%ValueKind) {

;stmt0:
  %2 = icmp eq %ValueKind %0, 1
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %3 = load %Str, %Str* @_func212_str1
  ret %Str %3
  br label %endif_0
else_0:

;stmt3:
  %5 = icmp eq %ValueKind %0, 8
  br i1 %5, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %6 = load %Str, %Str* @_func212_str2
  ret %Str %6
  br label %endif_1
else_1:

;stmt6:
  %8 = icmp eq %ValueKind %0, 9
  br i1 %8, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %9 = load %Str, %Str* @_func212_str3
  ret %Str %9
  br label %endif_2
else_2:

;stmt9:
  %11 = icmp eq %ValueKind %0, 10
  br i1 %11, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %12 = load %Str, %Str* @_func212_str4
  ret %Str %12
  br label %endif_3
else_3:

;stmt12:
  %14 = icmp eq %ValueKind %0, 11
  br i1 %14, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %15 = load %Str, %Str* @_func212_str5
  ret %Str %15
  br label %endif_4
else_4:

;stmt15:
  %17 = icmp eq %ValueKind %0, 26
  br i1 %17, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %18 = load %Str, %Str* @_func212_str6
  ret %Str %18
  br label %endif_5
else_5:

;stmt18:
  %20 = icmp eq %ValueKind %0, 27
  br i1 %20, label %then_6, label %else_6
then_6:

;stmt19:

;stmt20:
  %21 = load %Str, %Str* @_func212_str7
  ret %Str %21
  br label %endif_6
else_6:

;stmt21:
  %23 = icmp eq %ValueKind %0, 12
  br i1 %23, label %then_7, label %else_7
then_7:

;stmt22:

;stmt23:
  %24 = load %Str, %Str* @_func212_str8
  ret %Str %24
  br label %endif_7
else_7:

;stmt24:
  %26 = icmp eq %ValueKind %0, 13
  br i1 %26, label %then_8, label %else_8
then_8:

;stmt25:

;stmt26:
  %27 = load %Str, %Str* @_func212_str9
  ret %Str %27
  br label %endif_8
else_8:

;stmt27:
  %29 = icmp eq %ValueKind %0, 14
  br i1 %29, label %then_9, label %else_9
then_9:

;stmt28:

;stmt29:
  %30 = load %Str, %Str* @_func212_str10
  ret %Str %30
  br label %endif_9
else_9:

;stmt30:
  %32 = icmp eq %ValueKind %0, 15
  br i1 %32, label %then_10, label %else_10
then_10:

;stmt31:

;stmt32:
  %33 = load %Str, %Str* @_func212_str11
  ret %Str %33
  br label %endif_10
else_10:

;stmt33:
  %35 = icmp eq %ValueKind %0, 16
  br i1 %35, label %then_11, label %else_11
then_11:

;stmt34:

;stmt35:
  %36 = load %Str, %Str* @_func212_str12
  ret %Str %36
  br label %endif_11
else_11:

;stmt36:
  %38 = icmp eq %ValueKind %0, 17
  br i1 %38, label %then_12, label %else_12
then_12:

;stmt37:

;stmt38:
  %39 = load %Str, %Str* @_func212_str13
  ret %Str %39
  br label %endif_12
else_12:

;stmt39:
  %41 = icmp eq %ValueKind %0, 18
  br i1 %41, label %then_13, label %else_13
then_13:

;stmt40:

;stmt41:
  %42 = load %Str, %Str* @_func212_str14
  ret %Str %42
  br label %endif_13
else_13:

;stmt42:
  %44 = icmp eq %ValueKind %0, 19
  br i1 %44, label %then_14, label %else_14
then_14:

;stmt43:

;stmt44:
  %45 = load %Str, %Str* @_func212_str15
  ret %Str %45
  br label %endif_14
else_14:

;stmt45:
  %47 = icmp eq %ValueKind %0, 20
  br i1 %47, label %then_15, label %else_15
then_15:

;stmt46:

;stmt47:
  %48 = load %Str, %Str* @_func212_str16
  ret %Str %48
  br label %endif_15
else_15:

;stmt48:
  %50 = icmp eq %ValueKind %0, 21
  br i1 %50, label %then_16, label %else_16
then_16:

;stmt49:

;stmt50:
  %51 = load %Str, %Str* @_func212_str17
  ret %Str %51
  br label %endif_16
else_16:

;stmt51:
  %53 = icmp eq %ValueKind %0, 22
  br i1 %53, label %then_17, label %else_17
then_17:

;stmt52:

;stmt53:
  %54 = load %Str, %Str* @_func212_str18
  ret %Str %54
  br label %endif_17
else_17:

;stmt54:
  %56 = icmp eq %ValueKind %0, 23
  br i1 %56, label %then_18, label %else_18
then_18:

;stmt55:

;stmt56:
  %57 = load %Str, %Str* @_func212_str19
  ret %Str %57
  br label %endif_18
else_18:

;stmt57:
  %59 = icmp eq %ValueKind %0, 24
  br i1 %59, label %then_19, label %else_19
then_19:

;stmt58:

;stmt59:
  %60 = load %Str, %Str* @_func212_str20
  ret %Str %60
  br label %endif_19
else_19:

;stmt60:
  %62 = icmp eq %ValueKind %0, 25
  br i1 %62, label %then_20, label %else_20
then_20:

;stmt61:

;stmt62:
  %63 = load %Str, %Str* @_func212_str21
  ret %Str %63
  br label %endif_20
else_20:

;stmt63:
  %65 = icmp eq %ValueKind %0, 28
  br i1 %65, label %then_21, label %else_21
then_21:

;stmt64:

;stmt65:
  %66 = load %Str, %Str* @_func212_str22
  ret %Str %66
  br label %endif_21
else_21:

;stmt66:
  %68 = icmp eq %ValueKind %0, 29
  br i1 %68, label %then_22, label %else_22
then_22:

;stmt67:

;stmt68:
  %69 = load %Str, %Str* @_func212_str23
  ret %Str %69
  br label %endif_22
else_22:

;stmt69:
  %71 = icmp eq %ValueKind %0, 30
  br i1 %71, label %then_23, label %else_23
then_23:

;stmt70:

;stmt71:
  %72 = load %Str, %Str* @_func212_str24
  ret %Str %72
  br label %endif_23
else_23:

;stmt72:
  %74 = icmp eq %ValueKind %0, 31
  br i1 %74, label %then_24, label %else_24
then_24:

;stmt73:

;stmt74:
  %75 = load %Str, %Str* @_func212_str25
  ret %Str %75
  br label %endif_24
else_24:

;stmt75:
  %77 = icmp eq %ValueKind %0, 0
  br i1 %77, label %then_25, label %else_25
then_25:

;stmt76:

;stmt77:
  %78 = load %Str, %Str* @_func212_str26
  ret %Str %78
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
  %80 = load %Str, %Str* @_func212_str27
  ret %Str %80
}

define void @value_show (%Value*) {

;stmt0:
  %2 = load %Str, %Str* @_func213_str1
  %3 = call %Int32 (%Str, ...) @printf (%Str %2, %Value* %0)

;stmt1:
  %4 = load %Str, %Str* @_func213_str2
  %5 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %6 = load %ValueKind, %ValueKind* %5
  %7 = call %Str (%ValueKind) @print_value_kind (%ValueKind %6)
  %8 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %7)

;stmt2:
  %9 = load %Str, %Str* @_func213_str3
  %10 = call %Int32 (%Str, ...) @printf (%Str %9)

;stmt3:
  %11 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  call void (%Type*) @prttype (%Type* %12)

;stmt4:
  %13 = load %Str, %Str* @_func213_str4
  %14 = call %Int32 (%Str, ...) @printf (%Str %13)

;stmt5:
  %15 = load %Str, %Str* @_func213_str5
  %16 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %17 = load %Int64, %Int64* %16
  %18 = call %Int32 (%Str, ...) @printf (%Str %15, %Int64 %17)

;stmt6:
  %19 = load %Str, %Str* @_func213_str6
  %20 = call %Int32 (%Str, ...) @printf (%Str %19)
  ret void
}

define %Value* @castIfNumericTo (%Value*, %Type*) {

;stmt0:
  %3 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  %7 = icmp eq %TypeKind %6, 1
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %8 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %9 = load %Int64, %Int64* %8
  %10 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %11 = load %TokenInfo*, %TokenInfo** %10
  %12 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %1, %Int64 %9, %TokenInfo* %11)
  ret %Value* %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  ret %Value* %0
}

define %Value* @nat (%Value*, %Type*) {

;stmt0:
  %3 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %4 = load %Type*, %Type** %3

;stmt1:
  %5 = bitcast %Type* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  %8 = load %Str, %Str* @_func215_str1
  call void (%Bool, %Str) @assert (%Bool %7, %Str %8)

;stmt2:
  %9 = bitcast %Type* %1 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  %12 = load %Str, %Str* @_func215_str2
  call void (%Bool, %Str) @assert (%Bool %11, %Str %12)

;stmt3:
  %13 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %14 = load %TypeKind, %TypeKind* %13
  %15 = icmp eq %TypeKind %14, 1
  br i1 %15, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %16 = call %Bool (%Type*) @type_is_basic_integer (%Type* %1)
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %17 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %18 = load %Int64, %Int64* %17
  %19 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %20 = load %TokenInfo*, %TokenInfo** %19
  %21 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %1, %Int64 %18, %TokenInfo* %20)
  ret %Value* %21
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %23 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = call %Bool (%Type*, %Type*) @naturalConversionIsPossible (%Type* %24, %Type* %1)
  br i1 %25, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %26 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %27 = load %TokenInfo*, %TokenInfo** %26
  %28 = call %Value* (%Value*, %Type*, %TokenInfo*) @cast (%Value* %0, %Type* %1, %TokenInfo* %27)

;stmt11:
  %29 = call %Type* (%Value*) @checkValue (%Value* %28)

;stmt12:
  ret %Value* %28
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt13:
  ret %Value* %0
}

define %Bool @naturalConversionIsPossible (%Type*, %Type*) {

;stmt0:
  %3 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3

;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5

;stmt2:
  %7 = icmp eq %TypeKind %4, 7
  %8 = icmp eq %TypeKind %6, 7
  %9 = and %Bool %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %10 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8
  %11 = getelementptr inbounds %TypeArray, %TypeArray* %10, i32 0, i32 2
  %12 = load %Bool, %Bool* %11
  %13 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 8
  %14 = getelementptr inbounds %TypeArray, %TypeArray* %13, i32 0, i32 2
  %15 = load %Bool, %Bool* %14
  %16 = xor %Bool %15, 1
  %17 = and %Bool %12, %16
  br i1 %17, label %then_1, label %else_1
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
  %19 = icmp eq %TypeKind %4, 6
  %20 = icmp eq %TypeKind %6, 6
  %21 = and %Bool %19, %20
  br i1 %21, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %22 = load %Type*, %Type** @typeFreePtr
  %23 = call %Bool (%Type*, %Type*) @type_eq (%Type* %0, %Type* %22)
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  ret %Bool 1
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt12:
  %25 = load %Type*, %Type** @typeFreePtr
  %26 = call %Bool (%Type*, %Type*) @type_eq (%Type* %1, %Type* %25)
  br i1 %26, label %then_4, label %else_4
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
  %28 = icmp eq %TypeKind %4, 7
  %29 = icmp eq %TypeKind %6, 6
  %30 = and %Bool %28, %29
  br i1 %30, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %31 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8
  %32 = getelementptr inbounds %TypeArray, %TypeArray* %31, i32 0, i32 2
  %33 = load %Bool, %Bool* %32
  %34 = load %Type*, %Type** @typeFreePtr
  %35 = call %Bool (%Type*, %Type*) @type_eq (%Type* %0, %Type* %34)
  %36 = and %Bool %33, %35
  br i1 %36, label %then_6, label %else_6
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
  %38 = icmp eq %TypeKind %6, 7
  %39 = icmp eq %TypeKind %4, 6
  %40 = and %Bool %38, %39
  br i1 %40, label %then_7, label %else_7
then_7:

;stmt21:

;stmt22:
  %41 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 8
  %42 = getelementptr inbounds %TypeArray, %TypeArray* %41, i32 0, i32 2
  %43 = load %Bool, %Bool* %42
  %44 = load %Type*, %Type** @typeFreePtr
  %45 = call %Bool (%Type*, %Type*) @type_eq (%Type* %1, %Type* %44)
  %46 = and %Bool %43, %45
  br i1 %46, label %then_8, label %else_8
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

define %Value* @un (%ValueKind, %Value*, %TokenInfo*) {

;stmt0:
  %4 = bitcast %Value* %1 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = inttoptr i64 0 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = icmp eq %ValueKind %0, 8
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %10 = call %Value* (%Value*, %TokenInfo*) @un_ref (%Value* %1, %TokenInfo* %2)
  ret %Value* %10
  br label %endif_1
else_1:

;stmt6:
  %12 = icmp eq %ValueKind %0, 9
  br i1 %12, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %13 = call %Value* (%Value*, %TokenInfo*) @un_deref (%Value* %1, %TokenInfo* %2)
  ret %Value* %13
  br label %endif_2
else_2:

;stmt9:
  %15 = icmp eq %ValueKind %0, 11
  br i1 %15, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %16 = call %Value* (%Value*, %TokenInfo*) @un_minus (%Value* %1, %TokenInfo* %2)
  ret %Value* %16
  br label %endif_3
else_3:

;stmt12:
  %18 = icmp eq %ValueKind %0, 10
  br i1 %18, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %19 = call %Value* (%Value*, %TokenInfo*) @un_not (%Value* %1, %TokenInfo* %2)
  ret %Value* %19
  br label %endif_4
else_4:

;stmt15:

;stmt16:
  %21 = load %Str, %Str* @_func217_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %21)
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:

;stmt17:
  %22 = inttoptr i64 0 to %Value*
  ret %Value* %22
}

define %Value* @un_minus (%Value*, %TokenInfo*) {

;stmt0:
  %3 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %4 = load %ValueKind, %ValueKind* %3
  %5 = icmp eq %ValueKind %4, 2
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %9 = load %Int64, %Int64* %8
  %10 = sub nsw %Int64 0, %9
  %11 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %7, %Int64 %10, %TokenInfo* %1)
  ret %Value* %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %13 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 11, %TokenInfo* %1)

;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 7
  %15 = getelementptr inbounds %ValueUn, %ValueUn* %14, i32 0, i32 0
  store %Value* %0, %Value** %15

;stmt5:
  ret %Value* %13
}

define %Value* @un_not (%Value*, %TokenInfo*) {

;stmt0:
  %3 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %4 = load %ValueKind, %ValueKind* %3
  %5 = icmp eq %ValueKind %4, 2
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %9 = load %Int64, %Int64* %8
  %10 = xor %Int64 %9, -1
  %11 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %7, %Int64 %10, %TokenInfo* %1)
  ret %Value* %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %13 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 10, %TokenInfo* %1)

;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 7
  %15 = getelementptr inbounds %ValueUn, %ValueUn* %14, i32 0, i32 0
  store %Value* %0, %Value** %15

;stmt5:
  ret %Value* %13
}

define %Value* @un_ref (%Value*, %TokenInfo*) {

;stmt0:
  %3 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 8, %TokenInfo* %1)

;stmt1:
  %4 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 7
  %5 = getelementptr inbounds %ValueUn, %ValueUn* %4, i32 0, i32 0
  store %Value* %0, %Value** %5

;stmt2:
  ret %Value* %3
}

define %Value* @un_deref (%Value*, %TokenInfo*) {

;stmt0:
  %3 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 9, %TokenInfo* %1)

;stmt1:
  %4 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 7
  %5 = getelementptr inbounds %ValueUn, %ValueUn* %4, i32 0, i32 0
  store %Value* %0, %Value** %5

;stmt2:
  ret %Value* %3
}

define %Type* @checkValueUnary (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 7
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt2:
  %6 = alloca %Type*

;stmt3:
  %7 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %8 = load %ValueKind, %ValueKind* %7

;stmt4:
  %9 = icmp eq %ValueKind %8, 8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %10 = call %Bool (%Value*) @valueIsReadonly (%Value* %0)
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %11 = load %Str, %Str* @_func222_str1
  %12 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %13 = load %TokenInfo*, %TokenInfo** %12
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %13)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %14 = call %Type* (%Type*) @type_pointer_new (%Type* %5)
  store %Type* %14, %Type** %6
  br label %endif_0
else_0:

;stmt10:
  %15 = icmp eq %ValueKind %8, 9
  br i1 %15, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %16 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 0
  %17 = load %TypeKind, %TypeKind* %16
  %18 = icmp ne %TypeKind %17, 6
  br i1 %18, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %19 = load %Str, %Str* @_func222_str2
  %20 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %21 = load %TokenInfo*, %TokenInfo** %20
  call void (%Str, %TokenInfo*) @error (%Str %19, %TokenInfo* %21)

;stmt15:
  %22 = inttoptr i64 0 to %Type*
  ret %Type* %22
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt16:
  %24 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 7
  %25 = getelementptr inbounds %TypePointer, %TypePointer* %24, i32 0, i32 0
  %26 = load %Type*, %Type** %25
  store %Type* %26, %Type** %6
  br label %endif_2
else_2:

;stmt17:
  %27 = icmp eq %ValueKind %8, 11
  br i1 %27, label %then_4, label %else_4
then_4:

;stmt18:

;stmt19:
  store %Type* %5, %Type** %6
  br label %endif_4
else_4:

;stmt20:
  %28 = icmp eq %ValueKind %8, 10
  br i1 %28, label %then_5, label %else_5
then_5:

;stmt21:

;stmt22:
  store %Type* %5, %Type** %6
  br label %endif_5
else_5:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_2
endif_2:
  br label %endif_0
endif_0:

;stmt23:
  %29 = load %Type*, %Type** %6
  ret %Type* %29
}

define %Bool @binTypeValid (%ValueKind, %Type*) {

;stmt0:
  %3 = icmp eq %ValueKind %0, 20
  %4 = icmp eq %ValueKind %0, 21
  %5 = or %Bool %3, %4
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
  %7 = call %Bool (%Type*) @type_is_basic_integer (%Type* %1)
  %8 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %9 = load %TypeKind, %TypeKind* %8
  %10 = icmp eq %TypeKind %9, 1
  %11 = or %Bool %7, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %13 = load %Type*, %Type** @typeBool
  %14 = call %Bool (%Type*, %Type*) @type_eq (%Type* %1, %Type* %13)
  br i1 %14, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %15 = icmp eq %ValueKind %0, 19
  %16 = icmp eq %ValueKind %0, 17
  %17 = icmp eq %ValueKind %0, 18
  %18 = or %Bool %16, %17
  %19 = or %Bool %15, %18
  ret %Bool %19
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt9:
  ret %Bool 0
}

define %Value* @bin (%ValueKind, %Value*, %Value*, %TokenInfo*) {

;stmt0:
  %5 = bitcast %Value* %1 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp eq %Unit* %5, %6
  %8 = bitcast %Value* %2 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  %11 = or %Bool %7, %10
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %13 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind %0, %TokenInfo* %3)

;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 8
  %15 = getelementptr inbounds %ValueBin, %ValueBin* %14, i32 0, i32 0
  store %Value* %1, %Value** %15

;stmt5:
  %16 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 8
  %17 = getelementptr inbounds %ValueBin, %ValueBin* %16, i32 0, i32 1
  store %Value* %2, %Value** %17

;stmt6:
  ret %Value* %13

;stmt7:
  br label %fail
fail:

;stmt8:
  %19 = inttoptr i64 0 to %Value*
  ret %Value* %19
}

define %Type* @checkValueBinary (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %3 = getelementptr inbounds %ValueBin, %ValueBin* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %6 = getelementptr inbounds %ValueBin, %ValueBin* %5, i32 0, i32 1
  %7 = load %Value*, %Value** %6

;stmt2:
  %8 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt3:
  %9 = call %Type* (%Value*) @checkValue (%Value* %7)

;stmt4:
  %10 = bitcast %Type* %8 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp eq %Unit* %10, %11
  %13 = bitcast %Type* %9 to %Unit*
  %14 = inttoptr i64 0 to %Unit*
  %15 = icmp eq %Unit* %13, %14
  %16 = or %Bool %12, %15
  br i1 %16, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %18 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = call %Value* (%Value*, %Type*) @nat (%Value* %4, %Type* %19)

;stmt8:
  %21 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = call %Value* (%Value*, %Type*) @nat (%Value* %7, %Type* %22)

;stmt9:
  %24 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 1
  %25 = load %Type*, %Type** %24

;stmt10:
  %26 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 1
  %27 = load %Type*, %Type** %26

;stmt11:
  %28 = call %Bool (%Type*, %Type*) @type_eq (%Type* %25, %Type* %27)
  %29 = xor %Bool %28, 1
  br i1 %29, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %30 = load %Str, %Str* @E_TYPE_ERROR
  %31 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %32 = load %TokenInfo*, %TokenInfo** %31
  call void (%Str, %TokenInfo*) @error (%Str %30, %TokenInfo* %32)

;stmt14:
  %33 = load %Str, %Str* @_func225_str1
  %34 = call %Int32 (%Str, ...) @printf (%Str %33)

;stmt15:
  call void (%Type*) @prttype (%Type* %25)

;stmt16:
  %35 = load %Str, %Str* @_func225_str2
  %36 = call %Int32 (%Str, ...) @printf (%Str %35)

;stmt17:
  %37 = load %Str, %Str* @_func225_str3
  %38 = call %Int32 (%Str, ...) @printf (%Str %37)

;stmt18:
  call void (%Type*) @prttype (%Type* %27)

;stmt19:
  %39 = load %Str, %Str* @_func225_str4
  %40 = call %Int32 (%Str, ...) @printf (%Str %39)

;stmt20:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt21:
  %42 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %43 = load %ValueKind, %ValueKind* %42

;stmt22:
  %44 = call %Bool (%ValueKind, %Type*) @binTypeValid (%ValueKind %43, %Type* %25)
  %45 = xor %Bool %44, 1
  br i1 %45, label %then_2, label %else_2
then_2:

;stmt23:

;stmt24:
  %46 = load %Str, %Str* @_func225_str5
  %47 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %48 = load %TokenInfo*, %TokenInfo** %47
  call void (%Str, %TokenInfo*) @error (%Str %46, %TokenInfo* %48)

;stmt25:
  %49 = inttoptr i64 0 to %Type*
  ret %Type* %49
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt26:
  %51 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %52 = getelementptr inbounds %ValueBin, %ValueBin* %51, i32 0, i32 0
  store %Value* %20, %Value** %52

;stmt27:
  %53 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %54 = getelementptr inbounds %ValueBin, %ValueBin* %53, i32 0, i32 1
  store %Value* %23, %Value** %54

;stmt28:
  %55 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 0
  %56 = load %ValueKind, %ValueKind* %55
  %57 = icmp eq %ValueKind %56, 2
  %58 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 0
  %59 = load %ValueKind, %ValueKind* %58
  %60 = icmp eq %ValueKind %59, 2
  %61 = and %Bool %57, %60
  br i1 %61, label %then_3, label %else_3
then_3:

;stmt29:

;stmt30:
  call void (%Value*) @binFold (%Value* %0)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt31:
  %62 = call %Bool (%ValueKind) @isReletionOpKind (%ValueKind %43)
  br i1 %62, label %then_4, label %else_4
then_4:

;stmt32:

;stmt33:
  %63 = load %Type*, %Type** @typeBool
  ret %Type* %63
  br label %endif_4
else_4:

;stmt34:

;stmt35:
  %65 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 1
  %66 = load %Type*, %Type** %65
  ret %Type* %66
  br label %endif_4
endif_4:

;stmt36:
  br label %fail
fail:

;stmt37:
  %68 = inttoptr i64 0 to %Type*
  ret %Type* %68
}

define void @binFold (%Value*) {

;stmt0:
  %2 = alloca %Int64

;stmt1:
  %3 = alloca %Type*

;stmt2:
  %4 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %5 = getelementptr inbounds %ValueBin, %ValueBin* %4, i32 0, i32 0
  %6 = load %Value*, %Value** %5
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 2
  %8 = load %Int64, %Int64* %7

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %10 = getelementptr inbounds %ValueBin, %ValueBin* %9, i32 0, i32 1
  %11 = load %Value*, %Value** %10
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 2
  %13 = load %Int64, %Int64* %12

;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %15 = load %ValueKind, %ValueKind* %14

;stmt5:
  %16 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %17 = getelementptr inbounds %ValueBin, %ValueBin* %16, i32 0, i32 0
  %18 = load %Value*, %Value** %17
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 1
  %20 = load %Type*, %Type** %19
  store %Type* %20, %Type** %3

;stmt6:
  %21 = icmp eq %ValueKind %15, 12
  br i1 %21, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %22 = add %Int64 %8, %13
  store %Int64 %22, %Int64* %2
  br label %endif_0
else_0:

;stmt9:
  %23 = icmp eq %ValueKind %15, 13
  br i1 %23, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %24 = sub %Int64 %8, %13
  store %Int64 %24, %Int64* %2
  br label %endif_1
else_1:

;stmt12:
  %25 = icmp eq %ValueKind %15, 14
  br i1 %25, label %then_2, label %else_2
then_2:

;stmt13:

;stmt14:
  %26 = mul %Int64 %8, %13
  store %Int64 %26, %Int64* %2
  br label %endif_2
else_2:

;stmt15:
  %27 = icmp eq %ValueKind %15, 15
  br i1 %27, label %then_3, label %else_3
then_3:

;stmt16:

;stmt17:
  %28 = sdiv %Int64 %8, %13
  store %Int64 %28, %Int64* %2
  br label %endif_3
else_3:

;stmt18:
  %29 = icmp eq %ValueKind %15, 16
  br i1 %29, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %30 = srem %Int64 %8, %13
  store %Int64 %30, %Int64* %2
  br label %endif_4
else_4:

;stmt21:
  %31 = icmp eq %ValueKind %15, 17
  br i1 %31, label %then_5, label %else_5
then_5:

;stmt22:

;stmt23:
  %32 = or %Int64 %8, %13
  store %Int64 %32, %Int64* %2
  br label %endif_5
else_5:

;stmt24:
  %33 = icmp eq %ValueKind %15, 18
  br i1 %33, label %then_6, label %else_6
then_6:

;stmt25:

;stmt26:
  %34 = xor %Int64 %8, %13
  store %Int64 %34, %Int64* %2
  br label %endif_6
else_6:

;stmt27:
  %35 = icmp eq %ValueKind %15, 19
  br i1 %35, label %then_7, label %else_7
then_7:

;stmt28:

;stmt29:
  %36 = and %Int64 %8, %13
  store %Int64 %36, %Int64* %2
  br label %endif_7
else_7:

;stmt30:

;stmt31:
  %37 = load %Type*, %Type** @typeBool
  store %Type* %37, %Type** %3

;stmt32:
  %38 = icmp eq %ValueKind %15, 20
  br i1 %38, label %then_8, label %else_8
then_8:

;stmt33:

;stmt34:
  %39 = icmp eq %Int64 %8, %13
  %40 = sext %Bool %39 to %Int64
  store %Int64 %40, %Int64* %2
  br label %endif_8
else_8:

;stmt35:
  %41 = icmp eq %ValueKind %15, 21
  br i1 %41, label %then_9, label %else_9
then_9:

;stmt36:

;stmt37:
  %42 = icmp ne %Int64 %8, %13
  %43 = sext %Bool %42 to %Int64
  store %Int64 %43, %Int64* %2
  br label %endif_9
else_9:

;stmt38:
  %44 = icmp eq %ValueKind %15, 22
  br i1 %44, label %then_10, label %else_10
then_10:

;stmt39:

;stmt40:
  %45 = icmp slt %Int64 %8, %13
  %46 = sext %Bool %45 to %Int64
  store %Int64 %46, %Int64* %2
  br label %endif_10
else_10:

;stmt41:
  %47 = icmp eq %ValueKind %15, 23
  br i1 %47, label %then_11, label %else_11
then_11:

;stmt42:

;stmt43:
  %48 = icmp sgt %Int64 %8, %13
  %49 = sext %Bool %48 to %Int64
  store %Int64 %49, %Int64* %2
  br label %endif_11
else_11:

;stmt44:
  %50 = icmp eq %ValueKind %15, 24
  br i1 %50, label %then_12, label %else_12
then_12:

;stmt45:

;stmt46:
  %51 = icmp sle %Int64 %8, %13
  %52 = sext %Bool %51 to %Int64
  store %Int64 %52, %Int64* %2
  br label %endif_12
else_12:

;stmt47:
  %53 = icmp eq %ValueKind %15, 25
  br i1 %53, label %then_13, label %else_13
then_13:

;stmt48:

;stmt49:
  %54 = icmp sge %Int64 %8, %13
  %55 = sext %Bool %54 to %Int64
  store %Int64 %55, %Int64* %2
  br label %endif_13
else_13:

;stmt50:

;stmt51:
  %56 = load %Str, %Str* @_func226_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %56)
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

;stmt52:
  %57 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  store %ValueKind 2, %ValueKind* %57

;stmt53:
  %58 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %59 = load %Int64, %Int64* %2
  store %Int64 %59, %Int64* %58
  ret void
}

define %Value* @shift (%ValueKind, %Value*, %Value*, %TokenInfo*) {

;stmt0:
  %5 = bitcast %Value* %1 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp eq %Unit* %5, %6
  %8 = bitcast %Value* %2 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  %11 = or %Bool %7, %10
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %13 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind %0, %TokenInfo* %3)

;stmt4:
  %14 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 8
  %15 = getelementptr inbounds %ValueBin, %ValueBin* %14, i32 0, i32 0
  store %Value* %1, %Value** %15

;stmt5:
  %16 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 8
  %17 = getelementptr inbounds %ValueBin, %ValueBin* %16, i32 0, i32 1
  store %Value* %2, %Value** %17

;stmt6:
  ret %Value* %13

;stmt7:
  br label %fail
fail:

;stmt8:
  %19 = inttoptr i64 0 to %Value*
  ret %Value* %19
}

define %Type* @checkValueShift (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %3 = getelementptr inbounds %ValueBin, %ValueBin* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %6 = getelementptr inbounds %ValueBin, %ValueBin* %5, i32 0, i32 1
  %7 = load %Value*, %Value** %6

;stmt2:
  %8 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt3:
  %9 = call %Type* (%Value*) @checkValue (%Value* %7)

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 0
  %11 = load %ValueKind, %ValueKind* %10
  %12 = icmp eq %ValueKind %11, 2
  %13 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 0
  %14 = load %ValueKind, %ValueKind* %13
  %15 = icmp eq %ValueKind %14, 2
  %16 = and %Bool %12, %15
  br i1 %16, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %17 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %18 = load %ValueKind, %ValueKind* %17

;stmt7:
  %19 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  store %ValueKind 2, %ValueKind* %19

;stmt8:
  %20 = icmp eq %ValueKind %18, 26
  br i1 %20, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %21 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %22 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 2
  %23 = load %Int64, %Int64* %22
  %24 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 2
  %25 = load %Int64, %Int64* %24
  %26 = shl %Int64 %23, %25
  store %Int64 %26, %Int64* %21
  br label %endif_1
else_1:

;stmt11:
  %27 = icmp eq %ValueKind %18, 27
  br i1 %27, label %then_2, label %else_2
then_2:

;stmt12:

;stmt13:
  %28 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %29 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 2
  %30 = load %Int64, %Int64* %29
  %31 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 2
  %32 = load %Int64, %Int64* %31
  %33 = ashr %Int64 %30, %32
  store %Int64 %33, %Int64* %28
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:

;stmt14:
  %34 = load %Type*, %Type** @typeNumeric
  ret %Type* %34
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt15:
  %36 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %37 = getelementptr inbounds %ValueBin, %ValueBin* %36, i32 0, i32 0
  %38 = load %Type*, %Type** @typeBaseInt
  %39 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %4, %Type* %38)
  store %Value* %39, %Value** %37

;stmt16:
  %40 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %41 = getelementptr inbounds %ValueBin, %ValueBin* %40, i32 0, i32 1
  %42 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %43 = getelementptr inbounds %ValueBin, %ValueBin* %42, i32 0, i32 1
  %44 = load %Value*, %Value** %43
  %45 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %46 = getelementptr inbounds %ValueBin, %ValueBin* %45, i32 0, i32 0
  %47 = load %Value*, %Value** %46
  %48 = getelementptr inbounds %Value, %Value* %47, i32 0, i32 1
  %49 = load %Type*, %Type** %48
  %50 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 16
  %51 = load %TokenInfo*, %TokenInfo** %50
  %52 = call %Value* (%Value*, %Type*, %TokenInfo*) @cast (%Value* %44, %Type* %49, %TokenInfo* %51)
  store %Value* %52, %Value** %41

;stmt17:
  %53 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %54 = getelementptr inbounds %ValueBin, %ValueBin* %53, i32 0, i32 1
  %55 = load %Value*, %Value** %54
  %56 = call %Type* (%Value*) @checkValue (%Value* %55)

;stmt18:
  %57 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %58 = load %Type*, %Type** %57
  ret %Type* %58
}

define %Value* @indx (%Value*, %Value*, %TokenInfo*) {

;stmt0:
  %4 = bitcast %Value* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = bitcast %Value* %1 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  %10 = or %Bool %6, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %12 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 29, %TokenInfo* %2)

;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 9
  %14 = getelementptr inbounds %ValueIndex, %ValueIndex* %13, i32 0, i32 0
  store %Value* %0, %Value** %14

;stmt5:
  %15 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 9
  %16 = getelementptr inbounds %ValueIndex, %ValueIndex* %15, i32 0, i32 1
  store %Value* %1, %Value** %16

;stmt6:
  ret %Value* %12

;stmt7:
  br label %fail
fail:

;stmt8:
  %18 = inttoptr i64 0 to %Value*
  ret %Value* %18
}

define %Type* @checkValueIndex (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %3 = getelementptr inbounds %ValueIndex, %ValueIndex* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %6 = getelementptr inbounds %ValueIndex, %ValueIndex* %5, i32 0, i32 1
  %7 = load %Value*, %Value** %6

;stmt2:
  %8 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt3:
  %9 = call %Type* (%Value*) @checkValue (%Value* %7)

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %11 = getelementptr inbounds %ValueIndex, %ValueIndex* %10, i32 0, i32 0
  %12 = load %Type*, %Type** @typeBaseInt
  %13 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %4, %Type* %12)
  store %Value* %13, %Value** %11

;stmt5:
  %14 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %15 = getelementptr inbounds %ValueIndex, %ValueIndex* %14, i32 0, i32 1
  %16 = load %Type*, %Type** @typeBaseInt
  %17 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %7, %Type* %16)
  store %Value* %17, %Value** %15

;stmt6:
  %18 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %19 = getelementptr inbounds %ValueIndex, %ValueIndex* %18, i32 0, i32 0
  %20 = load %Value*, %Value** %19
  %21 = call %Type* (%Value*) @checkValue (%Value* %20)

;stmt7:
  %22 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %23 = getelementptr inbounds %ValueIndex, %ValueIndex* %22, i32 0, i32 1
  %24 = load %Value*, %Value** %23
  %25 = call %Type* (%Value*) @checkValue (%Value* %24)

;stmt8:
  %26 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %27 = getelementptr inbounds %ValueIndex, %ValueIndex* %26, i32 0, i32 0
  %28 = load %Value*, %Value** %27
  %29 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 1
  %30 = load %Type*, %Type** %29
  %31 = getelementptr inbounds %Type, %Type* %30, i32 0, i32 8
  %32 = getelementptr inbounds %TypeArray, %TypeArray* %31, i32 0, i32 0
  %33 = load %Type*, %Type** %32
  ret %Type* %33
}

define %Value* @access (%Value*, %Str, %TokenInfo*) {

;stmt0:
  %4 = bitcast %Value* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = bitcast %Str %1 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  %10 = or %Bool %6, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %12 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 30, %TokenInfo* %2)

;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 10
  %14 = getelementptr inbounds %ValueAccess, %ValueAccess* %13, i32 0, i32 0
  store %Value* %0, %Value** %14

;stmt5:
  %15 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 10
  %16 = getelementptr inbounds %ValueAccess, %ValueAccess* %15, i32 0, i32 1
  store %Str %1, %Str* %16

;stmt6:
  ret %Value* %12

;stmt7:
  br label %fail
fail:

;stmt8:
  %18 = inttoptr i64 0 to %Value*
  ret %Value* %18
}

define %Type* @checkValueAccess (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 10
  %3 = getelementptr inbounds %ValueAccess, %ValueAccess* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt2:
  %6 = alloca %Type*

;stmt3:
  %7 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 6
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %10 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 7
  %11 = getelementptr inbounds %TypePointer, %TypePointer* %10, i32 0, i32 0
  %12 = load %Type*, %Type** %11
  store %Type* %12, %Type** %6
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  store %Type* %5, %Type** %6
  br label %endif_0
endif_0:

;stmt8:
  %13 = load %Type*, %Type** %6
  %14 = getelementptr inbounds %Type, %Type* %13, i32 0, i32 0
  %15 = load %TypeKind, %TypeKind* %14
  %16 = icmp ne %TypeKind %15, 5
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %17 = load %Str, %Str* @_func232_str1
  %18 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %19 = load %TokenInfo*, %TokenInfo** %18
  call void (%Str, %TokenInfo*) @error (%Str %17, %TokenInfo* %19)

;stmt11:
  %20 = inttoptr i64 0 to %Type*
  ret %Type* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %22 = load %Type*, %Type** %6
  %23 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 10
  %24 = getelementptr inbounds %ValueAccess, %ValueAccess* %23, i32 0, i32 1
  %25 = load %Str, %Str* %24
  %26 = call %Field* (%Type*, %Str) @type_record_get_field (%Type* %22, %Str %25)

;stmt13:
  %27 = bitcast %Field* %26 to %Unit*
  %28 = inttoptr i64 0 to %Unit*
  %29 = icmp eq %Unit* %27, %28
  br i1 %29, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %30 = load %Str, %Str* @_func232_str2
  %31 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %32 = load %TokenInfo*, %TokenInfo** %31
  call void (%Str, %TokenInfo*) @error (%Str %30, %TokenInfo* %32)

;stmt16:
  %33 = inttoptr i64 0 to %Type*
  ret %Type* %33
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt17:
  %35 = getelementptr inbounds %Field, %Field* %26, i32 0, i32 1
  %36 = load %Type*, %Type** %35
  ret %Type* %36
}

define %Value* @call (%Value*, %List*, %TokenInfo*) {

;stmt0:
  %4 = bitcast %Value* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = bitcast %List* %1 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  %10 = or %Bool %6, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %12 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 28, %TokenInfo* %2)

;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 12
  %14 = getelementptr inbounds %ValueCall, %ValueCall* %13, i32 0, i32 0
  store %Value* %0, %Value** %14

;stmt5:
  %15 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 12
  %16 = getelementptr inbounds %ValueCall, %ValueCall* %15, i32 0, i32 1
  store %List* %1, %List** %16

;stmt6:
  ret %Value* %12

;stmt7:
  br label %fail
fail:

;stmt8:
  %18 = inttoptr i64 0 to %Value*
  ret %Value* %18
}

define %Type* @checkValueCall (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 12
  %3 = getelementptr inbounds %ValueCall, %ValueCall* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt2:
  %6 = bitcast %Type* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %9 = load %Str, %Str* @_func234_str1
  %10 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 16
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)

;stmt5:
  %12 = inttoptr i64 0 to %Type*
  ret %Type* %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %14 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 0
  %15 = load %TypeKind, %TypeKind* %14
  %16 = icmp ne %TypeKind %15, 3
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %17 = load %Str, %Str* @_func234_str2
  %18 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %19 = load %TokenInfo*, %TokenInfo** %18
  call void (%Str, %TokenInfo*) @error (%Str %17, %TokenInfo* %19)

;stmt9:
  %20 = inttoptr i64 0 to %Type*
  ret %Type* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %22 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 12
  %23 = getelementptr inbounds %ValueCall, %ValueCall* %22, i32 0, i32 1
  %24 = load %List*, %List** %23
  %25 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %26 = load %TokenInfo*, %TokenInfo** %25
  %27 = call %Bool (%Value*, %List*, %TokenInfo*) @checkParams (%Value* %4, %List* %24, %TokenInfo* %26)

;stmt11:
  %28 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 6
  %29 = getelementptr inbounds %TypeFunc, %TypeFunc* %28, i32 0, i32 1
  %30 = load %Type*, %Type** %29

;stmt12:
  ret %Type* %30
}

define %Bool @checkParams (%Value*, %List*, %TokenInfo*) {

;stmt0:
  %4 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %5 = load %Type*, %Type** %4
  %6 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 6
  %7 = getelementptr inbounds %TypeFunc, %TypeFunc* %6, i32 0, i32 0
  %8 = load %List*, %List** %7

;stmt1:
  %9 = getelementptr inbounds %List, %List* %1, i32 0, i32 2
  %10 = load %Nat64, %Nat64* %9
  %11 = getelementptr inbounds %List, %List* %8, i32 0, i32 2
  %12 = load %Nat64, %Nat64* %11
  %13 = icmp ult %Nat64 %10, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %14 = load %Str, %Str* @_func235_str1
  call void (%Str, %TokenInfo*) @error (%Str %14, %TokenInfo* %2)

;stmt4:
  ret %Bool 0
  br label %endif_0
else_0:

;stmt5:
  %16 = getelementptr inbounds %List, %List* %8, i32 0, i32 2
  %17 = load %Nat64, %Nat64* %16
  %18 = getelementptr inbounds %List, %List* %1, i32 0, i32 2
  %19 = load %Nat64, %Nat64* %18
  %20 = icmp ult %Nat64 %17, %19
  br i1 %20, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %21 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = getelementptr inbounds %Type, %Type* %22, i32 0, i32 6
  %24 = getelementptr inbounds %TypeFunc, %TypeFunc* %23, i32 0, i32 2
  %25 = load %Bool, %Bool* %24
  %26 = xor %Bool %25, 1
  br i1 %26, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %27 = load %Str, %Str* @_func235_str2
  call void (%Str, %TokenInfo*) @error (%Str %27, %TokenInfo* %2)
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
  %28 = alloca %Node*

;stmt11:
  %29 = alloca %Node*

;stmt12:
  %30 = getelementptr inbounds %List, %List* %8, i32 0, i32 0
  %31 = load %Node*, %Node** %30
  store %Node* %31, %Node** %28

;stmt13:
  %32 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %33 = load %Node*, %Node** %32
  store %Node* %33, %Node** %29

;stmt14:
  br label %continue_0
continue_0:
  %34 = load %Node*, %Node** %28
  %35 = bitcast %Node* %34 to %Unit*
  %36 = inttoptr i64 0 to %Unit*
  %37 = icmp ne %Unit* %35, %36
  br i1 %37, label %body_0, label %break_0
body_0:

;stmt15:

;stmt16:
  %38 = load %Node*, %Node** %28
  %39 = getelementptr inbounds %Node, %Node* %38, i32 0, i32 3
  %40 = load %Unit*, %Unit** %39
  %41 = bitcast %Unit* %40 to %Field*

;stmt17:
  %42 = load %Node*, %Node** %29
  %43 = getelementptr inbounds %Node, %Node* %42, i32 0, i32 3
  %44 = load %Unit*, %Unit** %43
  %45 = bitcast %Unit* %44 to %Value*

;stmt18:
  %46 = call %Type* (%Value*) @checkValue (%Value* %45)

;stmt19:
  %47 = getelementptr inbounds %Field, %Field* %41, i32 0, i32 1
  %48 = load %Type*, %Type** %47
  %49 = call %Value* (%Value*, %Type*) @nat (%Value* %45, %Type* %48)

;stmt20:
  %50 = getelementptr inbounds %Field, %Field* %41, i32 0, i32 1
  %51 = load %Type*, %Type** %50
  %52 = getelementptr inbounds %Value, %Value* %49, i32 0, i32 1
  %53 = load %Type*, %Type** %52
  %54 = call %Bool (%Type*, %Type*) @type_eq (%Type* %51, %Type* %53)
  %55 = xor %Bool %54, 1
  br i1 %55, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  %56 = load %Str, %Str* @_func235_str3
  call void (%Str, %TokenInfo*) @error (%Str %56, %TokenInfo* %2)

;stmt23:
  %57 = load %Str, %Str* @_func235_str4
  %58 = call %Int32 (%Str, ...) @printf (%Str %57)

;stmt24:
  %59 = getelementptr inbounds %Value, %Value* %49, i32 0, i32 1
  %60 = load %Type*, %Type** %59
  call void (%Type*) @prttype (%Type* %60)

;stmt25:
  %61 = load %Str, %Str* @_func235_str5
  %62 = call %Int32 (%Str, ...) @printf (%Str %61)

;stmt26:
  %63 = load %Str, %Str* @_func235_str6
  %64 = call %Int32 (%Str, ...) @printf (%Str %63)

;stmt27:
  %65 = getelementptr inbounds %Field, %Field* %41, i32 0, i32 1
  %66 = load %Type*, %Type** %65
  call void (%Type*) @prttype (%Type* %66)

;stmt28:
  %67 = load %Str, %Str* @_func235_str7
  %68 = call %Int32 (%Str, ...) @printf (%Str %67)

;stmt29:
  br label %nextarg
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt30:
  %70 = bitcast %Value* %45 to %Unit*
  %71 = bitcast %Value* %49 to %Unit*
  %72 = call %Bool (%List*, %Unit*, %Unit*) @list_subst (%List* %1, %Unit* %70, %Unit* %71)

;stmt31:
  br label %nextarg
nextarg:

;stmt32:
  %73 = load %Node*, %Node** %29
  %74 = getelementptr inbounds %Node, %Node* %73, i32 0, i32 1
  %75 = load %Node*, %Node** %74
  store %Node* %75, %Node** %29

;stmt33:
  %76 = load %Node*, %Node** %28
  %77 = getelementptr inbounds %Node, %Node* %76, i32 0, i32 1
  %78 = load %Node*, %Node** %77
  store %Node* %78, %Node** %28
  br label %continue_0
break_0:

;stmt34:
  br label %continue_1
continue_1:
  %79 = load %Node*, %Node** %29
  %80 = bitcast %Node* %79 to %Unit*
  %81 = inttoptr i64 0 to %Unit*
  %82 = icmp ne %Unit* %80, %81
  br i1 %82, label %body_1, label %break_1
body_1:

;stmt35:

;stmt36:
  %83 = load %Node*, %Node** %29
  %84 = getelementptr inbounds %Node, %Node* %83, i32 0, i32 3
  %85 = load %Unit*, %Unit** %84
  %86 = bitcast %Unit* %85 to %Value*

;stmt37:
  %87 = call %Type* (%Value*) @checkValue (%Value* %86)

;stmt38:
  %88 = load %Type*, %Type** @typeBaseInt
  %89 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %86, %Type* %88)

;stmt39:
  %90 = bitcast %Value* %86 to %Unit*
  %91 = bitcast %Value* %89 to %Unit*
  %92 = call %Bool (%List*, %Unit*, %Unit*) @list_subst (%List* %1, %Unit* %90, %Unit* %91)

;stmt40:
  %93 = load %Node*, %Node** %29
  %94 = getelementptr inbounds %Node, %Node* %93, i32 0, i32 1
  %95 = load %Node*, %Node** %94
  store %Node* %95, %Node** %29
  br label %continue_1
break_1:

;stmt41:
  ret %Bool 1
}

define %Bool @immCastIsPossible (%Value*, %Type*) {

;stmt0:
  %3 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %4 = load %ValueKind, %ValueKind* %3
  %5 = icmp eq %ValueKind %4, 2
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
  ret %Bool 0
}

define %Value* @cast (%Value*, %Type*, %TokenInfo*) {

;stmt0:
  %4 = bitcast %Value* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = bitcast %Type* %1 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  %10 = or %Bool %6, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %12 = call %Bool (%Value*, %Type*) @immCastIsPossible (%Value* %0, %Type* %1)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %13 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %14 = load %Int64, %Int64* %13
  %15 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %1, %Int64 %14, %TokenInfo* %2)
  ret %Value* %15
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %17 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 31, %TokenInfo* %2)

;stmt7:
  %18 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 11
  %19 = getelementptr inbounds %ValueCast, %ValueCast* %18, i32 0, i32 0
  store %Value* %0, %Value** %19

;stmt8:
  %20 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 11
  %21 = getelementptr inbounds %ValueCast, %ValueCast* %20, i32 0, i32 1
  store %Type* %1, %Type** %21

;stmt9:
  ret %Value* %17

;stmt10:
  br label %fail
fail:

;stmt11:
  %23 = inttoptr i64 0 to %Value*
  ret %Value* %23
}

define %Type* @checkValueCast (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 11
  %3 = getelementptr inbounds %ValueCast, %ValueCast* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 11
  %7 = getelementptr inbounds %ValueCast, %ValueCast* %6, i32 0, i32 1
  %8 = load %Type*, %Type** %7

;stmt2:
  ret %Type* %8
}

define %Value* @size_of (%Type*, %TokenInfo*) {

;stmt0:
  %3 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 32, %TokenInfo* %1)

;stmt1:
  %4 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 13
  store %Type* %0, %Type** %4

;stmt2:
  ret %Value* %3
}

define %Type* @checkValueSizeof (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 13
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = load %Str, %Str* @_func240_str1
  %8 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %9 = load %TokenInfo*, %TokenInfo** %8
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %9)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  store %ValueKind 2, %ValueKind* %10

;stmt5:
  %11 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %12 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 2
  %13 = load %Nat32, %Nat32* %12
  %14 = sext %Nat32 %13 to %Int64
  store %Int64 %14, %Int64* %11

;stmt6:
  %15 = load %Type*, %Type** @typeNumeric
  ret %Type* %15
}

define %Value* @align_of (%Type*, %TokenInfo*) {

;stmt0:
  %3 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 33, %TokenInfo* %1)

;stmt1:
  %4 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 13
  store %Type* %0, %Type** %4

;stmt2:
  ret %Value* %3
}

define %Type* @checkValueAlignof (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 13
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = load %Str, %Str* @_func242_str1
  %8 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 16
  %9 = load %TokenInfo*, %TokenInfo** %8
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %9)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  store %ValueKind 2, %ValueKind* %10

;stmt5:
  %11 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %12 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 4
  %13 = load %Nat8, %Nat8* %12
  %14 = sext %Nat8 %13 to %Int64
  store %Int64 %14, %Int64* %11

;stmt6:
  %15 = load %Type*, %Type** @typeNumeric
  ret %Type* %15
}

define void @value_init () {

;stmt0:
  %1 = load %Type*, %Type** @typeBool
  %2 = inttoptr i64 0 to %TokenInfo*
  %3 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %1, %Int64 0, %TokenInfo* %2)

;stmt1:
  %4 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 1
  %5 = load %Str, %Str* @_func243_str1
  %6 = bitcast %Value* %3 to %Unit*
  %7 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %5, %Unit* %6)

;stmt2:
  %8 = load %Type*, %Type** @typeBool
  %9 = inttoptr i64 0 to %TokenInfo*
  %10 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %8, %Int64 1, %TokenInfo* %9)

;stmt3:
  %11 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 1
  %12 = load %Str, %Str* @_func243_str2
  %13 = bitcast %Value* %10 to %Unit*
  %14 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %11, %Str %12, %Unit* %13)

;stmt4:
  %15 = load %Type*, %Type** @typeUnit
  %16 = inttoptr i64 0 to %TokenInfo*
  %17 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %15, %Int64 1, %TokenInfo* %16)

;stmt5:
  %18 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 1
  %19 = load %Str, %Str* @_func243_str3
  %20 = bitcast %Value* %17 to %Unit*
  %21 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %18, %Str %19, %Unit* %20)

;stmt6:
  %22 = load %Type*, %Type** @typeFreePtr
  %23 = inttoptr i64 0 to %TokenInfo*
  %24 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %22, %Int64 0, %TokenInfo* %23)

;stmt7:
  %25 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 1
  %26 = load %Str, %Str* @_func243_str4
  %27 = bitcast %Value* %24 to %Unit*
  %28 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %25, %Str %26, %Unit* %27)
  ret void
}

define %Value* @valueNew (%ValueKind, %TokenInfo*) {

;stmt0:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 176)
  %4 = bitcast %Unit* %3 to %Value*

;stmt1:
  %5 = bitcast %Value* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  %8 = load %Str, %Str* @_func244_str1
  call void (%Bool, %Str) @assert (%Bool %7, %Str %8)

;stmt2:
  %9 = bitcast %Value* %4 to %Unit*
  %10 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %9, %Nat8 0, %Nat32 176)

;stmt3:
  %11 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 0
  store %ValueKind %0, %ValueKind* %11

;stmt4:
  %12 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 16
  store %TokenInfo* %1, %TokenInfo** %12

;stmt5:
  ret %Value* %4
}

define %Type* @checkValue (%Value*) {

;stmt0:
  %2 = bitcast %Value* %0 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
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
  %6 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = bitcast %Type* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %11 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  ret %Type* %12
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %14 = alloca %Type*

;stmt7:
  %15 = inttoptr i64 0 to %Type*
  store %Type* %15, %Type** %14

;stmt8:
  %16 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %17 = load %ValueKind, %ValueKind* %16

;stmt9:
  %18 = icmp eq %ValueKind %17, 6
  br i1 %18, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %19 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 6
  %20 = load %Expr*, %Expr** %19
  %21 = getelementptr inbounds %Expr, %Expr* %20, i32 0, i32 0
  %22 = load %Value*, %Value** %21
  %23 = call %Type* (%Value*) @checkValue (%Value* %22)
  store %Type* %23, %Type** %14
  br label %endif_2
else_2:

;stmt12:
  %24 = call %Bool (%ValueKind) @isBinaryOpKind (%ValueKind %17)
  br i1 %24, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %25 = call %Type* (%Value*) @checkValueBinary (%Value* %0)
  store %Type* %25, %Type** %14
  br label %endif_3
else_3:

;stmt15:
  %26 = call %Bool (%ValueKind) @isUnaryOpKind (%ValueKind %17)
  br i1 %26, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %27 = call %Type* (%Value*) @checkValueUnary (%Value* %0)
  store %Type* %27, %Type** %14
  br label %endif_4
else_4:

;stmt18:
  %28 = icmp eq %ValueKind %17, 28
  br i1 %28, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %29 = call %Type* (%Value*) @checkValueCall (%Value* %0)
  store %Type* %29, %Type** %14
  br label %endif_5
else_5:

;stmt21:
  %30 = icmp eq %ValueKind %17, 29
  br i1 %30, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %31 = call %Type* (%Value*) @checkValueIndex (%Value* %0)
  store %Type* %31, %Type** %14
  br label %endif_6
else_6:

;stmt24:
  %32 = icmp eq %ValueKind %17, 30
  br i1 %32, label %then_7, label %else_7
then_7:

;stmt25:

;stmt26:
  %33 = call %Type* (%Value*) @checkValueAccess (%Value* %0)
  store %Type* %33, %Type** %14
  br label %endif_7
else_7:

;stmt27:
  %34 = icmp eq %ValueKind %17, 31
  br i1 %34, label %then_8, label %else_8
then_8:

;stmt28:

;stmt29:
  %35 = call %Type* (%Value*) @checkValueCast (%Value* %0)
  store %Type* %35, %Type** %14
  br label %endif_8
else_8:

;stmt30:
  %36 = icmp eq %ValueKind %17, 26
  %37 = icmp eq %ValueKind %17, 27
  %38 = or %Bool %36, %37
  br i1 %38, label %then_9, label %else_9
then_9:

;stmt31:

;stmt32:
  %39 = call %Type* (%Value*) @checkValueShift (%Value* %0)
  store %Type* %39, %Type** %14
  br label %endif_9
else_9:

;stmt33:
  %40 = icmp eq %ValueKind %17, 32
  br i1 %40, label %then_10, label %else_10
then_10:

;stmt34:

;stmt35:
  %41 = call %Type* (%Value*) @checkValueSizeof (%Value* %0)
  store %Type* %41, %Type** %14
  br label %endif_10
else_10:

;stmt36:
  %42 = icmp eq %ValueKind %17, 33
  br i1 %42, label %then_11, label %else_11
then_11:

;stmt37:

;stmt38:
  %43 = call %Type* (%Value*) @checkValueAlignof (%Value* %0)
  store %Type* %43, %Type** %14
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
endif_2:

;stmt39:
  %44 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %45 = load %Type*, %Type** %14
  store %Type* %45, %Type** %44

;stmt40:
  %46 = load %Type*, %Type** %14
  ret %Type* %46

;stmt41:
  br label %fail
fail:

;stmt42:
  %48 = load %Str, %Str* @_func245_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %48)

;stmt43:
  %49 = inttoptr i64 0 to %Type*
  ret %Type* %49
}

define %Value* @valueNewImm (%Type*, %Int64, %TokenInfo*) {

;stmt0:
  %4 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 2, %TokenInfo* %2)

;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  store %Type* %0, %Type** %5

;stmt2:
  %6 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 2
  store %Int64 %1, %Int64* %6

;stmt3:
  ret %Value* %4
}

define %Bool @isUnaryOpKind (%ValueKind) {

;stmt0:
  %2 = icmp eq %ValueKind %0, 8
  %3 = icmp eq %ValueKind %0, 9
  %4 = icmp eq %ValueKind %0, 11
  %5 = icmp eq %ValueKind %0, 10
  %6 = or %Bool %4, %5
  %7 = or %Bool %3, %6
  %8 = or %Bool %2, %7
  ret %Bool %8
}

define %Bool @isBinaryOpKind (%ValueKind) {

;stmt0:
  %2 = icmp eq %ValueKind %0, 12
  %3 = icmp eq %ValueKind %0, 13
  %4 = icmp eq %ValueKind %0, 14
  %5 = icmp eq %ValueKind %0, 15
  %6 = icmp eq %ValueKind %0, 16
  %7 = icmp eq %ValueKind %0, 19
  %8 = icmp eq %ValueKind %0, 17
  %9 = icmp eq %ValueKind %0, 18
  %10 = call %Bool (%ValueKind) @isReletionOpKind (%ValueKind %0)
  %11 = or %Bool %9, %10
  %12 = or %Bool %8, %11
  %13 = or %Bool %7, %12
  %14 = or %Bool %6, %13
  %15 = or %Bool %5, %14
  %16 = or %Bool %4, %15
  %17 = or %Bool %3, %16
  %18 = or %Bool %2, %17
  ret %Bool %18
}

define %Bool @isReletionOpKind (%ValueKind) {

;stmt0:
  %2 = icmp eq %ValueKind %0, 20
  %3 = icmp eq %ValueKind %0, 21
  %4 = icmp eq %ValueKind %0, 22
  %5 = icmp eq %ValueKind %0, 23
  %6 = icmp eq %ValueKind %0, 24
  %7 = icmp eq %ValueKind %0, 25
  %8 = or %Bool %6, %7
  %9 = or %Bool %5, %8
  %10 = or %Bool %4, %9
  %11 = or %Bool %3, %10
  %12 = or %Bool %2, %11
  ret %Bool %12
}

define %Bool @isSpecialOpKind (%ValueKind) {

;stmt0:
  %2 = icmp eq %ValueKind %0, 26
  %3 = icmp eq %ValueKind %0, 27
  %4 = icmp eq %ValueKind %0, 28
  %5 = icmp eq %ValueKind %0, 29
  %6 = icmp eq %ValueKind %0, 30
  %7 = icmp eq %ValueKind %0, 28
  %8 = icmp eq %ValueKind %0, 31
  %9 = icmp eq %ValueKind %0, 32
  %10 = icmp eq %ValueKind %0, 33
  %11 = or %Bool %9, %10
  %12 = or %Bool %8, %11
  %13 = or %Bool %7, %12
  %14 = or %Bool %6, %13
  %15 = or %Bool %5, %14
  %16 = or %Bool %4, %15
  %17 = or %Bool %3, %16
  %18 = or %Bool %2, %17
  ret %Bool %18
}

define %Bool @valueIsTerm (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %3 = load %ValueKind, %ValueKind* %2

;stmt1:
  %4 = call %Bool (%ValueKind) @isUnaryOpKind (%ValueKind %3)
  %5 = call %Bool (%ValueKind) @isBinaryOpKind (%ValueKind %3)
  %6 = call %Bool (%ValueKind) @isSpecialOpKind (%ValueKind %3)
  %7 = or %Bool %5, %6
  %8 = or %Bool %4, %7
  ret %Bool %8
}

define %Bool @valueIsReadonly (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %3 = load %ValueKind, %ValueKind* %2

;stmt1:
  %4 = icmp eq %ValueKind %3, 29
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %6 = getelementptr inbounds %ValueIndex, %ValueIndex* %5, i32 0, i32 0
  %7 = load %Value*, %Value** %6
  %8 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = call %Bool (%Type*) @typeIsDefinedArray (%Type* %9)

;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %12 = getelementptr inbounds %ValueIndex, %ValueIndex* %11, i32 0, i32 0
  %13 = load %Value*, %Value** %12
  %14 = call %Bool (%Value*) @valueIsReadonly (%Value* %13)
  %15 = and %Bool %14, %10
  ret %Bool %15
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %17 = icmp eq %ValueKind %3, 30
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %18 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 10
  %19 = getelementptr inbounds %ValueAccess, %ValueAccess* %18, i32 0, i32 0
  %20 = load %Value*, %Value** %19
  %21 = call %Bool (%Value*) @valueIsReadonly (%Value* %20)
  %22 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 10
  %23 = getelementptr inbounds %ValueAccess, %ValueAccess* %22, i32 0, i32 0
  %24 = load %Value*, %Value** %23
  %25 = getelementptr inbounds %Value, %Value* %24, i32 0, i32 1
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Type, %Type* %26, i32 0, i32 0
  %28 = load %TypeKind, %TypeKind* %27
  %29 = icmp ne %TypeKind %28, 6
  %30 = and %Bool %21, %29
  ret %Bool %30
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt8:
  %32 = icmp eq %ValueKind %3, 3
  %33 = icmp eq %ValueKind %3, 2
  %34 = icmp eq %ValueKind %3, 6
  %35 = icmp eq %ValueKind %3, 5
  %36 = or %Bool %34, %35
  %37 = or %Bool %33, %36
  %38 = or %Bool %32, %37
  ret %Bool %38
}

define %Bool @valueIsMutable (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %3 = load %ValueKind, %ValueKind* %2

;stmt1:
  %4 = icmp eq %ValueKind %3, 7
  %5 = icmp eq %ValueKind %3, 4
  %6 = or %Bool %4, %5
  ret %Bool %6
}

define void @importAdd (%Str, %ModuleContext*) {

;stmt0:
  %3 = getelementptr inbounds %List, %List* @imports, i32 0
  %4 = bitcast %ModuleContext* %1 to %Unit*
  %5 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %3, %Str %0, %Unit* %4)
  ret void
}

define %ModuleContext* @importGet (%Str) {

;stmt0:
  %2 = getelementptr inbounds %List, %List* @imports, i32 0
  %3 = call %Unit* (%List*, %Str) @map_get (%List* %2, %Str %0)

;stmt1:
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = bitcast %Unit* %3 to %ModuleContext*
  ret %ModuleContext* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = inttoptr i64 0 to %ModuleContext*
  ret %ModuleContext* %8
}

define %ModuleContext* @import (%Str) {

;stmt0:
  %2 = call %Str (%Nat32) @str_new (%Nat32 512)

;stmt1:
  %3 = call %Str (%Str, %Nat32) @getcwd (%Str %2, %Nat32 512)

;stmt2:
  %4 = call %SourceInfo (%Str) @getSourceInfo (%Str %0)

;stmt3:
  %5 = extractvalue %SourceInfo %4, 2
  %6 = call %ModuleContext* (%Str) @importGet (%Str %5)

;stmt4:
  %7 = bitcast %ModuleContext* %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  ret %ModuleContext* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %11 = extractvalue %SourceInfo %4, 0
  %12 = icmp eq %SourceType %11, 0
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %13 = load %Str, %Str* @_func256_str1
  %14 = call %Int32 (%Str, ...) @printf (%Str %13, %Str %0)

;stmt10:
  %15 = load %Str, %Str* @_func256_str2
  call void (%Str) @fatal (%Str %15)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt11:
  %16 = call %Source* (%SourceInfo) @openSource (%SourceInfo %4)

;stmt12:
  %17 = bitcast %Source* %16 to %Unit*
  %18 = inttoptr i64 0 to %Unit*
  %19 = icmp eq %Unit* %17, %18
  br i1 %19, label %then_2, label %else_2
then_2:

;stmt13:

;stmt14:
  %20 = load %Str, %Str* @_func256_str3
  %21 = call %Int32 (%Str, ...) @printf (%Str %20, %Str %0)

;stmt15:
  %22 = load %Str, %Str* @_func256_str4
  call void (%Str) @fatal (%Str %22)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt16:
  %23 = call %ModuleContext* (%Source*) @parse (%Source* %16)

;stmt17:
  %24 = extractvalue %SourceInfo %4, 2
  call void (%Str, %ModuleContext*) @importAdd (%Str %24, %ModuleContext* %23)

;stmt18:
  %25 = call %Int32 (%Str) @chdir (%Str %2)

;stmt19:
  ret %ModuleContext* %23
}

define void @module_init (%ModuleContext*) {

;stmt0:
  %2 = getelementptr inbounds %ModuleContext, %ModuleContext* %0, i32 0, i32 0
  %3 = inttoptr i64 0 to %Source*
  store %Source* %3, %Source** %2

;stmt1:
  %4 = getelementptr inbounds %ModuleContext, %ModuleContext* %0, i32 0, i32 1
  call void (%Index*) @index_init (%Index* %4)

;stmt2:
  %5 = getelementptr inbounds %ModuleContext, %ModuleContext* %0, i32 0, i32 2
  call void (%List*) @list_init (%List* %5)
  ret void
}

define void @comment (%Str) {
  ret void
}

define %ModuleContext* @parse (%Source*) {

;stmt0:
  %2 = load %ModuleContext*, %ModuleContext** @old_mctx

;stmt1:
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 80)
  %4 = bitcast %Unit* %3 to %ModuleContext*
  store %ModuleContext* %4, %ModuleContext** @old_mctx

;stmt2:
  %5 = load %ModuleContext*, %ModuleContext** @old_mctx
  %6 = bitcast %ModuleContext* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  %9 = load %Str, %Str* @_func259_str1
  call void (%Bool, %Str) @assert (%Bool %8, %Str %9)

;stmt3:
  %10 = load %ModuleContext*, %ModuleContext** @old_mctx
  call void (%ModuleContext*) @module_init (%ModuleContext* %10)

;stmt4:
  %11 = load %ModuleContext*, %ModuleContext** @old_mctx
  %12 = getelementptr inbounds %ModuleContext, %ModuleContext* %11, i32 0, i32 0
  store %Source* %0, %Source** %12

;stmt5:
  store %Bool 1, %Bool* @comments

;stmt6:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %13 = call %Token* () @ctok ()

;stmt10:
  %14 = getelementptr inbounds %Token, %Token* %13, i32 0, i32 0
  %15 = load %TokenType, %TokenType* %14
  %16 = icmp eq %TokenType %15, 6
  br i1 %16, label %then_0, label %else_0
then_0:

;stmt11:

;stmt12:
  %17 = getelementptr inbounds %Token, %Token* %13, i32 0, i32 2
  %18 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %17, i32 0, %Int32 0
  %19 = bitcast %Nat8* %18 to %Str
  call void (%Str) @comment (%Str %19)

;stmt13:
  call void () @skip ()
  br label %endif_0
else_0:

;stmt14:
  %20 = load %Str, %Str* @_func259_str2
  %21 = call %Bool (%Str) @match (%Str %20)
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt15:

;stmt16:
  call void () @parseImport ()
  br label %endif_1
else_1:

;stmt17:
  %22 = load %Str, %Str* @_func259_str3
  %23 = call %Bool (%Str) @match (%Str %22)
  br i1 %23, label %then_2, label %else_2
then_2:

;stmt18:

;stmt19:
  call void () @parseExport ()
  br label %endif_2
else_2:

;stmt20:

;stmt21:
  br label %break_0
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  br label %continue_0
break_0:

;stmt22:
  %25 = load %Str, %Str* @_func259_str4
  %26 = getelementptr inbounds %Source, %Source* %0, i32 0, i32 0
  %27 = getelementptr inbounds %SourceInfo, %SourceInfo* %26, i32 0, i32 2
  %28 = load %Str, %Str* %27
  %29 = call %Int32 (%Str, ...) @printf (%Str %25, %Str %28)

;stmt23:
  store %Bool 0, %Bool* @comments

;stmt24:
  %30 = load %Str, %Str* @_func259_str5
  call void (%Str, %Nat64) @set (%Str %30, %Nat64 0)

;stmt25:
  br label %continue_1
continue_1:
  br i1 1, label %body_1, label %break_1
body_1:

;stmt26:

;stmt27:
  call void () @skip_nl ()

;stmt28:
  %31 = call %Token* () @ctok ()

;stmt29:
  %32 = load %Str, %Str* @_func259_str6
  %33 = call %Bool (%Str) @match (%Str %32)
  br i1 %33, label %then_3, label %else_3
then_3:

;stmt30:

;stmt31:
  %34 = call %Stmt* () @parseLet ()
  br label %endif_3
else_3:

;stmt32:
  %35 = load %Str, %Str* @_func259_str7
  %36 = call %Bool (%Str) @match (%Str %35)
  br i1 %36, label %then_4, label %else_4
then_4:

;stmt33:

;stmt34:
  call void () @parseTypedef ()
  br label %endif_4
else_4:

;stmt35:
  %37 = load %Str, %Str* @_func259_str8
  %38 = call %Bool (%Str) @match (%Str %37)
  br i1 %38, label %then_5, label %else_5
then_5:

;stmt36:

;stmt37:
  call void () @parseExtern ()
  br label %endif_5
else_5:

;stmt38:
  %39 = load %Str, %Str* @_func259_str9
  %40 = call %Bool (%Str) @match (%Str %39)
  br i1 %40, label %then_6, label %else_6
then_6:

;stmt39:

;stmt40:
  call void () @parseVardef ()
  br label %endif_6
else_6:

;stmt41:

;stmt42:
  %41 = load %Str, %Str* @_func259_str10
  %42 = call %Bool (%Str) @match (%Str %41)
  br i1 %42, label %then_7, label %else_7
then_7:

;stmt43:

;stmt44:
  %43 = load %Str, %Str* @_func259_str11
  call void (%Str, %Nat64) @set (%Str %43, %Nat64 1)

;stmt45:
  br label %continue_1
  br label %endif_7
else_7:
  br label %endif_7
endif_7:

;stmt46:
  %45 = load %Str, %Str* @_func259_str12
  %46 = call %Bool (%Str) @match (%Str %45)
  br i1 %46, label %then_8, label %else_8
then_8:

;stmt47:

;stmt48:
  br label %continue_1
  br label %endif_8
else_8:
  br label %endif_8
endif_8:

;stmt49:
  %48 = call %Bool () @eof ()
  br i1 %48, label %then_9, label %else_9
then_9:

;stmt50:

;stmt51:
  br label %break_1
  br label %endif_9
else_9:
  br label %endif_9
endif_9:

;stmt52:
  br label %continue_2
continue_2:
  br i1 1, label %body_2, label %break_2
body_2:

;stmt53:

;stmt54:
  %50 = call %Token* () @ctok ()

;stmt55:
  %51 = getelementptr inbounds %Token, %Token* %50, i32 0, i32 0
  %52 = load %TokenType, %TokenType* %51
  %53 = icmp eq %TokenType %52, 1
  br i1 %53, label %then_10, label %else_10
then_10:

;stmt56:

;stmt57:
  %54 = load %Str, %Str* @_func259_str13
  %55 = getelementptr inbounds %Token, %Token* %50, i32 0, i32 2
  %56 = bitcast [0 x %Nat8]* %55 to %Str
  %57 = call %Int32 (%Str, %Str) @strcmp (%Str %54, %Str %56)
  %58 = icmp eq %Int32 %57, 0
  %59 = load %Str, %Str* @_func259_str14
  %60 = getelementptr inbounds %Token, %Token* %50, i32 0, i32 2
  %61 = bitcast [0 x %Nat8]* %60 to %Str
  %62 = call %Int32 (%Str, %Str) @strcmp (%Str %59, %Str %61)
  %63 = icmp eq %Int32 %62, 0
  %64 = load %Str, %Str* @_func259_str15
  %65 = getelementptr inbounds %Token, %Token* %50, i32 0, i32 2
  %66 = bitcast [0 x %Nat8]* %65 to %Str
  %67 = call %Int32 (%Str, %Str) @strcmp (%Str %64, %Str %66)
  %68 = icmp eq %Int32 %67, 0
  %69 = or %Bool %63, %68
  %70 = or %Bool %58, %69
  br i1 %70, label %then_11, label %else_11
then_11:

;stmt58:

;stmt59:
  br label %break_2
  br label %endif_11
else_11:
  br label %endif_11
endif_11:
  br label %endif_10
else_10:

;stmt60:
  %72 = getelementptr inbounds %Token, %Token* %50, i32 0, i32 0
  %73 = load %TokenType, %TokenType* %72
  %74 = icmp eq %TokenType %73, 0
  br i1 %74, label %then_12, label %else_12
then_12:

;stmt61:

;stmt62:
  br label %break_2
  br label %endif_12
else_12:
  br label %endif_12
endif_12:
  br label %endif_10
endif_10:

;stmt63:
  call void () @skip ()
  br label %continue_2
break_2:
  br label %endif_6
endif_6:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:

;stmt64:
  %76 = load %Str, %Str* @_func259_str16
  call void (%Str, %Nat64) @set (%Str %76, %Nat64 0)
  br label %continue_1
break_1:

;stmt65:
  %77 = load %Str, %Str* @_func259_str17
  %78 = getelementptr inbounds %Source, %Source* %0, i32 0, i32 0
  %79 = getelementptr inbounds %SourceInfo, %SourceInfo* %78, i32 0, i32 2
  %80 = load %Str, %Str* %79
  %81 = call %Int32 (%Str, ...) @printf (%Str %77, %Str %80)

;stmt66:
  %82 = load %ModuleContext*, %ModuleContext** @old_mctx

;stmt67:
  store %ModuleContext* %2, %ModuleContext** @old_mctx

;stmt68:
  ret %ModuleContext* %82
}

define void @parseExport () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %3 = load %TokenType, %TokenType* %2
  %4 = icmp ne %TokenType %3, 4
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = load %Str, %Str* @_func260_str1
  %6 = call %Token* () @ctok ()
  %7 = getelementptr inbounds %Token, %Token* %6, i32 0, i32 1
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
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 2
  %11 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %10, i32 0, %Int32 0
  %12 = bitcast %Nat8* %11 to %Str
  %13 = call %Str (%Str) @dup (%Str %12)

;stmt6:
  call void () @skip ()

;stmt7:
  %14 = load %Str, %Str* @_func260_str2
  %15 = call %Int32 (%Str, ...) @printf (%Str %14, %Str %13)

;stmt8:
ret void

;stmt9:
  br label %fail
fail:
  ret void
}

define void @parseImport () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %3 = load %TokenType, %TokenType* %2
  %4 = icmp ne %TokenType %3, 4
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = load %Str, %Str* @_func261_str1
  %6 = call %Token* () @ctok ()
  %7 = getelementptr inbounds %Token, %Token* %6, i32 0, i32 1
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
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 2
  %11 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %10, i32 0, %Int32 0
  %12 = bitcast %Nat8* %11 to %Str
  %13 = call %Str (%Str) @dup (%Str %12)

;stmt6:
  call void () @skip ()

;stmt7:
  %14 = call %ModuleContext* (%Str) @import (%Str %13)

;stmt8:
  %15 = load %ModuleContext*, %ModuleContext** @old_mctx
  %16 = getelementptr inbounds %ModuleContext, %ModuleContext* %15, i32 0, i32 2
  %17 = bitcast %ModuleContext* %14 to %Unit*
  %18 = call %Bool (%List*, %Unit*) @list_append (%List* %16, %Unit* %17)

;stmt9:
ret void

;stmt10:
  br label %fail
fail:
  ret void
}

define void @parseTypedef () {

;stmt0:
  %1 = call %Str () @parseId ()

;stmt1:
  %2 = bitcast %Str %1 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
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
  %6 = load %Str, %Str* @_func262_str1
  %7 = call %Bool (%Str) @need (%Str %6)

;stmt5:
  %8 = call %Type* () @parse_type ()

;stmt6:
  %9 = bitcast %Type* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp eq %Unit* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %13 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 0
  %14 = load %TypeKind, %TypeKind* %13
  %15 = icmp ne %TypeKind %14, 2
  br i1 %15, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %16 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 1
  %17 = load %Str, %Str* %16
  %18 = bitcast %Str %17 to %Unit*
  %19 = inttoptr i64 0 to %Unit*
  %20 = icmp eq %Unit* %18, %19
  br i1 %20, label %then_3, label %else_3
then_3:

;stmt12:

;stmt13:
  %21 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 1
  store %Str %1, %Str* %21
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt14:
  %22 = load %ModuleContext*, %ModuleContext** @old_mctx
  %23 = getelementptr inbounds %ModuleContext, %ModuleContext* %22, i32 0, i32 1
  call void (%Index*, %Str, %Type*) @add_type (%Index* %23, %Str %1, %Type* %8)

;stmt15:
  %24 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %25 = call %Definition* (%Assembly*, %Str, %Type*) @asmTypedefAdd (%Assembly* %24, %Str %1, %Type* %8)
  ret void
}

define %Stmt* @parseLet () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Str () @parseId ()

;stmt2:
  %4 = load %Str, %Str* @_func263_str1
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %3)

;stmt3:
  %6 = load %Str, %Str* @_func263_str2
  %7 = call %Bool (%Str) @need (%Str %6)

;stmt4:
  %8 = call %Value* () @hier1 ()

;stmt5:
  %9 = bitcast %Str %3 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp eq %Unit* %9, %10
  %12 = bitcast %Value* %8 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp eq %Unit* %12, %13
  %15 = or %Bool %11, %14
  br i1 %15, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %16 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %16
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %18 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 15
  store %TokenInfo* %2, %TokenInfo** %18

;stmt9:
  %19 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %20 = load %Value*, %Value** %19
  %21 = bitcast %Value* %20 to %Unit*
  %22 = inttoptr i64 0 to %Unit*
  %23 = icmp eq %Unit* %21, %22
  br i1 %23, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  call void (%Str, %Value*, %TokenInfo*) @globalLet (%Str %3, %Value* %8, %TokenInfo* %2)

;stmt12:
  %24 = load %Str, %Str* @_func263_str3
  %25 = call %Int32 (%Str, ...) @printf (%Str %24)

;stmt13:
  %26 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %26
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt14:
  %28 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 0
  %29 = load %ValueKind, %ValueKind* %28

;stmt15:
  %30 = icmp ne %ValueKind %29, 3
  %31 = icmp ne %ValueKind %29, 2
  %32 = and %Bool %30, %31
  %33 = icmp eq %ValueKind %29, 1
  %34 = or %Bool %32, %33
  br i1 %34, label %then_2, label %else_2
then_2:

;stmt16:

;stmt17:
  %35 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 6, %TokenInfo* %2)

;stmt18:
  call void (%Str, %Value*) @bind_value_local (%Str %3, %Value* %35)

;stmt19:
  %36 = call %Stmt* (%Value*, %TokenInfo*) @stmt_expr_new (%Value* %8, %TokenInfo* %2)

;stmt20:
  %37 = getelementptr inbounds %Value, %Value* %35, i32 0, i32 6
  %38 = getelementptr inbounds %Stmt, %Stmt* %36, i32 0, i32 3
  %39 = load %Expr*, %Expr** %38
  store %Expr* %39, %Expr** %37

;stmt21:
  %40 = load %Str, %Str* @_func263_str4
  %41 = call %Int32 (%Str, ...) @printf (%Str %40)

;stmt22:
  ret %Stmt* %36
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt23:
  %43 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %44 = load %Block*, %Block** %43
  call void (%Block*, %Str, %Value*) @bind_value_in_block (%Block* %44, %Str %3, %Value* %8)

;stmt24:
  %45 = load %Str, %Str* @_func263_str5
  %46 = call %Int32 (%Str, ...) @printf (%Str %45)

;stmt25:
  %47 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %47
}

define void @globalLet (%Str, %Value*, %TokenInfo*) {

;stmt0:
  %4 = load %Str, %Str* @_func264_str1
  %5 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %4)
  %6 = icmp eq %Int32 %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 3
  %8 = load %Definition*, %Definition** %7

;stmt3:
  %9 = bitcast %Definition* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %12 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %13 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Definition, %Definition* %8, i32 0, i32 1
  %16 = load %Str, %Str* %15
  %17 = call %Definition* (%Assembly*, %Str, %Type*, %Str) @asmAliasAdd (%Assembly* %12, %Str %0, %Type* %14, %Str %16)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %18 = call %Value* (%Str) @get_value_global (%Str %0)

;stmt7:
  %19 = bitcast %Value* %18 to %Unit*
  %20 = inttoptr i64 0 to %Unit*
  %21 = icmp eq %Unit* %19, %20
  br i1 %21, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  call void (%Str, %Value*) @bind_value_global (%Str %0, %Value* %1)

;stmt10:
ret void
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt11:
  %23 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 0
  %24 = load %ValueKind, %ValueKind* %23
  %25 = icmp ne %ValueKind %24, 1
  br i1 %25, label %then_3, label %else_3
then_3:

;stmt12:

;stmt13:
  %26 = load %Str, %Str* @_func264_str2
  call void (%Str, %TokenInfo*) @error (%Str %26, %TokenInfo* %2)

;stmt14:
ret void
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt15:
  %28 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 14
  %29 = load %TokenInfo*, %TokenInfo** %28

;stmt16:
  %30 = load %Value, %Value* %1
  store %Value %30, %Value* %18

;stmt17:
  %31 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 14
  store %TokenInfo* %29, %TokenInfo** %31
  ret void
}

define void @handle_fields (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0
  %6 = load %Str, %Str* %5

;stmt2:
  %7 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
  %8 = load %Type*, %Type** %7

;stmt3:
  %9 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %10 = load %Value*, %Value** %9
  %11 = bitcast %Value* %10 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %14 = inttoptr i64 0 to %Value*
  %15 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 3
  %16 = load %TokenInfo*, %TokenInfo** %15
  %17 = call %Value* (%Str, %Type*, %Value*, %TokenInfo*) @create_local_var (%Str %6, %Type* %8, %Value* %14, %TokenInfo* %16)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %18 = inttoptr i64 0 to %Value*
  %19 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 3
  %20 = load %TokenInfo*, %TokenInfo** %19
  call void (%Str, %Type*, %Value*, %TokenInfo*) @create_global_var (%Str %6, %Type* %8, %Value* %18, %TokenInfo* %20)
  br label %endif_0
endif_0:
  ret void
}

define void @parseVardef () {

;stmt0:
  %1 = call %List* () @parseField ()

;stmt1:
  %2 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %1, %ListForeachHandler @handle_fields, %Unit* %2)
  ret void
}

define void @extern_decl (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 3
  %10 = load %TokenInfo*, %TokenInfo** %9
  call void (%Str, %Type*, %TokenInfo*) @declare (%Str %6, %Type* %8, %TokenInfo* %10)
  ret void
}

define void @parseExtern () {

;stmt0:
  %1 = call %List* () @parseField ()

;stmt1:
  %2 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %1, %ListForeachHandler @extern_decl, %Unit* %2)
  ret void
}

define void @declare (%Str, %Type*, %TokenInfo*) {

;stmt0:
  %4 = bitcast %Str %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = bitcast %Type* %1 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  %10 = or %Bool %6, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %12 = call %Value* (%Str) @get_value_global (%Str %0)

;stmt4:
  %13 = bitcast %Value* %12 to %Unit*
  %14 = inttoptr i64 0 to %Unit*
  %15 = icmp ne %Unit* %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %16 = load %Str, %Str* @_func269_str1
  call void (%Str, %TokenInfo*) @error (%Str %16, %TokenInfo* %2)

;stmt7:
  %17 = load %Str, %Str* @_func269_str2
  %18 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 14
  %19 = load %TokenInfo*, %TokenInfo** %18
  call void (%Str, %TokenInfo*) @rem (%Str %17, %TokenInfo* %19)

;stmt8:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %21 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 1, %TokenInfo* %2)

;stmt10:
  %22 = getelementptr inbounds %Value, %Value* %21, i32 0, i32 1
  store %Type* %1, %Type** %22

;stmt11:
  %23 = getelementptr inbounds %Value, %Value* %21, i32 0, i32 1
  store %Type* %1, %Type** %23

;stmt12:
  %24 = getelementptr inbounds %Value, %Value* %21, i32 0, i32 14
  store %TokenInfo* %2, %TokenInfo** %24

;stmt13:
  %25 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %26 = load %TypeKind, %TypeKind* %25
  %27 = icmp eq %TypeKind %26, 3
  br i1 %27, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %28 = getelementptr inbounds %Value, %Value* %21, i32 0, i32 0
  store %ValueKind 3, %ValueKind* %28

;stmt16:
  %29 = getelementptr inbounds %Value, %Value* %21, i32 0, i32 3
  %30 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %31 = inttoptr i64 0 to %Block*
  %32 = call %Definition* (%Assembly*, %Str, %Type*, %Block*) @asmFuncAdd (%Assembly* %30, %Str %0, %Type* %1, %Block* %31)
  store %Definition* %32, %Definition** %29
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt17:
  call void (%Str, %Value*) @bind_value_global (%Str %0, %Value* %21)
  ret void
}

define %Str @parseId () {

;stmt0:
  %1 = call %Token* () @ctok ()

;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %3 = load %TokenType, %TokenType* %2
  %4 = icmp ne %TokenType %3, 1
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = load %Str, %Str* @_func270_str1
  %6 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)

;stmt4:
  %7 = load %Str, %Str* @_func270_str2
  %8 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %9 = load %TokenType, %TokenType* %8
  %10 = call %Int32 (%Str, ...) @printf (%Str %7, %TokenType %9)

;stmt5:
  %11 = load %Str, %Str* @_func270_str3
  %12 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2
  %13 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %12, i32 0, %Int32 0
  %14 = load %Nat8, %Nat8* %13
  %15 = call %Int32 (%Str, ...) @printf (%Str %11, %Nat8 %14)

;stmt6:
  %16 = load %Str, %Str* @_func270_str4
  %17 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2
  %18 = bitcast [0 x %Nat8]* %17 to %Str
  %19 = call %Int32 (%Str, ...) @printf (%Str %16, %Str %18)

;stmt7:
  %20 = inttoptr i64 0 to %Str
  ret %Str %20
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %22 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1
  %23 = getelementptr inbounds %TokenInfo, %TokenInfo* %22, i32 0, i32 3
  %24 = load %Nat16, %Nat16* %23
  %25 = zext %Nat16 %24 to %Nat32
  %26 = add %Nat32 %25, 1
  %27 = call %Str (%Nat32) @str_new (%Nat32 %26)

;stmt9:
  %28 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2
  %29 = bitcast [0 x %Nat8]* %28 to %Str
  %30 = call %Nat8* (%Str, %Str) @strcpy (%Str %27, %Str %29)

;stmt10:
  call void () @skip ()

;stmt11:
  ret %Str %27
}

define void @set_type (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = bitcast %Unit* %1 to %Type*

;stmt2:
  %6 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
  store %Type* %5, %Type** %6
  ret void
}

define %List* @parseField () {

;stmt0:
  %1 = call %List* () @list_new ()

;stmt1:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt2:

;stmt3:
  %2 = call %Token* () @ctok ()
  %3 = getelementptr inbounds %Token, %Token* %2, i32 0, i32 1

;stmt4:
  %4 = call %Str () @parseId ()

;stmt5:
  %5 = inttoptr i64 0 to %Type*
  %6 = call %Field* (%Str, %Type*, %TokenInfo*) @field_new (%Str %4, %Type* %5, %TokenInfo* %3)

;stmt6:
  %7 = bitcast %Field* %6 to %Unit*
  %8 = call %Bool (%List*, %Unit*) @list_append (%List* %1, %Unit* %7)

;stmt7:
  %9 = load %Str, %Str* @_func271_str1
  %10 = call %Bool (%Str) @match (%Str %9)
  %11 = xor %Bool %10, 1
  br i1 %11, label %then_0, label %else_0
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
  %13 = load %Str, %Str* @_func271_str2
  %14 = call %Bool (%Str) @need (%Str %13)

;stmt12:
  %15 = call %Type* () @parse_type ()

;stmt13:
  %16 = bitcast %Type* %15 to %Unit*
  %17 = inttoptr i64 0 to %Unit*
  %18 = icmp eq %Unit* %16, %17
  br i1 %18, label %then_1, label %else_1
then_1:

;stmt14:

;stmt15:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt16:
  %20 = bitcast %Type* %15 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %1, %ListForeachHandler @set_type, %Unit* %20)

;stmt17:
  ret %List* %1

;stmt18:
  br label %fail
fail:

;stmt19:
  %22 = inttoptr i64 0 to %List*
  ret %List* %22
}

define %Value* @create_local_var (%Str, %Type*, %Value*, %TokenInfo*) {

;stmt0:
  %5 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 7, %TokenInfo* %3)

;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1
  store %Type* %1, %Type** %6

;stmt2:
  call void (%Str, %Value*) @bind_value_local (%Str %0, %Value* %5)

;stmt3:
  %7 = inttoptr i64 0 to %TokenInfo*
  %8 = call %Stmt* (%Str, %Type*, %Value*, %TokenInfo*) @stmt_new_vardef (%Str %0, %Type* %1, %Value* %2, %TokenInfo* %7)

;stmt4:
  call void (%Stmt*) @stmtAdd (%Stmt* %8)

;stmt5:
  %9 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 4
  %10 = getelementptr inbounds %Stmt, %Stmt* %8, i32 0, i32 4
  %11 = load %VarDef*, %VarDef** %10
  store %VarDef* %11, %VarDef** %9

;stmt6:
  %12 = bitcast %Value* %2 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %15 = inttoptr i64 0 to %TokenInfo*
  %16 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @stmt_new_assign (%Value* %5, %Value* %2, %TokenInfo* %15)
  call void (%Stmt*) @stmtAdd (%Stmt* %16)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  ret %Value* %5
}

define void @create_global_var (%Str, %Type*, %Value*, %TokenInfo*) {

;stmt0:
  %5 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 4, %TokenInfo* %3)

;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 3
  %7 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %8 = call %Definition* (%Assembly*, %Str, %Type*, %Value*) @asmVarAdd (%Assembly* %7, %Str %0, %Type* %1, %Value* %2)
  store %Definition* %8, %Definition** %6

;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1
  store %Type* %1, %Type** %9

;stmt3:
  call void (%Str, %Value*) @bind_value_global (%Str %0, %Value* %5)
  ret void
}

define %Node* @gett () {

;stmt0:
  %1 = load %ModuleContext*, %ModuleContext** @old_mctx
  %2 = getelementptr inbounds %ModuleContext, %ModuleContext* %1, i32 0, i32 0
  %3 = load %Source*, %Source** %2
  %4 = getelementptr inbounds %Source, %Source* %3, i32 0, i32 2
  %5 = load %Node*, %Node** %4
  ret %Node* %5
}

define void @sett (%Node*) {

;stmt0:
  %2 = load %ModuleContext*, %ModuleContext** @old_mctx
  %3 = getelementptr inbounds %ModuleContext, %ModuleContext* %2, i32 0, i32 0
  %4 = load %Source*, %Source** %3
  %5 = getelementptr inbounds %Source, %Source* %4, i32 0, i32 2
  store %Node* %0, %Node** %5
  ret void
}

define void @skip () {

;stmt0:
  %1 = load %ModuleContext*, %ModuleContext** @old_mctx
  %2 = getelementptr inbounds %ModuleContext, %ModuleContext* %1, i32 0, i32 0
  %3 = load %Source*, %Source** %2
  %4 = getelementptr inbounds %Source, %Source* %3, i32 0, i32 2
  %5 = load %ModuleContext*, %ModuleContext** @old_mctx
  %6 = getelementptr inbounds %ModuleContext, %ModuleContext* %5, i32 0, i32 0
  %7 = load %Source*, %Source** %6
  %8 = getelementptr inbounds %Source, %Source* %7, i32 0, i32 2
  %9 = load %Node*, %Node** %8
  %10 = getelementptr inbounds %Node, %Node* %9, i32 0, i32 1
  %11 = load %Node*, %Node** %10
  store %Node* %11, %Node** %4
  ret void
}

define void @skip_nl () {

;stmt0:
  br label %continue_0
continue_0:
  %1 = load %Str, %Str* @_func278_str1
  %2 = call %Bool (%Str) @match (%Str %1)
  br i1 %2, label %body_0, label %break_0
body_0:

;stmt1:
  br label %continue_0
break_0:
  ret void
}

define %Token* @ctok () {

;stmt0:
  %1 = call %Node* () @gett ()
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 3
  %3 = load %Unit*, %Unit** %2
  %4 = bitcast %Unit* %3 to %Token*

;stmt1:
  %5 = load %Bool, %Bool* @comments
  %6 = xor %Bool %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 0
  %8 = load %TokenType, %TokenType* %7
  %9 = icmp eq %TokenType %8, 6
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  call void () @skip ()

;stmt6:
  %10 = call %Token* () @ctok ()
  ret %Token* %10
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  ret %Token* %4
}

define %Bool @eof () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %3 = load %TokenType, %TokenType* %2
  %4 = icmp eq %TokenType %3, 0
  ret %Bool %4
}

define %Token* @nextok () {

;stmt0:
  %1 = call %Node* () @gett ()
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 1
  %3 = load %Node*, %Node** %2
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = call %Node* () @gett ()
  %8 = getelementptr inbounds %Node, %Node* %7, i32 0, i32 1
  %9 = load %Node*, %Node** %8
  %10 = getelementptr inbounds %Node, %Node* %9, i32 0, i32 3
  %11 = load %Unit*, %Unit** %10
  %12 = bitcast %Unit* %11 to %Token*
  ret %Token* %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %14 = inttoptr i64 0 to %Token*
  ret %Token* %14
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
  %4 = load %Str, %Str* @_func282_str1
  %5 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1
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
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2
  %3 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %2, i32 0, %Int32 0
  %4 = load %Nat8, %Nat8* %3

;stmt1:
  %5 = load %Str, %Str* @_func283_str1
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %4, %7
  %9 = load %Str, %Str* @_func283_str2
  %10 = getelementptr inbounds %Nat8, %Str %9, %Int32 0
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
  %15 = load %Str, %Str* @_func283_str3
  %16 = getelementptr inbounds %Nat8, %Str %15, %Int32 0
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp eq %Nat8 %4, %17
  %19 = load %Str, %Str* @_func283_str4
  %20 = getelementptr inbounds %Nat8, %Str %19, %Int32 0
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

define void @skipto (%Str) {

;stmt0:
  %2 = load %Str, %Str* @_func284_str1
  %3 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %2, %TokenInfo* %3)

;stmt1:
  %4 = load %Str, %Str* @_func284_str2
  %5 = call %Token* () @ctok ()
  %6 = getelementptr inbounds %Token, %Token* %5, i32 0, i32 2
  %7 = call %Int32 (%Str, ...) @printf (%Str %4, [0 x %Nat8]* %6)

;stmt2:
  %8 = load %Str, %Str* @_func284_str3
  %9 = call %Int32 (%Str, ...) @printf (%Str %8, %Str %0)

;stmt3:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define %Bool @match (%Str) {

;stmt0:
  %2 = call %Token* () @ctok ()

;stmt1:
  %3 = getelementptr inbounds %Token, %Token* %2, i32 0, i32 0
  %4 = load %TokenType, %TokenType* %3

;stmt2:
  %5 = icmp eq %TokenType %4, 4
  %6 = icmp eq %TokenType %4, 0
  %7 = or %Bool %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = getelementptr inbounds %Token, %Token* %2, i32 0, i32 2
  %10 = bitcast [0 x %Nat8]* %9 to %Str
  %11 = call %Int32 (%Str, %Str) @strcmp (%Str %0, %Str %10)
  %12 = icmp eq %Int32 %11, 0

;stmt6:
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  ret %Bool %12
}

define %Bool @need (%Str) {

;stmt0:
  %2 = call %Bool (%Str) @match (%Str %0)

;stmt1:
  %3 = icmp eq %Bool %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %4 = call %Token* () @ctok ()

;stmt4:
  %5 = load %Str, %Str* @_func286_str1
  %6 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)

;stmt5:
  call void () @skip ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  ret %Bool %2
}

define void @lab_reset (%Nat32) {

;stmt0:
  store %Nat32 %0, %Nat32* @lab
  ret void
}

define %Nat32 @lab_get () {

;stmt0:
  %1 = load %Nat32, %Nat32* @lab

;stmt1:
  %2 = load %Nat32, %Nat32* @lab
  %3 = add %Nat32 %2, 1
  store %Nat32 %3, %Nat32* @lab

;stmt2:
  ret %Nat32 %1
}

define void @o (%Str) {

;stmt0:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func289_str1
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Str %0)
  ret void
}

define void @nl () {

;stmt0:
  %1 = load %Str, %Str* @_func290_str1
  call void (%Str) @o (%Str %1)
  ret void
}

define void @space () {

;stmt0:
  %1 = load %Str, %Str* @_func291_str1
  call void (%Str) @o (%Str %1)
  ret void
}

define void @comma () {

;stmt0:
  %1 = load %Str, %Str* @_func292_str1
  call void (%Str) @o (%Str %1)
  ret void
}

define %Nat32 @get_metadata () {

;stmt0:
  %1 = load %Nat32, %Nat32* @md

;stmt1:
  %2 = load %Nat32, %Nat32* @md
  %3 = add %Nat32 %2, 1
  store %Nat32 %3, %Nat32* @md

;stmt2:
  ret %Nat32 %1
}

define void @dbg (%Nat32) {

;stmt0:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func294_str1
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Nat32 %0)
  ret void
}

define void @print_md (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Metadata*

;stmt1:
  call void (%Metadata*) @print_metadata (%Metadata* %4)
  ret void
}

define void @print_metadata_list (%List*) {

;stmt0:
  %2 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %0, %ListForeachHandler @print_md, %Unit* %2)
  ret void
}

define void @print_metadata (%Metadata*) {
  ret void
}

define void @printType (%Type*, %Bool, %Bool) {

;stmt0:
  %4 = bitcast %Type* %0 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  %7 = load %Str, %Str* @_func298_str1
  call void (%Bool, %Str) @assert (%Bool %6, %Str %7)

;stmt1:
  %8 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 1
  %9 = load %Str, %Str* %8
  %10 = bitcast %Str %9 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  %13 = and %Bool %1, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %14 = load %Unit*, %Unit** @fout
  %15 = load %Str, %Str* @_func298_str2
  %16 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 1
  %17 = load %Str, %Str* %16
  %18 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15, %Str %17)

;stmt4:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %20 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 0
  %21 = load %TypeKind, %TypeKind* %20

;stmt6:
  %22 = icmp eq %TypeKind %21, 2
  br i1 %22, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %23 = load %Unit*, %Unit** @fout
  %24 = load %Str, %Str* @_func298_str3
  %25 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 5
  %26 = getelementptr inbounds %TypeBasic, %TypeBasic* %25, i32 0, i32 0
  %27 = load %Str, %Str* %26
  %28 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %23, %Str %24, %Str %27)
  br label %endif_1
else_1:

;stmt9:
  %29 = icmp eq %TypeKind %21, 4
  br i1 %29, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %30 = load %Type*, %Type** @typeEnum
  call void (%Type*, %Bool, %Bool) @printType (%Type* %30, %Bool 1, %Bool 1)
  br label %endif_2
else_2:

;stmt12:
  %31 = icmp eq %TypeKind %21, 5
  br i1 %31, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %32 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 9
  call void (%TypeRecord*) @printTypeRecord (%TypeRecord* %32)
  br label %endif_3
else_3:

;stmt15:
  %33 = icmp eq %TypeKind %21, 7
  br i1 %33, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %34 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 8
  call void (%TypeArray*) @printTypeArray (%TypeArray* %34)
  br label %endif_4
else_4:

;stmt18:
  %35 = icmp eq %TypeKind %21, 6
  br i1 %35, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %36 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 7
  call void (%TypePointer*) @printTypePointer (%TypePointer* %36)
  br label %endif_5
else_5:

;stmt21:
  %37 = icmp eq %TypeKind %21, 3
  br i1 %37, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %38 = getelementptr inbounds %Type, %Type* %0, i32 0, i32 6
  call void (%TypeFunc*, %Bool) @printTypeFunc (%TypeFunc* %38, %Bool %2)
  br label %endif_6
else_6:
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

define void @print_struct_field (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = bitcast %Unit* %1 to %Bool*

;stmt2:
  %6 = load %Bool, %Bool* %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @_func300_str1
  %9 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %10 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)

;stmt6:
  store %Bool 1, %Bool* %5
  ret void
}

define void @printTypeRecord (%TypeRecord*) {

;stmt0:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func299_str1
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3)

;stmt1:
  %5 = alloca %Bool

;stmt2:
  store %Bool 0, %Bool* %5

;stmt3:
  %6 = getelementptr inbounds %TypeRecord, %TypeRecord* %0, i32 0, i32 0
  %7 = load %List*, %List** %6
  %8 = getelementptr inbounds %Bool, %Bool* %5, i32 0
  %9 = bitcast %Bool* %8 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %7, %ListForeachHandler @print_struct_field, %Unit* %9)

;stmt4:
  %10 = load %Unit*, %Unit** @fout
  %11 = load %Str, %Str* @_func299_str2
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11)
  ret void
}

define void @printTypeArray (%TypeArray*) {

;stmt0:
  %2 = getelementptr inbounds %TypeArray, %TypeArray* %0, i32 0, i32 0
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = getelementptr inbounds %TypeArray, %TypeArray* %0, i32 0, i32 2
  %5 = load %Bool, %Bool* %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt4:
  %6 = load %Str, %Str* @_func301_str1
  call void (%Str) @o (%Str %6)
  br label %endif_0
else_0:

;stmt5:

;stmt6:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @_func301_str2
  %9 = getelementptr inbounds %TypeArray, %TypeArray* %0, i32 0, i32 1
  %10 = load %Nat32, %Nat32* %9
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8, %Nat32 %10)

;stmt7:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt8:
  %12 = load %Unit*, %Unit** @fout
  %13 = load %Str, %Str* @_func301_str3
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13)
  br label %endif_0
endif_0:
  ret void
}

define void @printTypePointer (%TypePointer*) {

;stmt0:
  %2 = getelementptr inbounds %TypePointer, %TypePointer* %0, i32 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt1:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func302_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5)
  ret void
}

define void @pt_print_param (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %1 to %Bool*

;stmt1:
  %5 = load %Bool, %Bool* %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @_func304_str1
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %9 = bitcast %Unit* %0 to %Field*
  %10 = getelementptr inbounds %Field, %Field* %9, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)

;stmt5:
  store %Bool 1, %Bool* %4
  ret void
}

define void @printTypeFunc (%TypeFunc*, %Bool) {

;stmt0:
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i32 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = load %Type*, %Type** @typeUnit
  %6 = call %Bool (%Type*, %Type*) @type_eq (%Type* %4, %Type* %5)
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @_func303_str1
  %9 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)
  br label %endif_0
endif_0:

;stmt5:
  %12 = load %Unit*, %Unit** @fout
  %13 = load %Str, %Str* @_func303_str2
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13)

;stmt6:
  %15 = alloca %Bool

;stmt7:
  store %Bool 0, %Bool* %15

;stmt8:
  %16 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i32 0, i32 0
  %17 = load %List*, %List** %16
  %18 = getelementptr inbounds %Bool, %Bool* %15, i32 0
  %19 = bitcast %Bool* %18 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %17, %ListForeachHandler @pt_print_param, %Unit* %19)

;stmt9:
  %20 = getelementptr inbounds %TypeFunc, %TypeFunc* %0, i32 0, i32 2
  %21 = load %Bool, %Bool* %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %22 = load %Str, %Str* @_func303_str3
  call void (%Str) @o (%Str %22)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %23 = load %Unit*, %Unit** @fout
  %24 = load %Str, %Str* @_func303_str4
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %23, %Str %24)

;stmt13:
  br i1 %1, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %26 = load %Unit*, %Unit** @fout
  %27 = load %Str, %Str* @_func303_str5
  %28 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %26, %Str %27)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  ret void
}

define void @reset_local_labels () {

;stmt0:
  store %Nat32 0, %Nat32* @if_id

;stmt1:
  store %Nat32 0, %Nat32* @global_while_id

;stmt2:
  store %Nat32 0, %Nat32* @old_while_id

;stmt3:
  store %Nat32 0, %Nat32* @stmtno

;stmt4:
  store %Nat32 0, %Nat32* @blockno
  ret void
}

define void @print_stmt (%Stmt*) {

;stmt0:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func306_str1
  %4 = load %Nat32, %Nat32* @stmtno
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Nat32 %4)

;stmt1:
  %6 = load %Nat32, %Nat32* @stmtno
  %7 = add %Nat32 %6, 1
  store %Nat32 %7, %Nat32* @stmtno

;stmt2:
  %8 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 0
  %9 = load %StmtKind, %StmtKind* %8

;stmt3:
  %10 = icmp eq %StmtKind %9, 1
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %11 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 2
  %12 = load %Block*, %Block** %11
  call void (%Block*) @print_block (%Block* %12)
  br label %endif_0
else_0:

;stmt6:
  %13 = icmp eq %StmtKind %9, 0
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %14 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 3
  %15 = load %Expr*, %Expr** %14
  call void (%Expr*) @print_stmt_expr (%Expr* %15)
  br label %endif_1
else_1:

;stmt9:
  %16 = icmp eq %StmtKind %9, 2
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %17 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 4
  %18 = load %VarDef*, %VarDef** %17
  call void (%VarDef*) @print_stmt_var (%VarDef* %18)
  br label %endif_2
else_2:

;stmt12:
  %19 = icmp eq %StmtKind %9, 3
  br i1 %19, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %20 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 1
  %21 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %20, i32 0, %Int32 0
  %22 = load %Value*, %Value** %21
  %23 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 1
  %24 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %23, i32 0, %Int32 1
  %25 = load %Value*, %Value** %24
  call void (%Value*, %Value*) @print_st (%Value* %22, %Value* %25)
  br label %endif_3
else_3:

;stmt15:
  %26 = icmp eq %StmtKind %9, 4
  br i1 %26, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %27 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 6
  %28 = load %If*, %If** %27
  call void (%If*) @print_stmt_if (%If* %28)
  br label %endif_4
else_4:

;stmt18:
  %29 = icmp eq %StmtKind %9, 5
  br i1 %29, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %30 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 5
  %31 = load %While*, %While** %30
  call void (%While*) @print_stmt_while (%While* %31)
  br label %endif_5
else_5:

;stmt21:
  %32 = icmp eq %StmtKind %9, 6
  br i1 %32, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %33 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 1
  %34 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %33, i32 0, %Int32 0
  %35 = load %Value*, %Value** %34
  call void (%Value*) @print_stmt_return (%Value* %35)
  br label %endif_6
else_6:

;stmt24:
  %36 = icmp eq %StmtKind %9, 7
  br i1 %36, label %then_7, label %else_7
then_7:

;stmt25:

;stmt26:
  call void () @print_stmt_break ()
  br label %endif_7
else_7:

;stmt27:
  %37 = icmp eq %StmtKind %9, 8
  br i1 %37, label %then_8, label %else_8
then_8:

;stmt28:

;stmt29:
  call void () @print_stmt_continue ()
  br label %endif_8
else_8:

;stmt30:
  %38 = icmp eq %StmtKind %9, 9
  br i1 %38, label %then_9, label %else_9
then_9:

;stmt31:

;stmt32:
  %39 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 7
  %40 = load %Str, %Str* %39
  call void (%Str) @print_stmt_goto (%Str %40)
  br label %endif_9
else_9:

;stmt33:
  %41 = icmp eq %StmtKind %9, 10
  br i1 %41, label %then_10, label %else_10
then_10:

;stmt34:

;stmt35:
  %42 = getelementptr inbounds %Stmt, %Stmt* %0, i32 0, i32 7
  %43 = load %Str, %Str* %42
  call void (%Str) @print_stmt_label (%Str %43)
  br label %endif_10
else_10:

;stmt36:

;stmt37:
  %44 = load %Unit*, %Unit** @fout
  %45 = load %Str, %Str* @_func306_str2
  %46 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %44, %Str %45)

;stmt38:
  call void (%Int32) @exit (%Int32 1)
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

define void @print_stmt_var (%VarDef*) {

;stmt0:
  %2 = call %Nat32 () @lab_get ()

;stmt1:
  %3 = getelementptr inbounds %VarDef, %VarDef* %0, i32 0, i32 1
  store %Nat32 %2, %Nat32* %3

;stmt2:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func307_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5, %Nat32 %2)

;stmt3:
  %7 = getelementptr inbounds %VarDef, %VarDef* %0, i32 0, i32 2
  %8 = load %Type*, %Type** %7
  call void (%Type*, %Bool, %Bool) @printType (%Type* %8, %Bool 1, %Bool 1)
  ret void
}

define void @print_stmt_expr (%Expr*) {

;stmt0:
  %2 = getelementptr inbounds %Expr, %Expr* %0, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %Operand (%Value*) @eval (%Value* %3)
  %5 = call %Operand (%Operand) @load (%Operand %4)

;stmt1:
  %6 = getelementptr inbounds %Expr, %Expr* %0, i32 0, i32 1
  %7 = extractvalue %Operand %5, 4
  store %Nat32 %7, %Nat32* %6
  ret void
}

define void @print_stmt_if (%If*) {

;stmt0:
  %2 = load %Nat32, %Nat32* @if_id

;stmt1:
  %3 = load %Nat32, %Nat32* @if_id
  %4 = add %Nat32 %3, 1
  store %Nat32 %4, %Nat32* @if_id

;stmt2:
  %5 = getelementptr inbounds %If, %If* %0, i32 0, i32 0
  %6 = load %Value*, %Value** %5
  %7 = call %Operand (%Value*) @eval (%Value* %6)
  %8 = call %Operand (%Operand) @load (%Operand %7)

;stmt3:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @_func309_str1
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10)

;stmt4:
  call void (%Operand) @print_operand (%Operand %8)

;stmt5:
  %12 = load %Unit*, %Unit** @fout
  %13 = load %Str, %Str* @_func309_str2
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13, %Nat32 %2, %Nat32 %2)

;stmt6:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @_func309_str3
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16, %Nat32 %2)

;stmt7:
  %18 = getelementptr inbounds %If, %If* %0, i32 0, i32 1
  %19 = load %Stmt*, %Stmt** %18
  call void (%Stmt*) @print_stmt (%Stmt* %19)

;stmt8:
  %20 = load %Unit*, %Unit** @fout
  %21 = load %Str, %Str* @_func309_str4
  %22 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %20, %Str %21, %Nat32 %2)

;stmt9:
  %23 = load %Unit*, %Unit** @fout
  %24 = load %Str, %Str* @_func309_str5
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %23, %Str %24, %Nat32 %2)

;stmt10:
  %26 = getelementptr inbounds %If, %If* %0, i32 0, i32 2
  %27 = load %Stmt*, %Stmt** %26
  %28 = bitcast %Stmt* %27 to %Unit*
  %29 = inttoptr i64 0 to %Unit*
  %30 = icmp ne %Unit* %28, %29
  br i1 %30, label %then_0, label %else_0
then_0:

;stmt11:

;stmt12:
  %31 = getelementptr inbounds %If, %If* %0, i32 0, i32 2
  %32 = load %Stmt*, %Stmt** %31
  call void (%Stmt*) @print_stmt (%Stmt* %32)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt13:
  %33 = load %Unit*, %Unit** @fout
  %34 = load %Str, %Str* @_func309_str6
  %35 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %33, %Str %34, %Nat32 %2)

;stmt14:
  %36 = load %Unit*, %Unit** @fout
  %37 = load %Str, %Str* @_func309_str7
  %38 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %36, %Str %37, %Nat32 %2)
  ret void
}

define void @print_stmt_while (%While*) {

;stmt0:
  %2 = load %Nat32, %Nat32* @old_while_id

;stmt1:
  %3 = load %Nat32, %Nat32* @global_while_id
  store %Nat32 %3, %Nat32* @old_while_id

;stmt2:
  %4 = load %Nat32, %Nat32* @global_while_id
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* @global_while_id

;stmt3:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @_func310_str1
  %8 = load %Nat32, %Nat32* @old_while_id
  %9 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7, %Nat32 %8)

;stmt4:
  %10 = load %Unit*, %Unit** @fout
  %11 = load %Str, %Str* @_func310_str2
  %12 = load %Nat32, %Nat32* @old_while_id
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11, %Nat32 %12)

;stmt5:
  %14 = getelementptr inbounds %While, %While* %0, i32 0, i32 0
  %15 = load %Value*, %Value** %14
  %16 = call %Operand (%Value*) @eval (%Value* %15)
  %17 = call %Operand (%Operand) @load (%Operand %16)

;stmt6:
  %18 = load %Unit*, %Unit** @fout
  %19 = load %Str, %Str* @_func310_str3
  %20 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %18, %Str %19)

;stmt7:
  call void (%Operand) @print_operand (%Operand %17)

;stmt8:
  %21 = load %Unit*, %Unit** @fout
  %22 = load %Str, %Str* @_func310_str4
  %23 = load %Nat32, %Nat32* @old_while_id
  %24 = load %Nat32, %Nat32* @old_while_id
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22, %Nat32 %23, %Nat32 %24)

;stmt9:
  %26 = load %Unit*, %Unit** @fout
  %27 = load %Str, %Str* @_func310_str5
  %28 = load %Nat32, %Nat32* @old_while_id
  %29 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %26, %Str %27, %Nat32 %28)

;stmt10:
  %30 = getelementptr inbounds %While, %While* %0, i32 0, i32 1
  %31 = load %Stmt*, %Stmt** %30
  call void (%Stmt*) @print_stmt (%Stmt* %31)

;stmt11:
  %32 = load %Unit*, %Unit** @fout
  %33 = load %Str, %Str* @_func310_str6
  %34 = load %Nat32, %Nat32* @old_while_id
  %35 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %32, %Str %33, %Nat32 %34)

;stmt12:
  %36 = load %Unit*, %Unit** @fout
  %37 = load %Str, %Str* @_func310_str7
  %38 = load %Nat32, %Nat32* @old_while_id
  %39 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %36, %Str %37, %Nat32 %38)

;stmt13:
  store %Nat32 %2, %Nat32* @old_while_id
  ret void
}

define void @print_stmt_return (%Value*) {

;stmt0:
  %2 = bitcast %Value* %0 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = call %Nat32 () @lab_get ()

;stmt3:
  %6 = load %Str, %Str* @_func311_str1
  call void (%Str) @o (%Str %6)

;stmt4:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = call %Operand (%Value*) @eval (%Value* %0)
  %9 = call %Operand (%Operand) @load (%Operand %8)

;stmt6:
  %10 = load %Unit*, %Unit** @fout
  %11 = load %Str, %Str* @_func311_str2
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11)

;stmt7:
  %13 = extractvalue %Operand %9, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %13, %Bool 1, %Bool 1)

;stmt8:
  call void () @space ()

;stmt9:
  call void (%Operand) @print_operand (%Operand %9)

;stmt10:
  %14 = call %Nat32 () @lab_get ()
  ret void
}

define void @print_stmt_break () {

;stmt0:
  %1 = call %Nat32 () @lab_get ()

;stmt1:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func312_str1
  %4 = load %Nat32, %Nat32* @old_while_id
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @print_stmt_continue () {

;stmt0:
  %1 = call %Nat32 () @lab_get ()

;stmt1:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func313_str1
  %4 = load %Nat32, %Nat32* @old_while_id
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @print_stmt_goto (%Str) {

;stmt0:
  %2 = call %Nat32 () @lab_get ()

;stmt1:
  %3 = load %Unit*, %Unit** @fout
  %4 = load %Str, %Str* @_func314_str1
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4, %Str %0)
  ret void
}

define void @print_stmt_label (%Str) {

;stmt0:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func315_str1
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Str %0)

;stmt1:
  %5 = load %Unit*, %Unit** @fout
  %6 = load %Str, %Str* @_func315_str2
  %7 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %5, %Str %6, %Str %0)
  ret void
}

define void @for_stmt (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = load %Nat32, %Nat32* @blockno
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* @blockno

;stmt1:
  %6 = bitcast %Unit* %0 to %Stmt*
  call void (%Stmt*) @print_stmt (%Stmt* %6)
  ret void
}

define void @print_block (%Block*) {

;stmt0:
  %2 = getelementptr inbounds %Block, %Block* %0, i32 0, i32 2
  %3 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %2, %ListForeachHandler @for_stmt, %Unit* %3)
  ret void
}

define %Operand @operand (%Type*, %OperandKind, %Nat32) {

;stmt0:
  %4 = alloca %Operand

;stmt1:
  %5 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 1
  store %Type* %0, %Type** %5

;stmt2:
  %6 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 0
  store %OperandKind %1, %OperandKind* %6

;stmt3:
  %7 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 4
  store %Nat32 %2, %Nat32* %7

;stmt4:
  %8 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 3
  %9 = inttoptr i64 0 to %Str
  store %Str %9, %Str* %8

;stmt5:
  %10 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 2
  store %Int64 0, %Int64* %10

;stmt6:
  %11 = load %Operand, %Operand* %4
  ret %Operand %11
}

define %Operand @eval (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %3 = load %ValueKind, %ValueKind* %2

;stmt1:
  %4 = alloca %Operand

;stmt2:
  %5 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 1
  %6 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %7 = load %Type*, %Type** %6
  store %Type* %7, %Type** %5

;stmt3:
  %8 = icmp ne %ValueKind %3, 1
  %9 = load %Str, %Str* @_func319_str1
  call void (%Bool, %Str) @assert (%Bool %8, %Str %9)

;stmt4:
  %10 = icmp eq %ValueKind %3, 2
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %11 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 0
  store %OperandKind 1, %OperandKind* %11

;stmt7:
  %12 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 2
  %13 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 2
  %14 = load %Int64, %Int64* %13
  store %Int64 %14, %Int64* %12

;stmt8:
  %15 = load %Operand, %Operand* %4
  ret %Operand %15
  br label %endif_0
else_0:

;stmt9:
  %17 = icmp eq %ValueKind %3, 3
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %18 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 0
  store %OperandKind 2, %OperandKind* %18

;stmt12:
  %19 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 3
  %20 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 3
  %21 = load %Definition*, %Definition** %20
  %22 = getelementptr inbounds %Definition, %Definition* %21, i32 0, i32 1
  %23 = load %Str, %Str* %22
  store %Str %23, %Str* %19

;stmt13:
  %24 = load %Operand, %Operand* %4
  ret %Operand %24
  br label %endif_1
else_1:

;stmt14:
  %26 = icmp eq %ValueKind %3, 7
  br i1 %26, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  %27 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 0
  store %OperandKind 3, %OperandKind* %27

;stmt17:
  %28 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 4
  %29 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 4
  %30 = load %VarDef*, %VarDef** %29
  %31 = getelementptr inbounds %VarDef, %VarDef* %30, i32 0, i32 1
  %32 = load %Nat32, %Nat32* %31
  store %Nat32 %32, %Nat32* %28

;stmt18:
  %33 = load %Operand, %Operand* %4
  ret %Operand %33
  br label %endif_2
else_2:

;stmt19:
  %35 = icmp eq %ValueKind %3, 4
  br i1 %35, label %then_3, label %else_3
then_3:

;stmt20:

;stmt21:
  %36 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 0
  store %OperandKind 4, %OperandKind* %36

;stmt22:
  %37 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 3
  %38 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 3
  %39 = load %Definition*, %Definition** %38
  %40 = getelementptr inbounds %Definition, %Definition* %39, i32 0, i32 1
  %41 = load %Str, %Str* %40
  store %Str %41, %Str* %37

;stmt23:
  %42 = load %Operand, %Operand* %4
  ret %Operand %42
  br label %endif_3
else_3:

;stmt24:
  %44 = icmp eq %ValueKind %3, 6
  br i1 %44, label %then_4, label %else_4
then_4:

;stmt25:

;stmt26:
  %45 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 0
  store %OperandKind 6, %OperandKind* %45

;stmt27:
  %46 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 4
  %47 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 6
  %48 = load %Expr*, %Expr** %47
  %49 = getelementptr inbounds %Expr, %Expr* %48, i32 0, i32 1
  %50 = load %Nat32, %Nat32* %49
  store %Nat32 %50, %Nat32* %46

;stmt28:
  %51 = load %Operand, %Operand* %4
  ret %Operand %51
  br label %endif_4
else_4:

;stmt29:
  %53 = icmp eq %ValueKind %3, 5
  br i1 %53, label %then_5, label %else_5
then_5:

;stmt30:

;stmt31:
  %54 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 0
  store %OperandKind 6, %OperandKind* %54

;stmt32:
  %55 = getelementptr inbounds %Operand, %Operand* %4, i32 0, i32 4
  %56 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 5
  %57 = load %Field*, %Field** %56
  %58 = getelementptr inbounds %Field, %Field* %57, i32 0, i32 2
  %59 = load %Nat16, %Nat16* %58
  %60 = zext %Nat16 %59 to %Nat32
  store %Nat32 %60, %Nat32* %55

;stmt33:
  %61 = load %Operand, %Operand* %4
  ret %Operand %61
  br label %endif_5
else_5:

;stmt34:
  %63 = icmp eq %ValueKind %3, 28
  br i1 %63, label %then_6, label %else_6
then_6:

;stmt35:

;stmt36:
  %64 = call %Operand (%Value*) @eval_call (%Value* %0)
  ret %Operand %64
  br label %endif_6
else_6:

;stmt37:
  %66 = icmp eq %ValueKind %3, 29
  br i1 %66, label %then_7, label %else_7
then_7:

;stmt38:

;stmt39:
  %67 = call %Operand (%Value*) @eval_index (%Value* %0)
  ret %Operand %67
  br label %endif_7
else_7:

;stmt40:
  %69 = icmp eq %ValueKind %3, 30
  br i1 %69, label %then_8, label %else_8
then_8:

;stmt41:

;stmt42:
  %70 = call %Operand (%Value*) @eval_access (%Value* %0)
  ret %Operand %70
  br label %endif_8
else_8:

;stmt43:
  %72 = icmp eq %ValueKind %3, 8
  br i1 %72, label %then_9, label %else_9
then_9:

;stmt44:

;stmt45:
  %73 = call %Operand (%Value*) @eval_ref (%Value* %0)
  ret %Operand %73
  br label %endif_9
else_9:

;stmt46:
  %75 = icmp eq %ValueKind %3, 9
  br i1 %75, label %then_10, label %else_10
then_10:

;stmt47:

;stmt48:
  %76 = call %Operand (%Value*) @eval_deref (%Value* %0)
  ret %Operand %76
  br label %endif_10
else_10:

;stmt49:
  %78 = icmp eq %ValueKind %3, 11
  br i1 %78, label %then_11, label %else_11
then_11:

;stmt50:

;stmt51:
  %79 = call %Operand (%Value*) @eval_minus (%Value* %0)
  ret %Operand %79
  br label %endif_11
else_11:

;stmt52:
  %81 = icmp eq %ValueKind %3, 10
  br i1 %81, label %then_12, label %else_12
then_12:

;stmt53:

;stmt54:
  %82 = call %Operand (%Value*) @eval_not (%Value* %0)
  ret %Operand %82
  br label %endif_12
else_12:

;stmt55:
  %84 = icmp eq %ValueKind %3, 31
  br i1 %84, label %then_13, label %else_13
then_13:

;stmt56:

;stmt57:
  %85 = call %Operand (%Value*) @eval_cast (%Value* %0)
  ret %Operand %85
  br label %endif_13
else_13:
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

;stmt58:
  %87 = call %Operand (%Value*) @eval_bin (%Value* %0)
  ret %Operand %87
}

define void @eval_args (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Value*

;stmt1:
  %5 = bitcast %Unit* %1 to %Arguments*

;stmt2:
  %6 = call %Operand (%Value*) @eval (%Value* %4)
  %7 = call %Operand (%Operand) @load (%Operand %6)

;stmt3:
  %8 = getelementptr inbounds %Arguments, %Arguments* %5, i32 0, i32 0
  %9 = getelementptr inbounds %Arguments, %Arguments* %5, i32 0, i32 1
  %10 = load %Nat16, %Nat16* %9
  %11 = getelementptr inbounds [64 x %Operand], [64 x %Operand]* %8, i32 0, %Nat16 %10
  store %Operand %7, %Operand* %11

;stmt4:
  %12 = getelementptr inbounds %Arguments, %Arguments* %5, i32 0, i32 1
  %13 = getelementptr inbounds %Arguments, %Arguments* %5, i32 0, i32 1
  %14 = load %Nat16, %Nat16* %13
  %15 = add %Nat16 %14, 1
  store %Nat16 %15, %Nat16* %12
  ret void
}

define %Operand @eval_call (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 12
  %3 = getelementptr inbounds %ValueCall, %ValueCall* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Operand (%Value*) @eval (%Value* %4)
  %6 = call %Operand (%Operand) @load (%Operand %5)

;stmt1:
  %7 = alloca %Arguments

;stmt2:
  %8 = getelementptr inbounds %Arguments, %Arguments* %7, i32 0, i32 1
  store %Nat16 0, %Nat16* %8

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 12
  %10 = getelementptr inbounds %ValueCall, %ValueCall* %9, i32 0, i32 1
  %11 = load %List*, %List** %10
  %12 = getelementptr inbounds %Arguments, %Arguments* %7, i32 0
  %13 = bitcast %Arguments* %12 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %11, %ListForeachHandler @eval_args, %Unit* %13)

;stmt4:
  %14 = alloca %Nat32

;stmt5:
  %15 = extractvalue %Operand %6, 1
  %16 = getelementptr inbounds %Type, %Type* %15, i32 0, i32 6
  %17 = getelementptr inbounds %TypeFunc, %TypeFunc* %16, i32 0, i32 1
  %18 = load %Type*, %Type** %17
  %19 = load %Type*, %Type** @typeUnit
  %20 = call %Bool (%Type*, %Type*) @type_eq (%Type* %18, %Type* %19)
  br i1 %20, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %21 = load %Unit*, %Unit** @fout
  %22 = load %Str, %Str* @_func320_str1
  %23 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22)
  br label %endif_0
else_0:

;stmt8:

;stmt9:
  %24 = call %Nat32 () @lab_get ()
  store %Nat32 %24, %Nat32* %14

;stmt10:
  %25 = load %Unit*, %Unit** @fout
  %26 = load %Str, %Str* @_func320_str2
  %27 = load %Nat32, %Nat32* %14
  %28 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %25, %Str %26, %Nat32 %27)
  br label %endif_0
endif_0:

;stmt11:
  %29 = extractvalue %Operand %6, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %29, %Bool 0, %Bool 0)

;stmt12:
  call void () @space ()

;stmt13:
  call void (%Operand) @print_operand (%Operand %6)

;stmt14:
  %30 = load %Str, %Str* @_func320_str3
  call void (%Str) @o (%Str %30)

;stmt15:
  %31 = alloca %Bool

;stmt16:
  store %Bool 0, %Bool* %31

;stmt17:
  %32 = alloca %Nat16

;stmt18:
  store %Nat16 0, %Nat16* %32

;stmt19:
  br label %continue_0
continue_0:
  %33 = load %Nat16, %Nat16* %32
  %34 = getelementptr inbounds %Arguments, %Arguments* %7, i32 0, i32 1
  %35 = load %Nat16, %Nat16* %34
  %36 = icmp ult %Nat16 %33, %35
  br i1 %36, label %body_0, label %break_0
body_0:

;stmt20:

;stmt21:
  %37 = load %Bool, %Bool* %31
  br i1 %37, label %then_1, label %else_1
then_1:

;stmt22:

;stmt23:
  call void () @comma ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt24:
  %38 = getelementptr inbounds %Arguments, %Arguments* %7, i32 0, i32 0
  %39 = load %Nat16, %Nat16* %32
  %40 = getelementptr inbounds [64 x %Operand], [64 x %Operand]* %38, i32 0, %Nat16 %39
  %41 = getelementptr inbounds %Operand, %Operand* %40, i32 0, i32 1
  %42 = load %Type*, %Type** %41
  call void (%Type*, %Bool, %Bool) @printType (%Type* %42, %Bool 1, %Bool 1)

;stmt25:
  call void () @space ()

;stmt26:
  %43 = getelementptr inbounds %Arguments, %Arguments* %7, i32 0, i32 0
  %44 = load %Nat16, %Nat16* %32
  %45 = getelementptr inbounds [64 x %Operand], [64 x %Operand]* %43, i32 0, %Nat16 %44
  %46 = load %Operand, %Operand* %45
  call void (%Operand) @print_operand (%Operand %46)

;stmt27:
  store %Bool 1, %Bool* %31

;stmt28:
  %47 = load %Nat16, %Nat16* %32
  %48 = add %Nat16 %47, 1
  store %Nat16 %48, %Nat16* %32
  br label %continue_0
break_0:

;stmt29:
  %49 = load %Str, %Str* @_func320_str4
  call void (%Str) @o (%Str %49)

;stmt30:
  %50 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %51 = load %Type*, %Type** %50
  %52 = load %Nat32, %Nat32* %14
  %53 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %51, %OperandKind 6, %Nat32 %52)
  ret %Operand %53
}

define %Operand @eval_index (%Value*) {

;stmt0:
  %2 = alloca %Operand

;stmt1:
  %3 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %4 = getelementptr inbounds %ValueIndex, %ValueIndex* %3, i32 0, i32 0
  %5 = load %Value*, %Value** %4
  %6 = call %Operand (%Value*) @eval (%Value* %5)
  store %Operand %6, %Operand* %2

;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 9
  %8 = getelementptr inbounds %ValueIndex, %ValueIndex* %7, i32 0, i32 1
  %9 = load %Value*, %Value** %8
  %10 = call %Operand (%Value*) @eval (%Value* %9)
  %11 = call %Operand (%Operand) @load (%Operand %10)

;stmt3:
  %12 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = getelementptr inbounds %Type, %Type* %13, i32 0, i32 8
  %15 = getelementptr inbounds %TypeArray, %TypeArray* %14, i32 0, i32 2
  %16 = load %Bool, %Bool* %15
  br i1 %16, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %17 = load %Operand, %Operand* %2
  %18 = call %Operand (%Operand) @load (%Operand %17)
  store %Operand %18, %Operand* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %19 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 0
  %20 = load %OperandKind, %OperandKind* %19
  %21 = icmp eq %OperandKind %20, 6
  %22 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = call %Bool (%Type*) @typeIsDefinedArray (%Type* %23)
  %25 = and %Bool %21, %24

;stmt7:
  %26 = and %Bool %25, 1
  br i1 %26, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %27 = call %Nat32 () @lab_get ()

;stmt10:
  %28 = load %Unit*, %Unit** @fout
  %29 = load %Str, %Str* @_func322_str1
  %30 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %28, %Str %29, %Nat32 %27)

;stmt11:
  %31 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %32 = load %Type*, %Type** %31
  call void (%Type*, %Bool, %Bool) @printType (%Type* %32, %Bool 1, %Bool 1)

;stmt12:
  call void () @space ()

;stmt13:
  %33 = load %Operand, %Operand* %2
  call void (%Operand) @print_operand (%Operand %33)

;stmt14:
  %34 = load %Unit*, %Unit** @fout
  %35 = load %Str, %Str* @_func322_str2
  %36 = extractvalue %Operand %11, 2
  %37 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %34, %Str %35, %Int64 %36)

;stmt15:
  %38 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %39 = load %Type*, %Type** %38
  %40 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %39, %OperandKind 6, %Nat32 %27)
  ret %Operand %40
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt16:
  %42 = call %Nat32 () @lab_get ()

;stmt17:
  %43 = load %Unit*, %Unit** @fout
  %44 = load %Str, %Str* @_func322_str3
  %45 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %43, %Str %44, %Nat32 %42)

;stmt18:
  %46 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %47 = load %Type*, %Type** %46

;stmt19:
  %48 = getelementptr inbounds %Type, %Type* %47, i32 0, i32 8
  %49 = getelementptr inbounds %TypeArray, %TypeArray* %48, i32 0, i32 2
  %50 = load %Bool, %Bool* %49
  br i1 %50, label %then_2, label %else_2
then_2:

;stmt20:

;stmt21:
  %51 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %52 = load %Type*, %Type** %51
  call void (%Type*, %Bool, %Bool) @printType (%Type* %52, %Bool 1, %Bool 1)
  br label %endif_2
else_2:

;stmt22:

;stmt23:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %47, %Bool 1, %Bool 1)
  br label %endif_2
endif_2:

;stmt24:
  call void () @comma ()

;stmt25:
  %53 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %54 = load %Type*, %Type** %53
  call void (%Type*, %Bool, %Bool) @printType (%Type* %54, %Bool 1, %Bool 1)

;stmt26:
  %55 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %56 = load %Type*, %Type** %55
  %57 = getelementptr inbounds %Type, %Type* %56, i32 0, i32 8
  %58 = getelementptr inbounds %TypeArray, %TypeArray* %57, i32 0, i32 2
  %59 = load %Bool, %Bool* %58
  br i1 %59, label %then_3, label %else_3
then_3:

;stmt27:

;stmt28:
  call void () @space ()
  br label %endif_3
else_3:

;stmt29:

;stmt30:
  %60 = load %Str, %Str* @_func322_str4
  call void (%Str) @o (%Str %60)
  br label %endif_3
endif_3:

;stmt31:
  %61 = load %Operand, %Operand* %2
  call void (%Operand) @print_operand (%Operand %61)

;stmt32:
  %62 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %63 = load %Type*, %Type** %62
  %64 = getelementptr inbounds %Type, %Type* %63, i32 0, i32 8
  %65 = getelementptr inbounds %TypeArray, %TypeArray* %64, i32 0, i32 2
  %66 = load %Bool, %Bool* %65
  %67 = xor %Bool %66, 1
  br i1 %67, label %then_4, label %else_4
then_4:

;stmt33:

;stmt34:
  %68 = load %Str, %Str* @_func322_str5
  call void (%Str) @o (%Str %68)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:

;stmt35:
  call void () @comma ()

;stmt36:
  %69 = extractvalue %Operand %11, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %69, %Bool 1, %Bool 1)

;stmt37:
  call void () @space ()

;stmt38:
  call void (%Operand) @print_operand (%Operand %11)

;stmt39:
  %70 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %71 = load %Type*, %Type** %70
  %72 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %71, %OperandKind 5, %Nat32 %42)
  ret %Operand %72
}

define %Operand @eval_access (%Value*) {

;stmt0:
  %2 = alloca %Operand

;stmt1:
  %3 = alloca %Type*

;stmt2:
  %4 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 10
  %5 = getelementptr inbounds %ValueAccess, %ValueAccess* %4, i32 0, i32 0
  %6 = load %Value*, %Value** %5
  %7 = call %Operand (%Value*) @eval (%Value* %6)
  store %Operand %7, %Operand* %2

;stmt3:
  %8 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %Type, %Type* %9, i32 0, i32 0
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp eq %TypeKind %11, 6
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %13 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i32 0, i32 7
  %16 = getelementptr inbounds %TypePointer, %TypePointer* %15, i32 0, i32 0
  %17 = load %Type*, %Type** %16
  store %Type* %17, %Type** %3

;stmt6:
  %18 = load %Operand, %Operand* %2
  %19 = call %Operand (%Operand) @load (%Operand %18)
  store %Operand %19, %Operand* %2
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %20 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %21 = load %Type*, %Type** %20
  store %Type* %21, %Type** %3
  br label %endif_0
endif_0:

;stmt9:
  %22 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 10
  %23 = getelementptr inbounds %ValueAccess, %ValueAccess* %22, i32 0, i32 1
  %24 = load %Str, %Str* %23
  %25 = bitcast %Str %24 to %Unit*
  %26 = inttoptr i64 0 to %Unit*
  %27 = icmp ne %Unit* %25, %26
  %28 = load %Str, %Str* @_func323_str1
  call void (%Bool, %Str) @assert (%Bool %27, %Str %28)

;stmt10:
  %29 = load %Type*, %Type** %3
  %30 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 10
  %31 = getelementptr inbounds %ValueAccess, %ValueAccess* %30, i32 0, i32 1
  %32 = load %Str, %Str* %31
  %33 = call %Field* (%Type*, %Str) @type_record_get_field (%Type* %29, %Str %32)

;stmt11:
  %34 = getelementptr inbounds %Field, %Field* %33, i32 0, i32 2
  %35 = load %Nat16, %Nat16* %34

;stmt12:
  %36 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 0
  %37 = load %OperandKind, %OperandKind* %36
  %38 = icmp eq %OperandKind %37, 6
  %39 = getelementptr inbounds %Operand, %Operand* %2, i32 0, i32 1
  %40 = load %Type*, %Type** %39
  %41 = getelementptr inbounds %Type, %Type* %40, i32 0, i32 0
  %42 = load %TypeKind, %TypeKind* %41
  %43 = icmp eq %TypeKind %42, 5
  %44 = and %Bool %38, %43

;stmt13:
  br i1 %44, label %then_1, label %else_1
then_1:

;stmt14:

;stmt15:
  %45 = call %Nat32 () @lab_get ()

;stmt16:
  %46 = load %Unit*, %Unit** @fout
  %47 = load %Str, %Str* @_func323_str2
  %48 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %46, %Str %47, %Nat32 %45)

;stmt17:
  %49 = load %Type*, %Type** %3
  call void (%Type*, %Bool, %Bool) @printType (%Type* %49, %Bool 1, %Bool 1)

;stmt18:
  call void () @space ()

;stmt19:
  %50 = load %Operand, %Operand* %2
  call void (%Operand) @print_operand (%Operand %50)

;stmt20:
  %51 = load %Unit*, %Unit** @fout
  %52 = load %Str, %Str* @_func323_str3
  %53 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %51, %Str %52, %Nat16 %35)

;stmt21:
  %54 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %55 = load %Type*, %Type** %54
  %56 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %55, %OperandKind 6, %Nat32 %45)
  ret %Operand %56
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt22:
  %58 = call %Nat32 () @lab_get ()

;stmt23:
  %59 = load %Unit*, %Unit** @fout
  %60 = load %Str, %Str* @_func323_str4
  %61 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %59, %Str %60, %Nat32 %58)

;stmt24:
  %62 = load %Type*, %Type** %3
  call void (%Type*, %Bool, %Bool) @printType (%Type* %62, %Bool 1, %Bool 1)

;stmt25:
  call void () @comma ()

;stmt26:
  %63 = load %Type*, %Type** %3
  call void (%Type*, %Bool, %Bool) @printType (%Type* %63, %Bool 1, %Bool 1)

;stmt27:
  %64 = load %Str, %Str* @_func323_str5
  call void (%Str) @o (%Str %64)

;stmt28:
  %65 = load %Operand, %Operand* %2
  call void (%Operand) @print_operand (%Operand %65)

;stmt29:
  %66 = load %Unit*, %Unit** @fout
  %67 = load %Str, %Str* @_func323_str6
  %68 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %66, %Str %67, %Nat16 %35)

;stmt30:
  %69 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %70 = load %Type*, %Type** %69
  %71 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %70, %OperandKind 5, %Nat32 %58)
  ret %Operand %71
}

define %Operand @eval_ref (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 7
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Operand (%Value*) @eval (%Value* %4)

;stmt1:
  %6 = extractvalue %Operand %5, 0
  %7 = icmp eq %OperandKind %6, 5
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = extractvalue %Operand %5, 4
  %11 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %9, %OperandKind 6, %Nat32 %10)
  ret %Operand %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %13 = call %Nat32 () @lab_get ()

;stmt5:
  %14 = load %Unit*, %Unit** @fout
  %15 = load %Str, %Str* @_func324_str1
  %16 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15, %Nat32 %13)

;stmt6:
  %17 = extractvalue %Operand %5, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %17, %Bool 1, %Bool 1)

;stmt7:
  call void () @comma ()

;stmt8:
  %18 = extractvalue %Operand %5, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %18, %Bool 1, %Bool 1)

;stmt9:
  %19 = load %Str, %Str* @_func324_str2
  call void (%Str) @o (%Str %19)

;stmt10:
  call void (%Operand) @print_operand (%Operand %5)

;stmt11:
  call void () @comma ()

;stmt12:
  %20 = load %Str, %Str* @_func324_str3
  call void (%Str) @o (%Str %20)

;stmt13:
  %21 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %22, %OperandKind 6, %Nat32 %13)
  ret %Operand %23
}

define %Operand @eval_deref (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 7
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Operand (%Value*) @eval (%Value* %4)
  %6 = call %Operand (%Operand) @load (%Operand %5)

;stmt1:
  %7 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = extractvalue %Operand %6, 4
  %10 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %8, %OperandKind 5, %Nat32 %9)
  ret %Operand %10
}

define %Operand @eval_not (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 7
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Operand (%Value*) @eval (%Value* %4)
  %6 = call %Operand (%Operand) @load (%Operand %5)

;stmt1:
  %7 = call %Nat32 () @lab_get ()

;stmt2:
  %8 = load %Unit*, %Unit** @fout
  %9 = load %Str, %Str* @_func326_str1
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Nat32 %7)

;stmt3:
  %11 = extractvalue %Operand %6, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)

;stmt4:
  call void () @space ()

;stmt5:
  call void (%Operand) @print_operand (%Operand %6)

;stmt6:
  %12 = extractvalue %Operand %6, 1
  %13 = load %Type*, %Type** @typeBool
  %14 = call %Bool (%Type*, %Type*) @type_eq (%Type* %12, %Type* %13)
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %15 = load %Str, %Str* @_func326_str2
  call void (%Str) @o (%Str %15)
  br label %endif_0
else_0:

;stmt9:

;stmt10:
  %16 = load %Str, %Str* @_func326_str3
  call void (%Str) @o (%Str %16)
  br label %endif_0
endif_0:

;stmt11:
  %17 = extractvalue %Operand %6, 1
  %18 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %17, %OperandKind 6, %Nat32 %7)
  ret %Operand %18
}

define %Operand @eval_minus (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 7
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Operand (%Value*) @eval (%Value* %4)
  %6 = call %Operand (%Operand) @load (%Operand %5)

;stmt1:
  %7 = call %Nat32 () @lab_get ()

;stmt2:
  %8 = load %Unit*, %Unit** @fout
  %9 = load %Str, %Str* @_func327_str1
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Nat32 %7)

;stmt3:
  %11 = extractvalue %Operand %6, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)

;stmt4:
  %12 = load %Unit*, %Unit** @fout
  %13 = load %Str, %Str* @_func327_str2
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13)

;stmt5:
  call void () @comma ()

;stmt6:
  call void (%Operand) @print_operand (%Operand %6)

;stmt7:
  %15 = extractvalue %Operand %6, 1
  %16 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %15, %OperandKind 6, %Nat32 %7)
  ret %Operand %16
}

define %Operand @eval_cast (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 11
  %3 = getelementptr inbounds %ValueCast, %ValueCast* %2, i32 0, i32 1
  %4 = load %Type*, %Type** %3

;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 11
  %6 = getelementptr inbounds %ValueCast, %ValueCast* %5, i32 0, i32 0
  %7 = load %Value*, %Value** %6
  %8 = call %Operand (%Value*) @eval (%Value* %7)
  %9 = call %Operand (%Operand) @load (%Operand %8)

;stmt2:
  %10 = extractvalue %Operand %9, 1
  %11 = call %Bool (%Type*, %Type*) @type_eq (%Type* %10, %Type* %4)
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  ret %Operand %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %13 = call %Nat32 () @lab_get ()

;stmt6:
  %14 = load %Unit*, %Unit** @fout
  %15 = load %Str, %Str* @_func328_str1
  %16 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15, %Nat32 %13)

;stmt7:
  %17 = extractvalue %Operand %9, 1
  %18 = getelementptr inbounds %Type, %Type* %17, i32 0, i32 0
  %19 = load %TypeKind, %TypeKind* %18

;stmt8:
  %20 = alloca %Str

;stmt9:
  %21 = load %Str, %Str* @_func328_str2
  store %Str %21, %Str* %20

;stmt10:
  %22 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %23 = load %TypeKind, %TypeKind* %22
  %24 = icmp eq %TypeKind %23, 7
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %25 = icmp eq %TypeKind %19, 2
  br i1 %25, label %then_2, label %else_2
then_2:

;stmt13:

;stmt14:
  %26 = load %Str, %Str* @_func328_str3
  store %Str %26, %Str* %20
  br label %endif_2
else_2:

;stmt15:

;stmt16:
  %27 = load %Str, %Str* @_func328_str4
  store %Str %27, %Str* %20
  br label %endif_2
endif_2:
  br label %endif_1
else_1:

;stmt17:
  %28 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %29 = load %TypeKind, %TypeKind* %28
  %30 = icmp eq %TypeKind %29, 6
  %31 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %32 = load %TypeKind, %TypeKind* %31
  %33 = icmp eq %TypeKind %32, 3
  %34 = or %Bool %30, %33
  br i1 %34, label %then_3, label %else_3
then_3:

;stmt18:

;stmt19:
  %35 = icmp eq %TypeKind %19, 6
  %36 = icmp eq %TypeKind %19, 7
  %37 = icmp eq %TypeKind %19, 3
  %38 = or %Bool %36, %37
  %39 = or %Bool %35, %38
  br i1 %39, label %then_4, label %else_4
then_4:

;stmt20:

;stmt21:
  %40 = load %Str, %Str* @_func328_str5
  store %Str %40, %Str* %20
  br label %endif_4
else_4:

;stmt22:

;stmt23:
  %41 = load %Str, %Str* @_func328_str6
  store %Str %41, %Str* %20
  br label %endif_4
endif_4:
  br label %endif_3
else_3:

;stmt24:
  %42 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %43 = load %TypeKind, %TypeKind* %42
  %44 = icmp eq %TypeKind %43, 2
  br i1 %44, label %then_5, label %else_5
then_5:

;stmt25:

;stmt26:
  %45 = icmp eq %TypeKind %19, 2
  br i1 %45, label %then_6, label %else_6
then_6:

;stmt27:

;stmt28:
  %46 = extractvalue %Operand %9, 1
  %47 = getelementptr inbounds %Type, %Type* %46, i32 0, i32 5
  %48 = getelementptr inbounds %TypeBasic, %TypeBasic* %47, i32 0, i32 1
  %49 = load %Nat32, %Nat32* %48
  %50 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 5
  %51 = getelementptr inbounds %TypeBasic, %TypeBasic* %50, i32 0, i32 1
  %52 = load %Nat32, %Nat32* %51
  %53 = icmp ugt %Nat32 %49, %52
  br i1 %53, label %then_7, label %else_7
then_7:

;stmt29:

;stmt30:
  %54 = load %Str, %Str* @_func328_str7
  store %Str %54, %Str* %20
  br label %endif_7
else_7:

;stmt31:
  %55 = extractvalue %Operand %9, 1
  %56 = getelementptr inbounds %Type, %Type* %55, i32 0, i32 5
  %57 = getelementptr inbounds %TypeBasic, %TypeBasic* %56, i32 0, i32 1
  %58 = load %Nat32, %Nat32* %57
  %59 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 5
  %60 = getelementptr inbounds %TypeBasic, %TypeBasic* %59, i32 0, i32 1
  %61 = load %Nat32, %Nat32* %60
  %62 = icmp ult %Nat32 %58, %61
  br i1 %62, label %then_8, label %else_8
then_8:

;stmt32:

;stmt33:
  %63 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 5
  %64 = getelementptr inbounds %TypeBasic, %TypeBasic* %63, i32 0, i32 3
  %65 = load %Bool, %Bool* %64
  br i1 %65, label %then_9, label %else_9
then_9:

;stmt34:

;stmt35:
  %66 = load %Str, %Str* @_func328_str8
  store %Str %66, %Str* %20
  br label %endif_9
else_9:

;stmt36:

;stmt37:
  %67 = load %Str, %Str* @_func328_str9
  store %Str %67, %Str* %20
  br label %endif_9
endif_9:
  br label %endif_8
else_8:

;stmt38:

;stmt39:
  %68 = load %Str, %Str* @_func328_str10
  store %Str %68, %Str* %20
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
else_6:

;stmt40:
  %69 = icmp eq %TypeKind %19, 6
  br i1 %69, label %then_10, label %else_10
then_10:

;stmt41:

;stmt42:
  %70 = load %Str, %Str* @_func328_str11
  store %Str %70, %Str* %20
  br label %endif_10
else_10:

;stmt43:
  %71 = icmp eq %TypeKind %19, 4
  br i1 %71, label %then_11, label %else_11
then_11:

;stmt44:

;stmt45:
  %72 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 3
  %73 = load %Nat32, %Nat32* %72
  %74 = mul %Nat32 %73, 8

;stmt46:
  %75 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 5
  %76 = getelementptr inbounds %TypeBasic, %TypeBasic* %75, i32 0, i32 1
  %77 = load %Nat32, %Nat32* %76
  %78 = icmp ugt %Nat32 %74, %77
  br i1 %78, label %then_12, label %else_12
then_12:

;stmt47:

;stmt48:
  %79 = load %Str, %Str* @_func328_str12
  store %Str %79, %Str* %20
  br label %endif_12
else_12:

;stmt49:
  %80 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 5
  %81 = getelementptr inbounds %TypeBasic, %TypeBasic* %80, i32 0, i32 1
  %82 = load %Nat32, %Nat32* %81
  %83 = icmp ult %Nat32 %74, %82
  br i1 %83, label %then_13, label %else_13
then_13:

;stmt50:

;stmt51:
  %84 = load %Str, %Str* @_func328_str13
  store %Str %84, %Str* %20
  br label %endif_13
else_13:

;stmt52:

;stmt53:
  %85 = load %Str, %Str* @_func328_str14
  store %Str %85, %Str* %20
  br label %endif_13
endif_13:
  br label %endif_12
endif_12:
  br label %endif_11
else_11:

;stmt54:
  %86 = icmp eq %TypeKind %19, 7
  br i1 %86, label %then_14, label %else_14
then_14:

;stmt55:
  br label %endif_14
else_14:

;stmt56:

;stmt57:
  %87 = load %Str, %Str* @_func328_str15
  %88 = call %Int32 (%Str, ...) @printf (%Str %87, %TypeKind %19)

;stmt58:
  %89 = load %Str, %Str* @_func328_str16
  call void (%Str) @fatal (%Str %89)
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

;stmt59:
  %90 = load %Unit*, %Unit** @fout
  %91 = load %Str, %Str* @_func328_str17
  %92 = load %Str, %Str* %20
  %93 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %90, %Str %91, %Str %92)

;stmt60:
  %94 = extractvalue %Operand %9, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %94, %Bool 1, %Bool 1)

;stmt61:
  call void () @space ()

;stmt62:
  call void (%Operand) @print_operand (%Operand %9)

;stmt63:
  %95 = load %Str, %Str* @_func328_str18
  call void (%Str) @o (%Str %95)

;stmt64:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %4, %Bool 1, %Bool 1)

;stmt65:
  %96 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %97 = load %Type*, %Type** %96
  %98 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %97, %OperandKind 6, %Nat32 %13)
  ret %Operand %98
}

define %Operand @eval_bin (%Value*) {

;stmt0:
  %2 = alloca %Str

;stmt1:
  %3 = load %Str, %Str* @_func329_str1
  store %Str %3, %Str* %2

;stmt2:
  %4 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %5 = getelementptr inbounds %ValueBin, %ValueBin* %4, i32 0, i32 0
  %6 = load %Value*, %Value** %5
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 5
  %10 = getelementptr inbounds %TypeBasic, %TypeBasic* %9, i32 0, i32 3
  %11 = load %Bool, %Bool* %10

;stmt3:
  %12 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 0
  %13 = load %ValueKind, %ValueKind* %12

;stmt4:
  %14 = icmp eq %ValueKind %13, 12
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %15 = load %Str, %Str* @_func329_str2
  store %Str %15, %Str* %2
  br label %endif_0
else_0:

;stmt7:
  %16 = icmp eq %ValueKind %13, 13
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %17 = load %Str, %Str* @_func329_str3
  store %Str %17, %Str* %2
  br label %endif_1
else_1:

;stmt10:
  %18 = icmp eq %ValueKind %13, 14
  br i1 %18, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %19 = load %Str, %Str* @_func329_str4
  store %Str %19, %Str* %2
  br label %endif_2
else_2:

;stmt13:
  %20 = icmp eq %ValueKind %13, 15
  br i1 %20, label %then_3, label %else_3
then_3:

;stmt14:

;stmt15:
  br i1 %11, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %21 = load %Str, %Str* @_func329_str5
  store %Str %21, %Str* %2
  br label %endif_4
else_4:

;stmt18:

;stmt19:
  %22 = load %Str, %Str* @_func329_str6
  store %Str %22, %Str* %2
  br label %endif_4
endif_4:
  br label %endif_3
else_3:

;stmt20:
  %23 = icmp eq %ValueKind %13, 16
  br i1 %23, label %then_5, label %else_5
then_5:

;stmt21:

;stmt22:
  br i1 %11, label %then_6, label %else_6
then_6:

;stmt23:

;stmt24:
  %24 = load %Str, %Str* @_func329_str7
  store %Str %24, %Str* %2
  br label %endif_6
else_6:

;stmt25:

;stmt26:
  %25 = load %Str, %Str* @_func329_str8
  store %Str %25, %Str* %2
  br label %endif_6
endif_6:
  br label %endif_5
else_5:

;stmt27:
  %26 = icmp eq %ValueKind %13, 17
  br i1 %26, label %then_7, label %else_7
then_7:

;stmt28:

;stmt29:
  %27 = load %Str, %Str* @_func329_str9
  store %Str %27, %Str* %2
  br label %endif_7
else_7:

;stmt30:
  %28 = icmp eq %ValueKind %13, 18
  br i1 %28, label %then_8, label %else_8
then_8:

;stmt31:

;stmt32:
  %29 = load %Str, %Str* @_func329_str10
  store %Str %29, %Str* %2
  br label %endif_8
else_8:

;stmt33:
  %30 = icmp eq %ValueKind %13, 19
  br i1 %30, label %then_9, label %else_9
then_9:

;stmt34:

;stmt35:
  %31 = load %Str, %Str* @_func329_str11
  store %Str %31, %Str* %2
  br label %endif_9
else_9:

;stmt36:
  %32 = icmp eq %ValueKind %13, 20
  br i1 %32, label %then_10, label %else_10
then_10:

;stmt37:

;stmt38:
  %33 = load %Str, %Str* @_func329_str12
  store %Str %33, %Str* %2
  br label %endif_10
else_10:

;stmt39:
  %34 = icmp eq %ValueKind %13, 21
  br i1 %34, label %then_11, label %else_11
then_11:

;stmt40:

;stmt41:
  %35 = load %Str, %Str* @_func329_str13
  store %Str %35, %Str* %2
  br label %endif_11
else_11:

;stmt42:
  %36 = icmp eq %ValueKind %13, 22
  br i1 %36, label %then_12, label %else_12
then_12:

;stmt43:

;stmt44:
  br i1 %11, label %then_13, label %else_13
then_13:

;stmt45:

;stmt46:
  %37 = load %Str, %Str* @_func329_str14
  store %Str %37, %Str* %2
  br label %endif_13
else_13:

;stmt47:

;stmt48:
  %38 = load %Str, %Str* @_func329_str15
  store %Str %38, %Str* %2
  br label %endif_13
endif_13:
  br label %endif_12
else_12:

;stmt49:
  %39 = icmp eq %ValueKind %13, 23
  br i1 %39, label %then_14, label %else_14
then_14:

;stmt50:

;stmt51:
  br i1 %11, label %then_15, label %else_15
then_15:

;stmt52:

;stmt53:
  %40 = load %Str, %Str* @_func329_str16
  store %Str %40, %Str* %2
  br label %endif_15
else_15:

;stmt54:

;stmt55:
  %41 = load %Str, %Str* @_func329_str17
  store %Str %41, %Str* %2
  br label %endif_15
endif_15:
  br label %endif_14
else_14:

;stmt56:
  %42 = icmp eq %ValueKind %13, 24
  br i1 %42, label %then_16, label %else_16
then_16:

;stmt57:

;stmt58:
  br i1 %11, label %then_17, label %else_17
then_17:

;stmt59:

;stmt60:
  %43 = load %Str, %Str* @_func329_str18
  store %Str %43, %Str* %2
  br label %endif_17
else_17:

;stmt61:

;stmt62:
  %44 = load %Str, %Str* @_func329_str19
  store %Str %44, %Str* %2
  br label %endif_17
endif_17:
  br label %endif_16
else_16:

;stmt63:
  %45 = icmp eq %ValueKind %13, 25
  br i1 %45, label %then_18, label %else_18
then_18:

;stmt64:

;stmt65:
  br i1 %11, label %then_19, label %else_19
then_19:

;stmt66:

;stmt67:
  %46 = load %Str, %Str* @_func329_str20
  store %Str %46, %Str* %2
  br label %endif_19
else_19:

;stmt68:

;stmt69:
  %47 = load %Str, %Str* @_func329_str21
  store %Str %47, %Str* %2
  br label %endif_19
endif_19:
  br label %endif_18
else_18:

;stmt70:
  %48 = icmp eq %ValueKind %13, 26
  br i1 %48, label %then_20, label %else_20
then_20:

;stmt71:

;stmt72:
  %49 = load %Str, %Str* @_func329_str22
  store %Str %49, %Str* %2
  br label %endif_20
else_20:

;stmt73:
  %50 = icmp eq %ValueKind %13, 27
  br i1 %50, label %then_21, label %else_21
then_21:

;stmt74:

;stmt75:
  br i1 %11, label %then_22, label %else_22
then_22:

;stmt76:

;stmt77:
  %51 = load %Str, %Str* @_func329_str23
  store %Str %51, %Str* %2
  br label %endif_22
else_22:

;stmt78:

;stmt79:
  %52 = load %Str, %Str* @_func329_str24
  store %Str %52, %Str* %2
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
  %53 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %54 = getelementptr inbounds %ValueBin, %ValueBin* %53, i32 0, i32 0
  %55 = load %Value*, %Value** %54
  %56 = call %Operand (%Value*) @eval (%Value* %55)
  %57 = call %Operand (%Operand) @load (%Operand %56)

;stmt81:
  %58 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 8
  %59 = getelementptr inbounds %ValueBin, %ValueBin* %58, i32 0, i32 1
  %60 = load %Value*, %Value** %59
  %61 = call %Operand (%Value*) @eval (%Value* %60)
  %62 = call %Operand (%Operand) @load (%Operand %61)

;stmt82:
  %63 = call %Nat32 () @lab_get ()

;stmt83:
  %64 = load %Unit*, %Unit** @fout
  %65 = load %Str, %Str* @_func329_str25
  %66 = load %Str, %Str* %2
  %67 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %64, %Str %65, %Nat32 %63, %Str %66)

;stmt84:
  %68 = extractvalue %Operand %57, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %68, %Bool 1, %Bool 1)

;stmt85:
  call void () @space ()

;stmt86:
  call void (%Operand) @print_operand (%Operand %57)

;stmt87:
  call void () @comma ()

;stmt88:
  call void (%Operand) @print_operand (%Operand %62)

;stmt89:
  %69 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 1
  %70 = load %Type*, %Type** %69
  %71 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %70, %OperandKind 6, %Nat32 %63)
  ret %Operand %71
}

define void @print_st (%Value*, %Value*) {

;stmt0:
  %3 = call %Operand (%Value*) @eval (%Value* %0)

;stmt1:
  %4 = call %Operand (%Value*) @eval (%Value* %1)
  %5 = call %Operand (%Operand) @load (%Operand %4)

;stmt2:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @_func330_str1
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)

;stmt3:
  %9 = extractvalue %Operand %5, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %9, %Bool 1, %Bool 1)

;stmt4:
  call void () @space ()

;stmt5:
  call void (%Operand) @print_operand (%Operand %5)

;stmt6:
  call void () @comma ()

;stmt7:
  %10 = extractvalue %Operand %5, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %10, %Bool 1, %Bool 1)

;stmt8:
  %11 = load %Str, %Str* @_func330_str2
  call void (%Str) @o (%Str %11)

;stmt9:
  call void (%Operand) @print_operand (%Operand %3)
  ret void
}

define %Operand @loadImmPtr (%Operand) {

;stmt0:
  %2 = extractvalue %Operand %0, 1

;stmt1:
  %3 = call %Nat32 () @lab_get ()

;stmt2:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func332_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5, %Nat32 %3)

;stmt3:
  call void (%Operand) @print_operand (%Operand %0)

;stmt4:
  %7 = load %Str, %Str* @_func332_str2
  call void (%Str) @o (%Str %7)

;stmt5:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %2, %Bool 1, %Bool 1)

;stmt6:
  %8 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %2, %OperandKind 6, %Nat32 %3)
  ret %Operand %8
}

define %Operand @load (%Operand) {

;stmt0:
  %2 = extractvalue %Operand %0, 0

;stmt1:
  %3 = icmp eq %OperandKind %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Operand %0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %5 = icmp eq %OperandKind %2, 1
  br i1 %5, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %6 = extractvalue %Operand %0, 1
  %7 = call %Bool (%Type*) @typeIsReference (%Type* %6)
  br i1 %7, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %8 = call %Operand (%Operand) @loadImmPtr (%Operand %0)
  ret %Operand %8
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt9:
  ret %Operand %0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %11 = icmp ne %OperandKind %2, 3
  %12 = icmp ne %OperandKind %2, 4
  %13 = icmp ne %OperandKind %2, 5
  %14 = and %Bool %12, %13
  %15 = and %Bool %11, %14
  br i1 %15, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  ret %Operand %0
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt13:
  %17 = call %Nat32 () @lab_get ()

;stmt14:
  %18 = load %Unit*, %Unit** @fout
  %19 = load %Str, %Str* @_func331_str1
  %20 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %18, %Str %19, %Nat32 %17)

;stmt15:
  %21 = extractvalue %Operand %0, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %21, %Bool 1, %Bool 1)

;stmt16:
  call void () @comma ()

;stmt17:
  %22 = extractvalue %Operand %0, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %22, %Bool 1, %Bool 1)

;stmt18:
  %23 = load %Str, %Str* @_func331_str2
  call void (%Str) @o (%Str %23)

;stmt19:
  call void (%Operand) @print_operand (%Operand %0)

;stmt20:
  %24 = extractvalue %Operand %0, 1
  %25 = call %Operand (%Type*, %OperandKind, %Nat32) @operand (%Type* %24, %OperandKind 6, %Nat32 %17)
  ret %Operand %25
}

define void @print_operand (%Operand) {

;stmt0:
  %2 = extractvalue %Operand %0, 0

;stmt1:
  %3 = icmp eq %OperandKind %2, 1
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func333_str1
  %6 = extractvalue %Operand %0, 2
  %7 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5, %Int64 %6)
  br label %endif_0
else_0:

;stmt4:
  %8 = icmp eq %OperandKind %2, 6
  %9 = icmp eq %OperandKind %2, 5
  %10 = or %Bool %8, %9
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %11 = load %Unit*, %Unit** @fout
  %12 = load %Str, %Str* @_func333_str2
  %13 = extractvalue %Operand %0, 4
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12, %Nat32 %13)
  br label %endif_1
else_1:

;stmt7:
  %15 = icmp eq %OperandKind %2, 4
  %16 = icmp eq %OperandKind %2, 2
  %17 = or %Bool %15, %16
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %18 = load %Unit*, %Unit** @fout
  %19 = load %Str, %Str* @_func333_str3
  %20 = extractvalue %Operand %0, 3
  %21 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %18, %Str %19, %Str %20)
  br label %endif_2
else_2:

;stmt10:
  %22 = icmp eq %OperandKind %2, 3
  br i1 %22, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %23 = load %Unit*, %Unit** @fout
  %24 = load %Str, %Str* @_func333_str4
  %25 = extractvalue %Operand %0, 4
  %26 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %23, %Str %24, %Nat32 %25)
  br label %endif_3
else_3:

;stmt13:
  %27 = icmp eq %OperandKind %2, 0
  br i1 %27, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  %28 = load %Unit*, %Unit** @fout
  %29 = load %Str, %Str* @_func333_str5
  %30 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %28, %Str %29)
  br label %endif_4
else_4:
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

define void @typedef (%Str, %Type*) {

;stmt0:
  %3 = load %Unit*, %Unit** @fout
  %4 = load %Str, %Str* @_func334_str1
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4, %Str %0)

;stmt1:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %1, %Bool 0, %Bool 1)
  ret void
}

define void @print_array_item (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Value*

;stmt1:
  %5 = bitcast %Unit* %1 to %Bool*

;stmt2:
  %6 = load %Bool, %Bool* %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %7 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*, %Bool, %Bool) @printType (%Type* %8, %Bool 1, %Bool 1)

;stmt6:
  call void () @space ()

;stmt7:
  store %Bool 1, %Bool* %5
  ret void
}

define void @arraydef (%Str, %Type*, %List*) {

;stmt0:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func335_str1
  %6 = getelementptr inbounds %List, %List* %2, i32 0, i32 2
  %7 = load %Nat64, %Nat64* %6
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5, %Str %0, %Nat64 %7)

;stmt1:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %1, %Bool 1, %Bool 1)

;stmt2:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @_func335_str2
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10)

;stmt3:
  %12 = alloca %Bool

;stmt4:
  store %Bool 0, %Bool* %12

;stmt5:
  %13 = getelementptr inbounds %Bool, %Bool* %12, i32 0
  %14 = bitcast %Bool* %13 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %2, %ListForeachHandler @print_array_item, %Unit* %14)

;stmt6:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @_func335_str3
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16)
  ret void
}

define void @stringdef (%Str, %Nat32, %Str) {

;stmt0:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func337_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5, %Str %0, %Nat32 %1)

;stmt1:
  %7 = alloca %Nat32

;stmt2:
  store %Nat32 0, %Nat32* %7

;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt4:

;stmt5:
  %8 = load %Nat32, %Nat32* %7
  %9 = getelementptr inbounds %Nat8, %Str %2, %Nat32 %8
  %10 = load %Nat8, %Nat8* %9

;stmt6:
  %11 = load %Nat32, %Nat32* %7
  %12 = add %Nat32 %11, 1
  store %Nat32 %12, %Nat32* %7

;stmt7:
  %13 = icmp eq %Nat8 %10, 0
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt10:
  %15 = load %Str, %Str* @_func337_str2
  %16 = getelementptr inbounds %Nat8, %Str %15, %Int32 0
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp eq %Nat8 %10, %17
  %19 = load %Str, %Str* @_func337_str3
  %20 = getelementptr inbounds %Nat8, %Str %19, %Int32 0
  %21 = load %Nat8, %Nat8* %20
  %22 = icmp eq %Nat8 %10, %21
  %23 = load %Str, %Str* @_func337_str4
  %24 = getelementptr inbounds %Nat8, %Str %23, %Int32 0
  %25 = load %Nat8, %Nat8* %24
  %26 = icmp eq %Nat8 %10, %25
  %27 = load %Str, %Str* @_func337_str5
  %28 = getelementptr inbounds %Nat8, %Str %27, %Int32 0
  %29 = load %Nat8, %Nat8* %28
  %30 = icmp eq %Nat8 %10, %29
  %31 = load %Str, %Str* @_func337_str6
  %32 = getelementptr inbounds %Nat8, %Str %31, %Int32 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %10, %33
  %35 = load %Str, %Str* @_func337_str7
  %36 = getelementptr inbounds %Nat8, %Str %35, %Int32 0
  %37 = load %Nat8, %Nat8* %36
  %38 = icmp eq %Nat8 %10, %37
  %39 = load %Str, %Str* @_func337_str8
  %40 = getelementptr inbounds %Nat8, %Str %39, %Int32 0
  %41 = load %Nat8, %Nat8* %40
  %42 = icmp eq %Nat8 %10, %41
  %43 = load %Str, %Str* @_func337_str9
  %44 = getelementptr inbounds %Nat8, %Str %43, %Int32 0
  %45 = load %Nat8, %Nat8* %44
  %46 = icmp eq %Nat8 %10, %45
  %47 = or %Bool %42, %46
  %48 = or %Bool %38, %47
  %49 = or %Bool %34, %48
  %50 = or %Bool %30, %49
  %51 = or %Bool %26, %50
  %52 = or %Bool %22, %51
  %53 = or %Bool %18, %52
  br i1 %53, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %54 = load %Unit*, %Unit** @fout
  %55 = load %Str, %Str* @_func337_str10
  %56 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %54, %Str %55, %Nat8 %10)
  br label %endif_1
else_1:

;stmt13:

;stmt14:
  %57 = load %Unit*, %Unit** @fout
  %58 = load %Str, %Str* @_func337_str11
  %59 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %57, %Str %58, %Nat8 %10)
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt15:
  %60 = load %Unit*, %Unit** @fout
  %61 = load %Str, %Str* @_func337_str12
  %62 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %60, %Str %61, %Int32 0)

;stmt16:
  %63 = load %Unit*, %Unit** @fout
  %64 = load %Str, %Str* @_func337_str13
  %65 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %63, %Str %64, %Str %0, %Nat32 %1, %Nat32 %1, %Str %0)
  ret void
}

define void @vardef (%Str, %Type*, %Value*) {

;stmt0:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func338_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5, %Str %0)

;stmt1:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %1, %Bool 1, %Bool 1)

;stmt2:
  call void () @space ()

;stmt3:
  %7 = load %Str, %Str* @_func338_str2
  call void (%Str) @o (%Str %7)
  ret void
}

define void @vf_print_param (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Field*

;stmt1:
  %5 = bitcast %Unit* %1 to %Bool*

;stmt2:
  %6 = load %Bool, %Bool* %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @_func340_str1
  %9 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %10 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)

;stmt6:
  store %Bool 1, %Bool* %5
  ret void
}

define void @funcdef (%Str, %Type*, %Block*) {

;stmt0:
  %4 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %4, i32 0, i32 0
  %6 = load %List*, %List** %5
  %7 = getelementptr inbounds %List, %List* %6, i32 0, i32 2
  %8 = load %Nat64, %Nat64* %7
  %9 = add %Nat64 %8, 1

;stmt1:
  %10 = trunc %Nat64 %9 to %Nat32
  call void (%Nat32) @lab_reset (%Nat32 %10)

;stmt2:
  %11 = bitcast %Type* %1 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  %14 = load %Str, %Str* @_func339_str1
  call void (%Bool, %Str) @assert (%Bool %13, %Str %14)

;stmt3:
  %15 = bitcast %Block* %2 to %Unit*
  %16 = inttoptr i64 0 to %Unit*
  %17 = icmp eq %Unit* %15, %16
  br i1 %17, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %18 = load %Str, %Str* @_func339_str2
  call void (%Str) @o (%Str %18)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %19 = load %Str, %Str* @_func339_str3
  call void (%Str) @o (%Str %19)
  br label %endif_0
endif_0:

;stmt8:
  call void () @space ()

;stmt9:
  %20 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6
  %21 = getelementptr inbounds %TypeFunc, %TypeFunc* %20, i32 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = load %Type*, %Type** @typeUnit
  %24 = call %Bool (%Type*, %Type*) @type_eq (%Type* %22, %Type* %23)

;stmt10:
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %25 = load %Str, %Str* @_func339_str4
  call void (%Str) @o (%Str %25)
  br label %endif_1
else_1:

;stmt13:

;stmt14:
  %26 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6
  %27 = getelementptr inbounds %TypeFunc, %TypeFunc* %26, i32 0, i32 1
  %28 = load %Type*, %Type** %27
  call void (%Type*, %Bool, %Bool) @printType (%Type* %28, %Bool 1, %Bool 1)
  br label %endif_1
endif_1:

;stmt15:
  %29 = load %Unit*, %Unit** @fout
  %30 = load %Str, %Str* @_func339_str5
  %31 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %29, %Str %30, %Str %0)

;stmt16:
  %32 = alloca %Bool

;stmt17:
  store %Bool 0, %Bool* %32

;stmt18:
  %33 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6
  %34 = getelementptr inbounds %TypeFunc, %TypeFunc* %33, i32 0, i32 0
  %35 = load %List*, %List** %34
  %36 = getelementptr inbounds %Bool, %Bool* %32, i32 0
  %37 = bitcast %Bool* %36 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %35, %ListForeachHandler @vf_print_param, %Unit* %37)

;stmt19:
  %38 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6
  %39 = getelementptr inbounds %TypeFunc, %TypeFunc* %38, i32 0, i32 2
  %40 = load %Bool, %Bool* %39
  br i1 %40, label %then_2, label %else_2
then_2:

;stmt20:

;stmt21:
  %41 = load %Str, %Str* @_func339_str6
  call void (%Str) @o (%Str %41)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt22:
  %42 = load %Str, %Str* @_func339_str7
  call void (%Str) @o (%Str %42)

;stmt23:
  %43 = bitcast %Block* %2 to %Unit*
  %44 = inttoptr i64 0 to %Unit*
  %45 = icmp ne %Unit* %43, %44
  br i1 %45, label %then_3, label %else_3
then_3:

;stmt24:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt25:
  %46 = bitcast %Block* %2 to %Unit*
  %47 = inttoptr i64 0 to %Unit*
  %48 = icmp ne %Unit* %46, %47
  br i1 %48, label %then_4, label %else_4
then_4:

;stmt26:

;stmt27:
  %49 = load %Str, %Str* @_func339_str8
  call void (%Str) @o (%Str %49)

;stmt28:
  call void () @reset_local_labels ()

;stmt29:
  call void (%Block*) @print_block (%Block* %2)

;stmt30:
  br i1 %24, label %then_5, label %else_5
then_5:

;stmt31:

;stmt32:
  %50 = load %Str, %Str* @_func339_str9
  call void (%Str) @o (%Str %50)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:

;stmt33:
  %51 = load %Str, %Str* @_func339_str10
  call void (%Str) @o (%Str %51)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  ret void
}

define void @aliasdef (%Str, %Type*, %Str) {

;stmt0:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func341_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5, %Str %0)

;stmt1:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %1, %Bool 0, %Bool 0)

;stmt2:
  call void () @comma ()

;stmt3:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %1, %Bool 0, %Bool 0)

;stmt4:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @_func341_str2
  %9 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8, %Str %2)
  ret void
}

define void @prt_itype (%Unit*, %Unit*, %Unit*) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Str

;stmt1:
  %5 = bitcast %Unit* %1 to %Type*

;stmt2:
  %6 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 5
  %7 = getelementptr inbounds %TypeBasic, %TypeBasic* %6, i32 0, i32 2
  %8 = load %Bool, %Bool* %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @_func343_str1
  %11 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 5
  %12 = getelementptr inbounds %TypeBasic, %TypeBasic* %11, i32 0, i32 1
  %13 = load %Nat32, %Nat32* %12
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10, %Str %4, %Nat32 %13)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @printer_init (%Arch, %Str) {

;stmt0:
  %3 = load %Str, %Str* @_func342_str1
  %4 = call %Unit* (%Str, %Str) @fopen (%Str %1, %Str %3)
  store %Unit* %4, %Unit** @fout

;stmt1:
  %5 = load %Unit*, %Unit** @fout
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp eq %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = load %Str, %Str* @_func342_str2
  call void (%Str) @fatal (%Str %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @_func342_str3
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10)

;stmt5:
  %12 = load %Unit*, %Unit** @fout
  %13 = load %Str, %Str* @_func342_str4
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13)

;stmt6:
  call void (%Arch) @print_head (%Arch %0)

;stmt7:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @_func342_str5
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16)

;stmt8:
  %18 = load %Unit*, %Unit** @fout
  %19 = load %Str, %Str* @_func342_str6
  %20 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %18, %Str %19)

;stmt9:
  %21 = load %Unit*, %Unit** @fout
  %22 = load %Str, %Str* @_func342_str7
  %23 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22)

;stmt10:
  %24 = load %Unit*, %Unit** @fout
  %25 = load %Str, %Str* @_func342_str8
  %26 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25)

;stmt11:
  %27 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0, i32 0
  %28 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %27, %MapForeachHandler @prt_itype, %Unit* %28)

;stmt12:
  %29 = load %Unit*, %Unit** @fout
  %30 = load %Str, %Str* @_func342_str9
  %31 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %29, %Str %30)
  ret void
}

define void @foreach_typedef (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*

;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 5

;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %TypeDef, %TypeDef* %5, i32 0, i32 0
  %9 = load %Type*, %Type** %8
  call void (%Str, %Type*) @typedef (%Str %7, %Type* %9)
  ret void
}

define void @foreach_stringdef (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*

;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 3

;stmt2:
  %6 = getelementptr inbounds %StringDef, %StringDef* %5, i32 0, i32 0
  %7 = load %Str, %Str* %6
  %8 = bitcast %Str %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %11 = load %Str, %Str* @_func346_str1
  %12 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 1
  %13 = load %Str, %Str* %12
  %14 = call %Int32 (%Str, ...) @printf (%Str %11, %Str %13)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %15 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 1
  %16 = load %Str, %Str* %15
  %17 = getelementptr inbounds %StringDef, %StringDef* %5, i32 0, i32 1
  %18 = load %Nat32, %Nat32* %17
  %19 = getelementptr inbounds %StringDef, %StringDef* %5, i32 0, i32 0
  %20 = load %Str, %Str* %19
  call void (%Str, %Nat32, %Str) @stringdef (%Str %16, %Nat32 %18, %Str %20)
  ret void
}

define void @foreach_arraydef (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*

;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 9

;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %ArrayDef, %ArrayDef* %5, i32 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %ArrayDef, %ArrayDef* %5, i32 0, i32 2
  %11 = load %List*, %List** %10
  call void (%Str, %Type*, %List*) @arraydef (%Str %7, %Type* %9, %List* %11)
  ret void
}

define void @foreach_vardef (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*

;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 13

;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %AssemblyVarDef, %AssemblyVarDef* %5, i32 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %AssemblyVarDef, %AssemblyVarDef* %5, i32 0, i32 1
  %11 = load %Value*, %Value** %10
  call void (%Str, %Type*, %Value*) @vardef (%Str %7, %Type* %9, %Value* %11)
  ret void
}

define void @foreach_funcdef (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*

;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 11

;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %FuncDef, %FuncDef* %5, i32 0, i32 0
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %FuncDef, %FuncDef* %5, i32 0, i32 1
  %11 = load %Block*, %Block** %10
  call void (%Str, %Type*, %Block*) @funcdef (%Str %7, %Type* %9, %Block* %11)
  ret void
}

define void @foreach_aliasdef (%Unit*, %Unit*, %Nat32) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Definition*

;stmt1:
  %5 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 15

;stmt2:
  %6 = getelementptr inbounds %Definition, %Definition* %4, i32 0, i32 1
  %7 = load %Str, %Str* %6
  %8 = getelementptr inbounds %AliasDef, %AliasDef* %5, i32 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %AliasDef, %AliasDef* %5, i32 0, i32 2
  %11 = load %Str, %Str* %10
  call void (%Str, %Type*, %Str) @aliasdef (%Str %7, %Type* %9, %Str %11)
  ret void
}

define void @print_assembly (%Assembly*) {

;stmt0:
  %2 = load %Str, %Str* @_func344_str1
  %3 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, ...) @printf (%Str %2, %Str %4)

;stmt1:
  %6 = getelementptr inbounds %List, %List* @md_list, i32 0
  call void (%List*) @list_init (%List* %6)

;stmt2:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @_func344_str2
  %9 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 0
  %10 = load %Str, %Str* %9
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8, %Str %10)

;stmt3:
  %12 = load %Str, %Str* @_func344_str3
  call void (%Str) @o (%Str %12)

;stmt4:
  %13 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 1
  %14 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %13, %ListForeachHandler @foreach_typedef, %Unit* %14)

;stmt5:
  %15 = load %Str, %Str* @_func344_str4
  call void (%Str) @o (%Str %15)

;stmt6:
  %16 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 4
  %17 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %16, %ListForeachHandler @foreach_stringdef, %Unit* %17)

;stmt7:
  %18 = load %Str, %Str* @_func344_str5
  call void (%Str) @o (%Str %18)

;stmt8:
  %19 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 3
  %20 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %19, %ListForeachHandler @foreach_arraydef, %Unit* %20)

;stmt9:
  %21 = load %Str, %Str* @_func344_str6
  call void (%Str) @o (%Str %21)

;stmt10:
  %22 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 5
  %23 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %22, %ListForeachHandler @foreach_vardef, %Unit* %23)

;stmt11:
  %24 = load %Str, %Str* @_func344_str7
  call void (%Str) @o (%Str %24)

;stmt12:
  %25 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 6
  %26 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %25, %ListForeachHandler @foreach_funcdef, %Unit* %26)

;stmt13:
  %27 = load %Str, %Str* @_func344_str8
  call void (%Str) @o (%Str %27)

;stmt14:
  %28 = getelementptr inbounds %Assembly, %Assembly* %0, i32 0, i32 2
  %29 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %28, %ListForeachHandler @foreach_aliasdef, %Unit* %29)

;stmt15:
  %30 = load %Str, %Str* @_func344_str9
  call void (%Str) @o (%Str %30)

;stmt16:
  %31 = getelementptr inbounds %List, %List* @md_list, i32 0
  call void (%List*) @print_metadata_list (%List* %31)
  ret void
}

define void @print_head (%Arch) {

;stmt0:
  %2 = icmp eq %Arch %0, 0
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %3 = load %Unit*, %Unit** @fout
  %4 = load %Str, %Str* @_func351_str1
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4)

;stmt3:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @_func351_str2
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)
  br label %endif_0
else_0:

;stmt4:
  %9 = icmp eq %Arch %0, 1
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %10 = load %Unit*, %Unit** @fout
  %11 = load %Str, %Str* @_func351_str3
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11)

;stmt7:
  %13 = load %Unit*, %Unit** @fout
  %14 = load %Str, %Str* @_func351_str4
  %15 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %13, %Str %14)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt8:
  %16 = load %Unit*, %Unit** @fout
  %17 = load %Str, %Str* @_func351_str5
  %18 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %16, %Str %17)
  ret void
}

define void @tshow (%Unit*, %Unit*, %Unit*) {

;stmt0:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func353_str1
  %6 = bitcast %Unit* %0 to %Str
  %7 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5, %Str %6, %Unit* %1)
  ret void
}

define void @print_type_index (%List*) {

;stmt0:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func352_str1
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3)

;stmt1:
  %5 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %0, void (%Unit*, %Unit*, %Unit*)* @tshow, %Unit* %5)
  ret void
}

define void @vshow (%Unit*, %Unit*, %Unit*) {

;stmt0:
  %4 = bitcast %Unit* %1 to %Value*

;stmt1:
  %5 = load %Unit*, %Unit** @fout
  %6 = load %Str, %Str* @_func355_str1
  %7 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %5, %Str %6, %Unit* %0, %Value* %4)

;stmt2:
  %8 = load %Unit*, %Unit** @fout
  %9 = load %Str, %Str* @_func355_str2
  %10 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 0
  %11 = load %ValueKind, %ValueKind* %10
  %12 = call %Str (%ValueKind) @print_value_kind (%ValueKind %11)
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Str %12)

;stmt3:
  %14 = load %Unit*, %Unit** @fout
  %15 = load %Str, %Str* @_func355_str3
  %16 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15)
  ret void
}

define void @print_value_index (%List*) {

;stmt0:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func354_str1
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3)

;stmt1:
  %5 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %0, void (%Unit*, %Unit*, %Unit*)* @vshow, %Unit* %5)
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
  %5 = getelementptr inbounds %List, %List* @liblist, i32 0
  call void (%List*) @list_init (%List* %5)

;stmt3:
  %6 = load %Str, %Str* @MINOR_LIB_ENV_VAR
  %7 = call %Str (%Str) @getenv (%Str %6)

;stmt4:
  %8 = bitcast %Str %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %11 = load %Str, %Str* @_func356_str1
  call void (%Str) @fatal (%Str %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  call void (%Str) @liblist_add (%Str %7)

;stmt8:
  %12 = getelementptr inbounds %Index, %Index* @builtinIndex, i32 0
  call void (%Index*) @index_init (%Index* %12)

;stmt9:
  %13 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %14 = load %Str, %Str* @_func356_str2
  call void (%Assembly*, %Str) @asmInit (%Assembly* %13, %Str %14)

;stmt10:
  %15 = call %List* () @list_new ()
  store %List* %15, %List** @settings

;stmt11:
  %16 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 0
  store %Nat32 64, %Nat32* %16

;stmt12:
  %17 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 1
  store %Nat32 8, %Nat32* %17

;stmt13:
  %18 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 2
  store %Nat32 1, %Nat32* %18

;stmt14:
  %19 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 3
  store %Nat32 2, %Nat32* %19

;stmt15:
  %20 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 4
  store %Nat32 8, %Nat32* %20

;stmt16:
  %21 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  store %Nat32 8, %Nat32* %21

;stmt17:
  call void () @type_init ()

;stmt18:
  call void () @value_init ()

;stmt19:
  store %Arch 0, %Arch* @arch
  ret void
}

define void @readConfig (%Str) {

;stmt0:
  %2 = load %Str, %Str* @_func357_str1
  %3 = call %Int32 (%Str, ...) @printf (%Str %2, %Str %0)

;stmt1:
  %4 = alloca [512 x %Nat8]

;stmt2:
  %5 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i32 0, %Int32 0
  %6 = bitcast %Nat8* %5 to %Str
  %7 = call %Str (%Str, %Nat32) @getcwd (%Str %6, %Nat32 512)

;stmt3:
  %8 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %4, i32 0, %Int32 0
  %9 = bitcast %Nat8* %8 to %Str
  %10 = load %Str, %Str* @_func357_str2
  %11 = call %SourceInfo (%Str, %Str) @getSourceInfoFrom (%Str %9, %Str %10)
  %12 = call %Source* (%SourceInfo) @openSource (%SourceInfo %11)

;stmt4:
  %13 = load %ModuleContext*, %ModuleContext** @old_mctx
  %14 = getelementptr inbounds %ModuleContext, %ModuleContext* %13, i32 0, i32 0
  %15 = load %Source*, %Source** %14

;stmt5:
  %16 = load %ModuleContext*, %ModuleContext** @old_mctx
  %17 = getelementptr inbounds %ModuleContext, %ModuleContext* %16, i32 0, i32 0
  store %Source* %12, %Source** %17

;stmt6:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %18 = alloca %Nat64

;stmt9:
  call void () @skip_nl ()

;stmt10:
  %19 = call %Bool () @eof ()
  br i1 %19, label %then_0, label %else_0
then_0:

;stmt11:

;stmt12:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt13:
  %21 = call %Str () @parseId ()

;stmt14:
  %22 = load %Str, %Str* @_func357_str3
  %23 = call %Bool (%Str) @need (%Str %22)

;stmt15:
  %24 = call %Token* () @ctok ()

;stmt16:
  %25 = getelementptr inbounds %Token, %Token* %24, i32 0, i32 0
  %26 = load %TokenType, %TokenType* %25
  %27 = icmp eq %TokenType %26, 2
  br i1 %27, label %then_1, label %else_1
then_1:

;stmt17:

;stmt18:
  %28 = getelementptr inbounds %Token, %Token* %24, i32 0, i32 2
  %29 = bitcast [0 x %Nat8]* %28 to %Unit*
  %30 = load %Str, %Str* @_func357_str4
  %31 = getelementptr inbounds %Nat64, %Nat64* %18, i32 0
  %32 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %29, %Str %30, %Nat64* %31)

;stmt19:
  call void () @skip ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt20:
  %33 = load %Str, %Str* @_func357_str5
  %34 = load %Nat64, %Nat64* %18
  %35 = call %Int32 (%Str, ...) @printf (%Str %33, %Str %21, %Nat64 %34)

;stmt21:
  %36 = load %Nat64, %Nat64* %18
  call void (%Str, %Nat64) @set (%Str %21, %Nat64 %36)
  br label %continue_0
break_0:

;stmt22:
  %37 = load %ModuleContext*, %ModuleContext** @old_mctx
  %38 = getelementptr inbounds %ModuleContext, %ModuleContext* %37, i32 0, i32 0
  store %Source* %15, %Source** %38
  ret void
}

define void @mcheck (%Unit*, %Unit*, %Unit*) {

;stmt0:
  %4 = bitcast %Unit* %1 to %ModuleContext*

;stmt1:
  call void (%ModuleContext*) @checkModule (%ModuleContext* %4)
  ret void
}

define void @tchk (%Unit*, %Unit*, %Unit*) {

;stmt0:
  %4 = bitcast %Unit* %1 to %Type*

;stmt1:
  call void (%Type*) @typeCheck (%Type* %4)
  ret void
}

define void @vchk (%Unit*, %Unit*, %Unit*) {

;stmt0:
  %4 = bitcast %Unit* %1 to %Value*

;stmt1:
  %5 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt2:
  %6 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = bitcast %Type* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = getelementptr inbounds %Type, %Type* %12, i32 0, i32 0
  %14 = load %TypeKind, %TypeKind* %13
  %15 = icmp eq %TypeKind %14, 3
  %16 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 0
  %17 = load %ValueKind, %ValueKind* %16
  %18 = icmp eq %ValueKind %17, 3
  %19 = and %Bool %15, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  call void (%Value*) @checkFunc (%Value* %4)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @checkModule (%ModuleContext*) {

;stmt0:
  %2 = getelementptr inbounds %ModuleContext, %ModuleContext* %0, i32 0, i32 2
  %3 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %2, %MapForeachHandler @mcheck, %Unit* %3)

;stmt1:
  %4 = load %Str, %Str* @_func358_str1
  %5 = getelementptr inbounds %ModuleContext, %ModuleContext* %0, i32 0, i32 0
  %6 = load %Source*, %Source** %5
  %7 = getelementptr inbounds %Source, %Source* %6, i32 0, i32 0
  %8 = getelementptr inbounds %SourceInfo, %SourceInfo* %7, i32 0, i32 2
  %9 = load %Str, %Str* %8
  %10 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %9)

;stmt2:
  %11 = getelementptr inbounds %ModuleContext, %ModuleContext* %0, i32 0, i32 1
  %12 = getelementptr inbounds %Index, %Index* %11, i32 0, i32 0
  %13 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %12, %MapForeachHandler @tchk, %Unit* %13)

;stmt3:
  %14 = getelementptr inbounds %ModuleContext, %ModuleContext* %0, i32 0, i32 1
  %15 = getelementptr inbounds %Index, %Index* %14, i32 0, i32 1
  %16 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %15, %MapForeachHandler @vchk, %Unit* %16)

;stmt4:
  %17 = load %Str, %Str* @_func358_str2
  %18 = getelementptr inbounds %ModuleContext, %ModuleContext* %0, i32 0, i32 0
  %19 = load %Source*, %Source** %18
  %20 = getelementptr inbounds %Source, %Source* %19, i32 0, i32 0
  %21 = getelementptr inbounds %SourceInfo, %SourceInfo* %20, i32 0, i32 2
  %22 = load %Str, %Str* %21
  %23 = call %Int32 (%Str, ...) @printf (%Str %17, %Str %22)
  ret void
}

define void @checkFunc (%Value*) {

;stmt0:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %3 = load %Value*, %Value** %2

;stmt1:
  %4 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  store %Value* %0, %Value** %4

;stmt2:
  %5 = getelementptr inbounds %Value, %Value* %0, i32 0, i32 3
  %6 = load %Definition*, %Definition** %5
  %7 = getelementptr inbounds %Definition, %Definition* %6, i32 0, i32 11
  %8 = getelementptr inbounds %FuncDef, %FuncDef* %7, i32 0, i32 1
  %9 = load %Block*, %Block** %8

;stmt3:
  %10 = bitcast %Block* %9 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  call void (%Block*) @stmtBlockCheck (%Block* %9)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %13 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  store %Value* %3, %Value** %13
  ret void
}

define %Int32 @main (%Int32, %Str*) {

;stmt0:
  %3 = load %Str, %Str* @_func363_str1
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Int32 0, %Int32 5)

;stmt1:
  call void () @init ()

;stmt2:
  call void (%Int32, %Str*) @parseArgs (%Int32 %0, %Str* %1)

;stmt3:
  %5 = load %Str, %Str* @_func363_str2
  %6 = call %SourceInfo (%Str) @getSourceInfo (%Str %5)

;stmt4:
  %7 = call %Source* (%SourceInfo) @openSource (%SourceInfo %6)

;stmt5:
  %8 = bitcast %Source* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  ret %Int32 -1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %12 = call %ModuleContext* (%Source*) @parse (%Source* %7)

;stmt9:
  %13 = load %Str, %Str* @_func363_str3
  %14 = load %Nat32, %Nat32* @lines
  %15 = call %Int32 (%Str, ...) @printf (%Str %13, %Nat32 %14)

;stmt10:
  call void (%ModuleContext*) @checkModule (%ModuleContext* %12)

;stmt11:
  %16 = load %Nat32, %Nat32* @errcnt
  %17 = icmp ugt %Nat32 %16, 0
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %18 = load %Str, %Str* @_func363_str4
  %19 = load %Nat32, %Nat32* @errcnt
  %20 = call %Int32 (%Str, ...) @printf (%Str %18, %Nat32 %19)

;stmt14:
  %21 = load %Nat32, %Nat32* @errcnt
  %22 = bitcast %Nat32 %21 to %Int32
  ret %Int32 %22
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt15:
  %24 = load %Arch, %Arch* @arch
  %25 = load %Str, %Str* @_func363_str5
  call void (%Arch, %Str) @printer_init (%Arch %24, %Str %25)

;stmt16:
  %26 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  call void (%Assembly*) @print_assembly (%Assembly* %26)

;stmt17:
  %27 = load %Nat32, %Nat32* @errcnt
  %28 = icmp ne %Nat32 %27, 0
  %29 = sext %Bool %28 to %Int32
  ret %Int32 %29
}

define void @parseArgs (%Int32, %Str*) {

;stmt0:
  %3 = alloca %Int32

;stmt1:
  store %Int32 1, %Int32* %3

;stmt2:
  br label %continue_0
continue_0:
  %4 = load %Int32, %Int32* %3
  %5 = icmp slt %Int32 %4, %0
  br i1 %5, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %6 = load %Int32, %Int32* %3
  %7 = getelementptr inbounds %Str, %Str* %1, %Int32 %6
  %8 = load %Str, %Str* %7

;stmt5:
  %9 = load %Str, %Str* @_func364_str1
  %10 = call %Int32 (%Str, %Str, %Nat32) @strncmp (%Str %8, %Str %9, %Nat32 6)
  %11 = icmp eq %Int32 %10, 0
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %12 = getelementptr inbounds %Nat8, %Str %8, %Int32 6
  %13 = bitcast %Nat8* %12 to %Str
  %14 = load %Str, %Str* @_func364_str2
  %15 = call %Int32 (%Str, %Str) @strcmp (%Str %13, %Str %14)
  %16 = icmp eq %Int32 %15, 0
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  store %Arch 1, %Arch* @arch
  br label %endif_1
else_1:

;stmt10:
  %17 = getelementptr inbounds %Nat8, %Str %8, %Int32 6
  %18 = bitcast %Nat8* %17 to %Str
  %19 = load %Str, %Str* @_func364_str3
  %20 = call %Int32 (%Str, %Str) @strcmp (%Str %18, %Str %19)
  %21 = icmp eq %Int32 %20, 0
  br i1 %21, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  store %Arch 0, %Arch* @arch
  br label %endif_2
else_2:

;stmt13:

;stmt14:
  %22 = load %Str, %Str* @_func364_str4
  call void (%Str) @fatal (%Str %22)
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt15:
  %23 = load %Str, %Str* @_func364_str5
  %24 = call %Int32 (%Str, %Str, %Nat32) @strncmp (%Str %8, %Str %23, %Nat32 5)
  %25 = icmp eq %Int32 %24, 0
  br i1 %25, label %then_3, label %else_3
then_3:

;stmt16:

;stmt17:
  %26 = getelementptr inbounds %Nat8, %Str %8, %Int32 5
  %27 = bitcast %Nat8* %26 to %Str
  call void (%Str) @liblist_add (%Str %27)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt18:
  %28 = load %Str, %Str* @_func364_str6
  %29 = call %Int32 (%Str, %Str, %Nat32) @strncmp (%Str %8, %Str %28, %Nat32 6)
  %30 = icmp eq %Int32 %29, 0
  br i1 %30, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %31 = getelementptr inbounds %Nat8, %Str %8, %Int32 6
  %32 = bitcast %Nat8* %31 to %Str
  call void (%Str) @readConfig (%Str %32)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:

;stmt21:
  %33 = load %Int32, %Int32* %3
  %34 = add %Int32 %33, 1
  store %Int32 %34, %Int32* %3
  br label %continue_0
break_0:
  ret void
}

define void @usage () {

;stmt0:
  %1 = load %Str, %Str* @_func365_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %3 = load %Str, %Str* @_func365_str2
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)

;stmt2:
  %5 = load %Str, %Str* @_func365_str3
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)

;stmt3:
  %7 = load %Str, %Str* @_func365_str4
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  ret void
}

define void @shwt (%Unit*, %Unit*, %Unit*) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Str
  %5 = call %Nat32 (%Str) @strlen (%Str %4)

;stmt1:
  %6 = load %Str, %Str* @_func367_str1
  %7 = call %Int32 (%Str, ...) @printf (%Str %6, %Unit* %0)

;stmt2:
  %8 = alloca %Nat32

;stmt3:
  store %Nat32 0, %Nat32* %8

;stmt4:
  br label %continue_0
continue_0:
  %9 = load %Nat32, %Nat32* %8
  %10 = sub %Nat32 40, %5
  %11 = icmp ult %Nat32 %9, %10
  br i1 %11, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %12 = load %Str, %Str* @_func367_str2
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)

;stmt7:
  %14 = load %Nat32, %Nat32* %8
  %15 = add %Nat32 %14, 1
  store %Nat32 %15, %Nat32* %8
  br label %continue_0
break_0:

;stmt8:
  %16 = bitcast %Unit* %1 to %Type*

;stmt9:
  call void (%Type*) @prttype (%Type* %16)

;stmt10:
  %17 = load %Str, %Str* @_func367_str3
  %18 = call %Int32 (%Str, ...) @printf (%Str %17)
  ret void
}

define void @showTypes () {

;stmt0:
  %1 = load %ModuleContext*, %ModuleContext** @old_mctx
  %2 = getelementptr inbounds %ModuleContext, %ModuleContext* %1, i32 0, i32 1
  %3 = getelementptr inbounds %Index, %Index* %2, i32 0, i32 0
  %4 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %3, %MapForeachHandler @shwt, %Unit* %4)
  ret void
}

define void @shwv (%Unit*, %Unit*, %Unit*) {

;stmt0:
  %4 = bitcast %Unit* %0 to %Str
  %5 = call %Nat32 (%Str) @strlen (%Str %4)

;stmt1:
  %6 = load %Str, %Str* @_func369_str1
  %7 = call %Int32 (%Str, ...) @printf (%Str %6, %Unit* %0)

;stmt2:
  %8 = alloca %Nat32

;stmt3:
  store %Nat32 0, %Nat32* %8

;stmt4:
  br label %continue_0
continue_0:
  %9 = load %Nat32, %Nat32* %8
  %10 = sub %Nat32 40, %5
  %11 = icmp ult %Nat32 %9, %10
  br i1 %11, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %12 = load %Str, %Str* @_func369_str2
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)

;stmt7:
  %14 = load %Nat32, %Nat32* %8
  %15 = add %Nat32 %14, 1
  store %Nat32 %15, %Nat32* %8
  br label %continue_0
break_0:

;stmt8:
  %16 = bitcast %Unit* %1 to %Value*
  %17 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 1
  %18 = load %Type*, %Type** %17
  call void (%Type*) @prttype (%Type* %18)

;stmt9:
  %19 = load %Str, %Str* @_func369_str3
  %20 = call %Int32 (%Str, ...) @printf (%Str %19)
  ret void
}

define void @showValues () {

;stmt0:
  %1 = load %ModuleContext*, %ModuleContext** @old_mctx
  %2 = getelementptr inbounds %ModuleContext, %ModuleContext* %1, i32 0, i32 1
  %3 = getelementptr inbounds %Index, %Index* %2, i32 0, i32 1
  %4 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %3, %MapForeachHandler @shwv, %Unit* %4)
  ret void
}

;metadata:
