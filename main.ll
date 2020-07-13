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
%Settings = type {%Nat32, %Nat32, %Nat32, %Nat32, %Nat32, %Nat32}
%TokenType = type %Int16
%TokenInfo = type {%Str, %Nat32, %Nat16, %Nat16}
%Token = type {%TokenType, %TokenInfo, [0 x %Nat8]}
%State = type {%Int32, %TokenType, [256 x %Nat8], %Nat16, %Nat32, %Nat32, %Nat16, %Str, %Nat8}
%Rule = type %Bool (%Nat8)*
%Source = type {%Str, %Str, %Str, %List*, %Node*}
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
%ValueParser = type %Value* ()*
%StmtParser = type %Stmt* (%TokenInfo*)*
%Block = type {%Block*, %List*, %List, %List, %List*}
%If = type {%Value*, %Stmt*, %Stmt*}
%While = type {%Value*, %Stmt*}
%VarDef = type {%Str, %Type*, %Value*, %TokenInfo*}
%StmtKind = type %Int16
%Stmt = type {%StmtKind, [2 x %Value*], %Block*, %VarDef*, %While*, %If*, %Str, %TokenInfo*}
%AssemblyItemKind = type %Int16
%Pad = type [3 x %Nat8]
%AssemblyItem = type {%AssemblyItemKind, %Str, %Pad, %StringDef, %Pad, %TypeDef, %Pad, %ConstDef, %Pad, %ArrayDef, %Pad, %FuncDef, %Pad, %AssemblyVarDef}
%TypeDef = type {%Type*}
%ConstDef = type {%Value*}
%StringDef = type {%Str, %Nat32}
%ArrayDef = type {%Type*, %Nat32, %List*}
%FuncDef = type {%Type*, %Block*}
%AssemblyVarDef = type {%Type*, %Value*}
%Assembly = type {%Str, %List*, %List*, %List*, %List*, %List*}
%TypeParser = type %Type* ()*
%ValueUn = type {%Value*}
%ValueBin = type {%Value*, %Value*}
%ValueIndex = type {%Value*, %Value*}
%ValueAccess = type {%Value*, %Str}
%ValueCall = type {%Value*, %List*}
%ValueCast = type {%Value*, %Type*}
%ValueKind = type %Int16
%Value = type {%ValueKind, %Type*, %Int64, %Nat32, %Str, %ValueUn, %ValueBin, %ValueIndex, %ValueAccess, %ValueCast, %ValueCall, %Type*, %AssemblyItem*, %TokenInfo*, %TokenInfo*, %TokenInfo*}
%ModuleContext = type {%Source*, %List, %List}
%FuncContext = type {%Value*, %Block*, %Nat32, %Nat32, %Nat32, %Nat32, %Nat32}
%MetadataClass = type %Int16
%Metadata = type {%MetadataClass}
%ObjKind = type %Int16
%Obj = type {%ObjKind, %Type*, %Int64, %Str, %Nat32}
%Eval = type %Obj (%Value*)*
%Arguments = type {[256 x %Obj], %Nat16}
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
@.str._func45_str3 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_func45_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func45_str3, i32 0, i32 0), align 8
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
@.str._func67_str1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@_func67_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func67_str1, i32 0, i32 0), align 8
@.str._func68_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_func68_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func68_str1, i32 0, i32 0), align 8
@.str._func68_str2 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@_func68_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func68_str2, i32 0, i32 0), align 8
@.str._func68_str3 = private unnamed_addr constant [8 x i8] c"/main.m\00", align 1
@_func68_str3 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func68_str3, i32 0, i32 0), align 8
@.str._func68_str4 = private unnamed_addr constant [7 x i8] c"main.m\00", align 1
@_func68_str4 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func68_str4, i32 0, i32 0), align 8
@.str._func69_str1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@_func69_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func69_str1, i32 0, i32 0), align 8
@.str._func71_str1 = private unnamed_addr constant [23 x i8] c"\0A%c[0;%dminfo:%c[0m %s\00", align 1
@_func71_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func71_str1, i32 0, i32 0), align 8
@.str._func72_str1 = private unnamed_addr constant [35 x i8] c"\0A%c[0;%dmwarning%c[0m (%s:%d) : %s\00", align 1
@_func72_str1 = constant i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str._func72_str1, i32 0, i32 0), align 8
@.str._func72_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func72_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func72_str2, i32 0, i32 0), align 8
@.str._func72_str3 = private unnamed_addr constant [26 x i8] c"\0A%c[0;%dmwarning:%c[0m %s\00", align 1
@_func72_str3 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func72_str3, i32 0, i32 0), align 8
@.str._func73_str1 = private unnamed_addr constant [24 x i8] c"\0A%c[0;%dmerror:%c[0m %s\00", align 1
@_func73_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func73_str1, i32 0, i32 0), align 8
@.str._func73_str2 = private unnamed_addr constant [33 x i8] c"\0A%c[0;%dmerror%c[0m (%s:%d) : %s\00", align 1
@_func73_str2 = constant i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str._func73_str2, i32 0, i32 0), align 8
@.str._func73_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func73_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func73_str3, i32 0, i32 0), align 8
@.str._func73_str4 = private unnamed_addr constant [14 x i8] c"*** STOP ***\0A\00", align 1
@_func73_str4 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func73_str4, i32 0, i32 0), align 8
@.str._func74_str1 = private unnamed_addr constant [17 x i8] c"\0A%c[0;%dm%s%c[0m\00", align 1
@_func74_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func74_str1, i32 0, i32 0), align 8
@.str._func74_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func74_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func74_str2, i32 0, i32 0), align 8
@.str._func75_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func75_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func75_str1, i32 0, i32 0), align 8
@.str._func75_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func75_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func75_str2, i32 0, i32 0), align 8
@.str._func76_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func76_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func76_str1, i32 0, i32 0), align 8
@.str._func76_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@_func76_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func76_str2, i32 0, i32 0), align 8
@.str._func76_str3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@_func76_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func76_str3, i32 0, i32 0), align 8
@.str._func76_str4 = private unnamed_addr constant [15 x i8] c"%c[0;%dm^%c[0m\00", align 1
@_func76_str4 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func76_str4, i32 0, i32 0), align 8
@.str._func77_str1 = private unnamed_addr constant [24 x i8] c"%c[0;%dmfatal:%c[0m %s\0A\00", align 1
@_func77_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func77_str1, i32 0, i32 0), align 8
@.str._func78_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@_func78_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func78_str1, i32 0, i32 0), align 8
@.str._func78_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@_func78_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func78_str2, i32 0, i32 0), align 8
@.str._func78_str3 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func78_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func78_str3, i32 0, i32 0), align 8
@.str._func78_str4 = private unnamed_addr constant [14 x i8] c"<TypeUnknown>\00", align 1
@_func78_str4 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func78_str4, i32 0, i32 0), align 8
@.str._func78_str5 = private unnamed_addr constant [14 x i8] c"<TypeNumeric>\00", align 1
@_func78_str5 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func78_str5, i32 0, i32 0), align 8
@.str._func78_str6 = private unnamed_addr constant [31 x i8] c"unkn type kind %d, maybe func?\00", align 1
@_func78_str6 = constant i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str._func78_str6, i32 0, i32 0), align 8
@.str._func79_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@_func79_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func79_str1, i32 0, i32 0), align 8
@.str._func80_str1 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@_func80_str1 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func80_str1, i32 0, i32 0), align 8
@.str._func80_str2 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func80_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func80_str2, i32 0, i32 0), align 8
@.str._func79_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func79_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func79_str2, i32 0, i32 0), align 8
@.str._func79_str3 = private unnamed_addr constant [16 x i8] c"<record:0x%02x>\00", align 1
@_func79_str3 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func79_str3, i32 0, i32 0), align 8
@.str._func81_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func81_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func81_str1, i32 0, i32 0), align 8
@.str._func82_str1 = private unnamed_addr constant [5 x i8] c"%s, \00", align 1
@_func82_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func82_str1, i32 0, i32 0), align 8
@.str._func81_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func81_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func81_str2, i32 0, i32 0), align 8
@.str._func83_str1 = private unnamed_addr constant [3 x i8] c"[]\00", align 1
@_func83_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func83_str1, i32 0, i32 0), align 8
@.str._func83_str2 = private unnamed_addr constant [5 x i8] c"[%d]\00", align 1
@_func83_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func83_str2, i32 0, i32 0), align 8
@.str._func84_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@_func84_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func84_str1, i32 0, i32 0), align 8
@.str._func85_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func85_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func85_str1, i32 0, i32 0), align 8
@.str._func85_str2 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@_func85_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func85_str2, i32 0, i32 0), align 8
@.str._func84_str2 = private unnamed_addr constant [6 x i8] c") -> \00", align 1
@_func84_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func84_str2, i32 0, i32 0), align 8
@.str._func88_str1 = private unnamed_addr constant [10 x i8] c"field_new\00", align 1
@_func88_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func88_str1, i32 0, i32 0), align 8
@.str._func105_str1 = private unnamed_addr constant [13 x i8] c"unknown type\00", align 1
@_func105_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func105_str1, i32 0, i32 0), align 8
@.str._func108_str1 = private unnamed_addr constant [27 x i8] c"m2/type/func f1.id == Nil!\00", align 1
@_func108_str1 = constant i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str._func108_str1, i32 0, i32 0), align 8
@.str._func108_str2 = private unnamed_addr constant [27 x i8] c"m2/type/func f2.id == Nil!\00", align 1
@_func108_str2 = constant i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str._func108_str2, i32 0, i32 0), align 8
@.str._func111_str1 = private unnamed_addr constant [26 x i8] c"type_eq unknown type kind\00", align 1
@_func111_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func111_str1, i32 0, i32 0), align 8
@.str._func112_str1 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@_func112_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func112_str1, i32 0, i32 0), align 8
@.str._func112_str2 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@_func112_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func112_str2, i32 0, i32 0), align 8
@.str._func112_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@_func112_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func112_str3, i32 0, i32 0), align 8
@.str._func112_str4 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@_func112_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func112_str4, i32 0, i32 0), align 8
@.str._func112_str5 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@_func112_str5 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func112_str5, i32 0, i32 0), align 8
@.str._func112_str6 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@_func112_str6 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str6, i32 0, i32 0), align 8
@.str._func112_str7 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@_func112_str7 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str7, i32 0, i32 0), align 8
@.str._func112_str8 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@_func112_str8 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str8, i32 0, i32 0), align 8
@.str._func112_str9 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@_func112_str9 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str9, i32 0, i32 0), align 8
@.str._func112_str10 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@_func112_str10 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str10, i32 0, i32 0), align 8
@.str._func112_str11 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@_func112_str11 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str11, i32 0, i32 0), align 8
@.str._func112_str12 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@_func112_str12 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func112_str12, i32 0, i32 0), align 8
@.str._func112_str13 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@_func112_str13 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func112_str13, i32 0, i32 0), align 8
@.str._func112_str14 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@_func112_str14 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str14, i32 0, i32 0), align 8
@.str._func112_str15 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@_func112_str15 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str15, i32 0, i32 0), align 8
@.str._func112_str16 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@_func112_str16 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str16, i32 0, i32 0), align 8
@.str._func112_str17 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@_func112_str17 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str17, i32 0, i32 0), align 8
@.str._func112_str18 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@_func112_str18 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str18, i32 0, i32 0), align 8
@.str._func112_str19 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@_func112_str19 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str19, i32 0, i32 0), align 8
@.str._func112_str20 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@_func112_str20 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func112_str20, i32 0, i32 0), align 8
@.str._func112_str21 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@_func112_str21 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str21, i32 0, i32 0), align 8
@.str._func112_str22 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@_func112_str22 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str22, i32 0, i32 0), align 8
@.str._func112_str23 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@_func112_str23 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str23, i32 0, i32 0), align 8
@.str._func112_str24 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@_func112_str24 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str24, i32 0, i32 0), align 8
@.str._func112_str25 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@_func112_str25 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func112_str25, i32 0, i32 0), align 8
@.str._func112_str26 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@_func112_str26 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func112_str26, i32 0, i32 0), align 8
@.str._func112_str27 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@_func112_str27 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str27, i32 0, i32 0), align 8
@.str._func112_str28 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@_func112_str28 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func112_str28, i32 0, i32 0), align 8
@.str._func112_str29 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@_func112_str29 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func112_str29, i32 0, i32 0), align 8
@.str._func112_str30 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@_func112_str30 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func112_str30, i32 0, i32 0), align 8
@.str._func112_str31 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@_func112_str31 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str31, i32 0, i32 0), align 8
@.str._func112_str32 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@_func112_str32 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str32, i32 0, i32 0), align 8
@.str._func112_str33 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@_func112_str33 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str33, i32 0, i32 0), align 8
@.str._func112_str34 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@_func112_str34 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func112_str34, i32 0, i32 0), align 8
@.str._func112_str35 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@_func112_str35 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str35, i32 0, i32 0), align 8
@.str._func112_str36 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@_func112_str36 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str36, i32 0, i32 0), align 8
@.str._func112_str37 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@_func112_str37 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func112_str37, i32 0, i32 0), align 8
@.str._func112_str38 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@_func112_str38 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func112_str38, i32 0, i32 0), align 8
@.str._func113_str1 = private unnamed_addr constant [9 x i8] c"type_new\00", align 1
@_func113_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func113_str1, i32 0, i32 0), align 8
@.str._func118_str1 = private unnamed_addr constant [44 x i8] c"type bind error: attempt to id redefinition\00", align 1
@_func118_str1 = constant i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str._func118_str1, i32 0, i32 0), align 8
@.str._func124_str1 = private unnamed_addr constant [45 x i8] c"value bind error: attempt to id redefinition\00", align 1
@_func124_str1 = constant i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str._func124_str1, i32 0, i32 0), align 8
@.str._func128_str1 = private unnamed_addr constant [5 x i8] c"self\00", align 1
@_func128_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func128_str1, i32 0, i32 0), align 8
@.str._func131_str1 = private unnamed_addr constant [25 x i8] c"attempt to redeclaration\00", align 1
@_func131_str1 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str._func131_str1, i32 0, i32 0), align 8
@.str._func131_str2 = private unnamed_addr constant [14 x i8] c"declared at: \00", align 1
@_func131_str2 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func131_str2, i32 0, i32 0), align 8
@.str._func132_str1 = private unnamed_addr constant [18 x i8] c"define: id == Nil\00", align 1
@_func132_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func132_str1, i32 0, i32 0), align 8
@.str._func132_str2 = private unnamed_addr constant [17 x i8] c"define: v == Nil\00", align 1
@_func132_str2 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func132_str2, i32 0, i32 0), align 8
@.str._func134_str1 = private unnamed_addr constant [5 x i8] c"%s%u\00", align 1
@_func134_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func134_str1, i32 0, i32 0), align 8
@.str._func135_str1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@_func135_str1 = constant i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str._func135_str1, i32 0, i32 0), align 8
@.str._func136_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@_func136_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func136_str1, i32 0, i32 0), align 8
@.str._func137_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@_func137_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func137_str1, i32 0, i32 0), align 8
@.str._func138_str1 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@_func138_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func138_str1, i32 0, i32 0), align 8
@.str._func139_str1 = private unnamed_addr constant [4 x i8] c"arr\00", align 1
@_func139_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func139_str1, i32 0, i32 0), align 8
@.str._func140_str1 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@_func140_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func140_str1, i32 0, i32 0), align 8
@.str._func141_str1 = private unnamed_addr constant [5 x i8] c"Type\00", align 1
@_func141_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func141_str1, i32 0, i32 0), align 8
@.str._func143_str1 = private unnamed_addr constant [24 x i8] c"expected constant value\00", align 1
@_func143_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func143_str1, i32 0, i32 0), align 8
@.str._func144_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@_func144_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func144_str1, i32 0, i32 0), align 8
@.str._func145_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@_func145_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func145_str1, i32 0, i32 0), align 8
@.str._func146_str1 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@_func146_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func146_str1, i32 0, i32 0), align 8
@.str._func147_str1 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@_func147_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func147_str1, i32 0, i32 0), align 8
@.str._func147_str2 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@_func147_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func147_str2, i32 0, i32 0), align 8
@.str._func148_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@_func148_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func148_str1, i32 0, i32 0), align 8
@.str._func148_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@_func148_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func148_str2, i32 0, i32 0), align 8
@.str._func148_str3 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@_func148_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func148_str3, i32 0, i32 0), align 8
@.str._func148_str4 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@_func148_str4 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func148_str4, i32 0, i32 0), align 8
@.str._func149_str1 = private unnamed_addr constant [3 x i8] c"<<\00", align 1
@_func149_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func149_str1, i32 0, i32 0), align 8
@.str._func149_str2 = private unnamed_addr constant [3 x i8] c">>\00", align 1
@_func149_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func149_str2, i32 0, i32 0), align 8
@.str._func150_str1 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@_func150_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func150_str1, i32 0, i32 0), align 8
@.str._func150_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@_func150_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func150_str2, i32 0, i32 0), align 8
@.str._func151_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func151_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func151_str1, i32 0, i32 0), align 8
@.str._func151_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@_func151_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func151_str2, i32 0, i32 0), align 8
@.str._func151_str3 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@_func151_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func151_str3, i32 0, i32 0), align 8
@.str._func152_str1 = private unnamed_addr constant [3 x i8] c"to\00", align 1
@_func152_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func152_str1, i32 0, i32 0), align 8
@.str._func153_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func153_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func153_str1, i32 0, i32 0), align 8
@.str._func153_str2 = private unnamed_addr constant [2 x i8] c"&\00", align 1
@_func153_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func153_str2, i32 0, i32 0), align 8
@.str._func153_str3 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@_func153_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func153_str3, i32 0, i32 0), align 8
@.str._func153_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@_func153_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func153_str4, i32 0, i32 0), align 8
@.str._func153_str5 = private unnamed_addr constant [7 x i8] c"sizeof\00", align 1
@_func153_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func153_str5, i32 0, i32 0), align 8
@.str._func153_str6 = private unnamed_addr constant [23 x i8] c"sizeof expected <type>\00", align 1
@_func153_str6 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func153_str6, i32 0, i32 0), align 8
@.str._func153_str7 = private unnamed_addr constant [8 x i8] c"alignof\00", align 1
@_func153_str7 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func153_str7, i32 0, i32 0), align 8
@.str._func153_str8 = private unnamed_addr constant [24 x i8] c"alignof expected <type>\00", align 1
@_func153_str8 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func153_str8, i32 0, i32 0), align 8
@.str._func154_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@_func154_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func154_str1, i32 0, i32 0), align 8
@.str._func154_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func154_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func154_str2, i32 0, i32 0), align 8
@.str._func154_str3 = private unnamed_addr constant [3 x i8] c",)\00", align 1
@_func154_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func154_str3, i32 0, i32 0), align 8
@.str._func154_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func154_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func154_str4, i32 0, i32 0), align 8
@.str._func154_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func154_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func154_str5, i32 0, i32 0), align 8
@.str._func154_str6 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func154_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func154_str6, i32 0, i32 0), align 8
@.str._func154_str7 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func154_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func154_str7, i32 0, i32 0), align 8
@.str._func154_str8 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@_func154_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func154_str8, i32 0, i32 0), align 8
@.str._func154_str9 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@_func154_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func154_str9, i32 0, i32 0), align 8
@.str._func154_str10 = private unnamed_addr constant [2 x i8] c".\00", align 1
@_func154_str10 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func154_str10, i32 0, i32 0), align 8
@.str._func155_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@_func155_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func155_str1, i32 0, i32 0), align 8
@.str._func155_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func155_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func155_str2, i32 0, i32 0), align 8
@.str._func156_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@_func156_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func156_str1, i32 0, i32 0), align 8
@.str._func156_str2 = private unnamed_addr constant [6 x i8] c"array\00", align 1
@_func156_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func156_str2, i32 0, i32 0), align 8
@.str._func156_str3 = private unnamed_addr constant [24 x i8] c"term: unexpected token\0A\00", align 1
@_func156_str3 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func156_str3, i32 0, i32 0), align 8
@.str._func156_str4 = private unnamed_addr constant [7 x i8] c"tt=%d\0A\00", align 1
@_func156_str4 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func156_str4, i32 0, i32 0), align 8
@.str._func156_str5 = private unnamed_addr constant [12 x i8] c"token = %s\0A\00", align 1
@_func156_str5 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func156_str5, i32 0, i32 0), align 8
@.str._func158_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func158_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func158_str1, i32 0, i32 0), align 8
@.str._func158_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func158_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func158_str2, i32 0, i32 0), align 8
@.str._func158_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func158_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func158_str3, i32 0, i32 0), align 8
@.str._func158_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func158_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func158_str4, i32 0, i32 0), align 8
@.str._func159_str1 = private unnamed_addr constant [16 x i8] c"funcdef id fail\00", align 1
@_func159_str1 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func159_str1, i32 0, i32 0), align 8
@.str._func159_str2 = private unnamed_addr constant [18 x i8] c"funcdef type fail\00", align 1
@_func159_str2 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func159_str2, i32 0, i32 0), align 8
@.str._func159_str3 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func159_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func159_str3, i32 0, i32 0), align 8
@.str._func161_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@_func161_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func161_str1, i32 0, i32 0), align 8
@.str._func161_str2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@_func161_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func161_str2, i32 0, i32 0), align 8
@.str._func161_str3 = private unnamed_addr constant [5 x i8] c"%llx\00", align 1
@_func161_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func161_str3, i32 0, i32 0), align 8
@.str._func161_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@_func161_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func161_str4, i32 0, i32 0), align 8
@.str._func165_str1 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func165_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func165_str1, i32 0, i32 0), align 8
@.str._func165_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@_func165_str2 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func165_str2, i32 0, i32 0), align 8
@.str._func165_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func165_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func165_str3, i32 0, i32 0), align 8
@.str._func169_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func169_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func169_str1, i32 0, i32 0), align 8
@.str._func169_str2 = private unnamed_addr constant [25 x i8] c"stmt::fail_with_restore\0A\00", align 1
@_func169_str2 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str._func169_str2, i32 0, i32 0), align 8
@.str._func169_str3 = private unnamed_addr constant [10 x i8] c"YYY = %s\0A\00", align 1
@_func169_str3 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func169_str3, i32 0, i32 0), align 8
@.str._func171_str1 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@_func171_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func171_str1, i32 0, i32 0), align 8
@.str._func171_str2 = private unnamed_addr constant [9 x i8] c"LTYPE = \00", align 1
@_func171_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func171_str2, i32 0, i32 0), align 8
@.str._func171_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func171_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func171_str3, i32 0, i32 0), align 8
@.str._func171_str4 = private unnamed_addr constant [9 x i8] c"RTYPE = \00", align 1
@_func171_str4 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func171_str4, i32 0, i32 0), align 8
@.str._func171_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func171_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func171_str5, i32 0, i32 0), align 8
@.str._func172_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func172_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func172_str1, i32 0, i32 0), align 8
@.str._func172_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func172_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func172_str2, i32 0, i32 0), align 8
@.str._func172_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@_func172_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func172_str3, i32 0, i32 0), align 8
@.str._func172_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func172_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func172_str4, i32 0, i32 0), align 8
@.str._func172_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@_func172_str5 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func172_str5, i32 0, i32 0), align 8
@.str._func172_str6 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func172_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func172_str6, i32 0, i32 0), align 8
@.str._func173_str1 = private unnamed_addr constant [25 x i8] c"expected Bool expression\00", align 1
@_func173_str1 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str._func173_str1, i32 0, i32 0), align 8
@.str._func174_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func174_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func174_str1, i32 0, i32 0), align 8
@.str._func174_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func174_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func174_str2, i32 0, i32 0), align 8
@.str._func175_str1 = private unnamed_addr constant [25 x i8] c"expected Bool expression\00", align 1
@_func175_str1 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str._func175_str1, i32 0, i32 0), align 8
@.str._func176_str1 = private unnamed_addr constant [27 x i8] c"expected return expression\00", align 1
@_func176_str1 = constant i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str._func176_str1, i32 0, i32 0), align 8
@.str._func178_str1 = private unnamed_addr constant [34 x i8] c"`break` outside any loop operator\00", align 1
@_func178_str1 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str._func178_str1, i32 0, i32 0), align 8
@.str._func179_str1 = private unnamed_addr constant [37 x i8] c"`continue` outside any loop operator\00", align 1
@_func179_str1 = constant i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str._func179_str1, i32 0, i32 0), align 8
@.str._func180_str1 = private unnamed_addr constant [15 x i8] c"expected label\00", align 1
@_func180_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func180_str1, i32 0, i32 0), align 8
@.str._func183_str1 = private unnamed_addr constant [9 x i8] c"stmt_new\00", align 1
@_func183_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func183_str1, i32 0, i32 0), align 8
@.str._func185_str1 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@_func185_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func185_str1, i32 0, i32 0), align 8
@.str._func185_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func185_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func185_str2, i32 0, i32 0), align 8
@.str._func185_str3 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@_func185_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func185_str3, i32 0, i32 0), align 8
@.str._func185_str4 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@_func185_str4 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func185_str4, i32 0, i32 0), align 8
@.str._func185_str5 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@_func185_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func185_str5, i32 0, i32 0), align 8
@.str._func185_str6 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@_func185_str6 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func185_str6, i32 0, i32 0), align 8
@.str._func185_str7 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@_func185_str7 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func185_str7, i32 0, i32 0), align 8
@.str._func185_str8 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@_func185_str8 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func185_str8, i32 0, i32 0), align 8
@.str._func185_str9 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@_func185_str9 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func185_str9, i32 0, i32 0), align 8
@.str._func185_str10 = private unnamed_addr constant [5 x i8] c"goto\00", align 1
@_func185_str10 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func185_str10, i32 0, i32 0), align 8
@.str._func185_str11 = private unnamed_addr constant [2 x i8] c":\00", align 1
@_func185_str11 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func185_str11, i32 0, i32 0), align 8
@.str._func191_str1 = private unnamed_addr constant [14 x i8] c"asmTypedefAdd\00", align 1
@_func191_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func191_str1, i32 0, i32 0), align 8
@.str._func192_str1 = private unnamed_addr constant [13 x i8] c"asmStringAdd\00", align 1
@_func192_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func192_str1, i32 0, i32 0), align 8
@.str._func193_str1 = private unnamed_addr constant [12 x i8] c"asmArrayAdd\00", align 1
@_func193_str1 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func193_str1, i32 0, i32 0), align 8
@.str._func194_str1 = private unnamed_addr constant [11 x i8] c"asmFuncAdd\00", align 1
@_func194_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func194_str1, i32 0, i32 0), align 8
@.str._func195_str1 = private unnamed_addr constant [10 x i8] c"asmVarAdd\00", align 1
@_func195_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func195_str1, i32 0, i32 0), align 8
@.str._func199_str1 = private unnamed_addr constant [7 x i8] c"record\00", align 1
@_func199_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func199_str1, i32 0, i32 0), align 8
@.str._func199_str2 = private unnamed_addr constant [5 x i8] c"enum\00", align 1
@_func199_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func199_str2, i32 0, i32 0), align 8
@.str._func199_str3 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func199_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func199_str3, i32 0, i32 0), align 8
@.str._func199_str4 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@_func199_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func199_str4, i32 0, i32 0), align 8
@.str._func199_str5 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@_func199_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func199_str5, i32 0, i32 0), align 8
@.str._func199_str6 = private unnamed_addr constant [14 x i8] c"expected type\00", align 1
@_func199_str6 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func199_str6, i32 0, i32 0), align 8
@.str._func199_str7 = private unnamed_addr constant [8 x i8] c"tok=%s\0A\00", align 1
@_func199_str7 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func199_str7, i32 0, i32 0), align 8
@.str._func200_str1 = private unnamed_addr constant [12 x i8] c"expected id\00", align 1
@_func200_str1 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func200_str1, i32 0, i32 0), align 8
@.str._func201_str1 = private unnamed_addr constant [14 x i8] c"dofield error\00", align 1
@_func201_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func201_str1, i32 0, i32 0), align 8
@.str._func201_str2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func201_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func201_str2, i32 0, i32 0), align 8
@.str._func202_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func202_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func202_str1, i32 0, i32 0), align 8
@.str._func202_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func202_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func202_str2, i32 0, i32 0), align 8
@.str._func203_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func203_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func203_str1, i32 0, i32 0), align 8
@.str._func203_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func203_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func203_str2, i32 0, i32 0), align 8
@.str._func203_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func203_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func203_str3, i32 0, i32 0), align 8
@.str._func203_str4 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func203_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func203_str4, i32 0, i32 0), align 8
@.str._func204_str1 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@_func204_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func204_str1, i32 0, i32 0), align 8
@.str._func204_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@_func204_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func204_str2, i32 0, i32 0), align 8
@.str._func205_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func205_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func205_str1, i32 0, i32 0), align 8
@.str._func205_str2 = private unnamed_addr constant [3 x i8] c"->\00", align 1
@_func205_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func205_str2, i32 0, i32 0), align 8
@.str._func205_str3 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@_func205_str3 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func205_str3, i32 0, i32 0), align 8
@.str._func206_str1 = private unnamed_addr constant [15 x i8] c"ValueUndefined\00", align 1
@_func206_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func206_str1, i32 0, i32 0), align 8
@.str._func206_str2 = private unnamed_addr constant [9 x i8] c"ValueRef\00", align 1
@_func206_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str2, i32 0, i32 0), align 8
@.str._func206_str3 = private unnamed_addr constant [11 x i8] c"ValueDeref\00", align 1
@_func206_str3 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func206_str3, i32 0, i32 0), align 8
@.str._func206_str4 = private unnamed_addr constant [9 x i8] c"ValueNot\00", align 1
@_func206_str4 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str4, i32 0, i32 0), align 8
@.str._func206_str5 = private unnamed_addr constant [11 x i8] c"ValueMinus\00", align 1
@_func206_str5 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func206_str5, i32 0, i32 0), align 8
@.str._func206_str6 = private unnamed_addr constant [9 x i8] c"ValueShl\00", align 1
@_func206_str6 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str6, i32 0, i32 0), align 8
@.str._func206_str7 = private unnamed_addr constant [9 x i8] c"ValueShr\00", align 1
@_func206_str7 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str7, i32 0, i32 0), align 8
@.str._func206_str8 = private unnamed_addr constant [9 x i8] c"ValueAdd\00", align 1
@_func206_str8 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str8, i32 0, i32 0), align 8
@.str._func206_str9 = private unnamed_addr constant [9 x i8] c"ValueSub\00", align 1
@_func206_str9 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str9, i32 0, i32 0), align 8
@.str._func206_str10 = private unnamed_addr constant [9 x i8] c"ValueMul\00", align 1
@_func206_str10 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str10, i32 0, i32 0), align 8
@.str._func206_str11 = private unnamed_addr constant [9 x i8] c"ValueDiv\00", align 1
@_func206_str11 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str11, i32 0, i32 0), align 8
@.str._func206_str12 = private unnamed_addr constant [9 x i8] c"ValueMod\00", align 1
@_func206_str12 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str12, i32 0, i32 0), align 8
@.str._func206_str13 = private unnamed_addr constant [8 x i8] c"ValueOr\00", align 1
@_func206_str13 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func206_str13, i32 0, i32 0), align 8
@.str._func206_str14 = private unnamed_addr constant [9 x i8] c"ValueXor\00", align 1
@_func206_str14 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str14, i32 0, i32 0), align 8
@.str._func206_str15 = private unnamed_addr constant [9 x i8] c"ValueAnd\00", align 1
@_func206_str15 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func206_str15, i32 0, i32 0), align 8
@.str._func206_str16 = private unnamed_addr constant [8 x i8] c"ValueEq\00", align 1
@_func206_str16 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func206_str16, i32 0, i32 0), align 8
@.str._func206_str17 = private unnamed_addr constant [8 x i8] c"ValueNe\00", align 1
@_func206_str17 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func206_str17, i32 0, i32 0), align 8
@.str._func206_str18 = private unnamed_addr constant [8 x i8] c"ValueLt\00", align 1
@_func206_str18 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func206_str18, i32 0, i32 0), align 8
@.str._func206_str19 = private unnamed_addr constant [8 x i8] c"ValueGt\00", align 1
@_func206_str19 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func206_str19, i32 0, i32 0), align 8
@.str._func206_str20 = private unnamed_addr constant [8 x i8] c"ValueLe\00", align 1
@_func206_str20 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func206_str20, i32 0, i32 0), align 8
@.str._func206_str21 = private unnamed_addr constant [8 x i8] c"ValueGe\00", align 1
@_func206_str21 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func206_str21, i32 0, i32 0), align 8
@.str._func206_str22 = private unnamed_addr constant [10 x i8] c"ValueCall\00", align 1
@_func206_str22 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func206_str22, i32 0, i32 0), align 8
@.str._func206_str23 = private unnamed_addr constant [11 x i8] c"ValueIndex\00", align 1
@_func206_str23 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func206_str23, i32 0, i32 0), align 8
@.str._func206_str24 = private unnamed_addr constant [12 x i8] c"ValueAccess\00", align 1
@_func206_str24 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func206_str24, i32 0, i32 0), align 8
@.str._func206_str25 = private unnamed_addr constant [10 x i8] c"ValueCast\00", align 1
@_func206_str25 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func206_str25, i32 0, i32 0), align 8
@.str._func206_str26 = private unnamed_addr constant [13 x i8] c"ValueInvalid\00", align 1
@_func206_str26 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func206_str26, i32 0, i32 0), align 8
@.str._func206_str27 = private unnamed_addr constant [13 x i8] c"ValueUnknown\00", align 1
@_func206_str27 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func206_str27, i32 0, i32 0), align 8
@.str._func207_str1 = private unnamed_addr constant [13 x i8] c"value: %p {\0A\00", align 1
@_func207_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func207_str1, i32 0, i32 0), align 8
@.str._func207_str2 = private unnamed_addr constant [12 x i8] c"  kind: %s\0A\00", align 1
@_func207_str2 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func207_str2, i32 0, i32 0), align 8
@.str._func207_str3 = private unnamed_addr constant [9 x i8] c"  type: \00", align 1
@_func207_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func207_str3, i32 0, i32 0), align 8
@.str._func207_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func207_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func207_str4, i32 0, i32 0), align 8
@.str._func207_str5 = private unnamed_addr constant [10 x i8] c"  id: %s\0A\00", align 1
@_func207_str5 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func207_str5, i32 0, i32 0), align 8
@.str._func207_str6 = private unnamed_addr constant [11 x i8] c"  imm: %d\0A\00", align 1
@_func207_str6 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func207_str6, i32 0, i32 0), align 8
@.str._func207_str7 = private unnamed_addr constant [3 x i8] c"}\0A\00", align 1
@_func207_str7 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func207_str7, i32 0, i32 0), align 8
@.str._func209_str1 = private unnamed_addr constant [20 x i8] c"nat:: v.type == Nil\00", align 1
@_func209_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str._func209_str1, i32 0, i32 0), align 8
@.str._func209_str2 = private unnamed_addr constant [15 x i8] c"nat:: t == Nil\00", align 1
@_func209_str2 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func209_str2, i32 0, i32 0), align 8
@.str._func211_str1 = private unnamed_addr constant [40 x i8] c"value/un :: unknown value kind received\00", align 1
@_func211_str1 = constant i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str._func211_str1, i32 0, i32 0), align 8
@.str._func216_str1 = private unnamed_addr constant [18 x i8] c"expected pointer\0A\00", align 1
@_func216_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func216_str1, i32 0, i32 0), align 8
@.str._func219_str1 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@_func219_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func219_str1, i32 0, i32 0), align 8
@.str._func219_str2 = private unnamed_addr constant [9 x i8] c"LTYPE = \00", align 1
@_func219_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func219_str2, i32 0, i32 0), align 8
@.str._func219_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func219_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func219_str3, i32 0, i32 0), align 8
@.str._func219_str4 = private unnamed_addr constant [9 x i8] c"RTYPE = \00", align 1
@_func219_str4 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func219_str4, i32 0, i32 0), align 8
@.str._func219_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func219_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func219_str5, i32 0, i32 0), align 8
@.str._func219_str6 = private unnamed_addr constant [18 x i8] c"binary type error\00", align 1
@_func219_str6 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func219_str6, i32 0, i32 0), align 8
@.str._func220_str1 = private unnamed_addr constant [32 x i8] c"binImm :: unknown bin operation\00", align 1
@_func220_str1 = constant i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str._func220_str1, i32 0, i32 0), align 8
@.str._func226_str1 = private unnamed_addr constant [41 x i8] c"expected record / pointer to record type\00", align 1
@_func226_str1 = constant i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str._func226_str1, i32 0, i32 0), align 8
@.str._func226_str2 = private unnamed_addr constant [16 x i8] c"undefined field\00", align 1
@_func226_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func226_str2, i32 0, i32 0), align 8
@.str._func228_str1 = private unnamed_addr constant [19 x i8] c"undefined function\00", align 1
@_func228_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func228_str1, i32 0, i32 0), align 8
@.str._func228_str2 = private unnamed_addr constant [18 x i8] c"expected function\00", align 1
@_func228_str2 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func228_str2, i32 0, i32 0), align 8
@.str._func229_str1 = private unnamed_addr constant [21 x i8] c"not enough arguments\00", align 1
@_func229_str1 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str._func229_str1, i32 0, i32 0), align 8
@.str._func229_str2 = private unnamed_addr constant [19 x i8] c"too many arguments\00", align 1
@_func229_str2 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func229_str2, i32 0, i32 0), align 8
@.str._func229_str3 = private unnamed_addr constant [37 x i8] c"argument type not match param type: \00", align 1
@_func229_str3 = constant i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str._func229_str3, i32 0, i32 0), align 8
@.str._func229_str4 = private unnamed_addr constant [7 x i8] c"arg = \00", align 1
@_func229_str4 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func229_str4, i32 0, i32 0), align 8
@.str._func229_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func229_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func229_str5, i32 0, i32 0), align 8
@.str._func229_str6 = private unnamed_addr constant [7 x i8] c"par = \00", align 1
@_func229_str6 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func229_str6, i32 0, i32 0), align 8
@.str._func229_str7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func229_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func229_str7, i32 0, i32 0), align 8
@.str._func234_str1 = private unnamed_addr constant [20 x i8] c"sizeof unknown type\00", align 1
@_func234_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str._func234_str1, i32 0, i32 0), align 8
@.str._func236_str1 = private unnamed_addr constant [21 x i8] c"alignof unknown type\00", align 1
@_func236_str1 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str._func236_str1, i32 0, i32 0), align 8
@.str._func237_str1 = private unnamed_addr constant [6 x i8] c"False\00", align 1
@_func237_str1 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func237_str1, i32 0, i32 0), align 8
@.str._func237_str2 = private unnamed_addr constant [5 x i8] c"True\00", align 1
@_func237_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func237_str2, i32 0, i32 0), align 8
@.str._func237_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@_func237_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func237_str3, i32 0, i32 0), align 8
@.str._func237_str4 = private unnamed_addr constant [4 x i8] c"Nil\00", align 1
@_func237_str4 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func237_str4, i32 0, i32 0), align 8
@.str._func238_str1 = private unnamed_addr constant [10 x i8] c"value_new\00", align 1
@_func238_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func238_str1, i32 0, i32 0), align 8
@.str._func246_str1 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@_func246_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func246_str1, i32 0, i32 0), align 8
@.str._func246_str2 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@_func246_str2 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func246_str2, i32 0, i32 0), align 8
@.str._func246_str3 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@_func246_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func246_str3, i32 0, i32 0), align 8
@.str._func246_str4 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@_func246_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func246_str4, i32 0, i32 0), align 8
@.str._func246_str5 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@_func246_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func246_str5, i32 0, i32 0), align 8
@.str._func246_str6 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@_func246_str6 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func246_str6, i32 0, i32 0), align 8
@.str._func246_str7 = private unnamed_addr constant [8 x i8] c"arghack\00", align 1
@_func246_str7 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func246_str7, i32 0, i32 0), align 8
@.str._func246_str8 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@_func246_str8 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func246_str8, i32 0, i32 0), align 8
@.str._func246_str9 = private unnamed_addr constant [11 x i8] c"nodecorate\00", align 1
@_func246_str9 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func246_str9, i32 0, i32 0), align 8
@.str._func246_str10 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@_func246_str10 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func246_str10, i32 0, i32 0), align 8
@.str._func246_str11 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@_func246_str11 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func246_str11, i32 0, i32 0), align 8
@.str._func246_str12 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@_func246_str12 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func246_str12, i32 0, i32 0), align 8
@.str._func246_str13 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@_func246_str13 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func246_str13, i32 0, i32 0), align 8
@.str._func247_str1 = private unnamed_addr constant [23 x i8] c"expected import string\00", align 1
@_func247_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func247_str1, i32 0, i32 0), align 8
@.str._func247_str2 = private unnamed_addr constant [18 x i8] c"when import = %s\0A\00", align 1
@_func247_str2 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func247_str2, i32 0, i32 0), align 8
@.str._func247_str3 = private unnamed_addr constant [14 x i8] c"cannot import\00", align 1
@_func247_str3 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func247_str3, i32 0, i32 0), align 8
@.str._func248_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func248_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func248_str1, i32 0, i32 0), align 8
@.str._func249_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func249_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func249_str1, i32 0, i32 0), align 8
@.str._func254_str1 = private unnamed_addr constant [12 x i8] c"expected id\00", align 1
@_func254_str1 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func254_str1, i32 0, i32 0), align 8
@.str._func254_str2 = private unnamed_addr constant [9 x i8] c"tt = %d\0A\00", align 1
@_func254_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func254_str2, i32 0, i32 0), align 8
@.str._func254_str3 = private unnamed_addr constant [9 x i8] c"tx = %d\0A\00", align 1
@_func254_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func254_str3, i32 0, i32 0), align 8
@.str._func254_str4 = private unnamed_addr constant [14 x i8] c"instead '%s'\0A\00", align 1
@_func254_str4 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func254_str4, i32 0, i32 0), align 8
@.str._func255_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@_func255_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func255_str1, i32 0, i32 0), align 8
@.str._func255_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@_func255_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func255_str2, i32 0, i32 0), align 8
@.str._func262_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func262_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func262_str1, i32 0, i32 0), align 8
@.str._func266_str1 = private unnamed_addr constant [19 x i8] c"expected separator\00", align 1
@_func266_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func266_str1, i32 0, i32 0), align 8
@.str._func267_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func267_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func267_str1, i32 0, i32 0), align 8
@.str._func267_str2 = private unnamed_addr constant [2 x i8] c";\00", align 1
@_func267_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func267_str2, i32 0, i32 0), align 8
@.str._func267_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func267_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func267_str3, i32 0, i32 0), align 8
@.str._func267_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func267_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func267_str4, i32 0, i32 0), align 8
@.str._func268_str1 = private unnamed_addr constant [29 x i8] c"lex::skipto not implemented\0A\00", align 1
@_func268_str1 = constant i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str._func268_str1, i32 0, i32 0), align 8
@.str._func268_str2 = private unnamed_addr constant [12 x i8] c"tok = '%s'\0A\00", align 1
@_func268_str2 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func268_str2, i32 0, i32 0), align 8
@.str._func268_str3 = private unnamed_addr constant [18 x i8] c"skip_target = %s\0A\00", align 1
@_func268_str3 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func268_str3, i32 0, i32 0), align 8
@.str._func270_str1 = private unnamed_addr constant [18 x i8] c"unexpected symbol\00", align 1
@_func270_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func270_str1, i32 0, i32 0), align 8
@.str._func270_str2 = private unnamed_addr constant [24 x i8] c"expected %s instead %s\0A\00", align 1
@_func270_str2 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func270_str2, i32 0, i32 0), align 8
@.str._func270_str3 = private unnamed_addr constant [16 x i8] c"ctok.type = %d\0A\00", align 1
@_func270_str3 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func270_str3, i32 0, i32 0), align 8
@.str._func273_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@_func273_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func273_str1, i32 0, i32 0), align 8
@.str._func274_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func274_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func274_str1, i32 0, i32 0), align 8
@.str._func275_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@_func275_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func275_str1, i32 0, i32 0), align 8
@.str._func276_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func276_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func276_str1, i32 0, i32 0), align 8
@.str._func278_str1 = private unnamed_addr constant [10 x i8] c" !dbg !%u\00", align 1
@_func278_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func278_str1, i32 0, i32 0), align 8
@.str._func282_str1 = private unnamed_addr constant [26 x i8] c"prn/printType :: t = Nil\0A\00", align 1
@_func282_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func282_str1, i32 0, i32 0), align 8
@.str._func282_str2 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@_func282_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func282_str2, i32 0, i32 0), align 8
@.str._func282_str3 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@_func282_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func282_str3, i32 0, i32 0), align 8
@.str._func283_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@_func283_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func283_str1, i32 0, i32 0), align 8
@.str._func284_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func284_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func284_str1, i32 0, i32 0), align 8
@.str._func283_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@_func283_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func283_str2, i32 0, i32 0), align 8
@.str._func285_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func285_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func285_str1, i32 0, i32 0), align 8
@.str._func285_str2 = private unnamed_addr constant [7 x i8] c"[%d x \00", align 1
@_func285_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func285_str2, i32 0, i32 0), align 8
@.str._func285_str3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@_func285_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func285_str3, i32 0, i32 0), align 8
@.str._func286_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func286_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func286_str1, i32 0, i32 0), align 8
@.str._func287_str1 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@_func287_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func287_str1, i32 0, i32 0), align 8
@.str._func287_str2 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@_func287_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func287_str2, i32 0, i32 0), align 8
@.str._func288_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func288_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func288_str1, i32 0, i32 0), align 8
@.str._func287_str3 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@_func287_str3 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func287_str3, i32 0, i32 0), align 8
@.str._func287_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func287_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func287_str4, i32 0, i32 0), align 8
@.str._func287_str5 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@_func287_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func287_str5, i32 0, i32 0), align 8
@.str._func290_str1 = private unnamed_addr constant [11 x i8] c"\0A\0A;stmt%d:\00", align 1
@_func290_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func290_str1, i32 0, i32 0), align 8
@.str._func290_str2 = private unnamed_addr constant [19 x i8] c"print::StmtUnknown\00", align 1
@_func290_str2 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func290_str2, i32 0, i32 0), align 8
@.str._func291_str1 = private unnamed_addr constant [18 x i8] c"\0A  %%%s = alloca \00", align 1
@_func291_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func291_str1, i32 0, i32 0), align 8
@.str._func294_str1 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@_func294_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func294_str1, i32 0, i32 0), align 8
@.str._func294_str2 = private unnamed_addr constant [35 x i8] c", label %%then_%d, label %%else_%d\00", align 1
@_func294_str2 = constant i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str._func294_str2, i32 0, i32 0), align 8
@.str._func294_str3 = private unnamed_addr constant [10 x i8] c"\0Athen_%d:\00", align 1
@_func294_str3 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func294_str3, i32 0, i32 0), align 8
@.str._func294_str4 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@_func294_str4 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func294_str4, i32 0, i32 0), align 8
@.str._func294_str5 = private unnamed_addr constant [10 x i8] c"\0Aelse_%d:\00", align 1
@_func294_str5 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func294_str5, i32 0, i32 0), align 8
@.str._func294_str6 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@_func294_str6 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func294_str6, i32 0, i32 0), align 8
@.str._func294_str7 = private unnamed_addr constant [11 x i8] c"\0Aendif_%d:\00", align 1
@_func294_str7 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func294_str7, i32 0, i32 0), align 8
@.str._func295_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@_func295_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func295_str1, i32 0, i32 0), align 8
@.str._func295_str2 = private unnamed_addr constant [14 x i8] c"\0Acontinue_%d:\00", align 1
@_func295_str2 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func295_str2, i32 0, i32 0), align 8
@.str._func295_str3 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@_func295_str3 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func295_str3, i32 0, i32 0), align 8
@.str._func295_str4 = private unnamed_addr constant [36 x i8] c", label %%body_%d, label %%break_%d\00", align 1
@_func295_str4 = constant i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str._func295_str4, i32 0, i32 0), align 8
@.str._func295_str5 = private unnamed_addr constant [10 x i8] c"\0Abody_%d:\00", align 1
@_func295_str5 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func295_str5, i32 0, i32 0), align 8
@.str._func295_str6 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@_func295_str6 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func295_str6, i32 0, i32 0), align 8
@.str._func295_str7 = private unnamed_addr constant [11 x i8] c"\0Abreak_%d:\00", align 1
@_func295_str7 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func295_str7, i32 0, i32 0), align 8
@.str._func296_str1 = private unnamed_addr constant [10 x i8] c"\0Aret void\00", align 1
@_func296_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func296_str1, i32 0, i32 0), align 8
@.str._func296_str2 = private unnamed_addr constant [8 x i8] c"\0A  ret \00", align 1
@_func296_str2 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func296_str2, i32 0, i32 0), align 8
@.str._func297_str1 = private unnamed_addr constant [23 x i8] c"\0A  br label %%break_%d\00", align 1
@_func297_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str._func297_str1, i32 0, i32 0), align 8
@.str._func298_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@_func298_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func298_str1, i32 0, i32 0), align 8
@.str._func299_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@_func299_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func299_str1, i32 0, i32 0), align 8
@.str._func300_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@_func300_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func300_str1, i32 0, i32 0), align 8
@.str._func300_str2 = private unnamed_addr constant [5 x i8] c"\0A%s:\00", align 1
@_func300_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func300_str2, i32 0, i32 0), align 8
@.str._func305_str1 = private unnamed_addr constant [9 x i8] c"\0A  call \00", align 1
@_func305_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func305_str1, i32 0, i32 0), align 8
@.str._func305_str2 = private unnamed_addr constant [16 x i8] c"\0A  %%%d = call \00", align 1
@_func305_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func305_str2, i32 0, i32 0), align 8
@.str._func305_str3 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@_func305_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func305_str3, i32 0, i32 0), align 8
@.str._func305_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func305_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func305_str4, i32 0, i32 0), align 8
@.str._func307_str1 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@_func307_str1 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str._func307_str1, i32 0, i32 0), align 8
@.str._func307_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@_func307_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func307_str2, i32 0, i32 0), align 8
@.str._func307_str3 = private unnamed_addr constant [8 x i8] c", i32 0\00", align 1
@_func307_str3 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func307_str3, i32 0, i32 0), align 8
@.str._func308_str1 = private unnamed_addr constant [29 x i8] c"print/expr:: v.field == Nil\0A\00", align 1
@_func308_str1 = constant i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str._func308_str1, i32 0, i32 0), align 8
@.str._func308_str2 = private unnamed_addr constant [24 x i8] c"\0A  %%%d = extractvalue \00", align 1
@_func308_str2 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func308_str2, i32 0, i32 0), align 8
@.str._func308_str3 = private unnamed_addr constant [5 x i8] c", %u\00", align 1
@_func308_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func308_str3, i32 0, i32 0), align 8
@.str._func308_str4 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@_func308_str4 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str._func308_str4, i32 0, i32 0), align 8
@.str._func308_str5 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@_func308_str5 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func308_str5, i32 0, i32 0), align 8
@.str._func308_str6 = private unnamed_addr constant [16 x i8] c", i32 0, i32 %u\00", align 1
@_func308_str6 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func308_str6, i32 0, i32 0), align 8
@.str._func309_str1 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@_func309_str1 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str._func309_str1, i32 0, i32 0), align 8
@.str._func309_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@_func309_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func309_str2, i32 0, i32 0), align 8
@.str._func309_str3 = private unnamed_addr constant [6 x i8] c"i32 0\00", align 1
@_func309_str3 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func309_str3, i32 0, i32 0), align 8
@.str._func311_str1 = private unnamed_addr constant [15 x i8] c"\0A  %%%d = xor \00", align 1
@_func311_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func311_str1, i32 0, i32 0), align 8
@.str._func311_str2 = private unnamed_addr constant [4 x i8] c", 1\00", align 1
@_func311_str2 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func311_str2, i32 0, i32 0), align 8
@.str._func311_str3 = private unnamed_addr constant [5 x i8] c", -1\00", align 1
@_func311_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func311_str3, i32 0, i32 0), align 8
@.str._func312_str1 = private unnamed_addr constant [19 x i8] c"\0A  %%%d = sub nsw \00", align 1
@_func312_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func312_str1, i32 0, i32 0), align 8
@.str._func312_str2 = private unnamed_addr constant [3 x i8] c" 0\00", align 1
@_func312_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func312_str2, i32 0, i32 0), align 8
@.str._func313_str1 = private unnamed_addr constant [11 x i8] c"\0A  %%%d = \00", align 1
@_func313_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func313_str1, i32 0, i32 0), align 8
@.str._func313_str2 = private unnamed_addr constant [10 x i8] c"inttoptr \00", align 1
@_func313_str2 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func313_str2, i32 0, i32 0), align 8
@.str._func313_str3 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@_func313_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func313_str3, i32 0, i32 0), align 8
@.str._func313_str4 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@_func313_str4 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func313_str4, i32 0, i32 0), align 8
@.str._func313_str5 = private unnamed_addr constant [10 x i8] c"inttoptr \00", align 1
@_func313_str5 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func313_str5, i32 0, i32 0), align 8
@.str._func313_str6 = private unnamed_addr constant [7 x i8] c"trunc \00", align 1
@_func313_str6 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func313_str6, i32 0, i32 0), align 8
@.str._func313_str7 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@_func313_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func313_str7, i32 0, i32 0), align 8
@.str._func313_str8 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@_func313_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func313_str8, i32 0, i32 0), align 8
@.str._func313_str9 = private unnamed_addr constant [5 x i8] c"ext \00", align 1
@_func313_str9 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func313_str9, i32 0, i32 0), align 8
@.str._func313_str10 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@_func313_str10 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func313_str10, i32 0, i32 0), align 8
@.str._func313_str11 = private unnamed_addr constant [10 x i8] c"ptrtoint \00", align 1
@_func313_str11 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func313_str11, i32 0, i32 0), align 8
@.str._func313_str12 = private unnamed_addr constant [7 x i8] c"trunc \00", align 1
@_func313_str12 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func313_str12, i32 0, i32 0), align 8
@.str._func313_str13 = private unnamed_addr constant [6 x i8] c"zext \00", align 1
@_func313_str13 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func313_str13, i32 0, i32 0), align 8
@.str._func313_str14 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@_func313_str14 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func313_str14, i32 0, i32 0), align 8
@.str._func313_str15 = private unnamed_addr constant [18 x i8] c"e.type.kind = %d\0A\00", align 1
@_func313_str15 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func313_str15, i32 0, i32 0), align 8
@.str._func313_str16 = private unnamed_addr constant [33 x i8] c"printer/expr/cast :: e.type.kind\00", align 1
@_func313_str16 = constant i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str._func313_str16, i32 0, i32 0), align 8
@.str._func313_str17 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@_func313_str17 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func313_str17, i32 0, i32 0), align 8
@.str._func314_str1 = private unnamed_addr constant [7 x i8] c"<oper>\00", align 1
@_func314_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func314_str1, i32 0, i32 0), align 8
@.str._func314_str2 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@_func314_str2 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func314_str2, i32 0, i32 0), align 8
@.str._func314_str3 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@_func314_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func314_str3, i32 0, i32 0), align 8
@.str._func314_str4 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@_func314_str4 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func314_str4, i32 0, i32 0), align 8
@.str._func314_str5 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@_func314_str5 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func314_str5, i32 0, i32 0), align 8
@.str._func314_str6 = private unnamed_addr constant [5 x i8] c"udiv\00", align 1
@_func314_str6 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func314_str6, i32 0, i32 0), align 8
@.str._func314_str7 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@_func314_str7 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func314_str7, i32 0, i32 0), align 8
@.str._func314_str8 = private unnamed_addr constant [5 x i8] c"urem\00", align 1
@_func314_str8 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func314_str8, i32 0, i32 0), align 8
@.str._func314_str9 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@_func314_str9 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func314_str9, i32 0, i32 0), align 8
@.str._func314_str10 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@_func314_str10 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func314_str10, i32 0, i32 0), align 8
@.str._func314_str11 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@_func314_str11 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func314_str11, i32 0, i32 0), align 8
@.str._func314_str12 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@_func314_str12 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func314_str12, i32 0, i32 0), align 8
@.str._func314_str13 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@_func314_str13 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func314_str13, i32 0, i32 0), align 8
@.str._func314_str14 = private unnamed_addr constant [9 x i8] c"icmp slt\00", align 1
@_func314_str14 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func314_str14, i32 0, i32 0), align 8
@.str._func314_str15 = private unnamed_addr constant [9 x i8] c"icmp ult\00", align 1
@_func314_str15 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func314_str15, i32 0, i32 0), align 8
@.str._func314_str16 = private unnamed_addr constant [9 x i8] c"icmp sgt\00", align 1
@_func314_str16 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func314_str16, i32 0, i32 0), align 8
@.str._func314_str17 = private unnamed_addr constant [9 x i8] c"icmp ugt\00", align 1
@_func314_str17 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func314_str17, i32 0, i32 0), align 8
@.str._func314_str18 = private unnamed_addr constant [9 x i8] c"icmp sle\00", align 1
@_func314_str18 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func314_str18, i32 0, i32 0), align 8
@.str._func314_str19 = private unnamed_addr constant [9 x i8] c"icmp ule\00", align 1
@_func314_str19 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func314_str19, i32 0, i32 0), align 8
@.str._func314_str20 = private unnamed_addr constant [9 x i8] c"icmp sge\00", align 1
@_func314_str20 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func314_str20, i32 0, i32 0), align 8
@.str._func314_str21 = private unnamed_addr constant [9 x i8] c"icmp uge\00", align 1
@_func314_str21 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func314_str21, i32 0, i32 0), align 8
@.str._func314_str22 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@_func314_str22 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func314_str22, i32 0, i32 0), align 8
@.str._func314_str23 = private unnamed_addr constant [5 x i8] c"ashr\00", align 1
@_func314_str23 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func314_str23, i32 0, i32 0), align 8
@.str._func314_str24 = private unnamed_addr constant [5 x i8] c"lshr\00", align 1
@_func314_str24 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func314_str24, i32 0, i32 0), align 8
@.str._func314_str25 = private unnamed_addr constant [14 x i8] c"\0A  %%%d = %s \00", align 1
@_func314_str25 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func314_str25, i32 0, i32 0), align 8
@.str._func315_str1 = private unnamed_addr constant [10 x i8] c"\0A  store \00", align 1
@_func315_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func315_str1, i32 0, i32 0), align 8
@.str._func315_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@_func315_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func315_str2, i32 0, i32 0), align 8
@.str._func317_str1 = private unnamed_addr constant [24 x i8] c"\0A  %%%d = inttoptr i64 \00", align 1
@_func317_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func317_str1, i32 0, i32 0), align 8
@.str._func317_str2 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@_func317_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func317_str2, i32 0, i32 0), align 8
@.str._func316_str1 = private unnamed_addr constant [16 x i8] c"\0A  %%%d = load \00", align 1
@_func316_str1 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func316_str1, i32 0, i32 0), align 8
@.str._func316_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@_func316_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func316_str2, i32 0, i32 0), align 8
@.str._func318_str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@_func318_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func318_str1, i32 0, i32 0), align 8
@.str._func318_str2 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@_func318_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func318_str2, i32 0, i32 0), align 8
@.str._func318_str3 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@_func318_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func318_str3, i32 0, i32 0), align 8
@.str._func318_str4 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@_func318_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func318_str4, i32 0, i32 0), align 8
@.str._func318_str5 = private unnamed_addr constant [13 x i8] c"<ObjInvalid>\00", align 1
@_func318_str5 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func318_str5, i32 0, i32 0), align 8
@.str._func319_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@_func319_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func319_str1, i32 0, i32 0), align 8
@.str._func320_str1 = private unnamed_addr constant [44 x i8] c"\0A@%s = private unnamed_addr constant [%d x \00", align 1
@_func320_str1 = constant i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str._func320_str1, i32 0, i32 0), align 8
@.str._func320_str2 = private unnamed_addr constant [4 x i8] c"] [\00", align 1
@_func320_str2 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func320_str2, i32 0, i32 0), align 8
@.str._func320_str3 = private unnamed_addr constant [12 x i8] c"], align 16\00", align 1
@_func320_str3 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func320_str3, i32 0, i32 0), align 8
@.str._func322_str1 = private unnamed_addr constant [55 x i8] c"\0A@.str.%s = private unnamed_addr constant [%d x i8] c\22\00", align 1
@_func322_str1 = constant i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str._func322_str1, i32 0, i32 0), align 8
@.str._func322_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func322_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func322_str2, i32 0, i32 0), align 8
@.str._func322_str3 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@_func322_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func322_str3, i32 0, i32 0), align 8
@.str._func322_str4 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@_func322_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func322_str4, i32 0, i32 0), align 8
@.str._func322_str5 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@_func322_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func322_str5, i32 0, i32 0), align 8
@.str._func322_str6 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@_func322_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func322_str6, i32 0, i32 0), align 8
@.str._func322_str7 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@_func322_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func322_str7, i32 0, i32 0), align 8
@.str._func322_str8 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@_func322_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func322_str8, i32 0, i32 0), align 8
@.str._func322_str9 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@_func322_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func322_str9, i32 0, i32 0), align 8
@.str._func322_str10 = private unnamed_addr constant [6 x i8] c"\5C%02X\00", align 1
@_func322_str10 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func322_str10, i32 0, i32 0), align 8
@.str._func322_str11 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@_func322_str11 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func322_str11, i32 0, i32 0), align 8
@.str._func322_str12 = private unnamed_addr constant [16 x i8] c"\5C%02d\22, align 1\00", align 1
@_func322_str12 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func322_str12, i32 0, i32 0), align 8
@.str._func322_str13 = private unnamed_addr constant [99 x i8] c"\0A@%s = constant i8* getelementptr inbounds ([%d x i8], [%d x i8]* @.str.%s, i32 0, i32 0), align 8\00", align 1
@_func322_str13 = constant i8* getelementptr inbounds ([99 x i8], [99 x i8]* @.str._func322_str13, i32 0, i32 0), align 8
@.str._func323_str1 = private unnamed_addr constant [15 x i8] c"\0A@%s = global \00", align 1
@_func323_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func323_str1, i32 0, i32 0), align 8
@.str._func323_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@_func323_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func323_str2, i32 0, i32 0), align 8
@.str._func324_str1 = private unnamed_addr constant [20 x i8] c"prn/funcdef t = Nil\00", align 1
@_func324_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str._func324_str1, i32 0, i32 0), align 8
@.str._func324_str2 = private unnamed_addr constant [9 x i8] c"\0Adeclare\00", align 1
@_func324_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func324_str2, i32 0, i32 0), align 8
@.str._func324_str3 = private unnamed_addr constant [9 x i8] c"\0A\0Adefine\00", align 1
@_func324_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func324_str3, i32 0, i32 0), align 8
@.str._func324_str4 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@_func324_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func324_str4, i32 0, i32 0), align 8
@.str._func324_str5 = private unnamed_addr constant [7 x i8] c" @%s (\00", align 1
@_func324_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func324_str5, i32 0, i32 0), align 8
@.str._func325_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@_func325_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func325_str1, i32 0, i32 0), align 8
@.str._func325_str2 = private unnamed_addr constant [6 x i8] c" %%%s\00", align 1
@_func325_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func325_str2, i32 0, i32 0), align 8
@.str._func324_str6 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@_func324_str6 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func324_str6, i32 0, i32 0), align 8
@.str._func324_str7 = private unnamed_addr constant [2 x i8] c")\00", align 1
@_func324_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func324_str7, i32 0, i32 0), align 8
@.str._func324_str8 = private unnamed_addr constant [3 x i8] c" {\00", align 1
@_func324_str8 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func324_str8, i32 0, i32 0), align 8
@.str._func324_str9 = private unnamed_addr constant [12 x i8] c"\0A  ret void\00", align 1
@_func324_str9 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func324_str9, i32 0, i32 0), align 8
@.str._func324_str10 = private unnamed_addr constant [3 x i8] c"\0A}\00", align 1
@_func324_str10 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str._func324_str10, i32 0, i32 0), align 8
@.str._func326_str1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@_func326_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func326_str1, i32 0, i32 0), align 8
@.str._func326_str2 = private unnamed_addr constant [26 x i8] c"cannot create output file\00", align 1
@_func326_str2 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str._func326_str2, i32 0, i32 0), align 8
@.str._func326_str3 = private unnamed_addr constant [29 x i8] c"; clang out2.ll && ./a.out\0A\0A\00", align 1
@_func326_str3 = constant i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str._func326_str3, i32 0, i32 0), align 8
@.str._func326_str4 = private unnamed_addr constant [45 x i8] c"; llc out2.ll ; for create .s file from .ll\0A\00", align 1
@_func326_str4 = constant i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str._func326_str4, i32 0, i32 0), align 8
@.str._func326_str5 = private unnamed_addr constant [19 x i8] c"%%Enum = type i32\0A\00", align 1
@_func326_str5 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str._func326_str5, i32 0, i32 0), align 8
@.str._func326_str6 = private unnamed_addr constant [18 x i8] c"%%Bool = type i1\0A\00", align 1
@_func326_str6 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func326_str6, i32 0, i32 0), align 8
@.str._func326_str7 = private unnamed_addr constant [18 x i8] c"%%Unit = type i1\0A\00", align 1
@_func326_str7 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func326_str7, i32 0, i32 0), align 8
@.str._func326_str8 = private unnamed_addr constant [18 x i8] c"%%Str = type i8*\0A\00", align 1
@_func326_str8 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str._func326_str8, i32 0, i32 0), align 8
@.str._func327_str1 = private unnamed_addr constant [17 x i8] c"%%%s = type i%d\0A\00", align 1
@_func327_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func327_str1, i32 0, i32 0), align 8
@.str._func326_str9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func326_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func326_str9, i32 0, i32 0), align 8
@.str._func328_str1 = private unnamed_addr constant [20 x i8] c"print_assembly: %s\0A\00", align 1
@_func328_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str._func328_str1, i32 0, i32 0), align 8
@.str._func328_str2 = private unnamed_addr constant [17 x i8] c"\0A; assembly: %s\0A\00", align 1
@_func328_str2 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func328_str2, i32 0, i32 0), align 8
@.str._func328_str3 = private unnamed_addr constant [11 x i8] c"\0A\0A;types:\0A\00", align 1
@_func328_str3 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func328_str3, i32 0, i32 0), align 8
@.str._func328_str4 = private unnamed_addr constant [13 x i8] c"\0A\0A;strings:\0A\00", align 1
@_func328_str4 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func328_str4, i32 0, i32 0), align 8
@.str._func330_str1 = private unnamed_addr constant [9 x i8] c"NIL: %s\0A\00", align 1
@_func330_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str._func330_str1, i32 0, i32 0), align 8
@.str._func328_str5 = private unnamed_addr constant [12 x i8] c"\0A\0A;arrays:\0A\00", align 1
@_func328_str5 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func328_str5, i32 0, i32 0), align 8
@.str._func328_str6 = private unnamed_addr constant [10 x i8] c"\0A\0A;vars:\0A\00", align 1
@_func328_str6 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func328_str6, i32 0, i32 0), align 8
@.str._func328_str7 = private unnamed_addr constant [11 x i8] c"\0A\0A;funcs:\0A\00", align 1
@_func328_str7 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func328_str7, i32 0, i32 0), align 8
@.str._func328_str8 = private unnamed_addr constant [14 x i8] c"\0A\0A;metadata:\0A\00", align 1
@_func328_str8 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func328_str8, i32 0, i32 0), align 8
@.str._func334_str1 = private unnamed_addr constant [61 x i8] c"target datalayout = \22e-m:o-i64:64-f80:128-n8:16:32:64-S128\22\0A\00", align 1
@_func334_str1 = constant i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str._func334_str1, i32 0, i32 0), align 8
@.str._func334_str2 = private unnamed_addr constant [46 x i8] c"target triple = \22x86_64-apple-macosx10.14.0\22\0A\00", align 1
@_func334_str2 = constant i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str._func334_str2, i32 0, i32 0), align 8
@.str._func334_str3 = private unnamed_addr constant [71 x i8] c"target datalayout = \22e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\22\0A\00", align 1
@_func334_str3 = constant i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str._func334_str3, i32 0, i32 0), align 8
@.str._func334_str4 = private unnamed_addr constant [47 x i8] c"target triple = \22thumbv7em-unknown-none-eabi\22\0A\00", align 1
@_func334_str4 = constant i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str._func334_str4, i32 0, i32 0), align 8
@.str._func334_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func334_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func334_str5, i32 0, i32 0), align 8
@.str._func335_str1 = private unnamed_addr constant [15 x i8] c"\0A;type_index:\0A\00", align 1
@_func335_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str._func335_str1, i32 0, i32 0), align 8
@.str._func336_str1 = private unnamed_addr constant [13 x i8] c";* %s -> %p\0A\00", align 1
@_func336_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func336_str1, i32 0, i32 0), align 8
@.str._func337_str1 = private unnamed_addr constant [16 x i8] c"\0A;value_index:\0A\00", align 1
@_func337_str1 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func337_str1, i32 0, i32 0), align 8
@.str._func338_str1 = private unnamed_addr constant [14 x i8] c"\0A;#%s -> %p {\00", align 1
@_func338_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str._func338_str1, i32 0, i32 0), align 8
@.str._func338_str2 = private unnamed_addr constant [16 x i8] c"\0A;  v.kind = %s\00", align 1
@_func338_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func338_str2, i32 0, i32 0), align 8
@.str._func338_str3 = private unnamed_addr constant [5 x i8] c"\0A;}\0A\00", align 1
@_func338_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func338_str3, i32 0, i32 0), align 8
@.str.MINOR_LIB_ENV_VAR = private unnamed_addr constant [10 x i8] c"MINOR_LIB\00", align 1
@MINOR_LIB_ENV_VAR = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.MINOR_LIB_ENV_VAR, i32 0, i32 0), align 8
@.str._func339_str1 = private unnamed_addr constant [42 x i8] c"enviroment variable MINOR_LIB not defined\00", align 1
@_func339_str1 = constant i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str._func339_str1, i32 0, i32 0), align 8
@.str._func339_str2 = private unnamed_addr constant [7 x i8] c"<asm0>\00", align 1
@_func339_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func339_str2, i32 0, i32 0), align 8
@.str._func340_str1 = private unnamed_addr constant [17 x i8] c"readConfig = %s\0A\00", align 1
@_func340_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str._func340_str1, i32 0, i32 0), align 8
@.str._func340_str2 = private unnamed_addr constant [7 x i8] c"config\00", align 1
@_func340_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func340_str2, i32 0, i32 0), align 8
@.str._func340_str3 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@_func340_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func340_str3, i32 0, i32 0), align 8
@.str._func340_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@_func340_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func340_str4, i32 0, i32 0), align 8
@.str._func340_str5 = private unnamed_addr constant [11 x i8] c"%s = %lld\0A\00", align 1
@_func340_str5 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func340_str5, i32 0, i32 0), align 8
@.str._func341_str1 = private unnamed_addr constant [13 x i8] c"unknown type\00", align 1
@_func341_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str._func341_str1, i32 0, i32 0), align 8
@.str._func346_str1 = private unnamed_addr constant [28 x i8] c"checkValue:: unknown v.kind\00", align 1
@_func346_str1 = constant i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str._func346_str1, i32 0, i32 0), align 8
@.str._func347_str1 = private unnamed_addr constant [11 x i8] c"m2 v%d.%d\0A\00", align 1
@_func347_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func347_str1, i32 0, i32 0), align 8
@.str._func347_str2 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@_func347_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func347_str2, i32 0, i32 0), align 8
@.str._func347_str3 = private unnamed_addr constant [11 x i8] c"lines: %d\0A\00", align 1
@_func347_str3 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str._func347_str3, i32 0, i32 0), align 8
@.str._func347_str4 = private unnamed_addr constant [12 x i8] c"error : %d\0A\00", align 1
@_func347_str4 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str._func347_str4, i32 0, i32 0), align 8
@.str._func347_str5 = private unnamed_addr constant [8 x i8] c"main.ll\00", align 1
@_func347_str5 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func347_str5, i32 0, i32 0), align 8
@.str._func348_str1 = private unnamed_addr constant [7 x i8] c"-arch=\00", align 1
@_func348_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func348_str1, i32 0, i32 0), align 8
@.str._func348_str2 = private unnamed_addr constant [10 x i8] c"cortex-m3\00", align 1
@_func348_str2 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str._func348_str2, i32 0, i32 0), align 8
@.str._func348_str3 = private unnamed_addr constant [4 x i8] c"x64\00", align 1
@_func348_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str._func348_str3, i32 0, i32 0), align 8
@.str._func348_str4 = private unnamed_addr constant [21 x i8] c"unknown architecture\00", align 1
@_func348_str4 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str._func348_str4, i32 0, i32 0), align 8
@.str._func348_str5 = private unnamed_addr constant [6 x i8] c"-lib=\00", align 1
@_func348_str5 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str._func348_str5, i32 0, i32 0), align 8
@.str._func348_str6 = private unnamed_addr constant [7 x i8] c"-conf=\00", align 1
@_func348_str6 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str._func348_str6, i32 0, i32 0), align 8
@.str._func349_str1 = private unnamed_addr constant [8 x i8] c"usage:\0A\00", align 1
@_func349_str1 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func349_str1, i32 0, i32 0), align 8
@.str._func349_str2 = private unnamed_addr constant [25 x i8] c"  -lib=/path/to/lib/dir\0A\00", align 1
@_func349_str2 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str._func349_str2, i32 0, i32 0), align 8
@.str._func349_str3 = private unnamed_addr constant [24 x i8] c"  -arch=x86, cortex-m3\0A\00", align 1
@_func349_str3 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str._func349_str3, i32 0, i32 0), align 8
@.str._func349_str4 = private unnamed_addr constant [16 x i8] c"  m2 <target>\0A\0A\00", align 1
@_func349_str4 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str._func349_str4, i32 0, i32 0), align 8
@.str._func351_str1 = private unnamed_addr constant [5 x i8] c"* %s\00", align 1
@_func351_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str._func351_str1, i32 0, i32 0), align 8
@.str._func351_str2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@_func351_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func351_str2, i32 0, i32 0), align 8
@.str._func351_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func351_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func351_str3, i32 0, i32 0), align 8
@.str._func353_str1 = private unnamed_addr constant [8 x i8] c"VAL: %s\00", align 1
@_func353_str1 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str._func353_str1, i32 0, i32 0), align 8
@.str._func353_str2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@_func353_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func353_str2, i32 0, i32 0), align 8
@.str._func353_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_func353_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str._func353_str3, i32 0, i32 0), align 8

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
@globalTypeIndex = global %List zeroinitializer
@globalValueIndex = global %List zeroinitializer
@func_uid = global %Nat32 zeroinitializer
@str_uid = global %Nat32 zeroinitializer
@arr_uid = global %Nat32 zeroinitializer
@var_uid = global %Nat32 zeroinitializer
@type_uid = global %Nat32 zeroinitializer
@mctx = global %ModuleContext zeroinitializer
@fctx = global %FuncContext zeroinitializer
@asm0 = global %Assembly zeroinitializer
@comments = global %Bool zeroinitializer
@fout = global %Unit* zeroinitializer
@clab = global %Nat32 zeroinitializer
@meta = global %Nat32 zeroinitializer
@md_list = global %List zeroinitializer
@global_if_id = global %Nat32 zeroinitializer
@global_while_id = global %Nat32 zeroinitializer
@while_id = global %Nat32 zeroinitializer
@blockno = global %Nat32 zeroinitializer
@stmtno = global %Nat32 zeroinitializer

;funcs:

declare %Unit* @malloc (%Nat32 %size)
declare %Unit* @memset (%Unit* %mem, %Nat8 %c, %Nat32 %n)
declare %Unit* @memcpy (%Unit* %dst, %Unit* %src, %Nat32 %len)
declare %Int32 @memcmp (%Unit* %ptr1, %Unit* %ptr2, %Nat32 %num)
declare void @free (%Unit* %mem)
declare %Int32 @putchar (%Int8 %char)
declare %Int32 @strcmp (%Str %s1, %Str %s2)
declare %Int32 @strncmp (%Str %s1, %Str %s2, %Nat32 %n)
declare %Nat8* @strcpy (%Str %dst, %Str %src)
declare %Nat32 @strlen (%Str %s)
declare %Int32 @printf (%Str %s, ...)
declare %Int32 @scanf (%Str %format, ...)
declare %Int32 @sscanf (%Unit* %buf, %Str %format, ...)
declare %Int32 @sprintf (%Unit* %buf, %Str %format, ...)
declare %Int32 @chdir (%Str %dir)
declare %Unit* @fopen (%Str %fname, %Str %mode)
declare %Int32 @fprintf (%Unit* %stream, %Str %format, ...)
declare %Int32 @fseek (%Unit* %stream, %Int64 %offset, %Int32 %whence)
declare %Int32 @fclose (%Unit* %fp)
declare %Int32 @open (%Str %path, %Int32 %oflags)
declare %Int32 @read (%Int32 %handle, %Nat8* %buf, %Nat32 %len)
declare %Int32 @write (%Int32 %handle, %Nat8* %buf, %Nat32 %len)
declare %Int64 @lseek (%Int32 %fd, %Int64 %offset, %Int32 %whence)
declare %Int32 @close (%Int32 %fd)
declare void @exit (%Int32 %rc)
declare %Unit* @opendir (%Str %name)
declare %Int32 @closedir (%Unit* %dirp)
declare %Str @getcwd (%Str %buf, %Nat32 %size)
declare %Str @getenv (%Str %name)

define %Str @str_new (%Nat32 %len) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 %len)
  %2 = bitcast %Unit* %1 to %Str
  ret %Str %2
}

define %Str @dup (%Str %s) {

;stmt0:
  %1 = call %Nat32 (%Str) @strlen (%Str %s)
  %2 = add %Nat32 %1, 1

;stmt1:
  %3 = call %Str (%Nat32) @str_new (%Nat32 %2)

;stmt2:
  %4 = call %Nat8* (%Str, %Str) @strcpy (%Str %3, %Str %s)

;stmt3:
  ret %Str %3
}

define %Str @cat (%Str %s1, %Str %s2) {

;stmt0:
  %1 = call %Nat32 (%Str) @strlen (%Str %s1)

;stmt1:
  %2 = call %Nat32 (%Str) @strlen (%Str %s2)

;stmt2:
  %3 = add %Nat32 %1, %2

;stmt3:
  %4 = add %Nat32 %3, 1
  %5 = call %Unit* (%Nat32) @malloc (%Nat32 %4)
  %6 = bitcast %Unit* %5 to %Str

;stmt4:
  %7 = getelementptr inbounds %Nat8, %Str %6, %Int32 0
  %8 = bitcast %Nat8* %7 to %Str
  %9 = call %Nat8* (%Str, %Str) @strcpy (%Str %8, %Str %s1)

;stmt5:
  %10 = getelementptr inbounds %Nat8, %Str %6, %Nat32 %1
  %11 = bitcast %Nat8* %10 to %Str
  %12 = call %Nat8* (%Str, %Str) @strcpy (%Str %11, %Str %s2)

;stmt6:
  %13 = getelementptr inbounds %Nat8, %Str %6, %Nat32 %3
  store %Nat8 0, %Nat8* %13

;stmt7:
  ret %Str %6
}

define %Str @cat3 (%Str %s1, %Str %s2, %Str %s3) {

;stmt0:
  %1 = call %Nat32 (%Str) @strlen (%Str %s1)

;stmt1:
  %2 = call %Nat32 (%Str) @strlen (%Str %s2)

;stmt2:
  %3 = call %Nat32 (%Str) @strlen (%Str %s3)

;stmt3:
  %4 = add %Nat32 %1, %2

;stmt4:
  %5 = add %Nat32 %4, %3

;stmt5:
  %6 = add %Nat32 %5, 1
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 %6)
  %8 = bitcast %Unit* %7 to %Str

;stmt6:
  %9 = getelementptr inbounds %Nat8, %Str %8, %Int32 0
  %10 = bitcast %Nat8* %9 to %Str
  %11 = call %Nat8* (%Str, %Str) @strcpy (%Str %10, %Str %s1)

;stmt7:
  %12 = getelementptr inbounds %Nat8, %Str %8, %Nat32 %1
  %13 = bitcast %Nat8* %12 to %Str
  %14 = call %Nat8* (%Str, %Str) @strcpy (%Str %13, %Str %s2)

;stmt8:
  %15 = getelementptr inbounds %Nat8, %Str %8, %Nat32 %4
  %16 = bitcast %Nat8* %15 to %Str
  %17 = call %Nat8* (%Str, %Str) @strcpy (%Str %16, %Str %s3)

;stmt9:
  %18 = getelementptr inbounds %Nat8, %Str %8, %Nat32 %5
  store %Nat8 0, %Nat8* %18

;stmt10:
  ret %Str %8
}

define %Str @cat4 (%Str %s1, %Str %s2, %Str %s3, %Str %s4) {

;stmt0:
  %1 = call %Nat32 (%Str) @strlen (%Str %s1)

;stmt1:
  %2 = call %Nat32 (%Str) @strlen (%Str %s2)

;stmt2:
  %3 = call %Nat32 (%Str) @strlen (%Str %s3)

;stmt3:
  %4 = call %Nat32 (%Str) @strlen (%Str %s4)

;stmt4:
  %5 = add %Nat32 %1, %2

;stmt5:
  %6 = add %Nat32 %5, %3

;stmt6:
  %7 = add %Nat32 %6, %4

;stmt7:
  %8 = add %Nat32 %7, 1
  %9 = call %Unit* (%Nat32) @malloc (%Nat32 %8)
  %10 = bitcast %Unit* %9 to %Str

;stmt8:
  %11 = getelementptr inbounds %Nat8, %Str %10, %Int32 0
  %12 = bitcast %Nat8* %11 to %Str
  %13 = call %Nat8* (%Str, %Str) @strcpy (%Str %12, %Str %s1)

;stmt9:
  %14 = getelementptr inbounds %Nat8, %Str %10, %Nat32 %1
  %15 = bitcast %Nat8* %14 to %Str
  %16 = call %Nat8* (%Str, %Str) @strcpy (%Str %15, %Str %s2)

;stmt10:
  %17 = getelementptr inbounds %Nat8, %Str %10, %Nat32 %5
  %18 = bitcast %Nat8* %17 to %Str
  %19 = call %Nat8* (%Str, %Str) @strcpy (%Str %18, %Str %s3)

;stmt11:
  %20 = getelementptr inbounds %Nat8, %Str %10, %Nat32 %6
  %21 = bitcast %Nat8* %20 to %Str
  %22 = call %Nat8* (%Str, %Str) @strcpy (%Str %21, %Str %s4)

;stmt12:
  %23 = getelementptr inbounds %Nat8, %Str %10, %Nat32 %7
  store %Nat8 0, %Nat8* %23

;stmt13:
  ret %Str %10
}

define %Str @cat5 (%Str %s1, %Str %s2, %Str %s3, %Str %s4, %Str %s5) {

;stmt0:
  %1 = call %Nat32 (%Str) @strlen (%Str %s1)

;stmt1:
  %2 = call %Nat32 (%Str) @strlen (%Str %s2)

;stmt2:
  %3 = call %Nat32 (%Str) @strlen (%Str %s3)

;stmt3:
  %4 = call %Nat32 (%Str) @strlen (%Str %s4)

;stmt4:
  %5 = call %Nat32 (%Str) @strlen (%Str %s5)

;stmt5:
  %6 = add %Nat32 %1, %2

;stmt6:
  %7 = add %Nat32 %6, %3

;stmt7:
  %8 = add %Nat32 %7, %4

;stmt8:
  %9 = add %Nat32 %8, %5

;stmt9:
  %10 = add %Nat32 %9, 1
  %11 = call %Unit* (%Nat32) @malloc (%Nat32 %10)
  %12 = bitcast %Unit* %11 to %Str

;stmt10:
  %13 = getelementptr inbounds %Nat8, %Str %12, %Int32 0
  %14 = bitcast %Nat8* %13 to %Str
  %15 = call %Nat8* (%Str, %Str) @strcpy (%Str %14, %Str %s1)

;stmt11:
  %16 = getelementptr inbounds %Nat8, %Str %12, %Nat32 %1
  %17 = bitcast %Nat8* %16 to %Str
  %18 = call %Nat8* (%Str, %Str) @strcpy (%Str %17, %Str %s2)

;stmt12:
  %19 = getelementptr inbounds %Nat8, %Str %12, %Nat32 %6
  %20 = bitcast %Nat8* %19 to %Str
  %21 = call %Nat8* (%Str, %Str) @strcpy (%Str %20, %Str %s3)

;stmt13:
  %22 = getelementptr inbounds %Nat8, %Str %12, %Nat32 %7
  %23 = bitcast %Nat8* %22 to %Str
  %24 = call %Nat8* (%Str, %Str) @strcpy (%Str %23, %Str %s4)

;stmt14:
  %25 = getelementptr inbounds %Nat8, %Str %12, %Nat32 %8
  %26 = bitcast %Nat8* %25 to %Str
  %27 = call %Nat8* (%Str, %Str) @strcpy (%Str %26, %Str %s5)

;stmt15:
  %28 = getelementptr inbounds %Nat8, %Str %12, %Nat32 %9
  store %Nat8 0, %Nat8* %28

;stmt16:
  ret %Str %12
}

define void @assert (%Bool %cond, %Str %text) {

;stmt0:
  %1 = xor %Bool %cond, 1
  br i1 %1, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %2 = load %Str, %Str* @_func7_str1
  %3 = call %Int32 (%Str, ...) @printf (%Str %2, %Str %text)

;stmt3:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Nat32 @prepart (%Str %path) {

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
  %2 = getelementptr inbounds %Nat8, %Str %path, %Nat32 %1
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp ne %Nat8 %3, 0
  br i1 %4, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %5 = load %Nat32, %Nat32* %c
  %6 = getelementptr inbounds %Nat8, %Str %path, %Nat32 %5
  %7 = load %Nat8, %Nat8* %6
  %8 = load %Str, %Str* @_func8_str1
  %9 = getelementptr inbounds %Nat8, %Str %8, %Int32 0
  %10 = load %Nat8, %Nat8* %9
  %11 = icmp eq %Nat8 %7, %10
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %12 = load %Nat32, %Nat32* %c
  %13 = add %Nat32 %12, 1
  store %Nat32 %13, %Nat32* %len
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  %14 = load %Nat32, %Nat32* %c
  %15 = add %Nat32 %14, 1
  store %Nat32 %15, %Nat32* %c
  br label %continue_0
break_0:

;stmt10:
  %16 = load %Nat32, %Nat32* %len
  ret %Nat32 %16
}

define %Str @getprefix (%Str %path) {

;stmt0:
  %1 = call %Nat32 (%Str) @prepart (%Str %path)

;stmt1:
  %2 = add %Nat32 %1, 1
  %3 = call %Unit* (%Nat32) @malloc (%Nat32 %2)
  %4 = bitcast %Unit* %3 to %Str

;stmt2:
  %5 = bitcast %Str %4 to %Unit*
  %6 = bitcast %Str %path to %Unit*
  %7 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %5, %Unit* %6, %Nat32 %1)

;stmt3:
  %8 = getelementptr inbounds %Nat8, %Str %4, %Nat32 %1
  store %Nat8 0, %Nat8* %8

;stmt4:
  ret %Str %4
}

define %Str @get_last (%Str %path) {

;stmt0:
  %1 = call %Nat32 (%Str) @prepart (%Str %path)

;stmt1:
  %2 = call %Nat32 (%Str) @strlen (%Str %path)
  %3 = sub %Nat32 %2, %1

;stmt2:
  %4 = add %Nat32 %3, 1
  %5 = call %Unit* (%Nat32) @malloc (%Nat32 %4)
  %6 = bitcast %Unit* %5 to %Str

;stmt3:
  %7 = bitcast %Str %6 to %Unit*
  %8 = getelementptr inbounds %Nat8, %Str %path, %Nat32 %1
  %9 = bitcast %Nat8* %8 to %Unit*
  %10 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %7, %Unit* %9, %Nat32 %3)

;stmt4:
  %11 = getelementptr inbounds %Nat8, %Str %6, %Nat32 %3
  store %Nat8 0, %Nat8* %11

;stmt5:
  ret %Str %6
}

define %Bool @exists (%Str %fname) {

;stmt0:
  %1 = call %Int32 (%Str, %Int32) @open (%Str %fname, %Int32 0)

;stmt1:
  %2 = icmp slt %Int32 %1, 0
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %4 = call %Int32 (%Int32) @close (%Int32 %1)

;stmt5:
  ret %Bool 1
}

define %Bool @isdir (%Str %name) {

;stmt0:
  %1 = call %Unit* (%Str) @opendir (%Str %name)

;stmt1:
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
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
  %5 = call %Int32 (%Unit*) @closedir (%Unit* %1)

;stmt5:
  ret %Bool 1
}

define void @node_init (%Node* %node) {

;stmt0:
  %1 = bitcast %Node* %node to %Unit*
  %2 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %1, %Nat8 0, %Nat32 32)
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

define void @node_append (%Node* %n, %Node* %an) {

;stmt0:
  %1 = getelementptr inbounds %Node, %Node* %n, i32 0, i32 1
  %2 = load %Node*, %Node** %1

;stmt1:
  %3 = bitcast %Node* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = getelementptr inbounds %Node, %Node* %an, i32 0, i32 1
  store %Node* %2, %Node** %6

;stmt4:
  %7 = getelementptr inbounds %Node, %Node* %2, i32 0, i32 0
  store %Node* %an, %Node** %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = getelementptr inbounds %Node, %Node* %n, i32 0, i32 1
  store %Node* %an, %Node** %8

;stmt6:
  %9 = getelementptr inbounds %Node, %Node* %an, i32 0, i32 0
  store %Node* %n, %Node** %9
  ret void
}

define void @node_exclude (%Node* %node) {

;stmt0:
  %1 = getelementptr inbounds %Node, %Node* %node, i32 0, i32 0
  %2 = load %Node*, %Node** %1

;stmt1:
  %3 = getelementptr inbounds %Node, %Node* %node, i32 0, i32 1
  %4 = load %Node*, %Node** %3

;stmt2:
  %5 = bitcast %Node* %2 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = getelementptr inbounds %Node, %Node* %2, i32 0, i32 1
  store %Node* %4, %Node** %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = bitcast %Node* %4 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %12 = getelementptr inbounds %Node, %Node* %4, i32 0, i32 0
  store %Node* %2, %Node** %12
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @node_foreach (%Node* %node_chain, %NodeForeachHandler %f, %Unit* %ctx) {

;stmt0:
  %1 = bitcast %Node* %node_chain to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
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
  store %Node* %node_chain, %Node** %n

;stmt5:
  %index = alloca %Nat32

;stmt6:
  store %Nat32 0, %Nat32* %index

;stmt7:
  br label %continue_0
continue_0:
  %5 = load %Node*, %Node** %n
  %6 = bitcast %Node* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  br i1 %8, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %9 = load %Node*, %Node** %n
  %10 = load %Nat32, %Nat32* %index
  call void (%Node*, %Unit*, %Nat32) %f (%Node* %9, %Unit* %ctx, %Nat32 %10)

;stmt10:
  %11 = load %Node*, %Node** %n
  %12 = getelementptr inbounds %Node, %Node* %11, i32 0, i32 1
  %13 = load %Node*, %Node** %12
  store %Node* %13, %Node** %n

;stmt11:
  %14 = load %Nat32, %Nat32* %index
  %15 = add %Nat32 %14, 1
  store %Nat32 %15, %Nat32* %index
  br label %continue_0
break_0:
  ret void
}

define %Node* @node_search (%Node* %node_chain, %NodeSearchHandler %f, %Unit* %ctx) {

;stmt0:
  %1 = bitcast %Node* %node_chain to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = inttoptr i64 0 to %Node*
  ret %Node* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %n = alloca %Node*

;stmt4:
  store %Node* %node_chain, %Node** %n

;stmt5:
  %index = alloca %Nat32

;stmt6:
  store %Nat32 0, %Nat32* %index

;stmt7:
  br label %continue_0
continue_0:
  %6 = load %Node*, %Node** %n
  %7 = bitcast %Node* %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  br i1 %9, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %10 = load %Node*, %Node** %n
  %11 = load %Nat32, %Nat32* %index
  %12 = call %Bool (%Node*, %Unit*, %Nat32) %f (%Node* %10, %Unit* %ctx, %Nat32 %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %13 = load %Node*, %Node** %n
  ret %Node* %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %15 = load %Node*, %Node** %n
  %16 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 1
  %17 = load %Node*, %Node** %16
  store %Node* %17, %Node** %n

;stmt13:
  %18 = load %Nat32, %Nat32* %index
  %19 = add %Nat32 %18, 1
  store %Nat32 %19, %Nat32* %index
  br label %continue_0
break_0:

;stmt14:
  %20 = inttoptr i64 0 to %Node*
  ret %Node* %20
}

define %Bool @_func20 (%Node* %n, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = getelementptr inbounds %Node, %Node* %n, i32 0, i32 3
  %2 = load %Unit*, %Unit** %1
  %3 = icmp eq %Unit* %2, %ctx
  ret %Bool %3
}

define %Node* @node_search_by_data (%Node* %node_chain, %Unit* %data) {

;stmt0:
  %1 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %node_chain, %NodeSearchHandler @_func20, %Unit* %data)
  ret %Node* %1
}

define void @map_init (%List* %list) {

;stmt0:
  %1 = bitcast %List* %list to %Unit*
  %2 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %1, %Nat8 0, %Nat32 24)
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

define %Bool @list_append (%List* %list, %Unit* %obj) {

;stmt0:
  %1 = bitcast %List* %list to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %obj, %4
  %6 = or %Bool %3, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %8 = call %Node* () @node_new ()

;stmt4:
  %9 = getelementptr inbounds %Node, %Node* %8, i32 0, i32 3
  store %Unit* %obj, %Unit** %9

;stmt5:
  %10 = getelementptr inbounds %List, %List* %list, i32 0, i32 0
  %11 = load %Node*, %Node** %10
  %12 = bitcast %Node* %11 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp eq %Unit* %12, %13
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %15 = getelementptr inbounds %List, %List* %list, i32 0, i32 0
  store %Node* %8, %Node** %15
  br label %endif_1
else_1:

;stmt8:

;stmt9:
  %16 = getelementptr inbounds %List, %List* %list, i32 0, i32 1
  %17 = load %Node*, %Node** %16
  call void (%Node*, %Node*) @node_append (%Node* %17, %Node* %8)
  br label %endif_1
endif_1:

;stmt10:
  %18 = getelementptr inbounds %List, %List* %list, i32 0, i32 1
  store %Node* %8, %Node** %18

;stmt11:
  %19 = getelementptr inbounds %List, %List* %list, i32 0, i32 2
  %20 = getelementptr inbounds %List, %List* %list, i32 0, i32 2
  %21 = load %Nat64, %Nat64* %20
  %22 = add %Nat64 %21, 1
  store %Nat64 %22, %Nat64* %19

;stmt12:
  ret %Bool 1
}

define %Bool @list_extend (%List* %list1, %List* %list2) {

;stmt0:
  %1 = bitcast %List* %list1 to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = bitcast %List* %list2 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = or %Bool %3, %6
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
  %9 = getelementptr inbounds %List, %List* %list1, i32 0, i32 1
  %10 = load %Node*, %Node** %9

;stmt4:
  %11 = getelementptr inbounds %List, %List* %list1, i32 0, i32 2
  %12 = getelementptr inbounds %List, %List* %list1, i32 0, i32 2
  %13 = load %Nat64, %Nat64* %12
  %14 = getelementptr inbounds %List, %List* %list2, i32 0, i32 2
  %15 = load %Nat64, %Nat64* %14
  %16 = add %Nat64 %13, %15
  store %Nat64 %16, %Nat64* %11

;stmt5:
  %17 = bitcast %Node* %10 to %Unit*
  %18 = inttoptr i64 0 to %Unit*
  %19 = icmp eq %Unit* %17, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %20 = getelementptr inbounds %List, %List* %list1, i32 0, i32 0
  %21 = getelementptr inbounds %List, %List* %list2, i32 0, i32 0
  %22 = load %Node*, %Node** %21
  store %Node* %22, %Node** %20

;stmt8:
  %23 = getelementptr inbounds %List, %List* %list1, i32 0, i32 1
  %24 = getelementptr inbounds %List, %List* %list2, i32 0, i32 1
  %25 = load %Node*, %Node** %24
  store %Node* %25, %Node** %23

;stmt9:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %27 = getelementptr inbounds %Node, %Node* %10, i32 0, i32 1
  %28 = getelementptr inbounds %List, %List* %list2, i32 0, i32 0
  %29 = load %Node*, %Node** %28
  store %Node* %29, %Node** %27

;stmt11:
  %30 = getelementptr inbounds %List, %List* %list2, i32 0, i32 0
  %31 = load %Node*, %Node** %30
  %32 = bitcast %Node* %31 to %Unit*
  %33 = inttoptr i64 0 to %Unit*
  %34 = icmp ne %Unit* %32, %33
  %35 = getelementptr inbounds %List, %List* %list2, i32 0, i32 1
  %36 = load %Node*, %Node** %35
  %37 = bitcast %Node* %36 to %Unit*
  %38 = inttoptr i64 0 to %Unit*
  %39 = icmp ne %Unit* %37, %38
  %40 = and %Bool %34, %39
  br i1 %40, label %then_2, label %else_2
then_2:

;stmt12:

;stmt13:
  %41 = getelementptr inbounds %List, %List* %list2, i32 0, i32 0
  %42 = load %Node*, %Node** %41
  %43 = getelementptr inbounds %Node, %Node* %42, i32 0, i32 0
  store %Node* %10, %Node** %43

;stmt14:
  %44 = getelementptr inbounds %List, %List* %list1, i32 0, i32 1
  %45 = getelementptr inbounds %List, %List* %list2, i32 0, i32 1
  %46 = load %Node*, %Node** %45
  store %Node* %46, %Node** %44
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt15:
  ret %Bool 1
}

define %Bool @list_subst (%List* %list, %Unit* %o1, %Unit* %o2) {

;stmt0:
  %1 = getelementptr inbounds %List, %List* %list, i32 0, i32 0
  %2 = load %Node*, %Node** %1
  %3 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %2, %Unit* %o1)

;stmt1:
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 3
  store %Unit* %o2, %Unit** %8

;stmt5:
  ret %Bool 1
}

define void @list_node_remove (%List* %list, %Node* %n) {

;stmt0:
  %1 = getelementptr inbounds %Node, %Node* %n, i32 0, i32 0
  %2 = load %Node*, %Node** %1

;stmt1:
  %3 = getelementptr inbounds %Node, %Node* %n, i32 0, i32 1
  %4 = load %Node*, %Node** %3

;stmt2:
  call void (%Node*) @node_exclude (%Node* %n)

;stmt3:
  %5 = getelementptr inbounds %List, %List* %list, i32 0, i32 0
  %6 = load %Node*, %Node** %5
  %7 = icmp eq %Node* %6, %n
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %8 = getelementptr inbounds %List, %List* %list, i32 0, i32 0
  store %Node* %4, %Node** %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %9 = getelementptr inbounds %List, %List* %list, i32 0, i32 1
  %10 = load %Node*, %Node** %9
  %11 = icmp eq %Node* %10, %n
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %12 = getelementptr inbounds %List, %List* %list, i32 0, i32 1
  store %Node* %2, %Node** %12
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %13 = bitcast %Node* %n to %Unit*
  call void (%Unit*) @free (%Unit* %13)

;stmt10:
  %14 = getelementptr inbounds %List, %List* %list, i32 0, i32 2
  %15 = getelementptr inbounds %List, %List* %list, i32 0, i32 2
  %16 = load %Nat64, %Nat64* %15
  %17 = sub %Nat64 %16, 1
  store %Nat64 %17, %Nat64* %14
  ret void
}

define %Bool @list_remove (%List* %list, %Unit* %o) {

;stmt0:
  %1 = getelementptr inbounds %List, %List* %list, i32 0, i32 0
  %2 = load %Node*, %Node** %1
  %3 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %2, %Unit* %o)

;stmt1:
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  call void (%List*, %Node*) @list_node_remove (%List* %list, %Node* %3)

;stmt5:
  ret %Bool 1
}

define void @list_foreach (%List* %list, %ListForeachHandler %f, %Unit* %ctx) {

;stmt0:
  %index = alloca %Nat32

;stmt1:
  store %Nat32 0, %Nat32* %index

;stmt2:
  %n = alloca %Node*

;stmt3:
  %1 = getelementptr inbounds %List, %List* %list, i32 0, i32 0
  %2 = load %Node*, %Node** %1
  store %Node* %2, %Node** %n

;stmt4:
  br label %continue_0
continue_0:
  %3 = load %Node*, %Node** %n
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %7 = load %Node*, %Node** %n
  %8 = getelementptr inbounds %Node, %Node* %7, i32 0, i32 3
  %9 = load %Unit*, %Unit** %8
  %10 = load %Nat32, %Nat32* %index
  call void (%Unit*, %Unit*, %Nat32) %f (%Unit* %9, %Unit* %ctx, %Nat32 %10)

;stmt7:
  %11 = load %Node*, %Node** %n
  %12 = getelementptr inbounds %Node, %Node* %11, i32 0, i32 1
  %13 = load %Node*, %Node** %12
  store %Node* %13, %Node** %n

;stmt8:
  %14 = load %Nat32, %Nat32* %index
  %15 = add %Nat32 %14, 1
  store %Nat32 %15, %Nat32* %index
  br label %continue_0
break_0:
  ret void
}

define void @list_foreach2 (%List* %list1, %List* %list2, %ListForeachHandler2 %f, %Unit* %ctx) {

;stmt0:
  %n1 = alloca %Node*

;stmt1:
  %n2 = alloca %Node*

;stmt2:
  %1 = getelementptr inbounds %List, %List* %list1, i32 0, i32 0
  %2 = load %Node*, %Node** %1
  store %Node* %2, %Node** %n1

;stmt3:
  %3 = getelementptr inbounds %List, %List* %list2, i32 0, i32 0
  %4 = load %Node*, %Node** %3
  store %Node* %4, %Node** %n2

;stmt4:
  %index = alloca %Nat32

;stmt5:
  store %Nat32 0, %Nat32* %index

;stmt6:
  br label %continue_0
continue_0:
  %5 = load %Node*, %Node** %n1
  %6 = bitcast %Node* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  %9 = load %Node*, %Node** %n2
  %10 = bitcast %Node* %9 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  %13 = and %Bool %8, %12
  br i1 %13, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %14 = load %Node*, %Node** %n1
  %15 = getelementptr inbounds %Node, %Node* %14, i32 0, i32 3
  %16 = load %Unit*, %Unit** %15
  %17 = load %Node*, %Node** %n2
  %18 = getelementptr inbounds %Node, %Node* %17, i32 0, i32 3
  %19 = load %Unit*, %Unit** %18
  %20 = load %Nat32, %Nat32* %index
  call void (%Unit*, %Unit*, %Unit*, %Nat32) %f (%Unit* %16, %Unit* %19, %Unit* %ctx, %Nat32 %20)

;stmt9:
  %21 = load %Node*, %Node** %n1
  %22 = getelementptr inbounds %Node, %Node* %21, i32 0, i32 1
  %23 = load %Node*, %Node** %22
  store %Node* %23, %Node** %n1

;stmt10:
  %24 = load %Node*, %Node** %n2
  %25 = getelementptr inbounds %Node, %Node* %24, i32 0, i32 1
  %26 = load %Node*, %Node** %25
  store %Node* %26, %Node** %n2

;stmt11:
  %27 = load %Nat32, %Nat32* %index
  %28 = add %Nat32 %27, 1
  store %Nat32 %28, %Nat32* %index
  br label %continue_0
break_0:
  ret void
}

define %Bool @list_compare (%List* %list1, %List* %list2, %ListCompareHandler %f, %Unit* %ctx) {

;stmt0:
  %1 = getelementptr inbounds %List, %List* %list1, i32 0, i32 2
  %2 = load %Nat64, %Nat64* %1
  %3 = getelementptr inbounds %List, %List* %list2, i32 0, i32 2
  %4 = load %Nat64, %Nat64* %3
  %5 = icmp ne %Nat64 %2, %4
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
  %n1 = alloca %Node*

;stmt4:
  %n2 = alloca %Node*

;stmt5:
  %7 = getelementptr inbounds %List, %List* %list1, i32 0, i32 0
  %8 = load %Node*, %Node** %7
  store %Node* %8, %Node** %n1

;stmt6:
  %9 = getelementptr inbounds %List, %List* %list2, i32 0, i32 0
  %10 = load %Node*, %Node** %9
  store %Node* %10, %Node** %n2

;stmt7:
  %index = alloca %Nat32

;stmt8:
  store %Nat32 0, %Nat32* %index

;stmt9:
  br label %continue_0
continue_0:
  %11 = load %Node*, %Node** %n1
  %12 = bitcast %Node* %11 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  %15 = load %Node*, %Node** %n2
  %16 = bitcast %Node* %15 to %Unit*
  %17 = inttoptr i64 0 to %Unit*
  %18 = icmp ne %Unit* %16, %17
  %19 = and %Bool %14, %18
  br i1 %19, label %body_0, label %break_0
body_0:

;stmt10:

;stmt11:
  %20 = load %Node*, %Node** %n1
  %21 = getelementptr inbounds %Node, %Node* %20, i32 0, i32 3
  %22 = load %Unit*, %Unit** %21
  %23 = load %Node*, %Node** %n2
  %24 = getelementptr inbounds %Node, %Node* %23, i32 0, i32 3
  %25 = load %Unit*, %Unit** %24
  %26 = load %Nat32, %Nat32* %index
  %27 = call %Bool (%Unit*, %Unit*, %Unit*, %Nat32) %f (%Unit* %22, %Unit* %25, %Unit* %ctx, %Nat32 %26)
  %28 = xor %Bool %27, 1
  br i1 %28, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  ret %Bool 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt14:
  %30 = load %Node*, %Node** %n1
  %31 = getelementptr inbounds %Node, %Node* %30, i32 0, i32 1
  %32 = load %Node*, %Node** %31
  store %Node* %32, %Node** %n1

;stmt15:
  %33 = load %Node*, %Node** %n2
  %34 = getelementptr inbounds %Node, %Node* %33, i32 0, i32 1
  %35 = load %Node*, %Node** %34
  store %Node* %35, %Node** %n2

;stmt16:
  %36 = load %Nat32, %Nat32* %index
  %37 = add %Nat32 %36, 1
  store %Nat32 %37, %Nat32* %index
  br label %continue_0
break_0:

;stmt17:
  ret %Bool 1
}

define %Unit* @list_search (%List* %list, %ListSearchHandler %f, %Unit* %ctx) {

;stmt0:
  %1 = bitcast %List* %list to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = inttoptr i64 0 to %Unit*
  ret %Unit* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %n = alloca %Node*

;stmt4:
  %6 = getelementptr inbounds %List, %List* %list, i32 0, i32 0
  %7 = load %Node*, %Node** %6
  store %Node* %7, %Node** %n

;stmt5:
  %index = alloca %Nat32

;stmt6:
  store %Nat32 0, %Nat32* %index

;stmt7:
  br label %continue_0
continue_0:
  %8 = load %Node*, %Node** %n
  %9 = bitcast %Node* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %12 = load %Node*, %Node** %n
  %13 = getelementptr inbounds %Node, %Node* %12, i32 0, i32 3
  %14 = load %Unit*, %Unit** %13
  %15 = load %Nat32, %Nat32* %index
  %16 = call %Unit* (%Unit*, %Unit*, %Nat32) %f (%Unit* %14, %Unit* %ctx, %Nat32 %15)

;stmt10:
  %17 = inttoptr i64 0 to %Unit*
  %18 = icmp ne %Unit* %16, %17
  br i1 %18, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  ret %Unit* %16
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt13:
  %20 = load %Node*, %Node** %n
  %21 = getelementptr inbounds %Node, %Node* %20, i32 0, i32 1
  %22 = load %Node*, %Node** %21
  store %Node* %22, %Node** %n

;stmt14:
  %23 = load %Nat32, %Nat32* %index
  %24 = add %Nat32 %23, 1
  store %Nat32 %24, %Nat32* %index
  br label %continue_0
break_0:

;stmt15:
  %25 = inttoptr i64 0 to %Unit*
  ret %Unit* %25
}

define %List* @list_map (%List* %list, %ListMapHandler %f, %Unit* %ctx) {

;stmt0:
  %1 = bitcast %List* %list to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = inttoptr i64 0 to %List*
  ret %List* %4
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
  %6 = getelementptr inbounds %List, %List* %list, i32 0, i32 0
  %7 = load %Node*, %Node** %6
  store %Node* %7, %Node** %n

;stmt7:
  %8 = call %List* () @map_new ()

;stmt8:
  br label %continue_0
continue_0:
  %9 = load %Node*, %Node** %n
  %10 = bitcast %Node* %9 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  br i1 %12, label %body_0, label %break_0
body_0:

;stmt9:

;stmt10:
  %13 = load %Node*, %Node** %n
  %14 = getelementptr inbounds %Node, %Node* %13, i32 0, i32 3
  %15 = load %Unit*, %Unit** %14
  %16 = load %Nat32, %Nat32* %index
  %17 = call %Unit* (%Unit*, %Unit*, %Nat32) %f (%Unit* %15, %Unit* %ctx, %Nat32 %16)

;stmt11:
  %18 = inttoptr i64 0 to %Unit*
  %19 = icmp ne %Unit* %17, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %20 = call %Bool (%List*, %Unit*) @list_append (%List* %8, %Unit* %17)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt14:
  %21 = load %Nat32, %Nat32* %index
  %22 = add %Nat32 %21, 1
  store %Nat32 %22, %Nat32* %index

;stmt15:
  %23 = load %Node*, %Node** %n
  %24 = getelementptr inbounds %Node, %Node* %23, i32 0, i32 1
  %25 = load %Node*, %Node** %24
  store %Node* %25, %Node** %n
  br label %continue_0
break_0:

;stmt16:
  ret %List* %8
}

define %Bool @map_append (%List* %m, %Str %k, %Unit* %v) {

;stmt0:
  %1 = bitcast %List* %m to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = bitcast %Str %k to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp eq %Unit* %v, %7
  %9 = or %Bool %6, %8
  %10 = or %Bool %3, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %12 = call %Node* () @node_new ()

;stmt4:
  %13 = getelementptr inbounds %Node, %Node* %12, i32 0, i32 2
  %14 = bitcast %Str %k to %Unit*
  store %Unit* %14, %Unit** %13

;stmt5:
  %15 = getelementptr inbounds %Node, %Node* %12, i32 0, i32 3
  store %Unit* %v, %Unit** %15

;stmt6:
  %16 = getelementptr inbounds %List, %List* %m, i32 0, i32 0
  %17 = load %Node*, %Node** %16
  %18 = bitcast %Node* %17 to %Unit*
  %19 = inttoptr i64 0 to %Unit*
  %20 = icmp eq %Unit* %18, %19
  br i1 %20, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %21 = getelementptr inbounds %List, %List* %m, i32 0, i32 0
  store %Node* %12, %Node** %21
  br label %endif_1
else_1:

;stmt9:

;stmt10:
  %22 = getelementptr inbounds %List, %List* %m, i32 0, i32 1
  %23 = load %Node*, %Node** %22
  call void (%Node*, %Node*) @node_append (%Node* %23, %Node* %12)
  br label %endif_1
endif_1:

;stmt11:
  %24 = getelementptr inbounds %List, %List* %m, i32 0, i32 1
  store %Node* %12, %Node** %24

;stmt12:
  %25 = getelementptr inbounds %List, %List* %m, i32 0, i32 2
  %26 = getelementptr inbounds %List, %List* %m, i32 0, i32 2
  %27 = load %Nat64, %Nat64* %26
  %28 = add %Nat64 %27, 1
  store %Nat64 %28, %Nat64* %25

;stmt13:
  ret %Bool 1
}

define %Bool @f (%Node* %n, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = getelementptr inbounds %Node, %Node* %n, i32 0, i32 2
  %2 = load %Unit*, %Unit** %1
  %3 = bitcast %Unit* %2 to %Str
  %4 = bitcast %Unit* %ctx to %Str
  %5 = call %Int32 (%Str, %Str) @strcmp (%Str %3, %Str %4)
  %6 = icmp eq %Int32 %5, 0
  ret %Bool %6
}

define %Node* @map_list_node_get (%List* %m, %Str %k) {

;stmt0:
  %1 = getelementptr inbounds %List, %List* %m, i32 0, i32 0
  %2 = load %Node*, %Node** %1
  %3 = bitcast %Str %k to %Unit*
  %4 = call %Node* (%Node*, %NodeSearchHandler, %Unit*) @node_search (%Node* %2, %NodeSearchHandler @f, %Unit* %3)
  ret %Node* %4
}

define void @map_reset (%List* %m, %Str %k, %Unit* %v) {

;stmt0:
  %1 = call %Node* (%List*, %Str) @map_list_node_get (%List* %m, %Str %k)

;stmt1:
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 3
  store %Unit* %v, %Unit** %2
  ret void
}

define %Unit* @map_remove (%List* %m, %Str %k) {

;stmt0:
  %1 = call %Node* (%List*, %Str) @map_list_node_get (%List* %m, %Str %k)

;stmt1:
  %2 = bitcast %Node* %1 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = inttoptr i64 0 to %Unit*
  ret %Unit* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 3
  %8 = load %Unit*, %Unit** %7

;stmt5:
  call void (%List*, %Node*) @list_node_remove (%List* %m, %Node* %1)

;stmt6:
  ret %Unit* %8
}

define %Unit* @map_get (%List* %m, %Str %k) {

;stmt0:
  %1 = call %Node* (%List*, %Str) @map_list_node_get (%List* %m, %Str %k)

;stmt1:
  %2 = bitcast %Node* %1 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 3
  %6 = load %Unit*, %Unit** %5
  ret %Unit* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = inttoptr i64 0 to %Unit*
  ret %Unit* %8
}

define void @map_foreach (%List* %m, %MapForeachHandler %f, %Unit* %ctx) {

;stmt0:
  %n = alloca %Node*

;stmt1:
  %1 = getelementptr inbounds %List, %List* %m, i32 0, i32 0
  %2 = load %Node*, %Node** %1
  store %Node* %2, %Node** %n

;stmt2:
  br label %continue_0
continue_0:
  %3 = load %Node*, %Node** %n
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %7 = load %Node*, %Node** %n
  %8 = getelementptr inbounds %Node, %Node* %7, i32 0, i32 2
  %9 = load %Unit*, %Unit** %8
  %10 = load %Node*, %Node** %n
  %11 = getelementptr inbounds %Node, %Node* %10, i32 0, i32 3
  %12 = load %Unit*, %Unit** %11
  call void (%Unit*, %Unit*, %Unit*) %f (%Unit* %9, %Unit* %12, %Unit* %ctx)

;stmt5:
  %13 = load %Node*, %Node** %n
  %14 = getelementptr inbounds %Node, %Node* %13, i32 0, i32 1
  %15 = load %Node*, %Node** %14
  store %Node* %15, %Node** %n
  br label %continue_0
break_0:
  ret void
}

define void @set (%Str %id, %Nat64 %v) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 8)
  %2 = bitcast %Unit* %1 to %Nat64*

;stmt1:
  store %Nat64 %v, %Nat64* %2

;stmt2:
  %3 = load %List*, %List** @settings
  %4 = call %Unit* (%List*, %Str) @map_get (%List* %3, %Str %id)

;stmt3:
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  call void (%Unit*) @free (%Unit* %4)

;stmt6:
  %7 = load %List*, %List** @settings
  %8 = bitcast %Nat64* %2 to %Unit*
  %9 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %7, %Str %id, %Unit* %8)
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %10 = load %List*, %List** @settings
  %11 = bitcast %Nat64* %2 to %Unit*
  call void (%List*, %Str, %Unit*) @map_reset (%List* %10, %Str %id, %Unit* %11)
  br label %endif_0
endif_0:
  ret void
}

define %Nat64 @get (%Str %id) {

;stmt0:
  %1 = load %List*, %List** @settings
  %2 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %id)
  %3 = bitcast %Unit* %2 to %Nat64*

;stmt1:
  %4 = load %Nat64, %Nat64* %3
  ret %Nat64 %4
}

define %Bool @isalpha (%Nat8 %c) {

;stmt0:
  %1 = load %Str, %Str* @_func42_str1
  %2 = getelementptr inbounds %Nat8, %Str %1, %Int32 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp uge %Nat8 %c, %3
  %5 = load %Str, %Str* @_func42_str2
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp ule %Nat8 %c, %7
  %9 = and %Bool %4, %8
  %10 = load %Str, %Str* @_func42_str3
  %11 = getelementptr inbounds %Nat8, %Str %10, %Int32 0
  %12 = load %Nat8, %Nat8* %11
  %13 = icmp uge %Nat8 %c, %12
  %14 = load %Str, %Str* @_func42_str4
  %15 = getelementptr inbounds %Nat8, %Str %14, %Int32 0
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp ule %Nat8 %c, %16
  %18 = and %Bool %13, %17
  %19 = or %Bool %9, %18
  ret %Bool %19
}

define %Bool @isdigit (%Nat8 %c) {

;stmt0:
  %1 = load %Str, %Str* @_func43_str1
  %2 = getelementptr inbounds %Nat8, %Str %1, %Int32 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp uge %Nat8 %c, %3
  %5 = load %Str, %Str* @_func43_str2
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp ule %Nat8 %c, %7
  %9 = and %Bool %4, %8
  ret %Bool %9
}

define %Bool @isalnum (%Nat8 %c) {

;stmt0:
  %1 = call %Bool (%Nat8) @isalpha (%Nat8 %c)
  %2 = call %Bool (%Nat8) @isdigit (%Nat8 %c)
  %3 = or %Bool %1, %2
  ret %Bool %3
}

define void @lex_init (%Str %fname) {

;stmt0:
  %1 = call %Bool (%Str) @exists (%Str %fname)
  %2 = xor %Bool %1, 1
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %3 = load %Str, %Str* @_func45_str1
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Str %fname)

;stmt3:
  %5 = load %Str, %Str* @_func45_str2
  call void (%Str) @fatal (%Str %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %6 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 0
  %7 = call %Int32 (%Str, %Int32) @open (%Str %fname, %Int32 0)
  store %Int32 %7, %Int32* %6

;stmt5:
  %8 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5
  store %Nat32 1, %Nat32* %8

;stmt6:
  %9 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  store %Nat16 1, %Nat16* %9

;stmt7:
  %10 = call %Str () @cwd ()

;stmt8:
  %11 = load %Str, %Str* @_func45_str3
  %12 = call %Str (%Str, %Str, %Str) @cat3 (%Str %10, %Str %11, %Str %fname)

;stmt9:
  %13 = bitcast %Str %10 to %Unit*
  call void (%Unit*) @free (%Unit* %13)

;stmt10:
  %14 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 7
  store %Str %12, %Str* %14
  ret void
}

define %Nat8 @getcc () {

;stmt0:
  %c = alloca %Nat8

;stmt1:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8
  %2 = load %Nat8, %Nat8* %1
  %3 = icmp ne %Nat8 %2, 0
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %4 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8
  %5 = load %Nat8, %Nat8* %4
  store %Nat8 %5, %Nat8* %c

;stmt4:
  %6 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8
  store %Nat8 0, %Nat8* %6
  br label %endif_0
else_0:

;stmt5:

;stmt6:
  %7 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 0
  %8 = load %Int32, %Int32* %7
  %9 = getelementptr inbounds %Nat8, %Nat8* %c, i32 0
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
  %13 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  %14 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  %15 = load %Nat16, %Nat16* %14
  %16 = add %Nat16 %15, 1
  store %Nat16 %16, %Nat16* %13
  br label %endif_0
endif_0:

;stmt11:
  %17 = load %Nat8, %Nat8* %c
  ret %Nat8 %17
}

define void @fill (%Rule %rule) {

;stmt0:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt1:

;stmt2:
  %1 = call %Nat8 () @getcc ()

;stmt3:
  %2 = icmp eq %Nat8 %1, 0
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %3 = load %Str, %Str* @_func47_str1
  call void (%Str) @fatal (%Str %3)

;stmt6:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %4 = call %Bool (%Nat8) %rule (%Nat8 %1)
  br i1 %4, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %5 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %6 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %7 = load %Nat32, %Nat32* %6
  %8 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %5, i32 0, %Nat32 %7
  store %Nat8 %1, %Nat8* %8

;stmt10:
  %9 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %10 = load %Nat32, %Nat32* %9
  %11 = icmp uge %Nat32 %10, 255
  br i1 %11, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %12 = load %Str, %Str* @_func47_str2
  call void (%Str) @fatal (%Str %12)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt13:
  %13 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %14 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %15 = load %Nat32, %Nat32* %14
  %16 = add %Nat32 %15, 1
  store %Nat32 %16, %Nat32* %13
  br label %endif_1
else_1:

;stmt14:

;stmt15:
  call void (%Nat8) @lex_putback (%Nat8 %1)

;stmt16:
  %17 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %18 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %19 = load %Nat32, %Nat32* %18
  %20 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %17, i32 0, %Nat32 %19
  store %Nat8 0, %Nat8* %20

;stmt17:
  br label %break_0
  br label %endif_1
endif_1:
  br label %continue_0
break_0:
  ret void
}

define %Bool @blank (%Nat8 %c) {

;stmt0:
  %1 = load %Str, %Str* @_func48_str1
  %2 = getelementptr inbounds %Nat8, %Str %1, %Int32 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %c, %3
  %5 = load %Str, %Str* @_func48_str2
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %c, %7
  %9 = or %Bool %4, %8
  ret %Bool %9
}

define %Bool @minus (%Nat8 %c) {

;stmt0:
  %1 = load %Str, %Str* @_func49_str1
  %2 = getelementptr inbounds %Nat8, %Str %1, %Int32 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %c, %3
  ret %Bool %4
}

define %Bool @slash (%Nat8 %c) {

;stmt0:
  %1 = load %Str, %Str* @_func50_str1
  %2 = getelementptr inbounds %Nat8, %Str %1, %Int32 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %c, %3
  %5 = load %Str, %Str* @_func50_str2
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %c, %7
  %9 = or %Bool %4, %8
  ret %Bool %9
}

define %Bool @rarrow (%Nat8 %c) {

;stmt0:
  %1 = load %Str, %Str* @_func51_str1
  %2 = getelementptr inbounds %Nat8, %Str %1, %Int32 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %c, %3
  %5 = load %Str, %Str* @_func51_str2
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %c, %7
  %9 = or %Bool %4, %8
  ret %Bool %9
}

define %Bool @larrow (%Nat8 %c) {

;stmt0:
  %1 = load %Str, %Str* @_func52_str1
  %2 = getelementptr inbounds %Nat8, %Str %1, %Int32 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %c, %3
  %5 = load %Str, %Str* @_func52_str2
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %c, %7
  %9 = or %Bool %4, %8
  ret %Bool %9
}

define %Bool @eq (%Nat8 %c) {

;stmt0:
  %1 = load %Str, %Str* @_func53_str1
  %2 = getelementptr inbounds %Nat8, %Str %1, %Int32 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %c, %3
  ret %Bool %4
}

define %Bool @bang (%Nat8 %c) {

;stmt0:
  %1 = load %Str, %Str* @_func54_str1
  %2 = getelementptr inbounds %Nat8, %Str %1, %Int32 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp eq %Nat8 %c, %3
  ret %Bool %4
}

define %Bool @id (%Nat8 %c) {

;stmt0:
  %1 = call %Bool (%Nat8) @isalnum (%Nat8 %c)
  %2 = load %Str, %Str* @_func55_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %c, %4
  %6 = or %Bool %1, %5
  ret %Bool %6
}

define %Bool @digit (%Nat8 %c) {

;stmt0:
  %1 = call %Bool (%Nat8) @isalnum (%Nat8 %c)
  ret %Bool %1
}

define %Bool @cpp_com (%Nat8 %c) {

;stmt0:
  %1 = load %Str, %Str* @_func57_str1
  %2 = getelementptr inbounds %Nat8, %Str %1, %Int32 0
  %3 = load %Nat8, %Nat8* %2
  %4 = icmp ne %Nat8 %c, %3
  ret %Bool %4
}

define %TokenType @gettoken () {

;stmt0:
  %c = alloca %Nat8

;stmt1:
  br label %again
again:

;stmt2:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  %2 = load %TokenType, %TokenType* %1
  %3 = icmp eq %TokenType %2, 7
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  call void () @linecnt ()

;stmt5:
  %4 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  store %Nat16 0, %Nat16* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %5 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 0, %TokenType* %5

;stmt7:
  %6 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
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
  %12 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 6
  %13 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  %14 = load %Nat16, %Nat16* %13
  store %Nat16 %14, %Nat16* %12

;stmt15:
  %15 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %16 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %15, i32 0, %Int32 0
  %17 = load %Nat8, %Nat8* %c
  store %Nat8 %17, %Nat8* %16

;stmt16:
  %18 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  store %Nat32 1, %Nat32* %18

;stmt17:
  %19 = load %Nat8, %Nat8* %c
  %20 = call %Bool (%Nat8) @isalpha (%Nat8 %19)
  %21 = load %Nat8, %Nat8* %c
  %22 = load %Str, %Str* @_func58_str1
  %23 = getelementptr inbounds %Nat8, %Str %22, %Int32 0
  %24 = load %Nat8, %Nat8* %23
  %25 = icmp eq %Nat8 %21, %24
  %26 = or %Bool %20, %25
  br i1 %26, label %then_2, label %else_2
then_2:

;stmt18:

;stmt19:
  %27 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
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
  %30 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 2, %TokenType* %30

;stmt24:
  call void (%Rule) @fill (%Rule @digit)
  br label %endif_3
else_3:

;stmt25:

;stmt26:
  %31 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 3, %TokenType* %31

;stmt27:
  %32 = load %Nat8, %Nat8* %c
  %33 = load %Str, %Str* @_func58_str2
  %34 = getelementptr inbounds %Nat8, %Str %33, %Int32 0
  %35 = load %Nat8, %Nat8* %34
  %36 = icmp eq %Nat8 %32, %35
  br i1 %36, label %then_4, label %else_4
then_4:

;stmt28:

;stmt29:
  %37 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 7, %TokenType* %37
  br label %endif_4
else_4:

;stmt30:
  %38 = load %Nat8, %Nat8* %c
  %39 = load %Str, %Str* @_func58_str3
  %40 = getelementptr inbounds %Nat8, %Str %39, %Int32 0
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
  %44 = load %Str, %Str* @_func58_str4
  %45 = getelementptr inbounds %Nat8, %Str %44, %Int32 0
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
  %49 = load %Str, %Str* @_func58_str5
  %50 = getelementptr inbounds %Nat8, %Str %49, %Int32 0
  %51 = load %Nat8, %Nat8* %50
  %52 = icmp eq %Nat8 %48, %51
  br i1 %52, label %then_7, label %else_7
then_7:

;stmt37:

;stmt38:
  call void () @xslash ()
  br label %endif_7
else_7:

;stmt39:
  %53 = load %Nat8, %Nat8* %c
  %54 = load %Str, %Str* @_func58_str6
  %55 = getelementptr inbounds %Nat8, %Str %54, %Int32 0
  %56 = load %Nat8, %Nat8* %55
  %57 = icmp eq %Nat8 %53, %56
  br i1 %57, label %then_8, label %else_8
then_8:

;stmt40:

;stmt41:
  call void (%Rule) @fill (%Rule @rarrow)
  br label %endif_8
else_8:

;stmt42:
  %58 = load %Nat8, %Nat8* %c
  %59 = load %Str, %Str* @_func58_str7
  %60 = getelementptr inbounds %Nat8, %Str %59, %Int32 0
  %61 = load %Nat8, %Nat8* %60
  %62 = icmp eq %Nat8 %58, %61
  br i1 %62, label %then_9, label %else_9
then_9:

;stmt43:

;stmt44:
  call void (%Rule) @fill (%Rule @larrow)
  br label %endif_9
else_9:

;stmt45:
  %63 = load %Nat8, %Nat8* %c
  %64 = load %Str, %Str* @_func58_str8
  %65 = getelementptr inbounds %Nat8, %Str %64, %Int32 0
  %66 = load %Nat8, %Nat8* %65
  %67 = icmp eq %Nat8 %63, %66
  br i1 %67, label %then_10, label %else_10
then_10:

;stmt46:

;stmt47:
  call void (%Rule) @fill (%Rule @bang)
  br label %endif_10
else_10:

;stmt48:
  %68 = load %Nat8, %Nat8* %c
  %69 = load %Str, %Str* @_func58_str9
  %70 = getelementptr inbounds %Nat8, %Str %69, %Int32 0
  %71 = load %Nat8, %Nat8* %70
  %72 = icmp eq %Nat8 %68, %71
  br i1 %72, label %then_11, label %else_11
then_11:

;stmt49:

;stmt50:
  %73 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 5, %TokenType* %73

;stmt51:
  call void (%Rule) @fill (%Rule @id)
  br label %endif_11
else_11:

;stmt52:
  %74 = load %Nat8, %Nat8* %c
  %75 = load %Str, %Str* @_func58_str10
  %76 = getelementptr inbounds %Nat8, %Str %75, %Int32 0
  %77 = load %Nat8, %Nat8* %76
  %78 = icmp eq %Nat8 %74, %77
  br i1 %78, label %then_12, label %else_12
then_12:

;stmt53:

;stmt54:
  call void () @string ()
  br label %endif_12
else_12:

;stmt55:
  %79 = load %Nat8, %Nat8* %c
  %80 = icmp eq %Nat8 %79, 0
  br i1 %80, label %then_13, label %else_13
then_13:

;stmt56:

;stmt57:
  %81 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 0, %TokenType* %81

;stmt58:
  %82 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %83 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %82, i32 0, %Int32 0
  store %Nat8 0, %Nat8* %83

;stmt59:
  %84 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  store %Nat32 0, %Nat32* %84

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
  %86 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %87 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %88 = load %Nat32, %Nat32* %87
  %89 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %86, i32 0, %Nat32 %88
  store %Nat8 0, %Nat8* %89

;stmt63:
  %90 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  %91 = load %TokenType, %TokenType* %90
  ret %TokenType %91
}

define void @xslash () {

;stmt0:
  %c = alloca %Nat8

;stmt1:
  %1 = call %Nat8 () @getcc ()

;stmt2:
  %2 = load %Str, %Str* @_func59_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  call void (%Nat8) @lex_putback (%Nat8 %1)

;stmt5:
  call void (%Rule) @fill (%Rule @cpp_com)

;stmt6:
  %6 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 6, %TokenType* %6
  br label %endif_0
else_0:

;stmt7:
  %7 = load %Str, %Str* @_func59_str2
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp eq %Nat8 %1, %9
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %11 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 6, %TokenType* %11

;stmt10:
  %12 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %13 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %12, i32 0, %Int32 0
  store %Nat8 0, %Nat8* %13

;stmt11:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt12:

;stmt13:
  %14 = call %Nat8 () @getcc ()
  store %Nat8 %14, %Nat8* %c

;stmt14:
  %15 = load %Nat8, %Nat8* %c
  %16 = icmp eq %Nat8 %15, 0
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  %17 = load %Str, %Str* @_func59_str3
  call void (%Str) @fatal (%Str %17)
  br label %endif_2
else_2:

;stmt17:
  %18 = load %Nat8, %Nat8* %c
  %19 = load %Str, %Str* @_func59_str4
  %20 = getelementptr inbounds %Nat8, %Str %19, %Int32 0
  %21 = load %Nat8, %Nat8* %20
  %22 = icmp eq %Nat8 %18, %21
  br i1 %22, label %then_3, label %else_3
then_3:

;stmt18:

;stmt19:
  %23 = call %Nat8 () @getcc ()
  store %Nat8 %23, %Nat8* %c

;stmt20:
  %24 = load %Nat8, %Nat8* %c
  %25 = load %Str, %Str* @_func59_str5
  %26 = getelementptr inbounds %Nat8, %Str %25, %Int32 0
  %27 = load %Nat8, %Nat8* %26
  %28 = icmp eq %Nat8 %24, %27
  br i1 %28, label %then_4, label %else_4
then_4:

;stmt21:

;stmt22:
  %29 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %30 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %31 = load %Nat32, %Nat32* %30
  %32 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %29, i32 0, %Nat32 %31
  store %Nat8 0, %Nat8* %32

;stmt23:
ret void
  br label %endif_4
else_4:

;stmt24:

;stmt25:
  %34 = load %Nat8, %Nat8* %c
  call void (%Nat8) @lex_putback (%Nat8 %34)
  br label %endif_4
endif_4:
  br label %endif_3
else_3:

;stmt26:
  %35 = load %Nat8, %Nat8* %c
  %36 = load %Str, %Str* @_func59_str6
  %37 = getelementptr inbounds %Nat8, %Str %36, %Int32 0
  %38 = load %Nat8, %Nat8* %37
  %39 = icmp eq %Nat8 %35, %38
  br i1 %39, label %then_5, label %else_5
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
  call void (%Nat8) @lex_putback (%Nat8 %1)

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
  %c = alloca %Nat8

;stmt1:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  store %TokenType 4, %TokenType* %1

;stmt2:
  %2 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
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
  %5 = load %Str, %Str* @_func60_str1
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
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
  %12 = load %Str, %Str* @_func60_str2
  call void (%Str) @fatal (%Str %12)
  br label %endif_1
else_1:

;stmt12:

;stmt13:
  %13 = load %Nat8, %Nat8* %c
  %14 = load %Str, %Str* @_func60_str3
  %15 = getelementptr inbounds %Nat8, %Str %14, %Int32 0
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
  %20 = load %Str, %Str* @_func60_str4
  %21 = getelementptr inbounds %Nat8, %Str %20, %Int32 0
  %22 = load %Nat8, %Nat8* %21
  %23 = icmp eq %Nat8 %19, %22
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt17:

;stmt18:
  %24 = load %Str, %Str* @_func60_str5
  %25 = getelementptr inbounds %Nat8, %Str %24, %Int32 0
  %26 = load %Nat8, %Nat8* %25
  store %Nat8 %26, %Nat8* %c
  br label %endif_3
else_3:

;stmt19:
  %27 = load %Nat8, %Nat8* %c
  %28 = load %Str, %Str* @_func60_str6
  %29 = getelementptr inbounds %Nat8, %Str %28, %Int32 0
  %30 = load %Nat8, %Nat8* %29
  %31 = icmp eq %Nat8 %27, %30
  br i1 %31, label %then_4, label %else_4
then_4:

;stmt20:

;stmt21:
  %32 = load %Str, %Str* @_func60_str7
  %33 = getelementptr inbounds %Nat8, %Str %32, %Int32 0
  %34 = load %Nat8, %Nat8* %33
  store %Nat8 %34, %Nat8* %c
  br label %endif_4
else_4:

;stmt22:
  %35 = load %Nat8, %Nat8* %c
  %36 = load %Str, %Str* @_func60_str8
  %37 = getelementptr inbounds %Nat8, %Str %36, %Int32 0
  %38 = load %Nat8, %Nat8* %37
  %39 = icmp eq %Nat8 %35, %38
  br i1 %39, label %then_5, label %else_5
then_5:

;stmt23:

;stmt24:
  %40 = load %Str, %Str* @_func60_str9
  %41 = getelementptr inbounds %Nat8, %Str %40, %Int32 0
  %42 = load %Nat8, %Nat8* %41
  store %Nat8 %42, %Nat8* %c
  br label %endif_5
else_5:

;stmt25:
  %43 = load %Nat8, %Nat8* %c
  %44 = load %Str, %Str* @_func60_str10
  %45 = getelementptr inbounds %Nat8, %Str %44, %Int32 0
  %46 = load %Nat8, %Nat8* %45
  %47 = icmp eq %Nat8 %43, %46
  br i1 %47, label %then_6, label %else_6
then_6:

;stmt26:

;stmt27:
  %48 = load %Str, %Str* @_func60_str11
  %49 = getelementptr inbounds %Nat8, %Str %48, %Int32 0
  %50 = load %Nat8, %Nat8* %49
  store %Nat8 %50, %Nat8* %c
  br label %endif_6
else_6:

;stmt28:
  %51 = load %Nat8, %Nat8* %c
  %52 = load %Str, %Str* @_func60_str12
  %53 = getelementptr inbounds %Nat8, %Str %52, %Int32 0
  %54 = load %Nat8, %Nat8* %53
  %55 = icmp eq %Nat8 %51, %54
  br i1 %55, label %then_7, label %else_7
then_7:

;stmt29:

;stmt30:
  %56 = load %Str, %Str* @_func60_str13
  %57 = getelementptr inbounds %Nat8, %Str %56, %Int32 0
  %58 = load %Nat8, %Nat8* %57
  store %Nat8 %58, %Nat8* %c
  br label %endif_7
else_7:

;stmt31:
  %59 = load %Nat8, %Nat8* %c
  %60 = load %Str, %Str* @_func60_str14
  %61 = getelementptr inbounds %Nat8, %Str %60, %Int32 0
  %62 = load %Nat8, %Nat8* %61
  %63 = icmp eq %Nat8 %59, %62
  br i1 %63, label %then_8, label %else_8
then_8:

;stmt32:

;stmt33:
  %64 = load %Str, %Str* @_func60_str15
  %65 = getelementptr inbounds %Nat8, %Str %64, %Int32 0
  %66 = load %Nat8, %Nat8* %65
  store %Nat8 %66, %Nat8* %c
  br label %endif_8
else_8:

;stmt34:
  %67 = load %Nat8, %Nat8* %c
  %68 = load %Str, %Str* @_func60_str16
  %69 = getelementptr inbounds %Nat8, %Str %68, %Int32 0
  %70 = load %Nat8, %Nat8* %69
  %71 = icmp eq %Nat8 %67, %70
  br i1 %71, label %then_9, label %else_9
then_9:

;stmt35:

;stmt36:
  %72 = load %Str, %Str* @_func60_str17
  %73 = getelementptr inbounds %Nat8, %Str %72, %Int32 0
  %74 = load %Nat8, %Nat8* %73
  store %Nat8 %74, %Nat8* %c
  br label %endif_9
else_9:

;stmt37:
  %75 = load %Nat8, %Nat8* %c
  %76 = load %Str, %Str* @_func60_str18
  %77 = getelementptr inbounds %Nat8, %Str %76, %Int32 0
  %78 = load %Nat8, %Nat8* %77
  %79 = icmp eq %Nat8 %75, %78
  br i1 %79, label %then_10, label %else_10
then_10:

;stmt38:

;stmt39:
  %80 = load %Str, %Str* @_func60_str19
  %81 = getelementptr inbounds %Nat8, %Str %80, %Int32 0
  %82 = load %Nat8, %Nat8* %81
  store %Nat8 %82, %Nat8* %c
  br label %endif_10
else_10:

;stmt40:
  %83 = load %Nat8, %Nat8* %c
  %84 = load %Str, %Str* @_func60_str20
  %85 = getelementptr inbounds %Nat8, %Str %84, %Int32 0
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
  %88 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %89 = load %Nat32, %Nat32* %88
  %90 = icmp uge %Nat32 %89, 255
  br i1 %90, label %then_12, label %else_12
then_12:

;stmt44:

;stmt45:
  %91 = load %Str, %Str* @_func60_str21
  call void (%Str) @fatal (%Str %91)
  br label %endif_12
else_12:
  br label %endif_12
endif_12:

;stmt46:
  %92 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %93 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %94 = load %Nat32, %Nat32* %93
  %95 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %92, i32 0, %Nat32 %94
  %96 = load %Nat8, %Nat8* %c
  store %Nat8 %96, %Nat8* %95

;stmt47:
  %97 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %98 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %99 = load %Nat32, %Nat32* %98
  %100 = add %Nat32 %99, 1
  store %Nat32 %100, %Nat32* %97
  br label %continue_0
break_0:
  ret void
}

define %List* @tokenize (%Str %filename) {

;stmt0:
  %1 = call %List* () @map_new ()

;stmt1:
  call void (%Str) @lex_init (%Str %filename)

;stmt2:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %2 = call %TokenType () @gettoken ()

;stmt5:
  %3 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %4 = load %Nat32, %Nat32* %3
  %5 = trunc %Nat32 %4 to %Nat16
  %6 = add %Nat16 %5, 1

;stmt6:
  %7 = zext %Nat16 %6 to %Nat32
  %8 = add %Nat32 40, %7
  %9 = call %Unit* (%Nat32) @malloc (%Nat32 %8)
  %10 = bitcast %Unit* %9 to %Token*

;stmt7:
  %11 = getelementptr inbounds %Token, %Token* %10, i32 0, i32 0
  %12 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 1
  %13 = load %TokenType, %TokenType* %12
  store %TokenType %13, %TokenType* %11

;stmt8:
  %14 = getelementptr inbounds %Token, %Token* %10, i32 0, i32 1
  %15 = getelementptr inbounds %TokenInfo, %TokenInfo* %14, i32 0, i32 3
  %16 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %17 = load %Nat32, %Nat32* %16
  %18 = trunc %Nat32 %17 to %Nat16
  store %Nat16 %18, %Nat16* %15

;stmt9:
  %19 = getelementptr inbounds %Token, %Token* %10, i32 0, i32 1
  %20 = getelementptr inbounds %TokenInfo, %TokenInfo* %19, i32 0, i32 0
  %21 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 7
  %22 = load %Str, %Str* %21
  store %Str %22, %Str* %20

;stmt10:
  %23 = getelementptr inbounds %Token, %Token* %10, i32 0, i32 1
  %24 = getelementptr inbounds %TokenInfo, %TokenInfo* %23, i32 0, i32 1
  %25 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5
  %26 = load %Nat32, %Nat32* %25
  store %Nat32 %26, %Nat32* %24

;stmt11:
  %27 = getelementptr inbounds %Token, %Token* %10, i32 0, i32 1
  %28 = getelementptr inbounds %TokenInfo, %TokenInfo* %27, i32 0, i32 2
  %29 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 6
  %30 = load %Nat16, %Nat16* %29
  store %Nat16 %30, %Nat16* %28

;stmt12:
  %31 = getelementptr inbounds %Token, %Token* %10, i32 0, i32 2
  %32 = bitcast [0 x %Nat8]* %31 to %Unit*
  %33 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %34 = bitcast [256 x %Nat8]* %33 to %Unit*
  %35 = zext %Nat16 %6 to %Nat32
  %36 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %32, %Unit* %34, %Nat32 %35)

;stmt13:
  %37 = getelementptr inbounds %Token, %Token* %10, i32 0, i32 2
  %38 = add %Nat16 %6, 1
  %39 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %37, i32 0, %Nat16 %38
  store %Nat8 0, %Nat8* %39

;stmt14:
  %40 = bitcast %Token* %10 to %Unit*
  %41 = call %Bool (%List*, %Unit*) @list_append (%List* %1, %Unit* %40)

;stmt15:
  %42 = icmp eq %TokenType %2, 0
  br i1 %42, label %then_0, label %else_0
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
  %44 = load %Nat32, %Nat32* @lines
  %45 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5
  %46 = load %Nat32, %Nat32* %45
  %47 = add %Nat32 %44, %46
  store %Nat32 %47, %Nat32* @lines

;stmt19:
  ret %List* %1
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

define void @lex_putback (%Nat8 %c) {

;stmt0:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8
  store %Nat8 %c, %Nat8* %1
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

define void @liblist_add (%Str %path) {

;stmt0:
  %1 = getelementptr inbounds %List, %List* @liblist, i32 0
  %2 = bitcast %Str %path to %Unit*
  %3 = call %Bool (%List*, %Unit*) @list_append (%List* %1, %Unit* %2)
  ret void
}

define %Str @domain (%Str %path) {

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
  %4 = getelementptr inbounds %Nat8, %Str %path, %Nat32 %3
  %5 = load %Nat8, %Nat8* %4
  %6 = icmp ne %Nat8 %5, 0
  br i1 %6, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  %7 = load %Nat32, %Nat32* %i
  %8 = getelementptr inbounds %Nat8, %Str %path, %Nat32 %7
  %9 = load %Nat8, %Nat8* %8
  %10 = load %Nat32, %Nat32* %i
  %11 = load %Str, %Str* @pdir
  %12 = getelementptr inbounds %Nat8, %Str %11, %Nat32 %10
  %13 = load %Nat8, %Nat8* %12
  %14 = icmp ne %Nat8 %9, %13
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  %15 = load %Nat32, %Nat32* %j
  %16 = getelementptr inbounds %Nat8, %Str %2, %Nat32 %15
  %17 = load %Nat32, %Nat32* %i
  %18 = getelementptr inbounds %Nat8, %Str %path, %Nat32 %17
  %19 = load %Nat8, %Nat8* %18
  store %Nat8 %19, %Nat8* %16

;stmt10:
  %20 = load %Nat32, %Nat32* %j
  %21 = add %Nat32 %20, 1
  store %Nat32 %21, %Nat32* %j
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt11:
  %22 = load %Nat32, %Nat32* %i
  %23 = add %Nat32 %22, 1
  store %Nat32 %23, %Nat32* %i
  br label %continue_0
break_0:

;stmt12:
  %24 = load %Nat32, %Nat32* %j
  %25 = getelementptr inbounds %Nat8, %Str %2, %Nat32 %24
  store %Nat8 0, %Nat8* %25

;stmt13:
  ret %Str %2
}

define %Source* @src_new (%Str %name, %List* %tokens) {

;stmt0:
  %fullpath = alloca %Str

;stmt1:
  store %Str %name, %Str* %fullpath

;stmt2:
  %1 = getelementptr inbounds %Nat8, %Str %name, %Int32 0
  %2 = load %Nat8, %Nat8* %1
  %3 = load %Str, %Str* @_func67_str1
  %4 = getelementptr inbounds %Nat8, %Str %3, %Int32 0
  %5 = load %Nat8, %Nat8* %4
  %6 = icmp eq %Nat8 %2, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = call %Str () @cwd ()

;stmt5:
  %8 = getelementptr inbounds %Nat8, %Str %name, %Int32 1
  %9 = bitcast %Nat8* %8 to %Str
  %10 = call %Str (%Str, %Str) @cat (%Str %7, %Str %9)
  store %Str %10, %Str* %fullpath
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %11 = call %Unit* (%Nat32) @malloc (%Nat32 40)
  %12 = bitcast %Unit* %11 to %Source*

;stmt7:
  %13 = getelementptr inbounds %Source, %Source* %12, i32 0, i32 0
  %14 = load %Str, %Str* %fullpath
  store %Str %14, %Str* %13

;stmt8:
  %15 = getelementptr inbounds %Source, %Source* %12, i32 0, i32 3
  store %List* %tokens, %List** %15

;stmt9:
  %16 = getelementptr inbounds %Source, %Source* %12, i32 0, i32 4
  %17 = getelementptr inbounds %Source, %Source* %12, i32 0, i32 3
  %18 = load %List*, %List** %17
  %19 = getelementptr inbounds %List, %List* %18, i32 0, i32 0
  %20 = load %Node*, %Node** %19
  store %Node* %20, %Node** %16

;stmt10:
  ret %Source* %12
}

define %Source* @src_open (%Str %dir, %Str %resource) {

;stmt0:
  %1 = load %Str, %Str* @_func68_str1
  %2 = call %Str (%Str, %Str, %Str) @cat3 (%Str %dir, %Str %1, %Str %resource)

;stmt1:
  %tokens = alloca %List*

;stmt2:
  %3 = inttoptr i64 0 to %List*
  store %List* %3, %List** %tokens

;stmt3:
  %fname = alloca %Str

;stmt4:
  %4 = load %Str, %Str* @_func68_str2
  %5 = call %Str (%Str, %Str) @cat (%Str %2, %Str %4)

;stmt5:
  %6 = call %Bool (%Str) @exists (%Str %5)
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %7 = call %Str (%Str) @getprefix (%Str %5)
  %8 = call %Int32 (%Str) @chdir (%Str %7)

;stmt8:
  %9 = call %Str (%Str) @get_last (%Str %5)
  %10 = call %List* (%Str) @tokenize (%Str %9)
  store %List* %10, %List** %tokens

;stmt9:
  store %Str %5, %Str* %fname
  br label %endif_0
else_0:

;stmt10:

;stmt11:
  %11 = load %Str, %Str* @_func68_str3
  %12 = call %Str (%Str, %Str) @cat (%Str %2, %Str %11)

;stmt12:
  %13 = call %Bool (%Str) @exists (%Str %12)
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt13:

;stmt14:
  %14 = call %Str (%Str) @getprefix (%Str %12)
  %15 = call %Int32 (%Str) @chdir (%Str %14)

;stmt15:
  %16 = load %Str, %Str* @_func68_str4
  %17 = call %List* (%Str) @tokenize (%Str %16)
  store %List* %17, %List** %tokens

;stmt16:
  store %Str %12, %Str* %fname
  br label %endif_1
else_1:

;stmt17:

;stmt18:
  %18 = bitcast %Str %12 to %Unit*
  call void (%Unit*) @free (%Unit* %18)
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt19:
  %19 = load %List*, %List** %tokens
  %20 = bitcast %List* %19 to %Unit*
  %21 = inttoptr i64 0 to %Unit*
  %22 = icmp eq %Unit* %20, %21
  br i1 %22, label %then_2, label %else_2
then_2:

;stmt20:

;stmt21:
  %23 = inttoptr i64 0 to %Source*
  ret %Source* %23
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt22:
  %25 = load %Str, %Str* %fname
  %26 = load %List*, %List** %tokens
  %27 = call %Source* (%Str, %List*) @src_new (%Str %25, %List* %26)
  ret %Source* %27
}

define %Unit* @search_in_lib (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Str

;stmt1:
  %2 = bitcast %Unit* %ctx to %Str

;stmt2:
  %3 = call %Source* (%Str, %Str) @src_open (%Str %1, %Str %2)
  %4 = bitcast %Source* %3 to %Unit*
  ret %Unit* %4
}

define %Source* @source_open (%Str %import_string) {

;stmt0:
  %1 = load %Str, %Str* @_func69_str1
  %2 = call %Source* (%Str, %Str) @src_open (%Str %1, %Str %import_string)

;stmt1:
  %3 = bitcast %Source* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Source* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = load %Str, %Str* @pdir
  %8 = call %Source* (%Str, %Str) @src_open (%Str %7, %Str %import_string)

;stmt5:
  %9 = bitcast %Source* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  ret %Source* %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt8:
  %13 = getelementptr inbounds %List, %List* @liblist, i32 0
  %14 = bitcast %Str %import_string to %Unit*
  %15 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %13, %ListSearchHandler @search_in_lib, %Unit* %14)
  %16 = bitcast %Unit* %15 to %Source*

;stmt9:
  ret %Source* %16
}

define void @info (%Str %s) {

;stmt0:
  %1 = load %Str, %Str* @_func71_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 27, %Int32 36, %Int32 27, %Str %s)
  ret void
}

define void @warning (%Str %s, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %TokenInfo* %ti to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp ne %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = load %Str, %Str* @_func72_str1
  %5 = getelementptr inbounds %TokenInfo, %TokenInfo* %ti, i32 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = getelementptr inbounds %TokenInfo, %TokenInfo* %ti, i32 0, i32 1
  %8 = load %Nat32, %Nat32* %7
  %9 = call %Int32 (%Str, ...) @printf (%Str %4, %Int32 27, %Int32 34, %Int32 27, %Str %6, %Nat32 %8, %Str %s)

;stmt3:
  call void (%TokenInfo*) @show (%TokenInfo* %ti)

;stmt4:
  %10 = load %Str, %Str* @_func72_str2
  %11 = call %Int32 (%Str, ...) @printf (%Str %10)
  br label %endif_0
else_0:

;stmt5:

;stmt6:
  %12 = load %Str, %Str* @_func72_str3
  %13 = call %Int32 (%Str, ...) @printf (%Str %12, %Int32 27, %Int32 34, %Int32 27, %Str %s)
  br label %endif_0
endif_0:

;stmt7:
  %14 = load %Nat32, %Nat32* @warncnt
  %15 = add %Nat32 %14, 1
  store %Nat32 %15, %Nat32* @warncnt
  ret void
}

define void @error (%Str %s, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %TokenInfo* %ti to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = load %Str, %Str* @_func73_str1
  %5 = call %Int32 (%Str, ...) @printf (%Str %4, %Int32 27, %Int32 35, %Int32 27, %Str %s)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %6 = load %Str, %Str* @_func73_str2
  %7 = getelementptr inbounds %TokenInfo, %TokenInfo* %ti, i32 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = getelementptr inbounds %TokenInfo, %TokenInfo* %ti, i32 0, i32 1
  %10 = load %Nat32, %Nat32* %9
  %11 = call %Int32 (%Str, ...) @printf (%Str %6, %Int32 27, %Int32 35, %Int32 27, %Str %8, %Nat32 %10, %Str %s)

;stmt5:
  call void (%TokenInfo*) @show (%TokenInfo* %ti)

;stmt6:
  %12 = load %Str, %Str* @_func73_str3
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)
  br label %endif_0
endif_0:

;stmt7:
  %14 = load %Nat32, %Nat32* @errcnt
  %15 = add %Nat32 %14, 1
  store %Nat32 %15, %Nat32* @errcnt

;stmt8:
  %16 = load %Nat32, %Nat32* @errcnt
  %17 = icmp ugt %Nat32 %16, 20
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %18 = load %Str, %Str* @_func73_str4
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)

;stmt11:
  call void (%Int32) @exit (%Int32 -1)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  ret void
}

define void @rem (%Str %s, %TokenInfo* %ti) {

;stmt0:
  %1 = load %Str, %Str* @_func74_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 27, %Int32 33, %Str %s, %Int32 27)

;stmt1:
  %3 = bitcast %TokenInfo* %ti to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  call void (%TokenInfo*) @show (%TokenInfo* %ti)

;stmt4:
  %6 = load %Str, %Str* @_func74_str2
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @gline (%Nat8* %line, %TokenInfo* %ti) {

;stmt0:
  %1 = getelementptr inbounds %TokenInfo, %TokenInfo* %ti, i32 0, i32 0
  %2 = load %Str, %Str* %1
  %3 = call %Int32 (%Str, %Int32) @open (%Str %2, %Int32 0)

;stmt1:
  %4 = icmp slt %Int32 %3, 0
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
  %6 = getelementptr inbounds %TokenInfo, %TokenInfo* %ti, i32 0, i32 1
  %7 = load %Nat32, %Nat32* %6

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
  %8 = load %Nat32, %Nat32* %linecnt
  %9 = icmp eq %Nat32 %8, %7
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt13:

;stmt14:
  br label %continue_1
continue_1:
  br i1 1, label %body_1, label %break_1
body_1:

;stmt15:

;stmt16:
  %10 = getelementptr inbounds %Nat8, %Nat8* %c, i32 0
  %11 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %3, %Nat8* %10, %Nat32 1)
  %12 = icmp eq %Int32 %11, 0
  br i1 %12, label %then_2, label %else_2
then_2:

;stmt17:

;stmt18:
  br label %exit
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt19:
  %14 = load %Nat32, %Nat32* %pos
  %15 = getelementptr inbounds %Nat8, %Nat8* %line, %Nat32 %14
  %16 = load %Nat8, %Nat8* %c
  store %Nat8 %16, %Nat8* %15

;stmt20:
  %17 = load %Nat32, %Nat32* %pos
  %18 = add %Nat32 %17, 1
  store %Nat32 %18, %Nat32* %pos

;stmt21:
  %19 = load %Nat8, %Nat8* %c
  %20 = load %Str, %Str* @_func75_str1
  %21 = getelementptr inbounds %Nat8, %Str %20, %Int32 0
  %22 = load %Nat8, %Nat8* %21
  %23 = icmp eq %Nat8 %19, %22
  br i1 %23, label %then_3, label %else_3
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
  %25 = getelementptr inbounds %Nat8, %Nat8* %c, i32 0
  %26 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %3, %Nat8* %25, %Nat32 1)

;stmt26:
  %27 = load %Nat8, %Nat8* %c
  %28 = load %Str, %Str* @_func75_str2
  %29 = getelementptr inbounds %Nat8, %Str %28, %Int32 0
  %30 = load %Nat8, %Nat8* %29
  %31 = icmp eq %Nat8 %27, %30
  br i1 %31, label %then_4, label %else_4
then_4:

;stmt27:

;stmt28:
  %32 = load %Nat32, %Nat32* %linecnt
  %33 = add %Nat32 %32, 1
  store %Nat32 %33, %Nat32* %linecnt
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
  %34 = call %Int32 (%Int32) @close (%Int32 %3)

;stmt31:
  %35 = load %Nat32, %Nat32* %pos
  %36 = getelementptr inbounds %Nat8, %Nat8* %line, %Nat32 %35
  store %Nat8 0, %Nat8* %36

;stmt32:
ret void
  ret void
}

define void @show (%TokenInfo* %ti) {

;stmt0:
  %1 = load %Str, %Str* @_func76_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %line = alloca [512 x %Nat8]

;stmt2:
  %3 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %line, i32 0, %Int32 0
  %4 = bitcast %Nat8* %3 to %Unit*
  %5 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %4, %Nat8 0, %Nat32 512)

;stmt3:
  %6 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %line, i32 0, %Int32 0
  %7 = bitcast %Nat8* %6 to %Nat8*
  call void (%Nat8*, %TokenInfo*) @gline (%Nat8* %7, %TokenInfo* %ti)

;stmt4:
  %8 = load %Str, %Str* @_func76_str2
  %9 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %line, i32 0, %Int32 0
  %10 = call %Int32 (%Str, ...) @printf (%Str %8, %Nat8* %9)

;stmt5:
  %vpos = alloca %Nat16

;stmt6:
  store %Nat16 1, %Nat16* %vpos

;stmt7:
  br label %continue_0
continue_0:
  %11 = load %Nat16, %Nat16* %vpos
  %12 = getelementptr inbounds %TokenInfo, %TokenInfo* %ti, i32 0, i32 2
  %13 = load %Nat16, %Nat16* %12
  %14 = icmp ult %Nat16 %11, %13
  br i1 %14, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %15 = load %Str, %Str* @_func76_str3
  %16 = call %Int32 (%Str, ...) @printf (%Str %15)

;stmt10:
  %17 = load %Nat16, %Nat16* %vpos
  %18 = add %Nat16 %17, 1
  store %Nat16 %18, %Nat16* %vpos
  br label %continue_0
break_0:

;stmt11:
  %19 = load %Str, %Str* @_func76_str4
  %20 = call %Int32 (%Str, ...) @printf (%Str %19, %Int32 27, %Int32 32, %Int32 27)
  ret void
}

define void @fatal (%Str %s) {

;stmt0:
  %1 = load %Str, %Str* @_func77_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 27, %Int32 31, %Int32 27, %Str %s)

;stmt1:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define void @prttype (%Type* %t) {

;stmt0:
  %1 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 1
  %2 = load %Str, %Str* %1
  %3 = bitcast %Str %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = load %Str, %Str* @_func78_str1
  %7 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 1
  %8 = load %Str, %Str* %7
  %9 = call %Int32 (%Str, ...) @printf (%Str %6, %Str %8)

;stmt3:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %11 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 0
  %12 = load %TypeKind, %TypeKind* %11

;stmt5:
  %13 = icmp eq %TypeKind %12, 2
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %14 = load %Str, %Str* @_func78_str2
  %15 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 5
  %16 = getelementptr inbounds %TypeBasic, %TypeBasic* %15, i32 0, i32 0
  %17 = load %Str, %Str* %16
  %18 = call %Int32 (%Str, ...) @printf (%Str %14, %Str %17)
  br label %endif_1
else_1:

;stmt8:
  %19 = icmp eq %TypeKind %12, 6
  br i1 %19, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %20 = load %Str, %Str* @_func78_str3
  %21 = call %Int32 (%Str, ...) @printf (%Str %20)

;stmt11:
  %22 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 7
  %23 = getelementptr inbounds %TypePointer, %TypePointer* %22, i32 0, i32 0
  %24 = load %Type*, %Type** %23
  call void (%Type*) @prttype (%Type* %24)
  br label %endif_2
else_2:

;stmt12:
  %25 = icmp eq %TypeKind %12, 7
  br i1 %25, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  call void (%Type*) @print_type_array (%Type* %t)
  br label %endif_3
else_3:

;stmt15:
  %26 = icmp eq %TypeKind %12, 5
  br i1 %26, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  call void (%Type*) @print_type_record (%Type* %t)
  br label %endif_4
else_4:

;stmt18:
  %27 = icmp eq %TypeKind %12, 4
  br i1 %27, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  call void (%Type*) @print_type_enum (%Type* %t)
  br label %endif_5
else_5:

;stmt21:
  %28 = icmp eq %TypeKind %12, 3
  br i1 %28, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %29 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 6
  call void (%TypeFunc*) @print_type_func (%TypeFunc* %29)
  br label %endif_6
else_6:

;stmt24:
  %30 = icmp eq %TypeKind %12, 0
  br i1 %30, label %then_7, label %else_7
then_7:

;stmt25:

;stmt26:
  %31 = load %Str, %Str* @_func78_str4
  %32 = call %Int32 (%Str, ...) @printf (%Str %31)
  br label %endif_7
else_7:

;stmt27:
  %33 = icmp eq %TypeKind %12, 1
  br i1 %33, label %then_8, label %else_8
then_8:

;stmt28:

;stmt29:
  %34 = load %Str, %Str* @_func78_str5
  %35 = call %Int32 (%Str, ...) @printf (%Str %34)
  br label %endif_8
else_8:

;stmt30:

;stmt31:
  %36 = load %Str, %Str* @_func78_str6
  %37 = call %Int32 (%Str, ...) @printf (%Str %36, %TypeKind %12)

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

define void @print_field (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = load %Str, %Str* @_func80_str1
  %2 = bitcast %Unit* %data to %Field*
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %4)

;stmt1:
  %6 = bitcast %Unit* %data to %Field*
  %7 = getelementptr inbounds %Field, %Field* %6, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*) @prttype (%Type* %8)

;stmt2:
  %9 = load %Str, %Str* @_func80_str2
  %10 = call %Int32 (%Str, ...) @printf (%Str %9)
  ret void
}

define void @print_type_record (%Type* %t) {

;stmt0:
  %1 = load %Str, %Str* @_func79_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %3 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 9
  %4 = getelementptr inbounds %TypeRecord, %TypeRecord* %3, i32 0, i32 0
  %5 = load %List*, %List** %4
  %6 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %5, %ListForeachHandler @print_field, %Unit* %6)

;stmt2:
  %7 = load %Str, %Str* @_func79_str2
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)

;stmt3:
  %9 = load %Str, %Str* @_func79_str3
  %10 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 9
  %11 = getelementptr inbounds %TypeRecord, %TypeRecord* %10, i32 0, i32 1
  %12 = load %Nat32, %Nat32* %11
  %13 = call %Int32 (%Str, ...) @printf (%Str %9, %Nat32 %12)
  ret void
}

define void @print_cons (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = load %Str, %Str* @_func82_str1
  %2 = bitcast %Unit* %data to %Value*
  %3 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 4
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %4)
  ret void
}

define void @print_type_enum (%Type* %t) {

;stmt0:
  %1 = load %Str, %Str* @_func81_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %3 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 10
  %4 = getelementptr inbounds %TypeEnum, %TypeEnum* %3, i32 0, i32 0
  %5 = load %List*, %List** %4
  %6 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %5, %ListForeachHandler @print_cons, %Unit* %6)

;stmt2:
  %7 = load %Str, %Str* @_func81_str2
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  ret void
}

define void @print_type_array (%Type* %t) {

;stmt0:
  %1 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 8
  %2 = getelementptr inbounds %TypeArray, %TypeArray* %1, i32 0, i32 2
  %3 = load %Bool, %Bool* %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = load %Str, %Str* @_func83_str1
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %6 = load %Str, %Str* @_func83_str2
  %7 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 8
  %8 = getelementptr inbounds %TypeArray, %TypeArray* %7, i32 0, i32 1
  %9 = load %Nat32, %Nat32* %8
  %10 = call %Int32 (%Str, ...) @printf (%Str %6, %Nat32 %9)
  br label %endif_0
endif_0:

;stmt5:
  %11 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 8
  %12 = getelementptr inbounds %TypeArray, %TypeArray* %11, i32 0, i32 0
  %13 = load %Type*, %Type** %12
  call void (%Type*) @prttype (%Type* %13)
  ret void
}

define void @print_params (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*

;stmt1:
  %2 = load %Bool, %Bool* @needs
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %3 = load %Str, %Str* @_func85_str1
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)
  br label %endif_0
else_0:

;stmt4:

;stmt5:
  store %Bool 1, %Bool* @needs
  br label %endif_0
endif_0:

;stmt6:
  %5 = load %Str, %Str* @_func85_str2
  %6 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 0
  %7 = load %Str, %Str* %6
  %8 = call %Int32 (%Str, ...) @printf (%Str %5, %Str %7)

;stmt7:
  %9 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 1
  %10 = load %Type*, %Type** %9
  call void (%Type*) @prttype (%Type* %10)
  ret void
}

define void @print_type_func (%TypeFunc* %t) {

;stmt0:
  %1 = load %Str, %Str* @_func84_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  store %Bool 0, %Bool* @needs

;stmt2:
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %t, i32 0, i32 0
  %4 = load %List*, %List** %3
  %5 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %4, %ListForeachHandler @print_params, %Unit* %5)

;stmt3:
  %6 = load %Str, %Str* @_func84_str2
  %7 = call %Int32 (%Str, ...) @printf (%Str %6)

;stmt4:
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %t, i32 0, i32 1
  %9 = load %Type*, %Type** %8
  call void (%Type*) @prttype (%Type* %9)
  ret void
}

define %Type* @type_basic_new (%Str %id, %Nat32 %size, %Nat32 %p, %Bool %i, %Bool %s) {

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 2)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 3
  store %Nat32 %size, %Nat32* %2

;stmt2:
  %3 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2
  store %Nat32 %size, %Nat32* %3

;stmt3:
  %4 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 1
  store %Str %id, %Str* %4

;stmt4:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5
  %6 = getelementptr inbounds %TypeBasic, %TypeBasic* %5, i32 0, i32 0
  store %Str %id, %Str* %6

;stmt5:
  %7 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5
  %8 = getelementptr inbounds %TypeBasic, %TypeBasic* %7, i32 0, i32 1
  store %Nat32 %p, %Nat32* %8

;stmt6:
  %9 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5
  %10 = getelementptr inbounds %TypeBasic, %TypeBasic* %9, i32 0, i32 2
  store %Bool %i, %Bool* %10

;stmt7:
  %11 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5
  %12 = getelementptr inbounds %TypeBasic, %TypeBasic* %11, i32 0, i32 3
  store %Bool %s, %Bool* %12

;stmt8:
  ret %Type* %1
}

define %Bool @type_basic_eq (%TypeBasic* %a, %TypeBasic* %b) {

;stmt0:
  %1 = getelementptr inbounds %TypeBasic, %TypeBasic* %a, i32 0, i32 0
  %2 = load %Str, %Str* %1
  %3 = getelementptr inbounds %TypeBasic, %TypeBasic* %b, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, %Str) @strcmp (%Str %2, %Str %4)
  %6 = icmp eq %Int32 %5, 0
  ret %Bool %6
}

define %Field* @field_new (%Str %id, %Type* %t, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = bitcast %Field* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @_func88_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  store %Str %id, %Str* %7

;stmt3:
  %8 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  store %Type* %t, %Type** %8

;stmt4:
  %9 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 2
  store %Nat16 0, %Nat16* %9

;stmt5:
  %10 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 3
  store %TokenInfo* %ti, %TokenInfo** %10

;stmt6:
  ret %Field* %2
}

define void @fpost (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*

;stmt1:
  %2 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 1
  %3 = load %Type*, %Type** %2

;stmt2:
  %4 = bitcast %Unit* %ctx to %FieldHandleContext*

;stmt3:
  %5 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 2
  %6 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %4, i32 0, i32 0
  %7 = load %Nat16, %Nat16* %6
  store %Nat16 %7, %Nat16* %5

;stmt4:
  %8 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %4, i32 0, i32 0
  %9 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %4, i32 0, i32 0
  %10 = load %Nat16, %Nat16* %9
  %11 = add %Nat16 %10, 1
  store %Nat16 %11, %Nat16* %8

;stmt5:
  %12 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %4, i32 0, i32 2
  %13 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %4, i32 0, i32 2
  %14 = load %Nat32, %Nat32* %13
  %15 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 3
  %16 = load %Nat32, %Nat32* %15
  %17 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %4, i32 0, i32 1
  %18 = load %Nat8, %Nat8* %17
  %19 = call %Nat32 (%Nat32, %Nat8) @alignment (%Nat32 %16, %Nat8 %18)
  %20 = add %Nat32 %14, %19
  store %Nat32 %20, %Nat32* %12
  ret void
}

define %Type* @type_record_new (%List* %fields) {

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 5)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 9
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %2, i32 0, i32 1
  %4 = call %Nat32 () @get_uid ()
  store %Nat32 %4, %Nat32* %3

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 9
  %6 = getelementptr inbounds %TypeRecord, %TypeRecord* %5, i32 0, i32 0
  store %List* %fields, %List** %6

;stmt3:
  %fhc = alloca %FieldHandleContext

;stmt4:
  %7 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 2
  store %Nat32 0, %Nat32* %7

;stmt5:
  %8 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 0
  store %Nat16 0, %Nat16* %8

;stmt6:
  %9 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 1
  %10 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 4
  %11 = load %Nat8, %Nat8* %10
  store %Nat8 %11, %Nat8* %9

;stmt7:
  %12 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 9
  %13 = getelementptr inbounds %TypeRecord, %TypeRecord* %12, i32 0, i32 0
  %14 = load %List*, %List** %13
  %15 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0
  %16 = bitcast %FieldHandleContext* %15 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %14, %ListForeachHandler @fpost, %Unit* %16)

;stmt8:
  %17 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 3
  %18 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 2
  %19 = load %Nat32, %Nat32* %18
  store %Nat32 %19, %Nat32* %17

;stmt9:
  ret %Type* %1
}

define %Unit* @fsearch (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*

;stmt1:
  %2 = bitcast %Unit* %ctx to %Str

;stmt2:
  %3 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, %Str) @strcmp (%Str %4, %Str %2)
  %6 = icmp eq %Int32 %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = bitcast %Field* %1 to %Unit*
  ret %Unit* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = inttoptr i64 0 to %Unit*
  ret %Unit* %9
}

define %Field* @type_record_get_field (%Type* %t, %Str %field_id) {

;stmt0:
  %1 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 9
  %2 = getelementptr inbounds %TypeRecord, %TypeRecord* %1, i32 0, i32 0
  %3 = load %List*, %List** %2
  %4 = bitcast %Str %field_id to %Unit*
  %5 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %3, %ListSearchHandler @fsearch, %Unit* %4)
  %6 = bitcast %Unit* %5 to %Field*
  ret %Field* %6
}

define %Bool @check_fields (%Unit* %data1, %Unit* %data2, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data1 to %Field*

;stmt1:
  %2 = bitcast %Unit* %data2 to %Field*

;stmt2:
  %3 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = call %Int32 (%Str, %Str) @strcmp (%Str %4, %Str %6)
  %8 = icmp ne %Int32 %7, 0
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %10 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = call %Bool (%Type*, %Type*) @type_eq (%Type* %11, %Type* %13)
  ret %Bool %14
}

define %Bool @type_record_eq (%TypeRecord* %a, %TypeRecord* %b) {

;stmt0:
  %1 = getelementptr inbounds %TypeRecord, %TypeRecord* %a, i32 0, i32 0
  %2 = load %List*, %List** %1
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %b, i32 0, i32 0
  %4 = load %List*, %List** %3
  %5 = inttoptr i64 0 to %Unit*
  %6 = call %Bool (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %2, %List* %4, %ListCompareHandler @check_fields, %Unit* %5)
  ret %Bool %6
}

define void @foreach_struct_field (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*
  ret void
}

define void @typeRecordCheck (%TypeRecord* %r) {

;stmt0:
  %1 = getelementptr inbounds %TypeRecord, %TypeRecord* %r, i32 0, i32 0
  %2 = load %List*, %List** %1
  %3 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %2, %ListForeachHandler @foreach_struct_field, %Unit* %3)
  ret void
}

define void @create_constructor (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %EnumConstructor*

;stmt1:
  %2 = bitcast %Unit* %ctx to %Type*

;stmt2:
  %3 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %1, i32 0, i32 1
  %4 = load %Int64, %Int64* %3
  %5 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %1, i32 0, i32 2
  %6 = load %TokenInfo*, %TokenInfo** %5
  %7 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %2, %Int64 %4, %TokenInfo* %6)

;stmt3:
  %8 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %1, i32 0, i32 0
  %9 = load %Str, %Str* %8
  call void (%Str, %Value*) @bind_value (%Str %9, %Value* %7)
  ret void
}

define %Type* @type_enum_new (%List* %constructors) {

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 4)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 10
  %3 = getelementptr inbounds %TypeEnum, %TypeEnum* %2, i32 0, i32 1
  %4 = call %Nat32 () @get_uid ()
  store %Nat32 %4, %Nat32* %3

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 3
  %6 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 3
  %7 = load %Nat32, %Nat32* %6
  store %Nat32 %7, %Nat32* %5

;stmt3:
  %8 = bitcast %Type* %1 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %constructors, %ListForeachHandler @create_constructor, %Unit* %8)

;stmt4:
  ret %Type* %1
}

define %Bool @type_enum_eq (%TypeEnum* %a, %TypeEnum* %b) {

;stmt0:
  %1 = getelementptr inbounds %TypeEnum, %TypeEnum* %a, i32 0, i32 1
  %2 = load %Nat32, %Nat32* %1
  %3 = getelementptr inbounds %TypeEnum, %TypeEnum* %b, i32 0, i32 1
  %4 = load %Nat32, %Nat32* %3
  %5 = icmp eq %Nat32 %2, %4
  ret %Bool %5
}

define %Type* @type_array_new (%Type* %of, %Nat32 %volume, %Bool %undefined) {

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 7)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8
  %3 = getelementptr inbounds %TypeArray, %TypeArray* %2, i32 0, i32 0
  store %Type* %of, %Type** %3

;stmt2:
  %4 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %4, i32 0, i32 1
  store %Nat32 %volume, %Nat32* %5

;stmt3:
  %6 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8
  %7 = getelementptr inbounds %TypeArray, %TypeArray* %6, i32 0, i32 2
  store %Bool %undefined, %Bool* %7

;stmt4:
  br i1 %undefined, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %8 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 3
  %9 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  %10 = load %Nat32, %Nat32* %9
  store %Nat32 %10, %Nat32* %8
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %11 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 3
  %12 = getelementptr inbounds %Type, %Type* %of, i32 0, i32 3
  %13 = load %Nat32, %Nat32* %12
  %14 = mul %Nat32 %volume, %13
  store %Nat32 %14, %Nat32* %11
  br label %endif_0
endif_0:

;stmt9:
  ret %Type* %1
}

define %Bool @type_array_eq (%TypeArray* %a, %TypeArray* %b) {

;stmt0:
  %1 = getelementptr inbounds %TypeArray, %TypeArray* %a, i32 0, i32 0
  %2 = load %Type*, %Type** %1
  %3 = getelementptr inbounds %TypeArray, %TypeArray* %b, i32 0, i32 0
  %4 = load %Type*, %Type** %3
  %5 = call %Bool (%Type*, %Type*) @type_eq (%Type* %2, %Type* %4)
  %6 = xor %Bool %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %8 = getelementptr inbounds %TypeArray, %TypeArray* %a, i32 0, i32 2
  %9 = load %Bool, %Bool* %8
  %10 = getelementptr inbounds %TypeArray, %TypeArray* %b, i32 0, i32 2
  %11 = load %Bool, %Bool* %10
  %12 = and %Bool %9, %11
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %14 = getelementptr inbounds %TypeArray, %TypeArray* %a, i32 0, i32 2
  %15 = load %Bool, %Bool* %14
  %16 = getelementptr inbounds %TypeArray, %TypeArray* %b, i32 0, i32 2
  %17 = load %Bool, %Bool* %16
  %18 = or %Bool %15, %17
  br i1 %18, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  ret %Bool 0
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt9:
  %20 = getelementptr inbounds %TypeArray, %TypeArray* %a, i32 0, i32 1
  %21 = load %Nat32, %Nat32* %20
  %22 = getelementptr inbounds %TypeArray, %TypeArray* %b, i32 0, i32 1
  %23 = load %Nat32, %Nat32* %22
  %24 = icmp eq %Nat32 %21, %23
  br i1 %24, label %then_3, label %else_3
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

define void @typeArrayCheck (%TypeArray* %a) {

;stmt0:
  %1 = getelementptr inbounds %TypeArray, %TypeArray* %a, i32 0, i32 0
  %2 = load %Type*, %Type** %1
  call void (%Type*) @typeCheck (%Type* %2)
  ret void
}

define %Type* @type_pointer_new (%Type* %to) {

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 6)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 7
  %3 = getelementptr inbounds %TypePointer, %TypePointer* %2, i32 0, i32 0
  store %Type* %to, %Type** %3

;stmt2:
  %4 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 3
  %5 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  %6 = load %Nat32, %Nat32* %5
  store %Nat32 %6, %Nat32* %4

;stmt3:
  ret %Type* %1
}

define %Bool @type_pointer_eq (%TypePointer* %a, %TypePointer* %b) {

;stmt0:
  %1 = getelementptr inbounds %TypePointer, %TypePointer* %a, i32 0, i32 0
  %2 = load %Type*, %Type** %1
  %3 = getelementptr inbounds %TypePointer, %TypePointer* %b, i32 0, i32 0
  %4 = load %Type*, %Type** %3
  %5 = call %Bool (%Type*, %Type*) @type_eq (%Type* %2, %Type* %4)
  ret %Bool %5
}

define void @typePointerCheck (%TypePointer* %p) {

;stmt0:
  %1 = getelementptr inbounds %TypePointer, %TypePointer* %p, i32 0, i32 0
  %2 = load %Type*, %Type** %1

;stmt1:
  %3 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = icmp eq %TypeKind %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Str, %Str* @_func105_str1
  %7 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 13
  %8 = load %TokenInfo*, %TokenInfo** %7
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %8)
  br label %endif_0
else_0:

;stmt4:

;stmt5:
  call void (%Type*) @typeCheck (%Type* %2)
  br label %endif_0
endif_0:
  ret void
}

define %Type* @type_func_new (%List* %params, %Type* %rettype, %Bool %arghack) {

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 3)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 3
  %3 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  %4 = load %Nat32, %Nat32* %3
  store %Nat32 %4, %Nat32* %2

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6
  %6 = getelementptr inbounds %TypeFunc, %TypeFunc* %5, i32 0, i32 0
  store %List* %params, %List** %6

;stmt3:
  %7 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %7, i32 0, i32 1
  store %Type* %rettype, %Type** %8

;stmt4:
  %9 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %9, i32 0, i32 2
  store %Bool %arghack, %Bool* %10

;stmt5:
  ret %Type* %1
}

define %Bool @check_param (%Unit* %data1, %Unit* %data2, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data1 to %Field*

;stmt1:
  %2 = bitcast %Unit* %data2 to %Field*

;stmt2:
  %3 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = bitcast %Str %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  %8 = load %Str, %Str* @_func108_str1
  call void (%Bool, %Str) @assert (%Bool %7, %Str %8)

;stmt3:
  %9 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %10 = load %Str, %Str* %9
  %11 = bitcast %Str %10 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  %14 = load %Str, %Str* @_func108_str2
  call void (%Bool, %Str) @assert (%Bool %13, %Str %14)

;stmt4:
  %15 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 0
  %16 = load %Str, %Str* %15
  %17 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %18 = load %Str, %Str* %17
  %19 = call %Int32 (%Str, %Str) @strcmp (%Str %16, %Str %18)
  %20 = icmp ne %Int32 %19, 0
  br i1 %20, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %22 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %25 = load %Type*, %Type** %24
  %26 = call %Bool (%Type*, %Type*) @type_eq (%Type* %23, %Type* %25)
  ret %Bool %26
}

define %Bool @type_function_eq (%TypeFunc* %a, %TypeFunc* %b) {

;stmt0:
  %1 = getelementptr inbounds %TypeFunc, %TypeFunc* %a, i32 0, i32 1
  %2 = load %Type*, %Type** %1
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %b, i32 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = call %Bool (%Type*, %Type*) @type_eq (%Type* %2, %Type* %4)
  %6 = xor %Bool %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %a, i32 0, i32 0
  %9 = load %List*, %List** %8
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %b, i32 0, i32 0
  %11 = load %List*, %List** %10
  %12 = inttoptr i64 0 to %Unit*
  %13 = call %Bool (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %9, %List* %11, %ListCompareHandler @check_param, %Unit* %12)
  ret %Bool %13
}

define void @foreach_func_param (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*

;stmt1:
  %2 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 1
  %3 = load %Type*, %Type** %2
  call void (%Type*) @typeCheck (%Type* %3)
  ret void
}

define void @typeFuncCheck (%TypeFunc* %f) {

;stmt0:
  %1 = getelementptr inbounds %TypeFunc, %TypeFunc* %f, i32 0, i32 1
  %2 = load %Type*, %Type** %1
  call void (%Type*) @typeCheck (%Type* %2)

;stmt1:
  %3 = getelementptr inbounds %TypeFunc, %TypeFunc* %f, i32 0, i32 0
  %4 = load %List*, %List** %3
  %5 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %4, %ListForeachHandler @foreach_func_param, %Unit* %5)
  ret void
}

define %Bool @type_eq (%Type* %a, %Type* %b) {

;stmt0:
  %1 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 0
  %2 = load %TypeKind, %TypeKind* %1
  %3 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = icmp ne %TypeKind %2, %4
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
  %7 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 1
  %8 = load %Str, %Str* %7
  %9 = bitcast %Str %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  %12 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 1
  %13 = load %Str, %Str* %12
  %14 = bitcast %Str %13 to %Unit*
  %15 = inttoptr i64 0 to %Unit*
  %16 = icmp ne %Unit* %14, %15
  %17 = and %Bool %11, %16
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %18 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 1
  %19 = load %Str, %Str* %18
  %20 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 1
  %21 = load %Str, %Str* %20
  %22 = call %Int32 (%Str, %Str) @strcmp (%Str %19, %Str %21)
  %23 = icmp eq %Int32 %22, 0
  br i1 %23, label %then_2, label %else_2
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
  %25 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 0
  %26 = load %TypeKind, %TypeKind* %25

;stmt9:
  %27 = icmp eq %TypeKind %26, 2
  br i1 %27, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %28 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 5
  %29 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 5
  %30 = call %Bool (%TypeBasic*, %TypeBasic*) @type_basic_eq (%TypeBasic* %28, %TypeBasic* %29)
  ret %Bool %30
  br label %endif_3
else_3:

;stmt12:
  %32 = icmp eq %TypeKind %26, 6
  br i1 %32, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %33 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 7
  %34 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 7
  %35 = call %Bool (%TypePointer*, %TypePointer*) @type_pointer_eq (%TypePointer* %33, %TypePointer* %34)
  ret %Bool %35
  br label %endif_4
else_4:

;stmt15:
  %37 = icmp eq %TypeKind %26, 7
  br i1 %37, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %38 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 8
  %39 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 8
  %40 = call %Bool (%TypeArray*, %TypeArray*) @type_array_eq (%TypeArray* %38, %TypeArray* %39)
  ret %Bool %40
  br label %endif_5
else_5:

;stmt18:
  %42 = icmp eq %TypeKind %26, 3
  br i1 %42, label %then_6, label %else_6
then_6:

;stmt19:

;stmt20:
  %43 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 6
  %44 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 6
  %45 = call %Bool (%TypeFunc*, %TypeFunc*) @type_function_eq (%TypeFunc* %43, %TypeFunc* %44)
  ret %Bool %45
  br label %endif_6
else_6:

;stmt21:
  %47 = icmp eq %TypeKind %26, 5
  br i1 %47, label %then_7, label %else_7
then_7:

;stmt22:

;stmt23:
  %48 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 9
  %49 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 9
  %50 = call %Bool (%TypeRecord*, %TypeRecord*) @type_record_eq (%TypeRecord* %48, %TypeRecord* %49)
  ret %Bool %50
  br label %endif_7
else_7:

;stmt24:
  %52 = icmp eq %TypeKind %26, 4
  br i1 %52, label %then_8, label %else_8
then_8:

;stmt25:

;stmt26:
  %53 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 10
  %54 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 10
  %55 = call %Bool (%TypeEnum*, %TypeEnum*) @type_enum_eq (%TypeEnum* %53, %TypeEnum* %54)
  ret %Bool %55
  br label %endif_8
else_8:

;stmt27:
  %57 = icmp eq %TypeKind %26, 1
  br i1 %57, label %then_9, label %else_9
then_9:

;stmt28:

;stmt29:
  %58 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 0
  %59 = load %TypeKind, %TypeKind* %58
  %60 = icmp eq %TypeKind %59, 1
  ret %Bool %60
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
  %62 = load %Str, %Str* @_func111_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %62)

;stmt31:
  ret %Bool 0
}

define void @type_init () {

;stmt0:
  %1 = load %Str, %Str* @_func112_str1
  %2 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %1, %Nat32 1, %Nat32 0, %Bool 0, %Bool 0)
  store %Type* %2, %Type** @typeUnit

;stmt1:
  %3 = load %Str, %Str* @_func112_str2
  %4 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %3, %Nat32 1, %Nat32 1, %Bool 0, %Bool 0)
  store %Type* %4, %Type** @typeBool

;stmt2:
  %5 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %6 = load %Str, %Str* @_func112_str3
  %7 = load %Type*, %Type** @typeUnit
  %8 = bitcast %Type* %7 to %Unit*
  %9 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %5, %Str %6, %Unit* %8)

;stmt3:
  %10 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %11 = load %Str, %Str* @_func112_str4
  %12 = load %Type*, %Type** @typeBool
  %13 = bitcast %Type* %12 to %Unit*
  %14 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %10, %Str %11, %Unit* %13)

;stmt4:
  %15 = load %Str, %Str* @_func112_str5
  %16 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %15, %Nat32 1, %Nat32 8, %Bool 1, %Bool 1)

;stmt5:
  %17 = load %Str, %Str* @_func112_str6
  %18 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %17, %Nat32 2, %Nat32 16, %Bool 1, %Bool 1)

;stmt6:
  %19 = load %Str, %Str* @_func112_str7
  %20 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %19, %Nat32 4, %Nat32 32, %Bool 1, %Bool 1)

;stmt7:
  %21 = load %Str, %Str* @_func112_str8
  %22 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %21, %Nat32 8, %Nat32 64, %Bool 1, %Bool 1)

;stmt8:
  %23 = load %Str, %Str* @_func112_str9
  %24 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %23, %Nat32 16, %Nat32 128, %Bool 1, %Bool 1)

;stmt9:
  %25 = load %Str, %Str* @_func112_str10
  %26 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %25, %Nat32 32, %Nat32 256, %Bool 1, %Bool 1)

;stmt10:
  %27 = load %Str, %Str* @_func112_str11
  %28 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %27, %Nat32 64, %Nat32 512, %Bool 1, %Bool 1)

;stmt11:
  %29 = load %Str, %Str* @_func112_str12
  %30 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %29, %Nat32 128, %Nat32 1024, %Bool 1, %Bool 1)

;stmt12:
  %31 = load %Str, %Str* @_func112_str13
  %32 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %31, %Nat32 1, %Nat32 8, %Bool 1, %Bool 0)

;stmt13:
  %33 = load %Str, %Str* @_func112_str14
  %34 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %33, %Nat32 2, %Nat32 16, %Bool 1, %Bool 0)

;stmt14:
  %35 = load %Str, %Str* @_func112_str15
  %36 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %35, %Nat32 4, %Nat32 32, %Bool 1, %Bool 0)

;stmt15:
  %37 = load %Str, %Str* @_func112_str16
  %38 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %37, %Nat32 8, %Nat32 64, %Bool 1, %Bool 0)

;stmt16:
  %39 = load %Str, %Str* @_func112_str17
  %40 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %39, %Nat32 16, %Nat32 128, %Bool 1, %Bool 0)

;stmt17:
  %41 = load %Str, %Str* @_func112_str18
  %42 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %41, %Nat32 32, %Nat32 256, %Bool 1, %Bool 0)

;stmt18:
  %43 = load %Str, %Str* @_func112_str19
  %44 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %43, %Nat32 64, %Nat32 512, %Bool 1, %Bool 0)

;stmt19:
  %45 = load %Str, %Str* @_func112_str20
  %46 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %45, %Nat32 128, %Nat32 1024, %Bool 1, %Bool 0)

;stmt20:
  %47 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %48 = load %Str, %Str* @_func112_str21
  %49 = bitcast %Type* %22 to %Unit*
  %50 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %47, %Str %48, %Unit* %49)

;stmt21:
  %51 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %52 = load %Str, %Str* @_func112_str22
  %53 = bitcast %Type* %38 to %Unit*
  %54 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %51, %Str %52, %Unit* %53)

;stmt22:
  %55 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %56 = load %Str, %Str* @_func112_str23
  %57 = bitcast %Type* %20 to %Unit*
  %58 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %55, %Str %56, %Unit* %57)

;stmt23:
  %59 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %60 = load %Str, %Str* @_func112_str24
  %61 = bitcast %Type* %36 to %Unit*
  %62 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %59, %Str %60, %Unit* %61)

;stmt24:
  %63 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %64 = load %Str, %Str* @_func112_str25
  %65 = bitcast %Type* %16 to %Unit*
  %66 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %63, %Str %64, %Unit* %65)

;stmt25:
  %67 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %68 = load %Str, %Str* @_func112_str26
  %69 = bitcast %Type* %32 to %Unit*
  %70 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %67, %Str %68, %Unit* %69)

;stmt26:
  %71 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %72 = load %Str, %Str* @_func112_str27
  %73 = bitcast %Type* %18 to %Unit*
  %74 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %71, %Str %72, %Unit* %73)

;stmt27:
  %75 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %76 = load %Str, %Str* @_func112_str28
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
  %83 = load %Str, %Str* @_func112_str29
  store %Str %83, %Str* %82

;stmt31:
  %84 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %85 = load %Str, %Str* @_func112_str30
  %86 = load %Type*, %Type** @typeStr
  %87 = bitcast %Type* %86 to %Unit*
  %88 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %84, %Str %85, %Unit* %87)

;stmt32:
  %89 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %90 = load %Str, %Str* @_func112_str31
  %91 = bitcast %Type* %24 to %Unit*
  %92 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %89, %Str %90, %Unit* %91)

;stmt33:
  %93 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %94 = load %Str, %Str* @_func112_str32
  %95 = bitcast %Type* %26 to %Unit*
  %96 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %93, %Str %94, %Unit* %95)

;stmt34:
  %97 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %98 = load %Str, %Str* @_func112_str33
  %99 = bitcast %Type* %28 to %Unit*
  %100 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %97, %Str %98, %Unit* %99)

;stmt35:
  %101 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %102 = load %Str, %Str* @_func112_str34
  %103 = bitcast %Type* %30 to %Unit*
  %104 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %101, %Str %102, %Unit* %103)

;stmt36:
  %105 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %106 = load %Str, %Str* @_func112_str35
  %107 = bitcast %Type* %40 to %Unit*
  %108 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %105, %Str %106, %Unit* %107)

;stmt37:
  %109 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %110 = load %Str, %Str* @_func112_str36
  %111 = bitcast %Type* %42 to %Unit*
  %112 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %109, %Str %110, %Unit* %111)

;stmt38:
  %113 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %114 = load %Str, %Str* @_func112_str37
  %115 = bitcast %Type* %44 to %Unit*
  %116 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %113, %Str %114, %Unit* %115)

;stmt39:
  %117 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %118 = load %Str, %Str* @_func112_str38
  %119 = bitcast %Type* %46 to %Unit*
  %120 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %117, %Str %118, %Unit* %119)

;stmt40:
  %121 = load %Type*, %Type** @typeUnit
  %122 = call %Type* (%Type*) @type_pointer_new (%Type* %121)
  store %Type* %122, %Type** @typeFreePtr

;stmt41:
  store %Type* %20, %Type** @typeBaseInt

;stmt42:
  store %Type* %36, %Type** @typeBaseNat

;stmt43:
  store %Type* %36, %Type** @typeSizeof

;stmt44:
  store %Type* %18, %Type** @typeAlignof

;stmt45:
  store %Type* %18, %Type** @typeEnum
  ret void
}

define %Type* @type_new (%TypeKind %k) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 184)
  %2 = bitcast %Unit* %1 to %Type*

;stmt1:
  %3 = bitcast %Type* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @_func113_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Type* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 184)

;stmt3:
  %9 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 0
  store %TypeKind %k, %TypeKind* %9

;stmt4:
  %10 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 4
  %11 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 1
  %12 = load %Nat32, %Nat32* %11
  %13 = trunc %Nat32 %12 to %Nat8
  store %Nat8 %13, %Nat8* %10

;stmt5:
  ret %Type* %2
}

define %Bool @typeIsReference (%Type* %t) {

;stmt0:
  %1 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 0
  %2 = load %TypeKind, %TypeKind* %1

;stmt1:
  %3 = icmp eq %TypeKind %2, 6
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Bool 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %5 = icmp eq %TypeKind %2, 7
  br i1 %5, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %6 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 8
  %7 = getelementptr inbounds %TypeArray, %TypeArray* %6, i32 0, i32 2
  %8 = load %Bool, %Bool* %7
  ret %Bool %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  ret %Bool 0
}

define %Bool @type_is_basic_integer (%Type* %t) {

;stmt0:
  %1 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 0
  %2 = load %TypeKind, %TypeKind* %1
  %3 = icmp eq %TypeKind %2, 2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 5
  %5 = getelementptr inbounds %TypeBasic, %TypeBasic* %4, i32 0, i32 2
  %6 = load %Bool, %Bool* %5
  ret %Bool %6
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

define %Nat32 @alignment (%Nat32 %req_sz, %Nat8 %align) {

;stmt0:
  %sz = alloca %Nat32

;stmt1:
  store %Nat32 %req_sz, %Nat32* %sz

;stmt2:
  br label %continue_0
continue_0:
  %1 = load %Nat32, %Nat32* %sz
  %2 = zext %Nat8 %align to %Nat32
  %3 = urem %Nat32 %1, %2
  %4 = icmp ne %Nat32 %3, 0
  br i1 %4, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %5 = load %Nat32, %Nat32* %sz
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* %sz
  br label %continue_0
break_0:

;stmt5:
  %7 = load %Nat32, %Nat32* %sz
  ret %Nat32 %7
}

define void @add_type (%List* %index, %Str %id, %Type* %t) {

;stmt0:
  %1 = call %Type* (%Str) @get_type (%Str %id)

;stmt1:
  %2 = bitcast %Type* %1 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  %7 = icmp ne %TypeKind %6, 0
  br i1 %7, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %8 = load %Str, %Str* @_func118_str1
  %9 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 13
  %10 = load %TokenInfo*, %TokenInfo** %9
  call void (%Str, %TokenInfo*) @error (%Str %8, %TokenInfo* %10)

;stmt6:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  %12 = bitcast %Type* %1 to %Unit*
  %13 = bitcast %Type* %t to %Unit*
  %14 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %12, %Unit* %13, %Nat32 184)

;stmt8:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  %16 = bitcast %Type* %t to %Unit*
  %17 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %index, %Str %id, %Unit* %16)
  ret void
}

define %Type* @get_type (%Str %id) {

;stmt0:
  %1 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %2 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %id)

;stmt1:
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = bitcast %Unit* %2 to %Type*
  ret %Type* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %b = alloca %Block*

;stmt5:
  %7 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %8 = load %Block*, %Block** %7
  store %Block* %8, %Block** %b

;stmt6:
  br label %continue_0
continue_0:
  %9 = load %Block*, %Block** %b
  %10 = bitcast %Block* %9 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  br i1 %12, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %13 = load %Block*, %Block** %b
  %14 = getelementptr inbounds %Block, %Block* %13, i32 0, i32 2
  %15 = call %Unit* (%List*, %Str) @map_get (%List* %14, %Str %id)
  %16 = bitcast %Unit* %15 to %Type*

;stmt9:
  %17 = bitcast %Type* %16 to %Unit*
  %18 = inttoptr i64 0 to %Unit*
  %19 = icmp ne %Unit* %17, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  ret %Type* %16
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %21 = load %Block*, %Block** %b
  %22 = getelementptr inbounds %Block, %Block* %21, i32 0, i32 0
  %23 = load %Block*, %Block** %22
  store %Block* %23, %Block** %b
  br label %continue_0
break_0:

;stmt13:
  %24 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1
  %25 = call %Unit* (%List*, %Str) @map_get (%List* %24, %Str %id)
  %26 = bitcast %Unit* %25 to %Type*
  ret %Type* %26
}

define void @bind_value (%Str %id, %Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %2 = load %Block*, %Block** %1
  %3 = bitcast %Block* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %7 = load %Block*, %Block** %6
  call void (%Block*, %Str, %Value*) @bind_value_in_block (%Block* %7, %Str %id, %Value* %v)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  call void (%Str, %Value*) @bind_value_global (%Str %id, %Value* %v)
  br label %endif_0
endif_0:
  ret void
}

define void @bind_value_in_block (%Block* %b, %Str %id, %Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Block, %Block* %b, i32 0, i32 3
  call void (%List*, %Str, %Value*) @add_value (%List* %1, %Str %id, %Value* %v)
  ret void
}

define void @bind_value_local (%Str %id, %Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %2 = load %Block*, %Block** %1
  %3 = getelementptr inbounds %Block, %Block* %2, i32 0, i32 3
  call void (%List*, %Str, %Value*) @add_value (%List* %3, %Str %id, %Value* %v)
  ret void
}

define void @bind_value_global (%Str %id, %Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2
  call void (%List*, %Str, %Value*) @add_value (%List* %1, %Str %id, %Value* %v)
  ret void
}

define void @add_value (%List* %index, %Str %id, %Value* %v) {

;stmt0:
  %1 = call %Unit* (%List*, %Str) @map_get (%List* %index, %Str %id)
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = icmp ne %ValueKind %7, 1
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %9 = load %Str, %Str* @_func124_str1
  %10 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %11 = load %TokenInfo*, %TokenInfo** %10
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %11)

;stmt6:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  %13 = bitcast %Value* %2 to %Unit*
  %14 = bitcast %Value* %v to %Unit*
  %15 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %13, %Unit* %14, %Nat32 168)

;stmt8:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  %17 = bitcast %Value* %v to %Unit*
  %18 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %index, %Str %id, %Unit* %17)
  ret void
}

define %Value* @get_value (%Str %id) {

;stmt0:
  %1 = call %Value* (%Str) @get_value_local (%Str %id)

;stmt1:
  %2 = bitcast %Value* %1 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Value* %1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %6 = call %Value* (%Str) @get_value_global (%Str %id)

;stmt5:
  %7 = bitcast %Value* %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  ret %Value* %6
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt8:
  %11 = call %Value* (%Str) @get_value_builtin (%Str %id)
  ret %Value* %11
}

define %Value* @get_value_local (%Str %id) {

;stmt0:
  %b = alloca %Block*

;stmt1:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %2 = load %Block*, %Block** %1
  store %Block* %2, %Block** %b

;stmt2:
  br label %continue_0
continue_0:
  %3 = load %Block*, %Block** %b
  %4 = bitcast %Block* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %7 = load %Block*, %Block** %b
  %8 = getelementptr inbounds %Block, %Block* %7, i32 0, i32 3
  %9 = call %Unit* (%List*, %Str) @map_get (%List* %8, %Str %id)
  %10 = bitcast %Unit* %9 to %Value*

;stmt5:
  %11 = bitcast %Value* %10 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  ret %Value* %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %15 = load %Block*, %Block** %b
  %16 = getelementptr inbounds %Block, %Block* %15, i32 0, i32 0
  %17 = load %Block*, %Block** %16
  store %Block* %17, %Block** %b

;stmt9:
  %18 = load %Block*, %Block** %b
  %19 = bitcast %Block* %18 to %Unit*
  %20 = inttoptr i64 0 to %Unit*
  %21 = icmp eq %Unit* %19, %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %22 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %23 = load %Value*, %Value** %22
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 1
  %25 = load %Type*, %Type** %24
  %26 = getelementptr inbounds %Type, %Type* %25, i32 0, i32 6
  %27 = getelementptr inbounds %TypeFunc, %TypeFunc* %26, i32 0, i32 0
  %28 = load %List*, %List** %27
  %29 = call %Value* (%List*, %Str) @get_value_from_params (%List* %28, %Str %id)
  ret %Value* %29
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt12:
  %31 = inttoptr i64 0 to %Value*
  ret %Value* %31
}

define %Value* @get_value_global (%Str %id) {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2
  %2 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %id)
  %3 = bitcast %Unit* %2 to %Value*
  ret %Value* %3
}

define %Value* @get_value_builtin (%Str %id) {

;stmt0:
  %1 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  %2 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %id)

;stmt1:
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = load %Str, %Str* @_func128_str1
  %6 = call %Int32 (%Str, %Str) @strcmp (%Str %id, %Str %5)
  %7 = icmp eq %Int32 %6, 0
  br i1 %7, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %8 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %9 = load %Value*, %Value** %8
  ret %Value* %9
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %11 = bitcast %Unit* %2 to %Value*
  ret %Value* %11
}

define %Unit* @psearch (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*

;stmt1:
  %2 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 0
  %3 = load %Str, %Str* %2
  %4 = bitcast %Unit* %ctx to %Str
  %5 = call %Int32 (%Str, %Str) @strcmp (%Str %3, %Str %4)
  %6 = icmp eq %Int32 %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  ret %Unit* %data
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = inttoptr i64 0 to %Unit*
  ret %Unit* %8
}

define %Value* @get_value_from_params (%List* %params, %Str %id) {

;stmt0:
  %1 = bitcast %Str %id to %Unit*
  %2 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %params, %ListSearchHandler @psearch, %Unit* %1)
  %3 = bitcast %Unit* %2 to %Field*

;stmt1:
  %4 = bitcast %Field* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = inttoptr i64 0 to %Value*
  ret %Value* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %9 = getelementptr inbounds %Field, %Field* %3, i32 0, i32 3
  %10 = load %TokenInfo*, %TokenInfo** %9
  %11 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 4, %TokenInfo* %10)

;stmt5:
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 1
  %13 = getelementptr inbounds %Field, %Field* %3, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  store %Type* %14, %Type** %12

;stmt6:
  %15 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 4
  %16 = getelementptr inbounds %Field, %Field* %3, i32 0, i32 0
  %17 = load %Str, %Str* %16
  store %Str %17, %Str* %15

;stmt7:
  ret %Value* %11
}

define void @declare (%Str %id, %Type* %type, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %Str %id to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = bitcast %Type* %type to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = or %Bool %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = call %Value* (%Str) @get_value_global (%Str %id)

;stmt4:
  %10 = bitcast %Value* %9 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %13 = load %Str, %Str* @_func131_str1
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %ti)

;stmt7:
  %14 = load %Str, %Str* @_func131_str2
  %15 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 13
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @rem (%Str %14, %TokenInfo* %16)

;stmt8:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %18 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 1, %TokenInfo* %ti)

;stmt10:
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 1
  store %Type* %type, %Type** %19

;stmt11:
  %20 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 4
  store %Str %id, %Str* %20

;stmt12:
  %21 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 1
  store %Type* %type, %Type** %21

;stmt13:
  %22 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 13
  store %TokenInfo* %ti, %TokenInfo** %22

;stmt14:
  %23 = getelementptr inbounds %Type, %Type* %type, i32 0, i32 0
  %24 = load %TypeKind, %TypeKind* %23
  %25 = icmp eq %TypeKind %24, 3
  br i1 %25, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  %26 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 0
  store %ValueKind 3, %ValueKind* %26

;stmt17:
  %27 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 12
  %28 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %29 = inttoptr i64 0 to %Block*
  %30 = call %AssemblyItem* (%Assembly*, %Str, %Type*, %Block*) @asmFuncAdd (%Assembly* %28, %Str %id, %Type* %type, %Block* %29)
  store %AssemblyItem* %30, %AssemblyItem** %27
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt18:
  call void (%Str, %Value*) @bind_value_global (%Str %id, %Value* %18)
  ret void
}

define void @def_global (%Str %id, %Value* %v, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %Str %id to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp ne %Unit* %1, %2
  %4 = load %Str, %Str* @_func132_str1
  call void (%Bool, %Str) @assert (%Bool %3, %Str %4)

;stmt1:
  %5 = bitcast %Value* %v to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  %8 = load %Str, %Str* @_func132_str2
  call void (%Bool, %Str) @assert (%Bool %7, %Str %8)

;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 14
  store %TokenInfo* %ti, %TokenInfo** %9

;stmt3:
  %10 = call %Value* (%Str) @get_value_global (%Str %id)

;stmt4:
  %11 = bitcast %Value* %10 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %14 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 0
  %15 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %16 = load %ValueKind, %ValueKind* %15
  store %ValueKind %16, %ValueKind* %14

;stmt7:
  %17 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %18 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %19 = load %Type*, %Type** %18
  store %Type* %19, %Type** %17

;stmt8:
  %20 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 4
  %21 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 4
  %22 = load %Str, %Str* %21
  store %Str %22, %Str* %20

;stmt9:
  %23 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 12
  %24 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 12
  %25 = load %AssemblyItem*, %AssemblyItem** %24
  store %AssemblyItem* %25, %AssemblyItem** %23

;stmt10:
  call void (%Value*, %Str) @rename (%Value* %10, %Str %id)

;stmt11:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt12:
  call void (%Value*, %Str) @rename (%Value* %v, %Str %id)

;stmt13:
  call void (%Str, %Value*) @bind_value_global (%Str %id, %Value* %v)
  ret void
}

define void @rename (%Value* %v, %Str %id) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 4
  %2 = load %Str, %Str* %1

;stmt1:
  %3 = bitcast %Str %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 4
  store %Str %id, %Str* %6

;stmt4:
  %7 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  call void (%Assembly*, %Str, %Str) @asmRename (%Assembly* %7, %Str %2, %Str %id)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Str @get_suid (%Str %prefix, %Nat32 %uid) {

;stmt0:
  %1 = call %Nat32 (%Str) @strlen (%Str %prefix)
  %2 = add %Nat32 %1, 8
  %3 = add %Nat32 %2, 1
  %4 = call %Unit* (%Nat32) @malloc (%Nat32 %3)
  %5 = bitcast %Unit* %4 to %Str

;stmt1:
  %6 = bitcast %Str %5 to %Unit*
  %7 = load %Str, %Str* @_func134_str1
  %8 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %6, %Str %7, %Str %prefix, %Nat32 %uid)

;stmt2:
  ret %Str %5
}

define %Str @get_prefix () {

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %2 = load %Value*, %Value** %1
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %7 = load %Value*, %Value** %6
  %8 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 4
  %9 = load %Str, %Str* %8
  %10 = call %Str (%Str) @dup (%Str %9)
  ret %Str %10
  br label %endif_0
else_0:

;stmt3:
  br label %endif_0
endif_0:

;stmt4:
  %12 = load %Str, %Str* @_func135_str1
  ret %Str %12
}

define %Str @get_name (%Str %res, %Nat32* %uid) {

;stmt0:
  %1 = call %Str () @get_prefix ()

;stmt1:
  %_uid2 = alloca %Nat32*

;stmt2:
  store %Nat32* %uid, %Nat32** %_uid2

;stmt3:
  %id = alloca %Str

;stmt4:
  %2 = load %Nat32*, %Nat32** %_uid2
  %3 = load %Nat32*, %Nat32** %_uid2
  %4 = load %Nat32, %Nat32* %3
  %5 = add %Nat32 %4, 1
  store %Nat32 %5, %Nat32* %2

;stmt5:
  %6 = load %Nat32*, %Nat32** %_uid2
  %7 = load %Nat32, %Nat32* %6
  %8 = call %Str (%Str, %Nat32) @get_suid (%Str %res, %Nat32 %7)
  store %Str %8, %Str* %id

;stmt6:
  %9 = load %Str, %Str* @_func136_str1
  %10 = load %Str, %Str* %id
  %11 = call %Str (%Str, %Str, %Str) @cat3 (%Str %1, %Str %9, %Str %10)
  ret %Str %11
}

define %Str @get_name_func () {

;stmt0:
  %1 = load %Str, %Str* @_func137_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @func_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_str () {

;stmt0:
  %uid = alloca %Nat32*

;stmt1:
  %1 = getelementptr inbounds %Nat32, %Nat32* @str_uid, i32 0
  store %Nat32* %1, %Nat32** %uid

;stmt2:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %7 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 4
  store %Nat32* %7, %Nat32** %uid
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = load %Str, %Str* @_func138_str1
  %9 = load %Nat32*, %Nat32** %uid
  %10 = call %Str (%Str, %Nat32*) @get_name (%Str %8, %Nat32* %9)
  ret %Str %10
}

define %Str @get_name_arr () {

;stmt0:
  %1 = load %Str, %Str* @_func139_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @arr_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_var () {

;stmt0:
  %1 = load %Str, %Str* @_func140_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @var_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_type () {

;stmt0:
  %1 = load %Str, %Str* @_func141_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @type_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
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
  %9 = load %Str, %Str* @_func143_str1
  %10 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 15
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
  %v = alloca %Value*

;stmt1:
  %1 = call %Value* () @hier2 ()
  store %Value* %1, %Value** %v

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr i64 0 to %Value*
  ret %Value* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt6:
  %10 = load %Str, %Str* @_func144_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %12 = load %Value*, %Value** %v

;stmt10:
  %13 = call %Value* () @hier1 ()

;stmt11:
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 17, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %15 = load %Value*, %Value** %v
  ret %Value* %15
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr i64 0 to %Value*
  ret %Value* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt6:
  %10 = load %Str, %Str* @_func145_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %12 = load %Value*, %Value** %v

;stmt10:
  %13 = call %Value* () @hier2 ()

;stmt11:
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 18, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %15 = load %Value*, %Value** %v
  ret %Value* %15
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr i64 0 to %Value*
  ret %Value* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt6:
  %10 = load %Str, %Str* @_func146_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %12 = load %Value*, %Value** %v

;stmt10:
  %13 = call %Value* () @hier3 ()

;stmt11:
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 19, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %15 = load %Value*, %Value** %v
  ret %Value* %15
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr i64 0 to %Value*
  ret %Value* %6
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
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt8:
  %10 = load %Str, %Str* @_func147_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %12 = load %Value*, %Value** %v

;stmt12:
  %13 = call %Value* () @hier4 ()

;stmt13:
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 20, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %15 = load %Str, %Str* @_func147_str2
  %16 = call %Bool (%Str) @match (%Str %15)
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %17 = load %Value*, %Value** %v

;stmt18:
  %18 = call %Value* () @hier4 ()

;stmt19:
  %19 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 21, %Value* %17, %Value* %18, %TokenInfo* %9)
  store %Value* %19, %Value** %v
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
  %21 = load %Value*, %Value** %v
  ret %Value* %21
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr i64 0 to %Value*
  ret %Value* %6
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
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt8:
  %10 = load %Str, %Str* @_func148_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %12 = load %Value*, %Value** %v

;stmt12:
  %13 = call %Value* () @hier6 ()

;stmt13:
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 22, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %15 = load %Str, %Str* @_func148_str2
  %16 = call %Bool (%Str) @match (%Str %15)
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %17 = load %Value*, %Value** %v

;stmt18:
  %18 = call %Value* () @hier6 ()

;stmt19:
  %19 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 23, %Value* %17, %Value* %18, %TokenInfo* %9)
  store %Value* %19, %Value** %v
  br label %endif_2
else_2:

;stmt20:
  %20 = load %Str, %Str* @_func148_str3
  %21 = call %Bool (%Str) @match (%Str %20)
  br i1 %21, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  call void () @skip_nl ()

;stmt23:
  %22 = load %Value*, %Value** %v

;stmt24:
  %23 = call %Value* () @hier6 ()

;stmt25:
  %24 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 24, %Value* %22, %Value* %23, %TokenInfo* %9)
  store %Value* %24, %Value** %v
  br label %endif_3
else_3:

;stmt26:
  %25 = load %Str, %Str* @_func148_str4
  %26 = call %Bool (%Str) @match (%Str %25)
  br i1 %26, label %then_4, label %else_4
then_4:

;stmt27:

;stmt28:
  call void () @skip_nl ()

;stmt29:
  %27 = load %Value*, %Value** %v

;stmt30:
  %28 = call %Value* () @hier6 ()

;stmt31:
  %29 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 25, %Value* %27, %Value* %28, %TokenInfo* %9)
  store %Value* %29, %Value** %v
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
  %31 = load %Value*, %Value** %v
  ret %Value* %31
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr i64 0 to %Value*
  ret %Value* %6
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
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt8:
  %10 = load %Str, %Str* @_func149_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %12 = load %Value*, %Value** %v

;stmt12:
  %13 = call %Value* () @hier7 ()

;stmt13:
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @shift (%ValueKind 26, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %15 = load %Str, %Str* @_func149_str2
  %16 = call %Bool (%Str) @match (%Str %15)
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %17 = load %Value*, %Value** %v

;stmt18:
  %18 = call %Value* () @hier7 ()

;stmt19:
  %19 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @shift (%ValueKind 27, %Value* %17, %Value* %18, %TokenInfo* %9)
  store %Value* %19, %Value** %v
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
  %21 = load %Value*, %Value** %v
  ret %Value* %21
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr i64 0 to %Value*
  ret %Value* %6
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
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt8:
  %10 = load %Str, %Str* @_func150_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %12 = load %Value*, %Value** %v

;stmt12:
  %13 = call %Value* () @hier8 ()

;stmt13:
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 12, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %15 = load %Str, %Str* @_func150_str2
  %16 = call %Bool (%Str) @match (%Str %15)
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %17 = load %Value*, %Value** %v

;stmt18:
  %18 = call %Value* () @hier8 ()

;stmt19:
  %19 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 13, %Value* %17, %Value* %18, %TokenInfo* %9)
  store %Value* %19, %Value** %v
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
  %21 = load %Value*, %Value** %v
  ret %Value* %21
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr i64 0 to %Value*
  ret %Value* %6
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
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt8:
  %10 = load %Str, %Str* @_func151_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  call void () @skip_nl ()

;stmt11:
  %12 = load %Value*, %Value** %v

;stmt12:
  %13 = call %Value* () @hier9 ()

;stmt13:
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 14, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %15 = load %Str, %Str* @_func151_str2
  %16 = call %Bool (%Str) @match (%Str %15)
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  call void () @skip_nl ()

;stmt17:
  %17 = load %Value*, %Value** %v

;stmt18:
  %18 = call %Value* () @hier9 ()

;stmt19:
  %19 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 15, %Value* %17, %Value* %18, %TokenInfo* %9)
  store %Value* %19, %Value** %v
  br label %endif_2
else_2:

;stmt20:
  %20 = load %Str, %Str* @_func151_str3
  %21 = call %Bool (%Str) @match (%Str %20)
  br i1 %21, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  call void () @skip_nl ()

;stmt23:
  %22 = load %Value*, %Value** %v

;stmt24:
  %23 = call %Value* () @hier9 ()

;stmt25:
  %24 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 16, %Value* %22, %Value* %23, %TokenInfo* %9)
  store %Value* %24, %Value** %v
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
  %26 = load %Value*, %Value** %v
  ret %Value* %26
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr i64 0 to %Value*
  ret %Value* %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt6:
  %10 = load %Str, %Str* @_func152_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %12 = call %Type* () @parse_type ()

;stmt9:
  %13 = load %Value*, %Value** %v
  %14 = call %Value* (%Value*, %Type*, %TokenInfo*) @cast (%Value* %13, %Type* %12, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %15 = load %Value*, %Value** %v
  ret %Value* %15
}

define %Value* @hier10 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt2:
  %3 = load %Str, %Str* @_func153_str1
  %4 = call %Bool (%Str) @match (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %5 = call %Value* () @hier10 ()

;stmt5:
  %6 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 9, %Value* %5, %TokenInfo* %2)
  store %Value* %6, %Value** %v
  br label %endif_0
else_0:

;stmt6:
  %7 = load %Str, %Str* @_func153_str2
  %8 = call %Bool (%Str) @match (%Str %7)
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %9 = call %Value* () @hier11 ()

;stmt9:
  %10 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 8, %Value* %9, %TokenInfo* %2)
  store %Value* %10, %Value** %v
  br label %endif_1
else_1:

;stmt10:
  %11 = load %Str, %Str* @_func153_str3
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %13 = call %Value* () @hier10 ()

;stmt13:
  %14 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 10, %Value* %13, %TokenInfo* %2)
  store %Value* %14, %Value** %v
  br label %endif_2
else_2:

;stmt14:
  %15 = load %Str, %Str* @_func153_str4
  %16 = call %Bool (%Str) @match (%Str %15)
  br i1 %16, label %then_3, label %else_3
then_3:

;stmt15:

;stmt16:
  %17 = call %Value* () @hier10 ()

;stmt17:
  %18 = call %Value* (%ValueKind, %Value*, %TokenInfo*) @un (%ValueKind 11, %Value* %17, %TokenInfo* %2)
  store %Value* %18, %Value** %v
  br label %endif_3
else_3:

;stmt18:
  %19 = load %Str, %Str* @_func153_str5
  %20 = call %Bool (%Str) @match (%Str %19)
  br i1 %20, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %21 = call %Token* () @ctok ()
  %22 = getelementptr inbounds %Token, %Token* %21, i32 0, i32 1

;stmt21:
  %23 = call %Type* () @parse_type ()

;stmt22:
  %24 = bitcast %Type* %23 to %Unit*
  %25 = inttoptr i64 0 to %Unit*
  %26 = icmp eq %Unit* %24, %25
  br i1 %26, label %then_5, label %else_5
then_5:

;stmt23:

;stmt24:
  %27 = load %Str, %Str* @_func153_str6
  call void (%Str, %TokenInfo*) @error (%Str %27, %TokenInfo* %22)

;stmt25:
  %28 = inttoptr i64 0 to %Value*
  ret %Value* %28
  br label %endif_5
else_5:
  br label %endif_5
endif_5:

;stmt26:
  %30 = call %Value* (%Type*, %TokenInfo*) @size_of (%Type* %23, %TokenInfo* %2)
  store %Value* %30, %Value** %v
  br label %endif_4
else_4:

;stmt27:
  %31 = load %Str, %Str* @_func153_str7
  %32 = call %Bool (%Str) @match (%Str %31)
  br i1 %32, label %then_6, label %else_6
then_6:

;stmt28:

;stmt29:
  %33 = call %Token* () @ctok ()
  %34 = getelementptr inbounds %Token, %Token* %33, i32 0, i32 1

;stmt30:
  %35 = call %Type* () @parse_type ()

;stmt31:
  %36 = bitcast %Type* %35 to %Unit*
  %37 = inttoptr i64 0 to %Unit*
  %38 = icmp eq %Unit* %36, %37
  br i1 %38, label %then_7, label %else_7
then_7:

;stmt32:

;stmt33:
  %39 = load %Str, %Str* @_func153_str8
  call void (%Str, %TokenInfo*) @error (%Str %39, %TokenInfo* %34)

;stmt34:
  %40 = inttoptr i64 0 to %Value*
  ret %Value* %40
  br label %endif_7
else_7:
  br label %endif_7
endif_7:

;stmt35:
  %42 = call %Value* (%Type*, %TokenInfo*) @align_of (%Type* %35, %TokenInfo* %2)
  store %Value* %42, %Value** %v
  br label %endif_6
else_6:

;stmt36:

;stmt37:
  %43 = call %Value* () @hier11 ()
  store %Value* %43, %Value** %v
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
  %44 = load %Value*, %Value** %v
  ret %Value* %44
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = inttoptr i64 0 to %Value*
  ret %Value* %6
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
  %8 = call %Token* () @ctok ()
  %9 = getelementptr inbounds %Token, %Token* %8, i32 0, i32 1

;stmt8:
  %10 = load %Str, %Str* @_func154_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %12 = call %List* () @map_new ()

;stmt11:
  br label %continue_1
continue_1:
  %13 = load %Str, %Str* @_func154_str2
  %14 = call %Bool (%Str) @match (%Str %13)
  %15 = xor %Bool %14, 1
  br i1 %15, label %body_1, label %break_1
body_1:

;stmt12:

;stmt13:
  %16 = call %Value* () @expr ()

;stmt14:
  %17 = bitcast %Value* %16 to %Unit*
  %18 = inttoptr i64 0 to %Unit*
  %19 = icmp eq %Unit* %17, %18
  br i1 %19, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  %20 = load %Str, %Str* @_func154_str3
  call void (%Str) @skipto (%Str %20)

;stmt17:
  %21 = load %Str, %Str* @_func154_str4
  %22 = call %Bool (%Str) @match (%Str %21)
  br i1 %22, label %then_3, label %else_3
then_3:

;stmt18:

;stmt19:
  br label %continue_1
  br label %endif_3
else_3:

;stmt20:
  %24 = load %Str, %Str* @_func154_str5
  %25 = call %Bool (%Str) @match (%Str %24)
  br i1 %25, label %then_4, label %else_4
then_4:

;stmt21:

;stmt22:
  br label %break_1
  br label %endif_4
else_4:

;stmt23:

;stmt24:
  %27 = inttoptr i64 0 to %Value*
  ret %Value* %27
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt25:
  %29 = bitcast %Value* %16 to %Unit*
  %30 = call %Bool (%List*, %Unit*) @list_append (%List* %12, %Unit* %29)

;stmt26:
  %31 = load %Str, %Str* @_func154_str6
  %32 = call %Bool (%Str) @match (%Str %31)
  %33 = xor %Bool %32, 1
  br i1 %33, label %then_5, label %else_5
then_5:

;stmt27:

;stmt28:
  %34 = load %Str, %Str* @_func154_str7
  %35 = call %Bool (%Str) @need (%Str %34)
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
  %37 = load %Value*, %Value** %v
  %38 = call %Value* (%Value*, %List*, %TokenInfo*) @call (%Value* %37, %List* %12, %TokenInfo* %9)
  store %Value* %38, %Value** %v
  br label %endif_1
else_1:

;stmt32:
  %39 = load %Str, %Str* @_func154_str8
  %40 = call %Bool (%Str) @match (%Str %39)
  br i1 %40, label %then_6, label %else_6
then_6:

;stmt33:

;stmt34:
  %41 = call %Value* () @expr ()

;stmt35:
  %42 = load %Str, %Str* @_func154_str9
  %43 = call %Bool (%Str) @match (%Str %42)

;stmt36:
  %44 = load %Value*, %Value** %v
  %45 = call %Value* (%Value*, %Value*, %TokenInfo*) @indx (%Value* %44, %Value* %41, %TokenInfo* %9)
  store %Value* %45, %Value** %v
  br label %endif_6
else_6:

;stmt37:
  %46 = load %Str, %Str* @_func154_str10
  %47 = call %Bool (%Str) @match (%Str %46)
  br i1 %47, label %then_7, label %else_7
then_7:

;stmt38:

;stmt39:
  %48 = call %Str () @parseId ()

;stmt40:
  %49 = load %Value*, %Value** %v
  %50 = call %Value* (%Value*, %Str, %TokenInfo*) @access (%Value* %49, %Str %48, %TokenInfo* %9)
  store %Value* %50, %Value** %v
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
  %52 = load %Value*, %Value** %v
  ret %Value* %52
}

define %Value* @hier12 () {

;stmt0:
  %v = alloca %Value*

;stmt1:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt2:
  %3 = load %Str, %Str* @_func155_str1
  %4 = call %Bool (%Str) @match (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %5 = call %Value* () @expr ()
  store %Value* %5, %Value** %v

;stmt5:
  %6 = load %Str, %Str* @_func155_str2
  %7 = call %Bool (%Str) @need (%Str %6)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %8 = call %Value* () @term ()
  store %Value* %8, %Value** %v
  br label %endif_0
endif_0:

;stmt8:
  %9 = load %Value*, %Value** %v
  ret %Value* %9
}

define %Value* @term () {

;stmt0:
  %1 = call %Token* () @ctok ()

;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %3 = load %TokenType, %TokenType* %2

;stmt2:
  %v = alloca %Value*

;stmt3:
  %4 = inttoptr i64 0 to %Value*
  store %Value* %4, %Value** %v

;stmt4:
  %5 = icmp eq %TokenType %3, 1
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %6 = load %Str, %Str* @_func156_str1
  %7 = call %Bool (%Str) @match (%Str %6)
  br i1 %7, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %8 = call %Value* () @term_func ()
  store %Value* %8, %Value** %v
  br label %endif_1
else_1:

;stmt9:
  %9 = load %Str, %Str* @_func156_str2
  %10 = call %Bool (%Str) @match (%Str %9)
  br i1 %10, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %11 = call %Value* () @term_arr ()
  store %Value* %11, %Value** %v
  br label %endif_2
else_2:

;stmt12:

;stmt13:
  %12 = call %Value* () @term_id ()
  store %Value* %12, %Value** %v
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:

;stmt14:
  %13 = icmp eq %TokenType %3, 2
  br i1 %13, label %then_3, label %else_3
then_3:

;stmt15:

;stmt16:
  %14 = call %Value* () @term_num ()
  store %Value* %14, %Value** %v
  br label %endif_3
else_3:

;stmt17:
  %15 = icmp eq %TokenType %3, 4
  br i1 %15, label %then_4, label %else_4
then_4:

;stmt18:

;stmt19:
  %16 = call %Value* () @term_str ()
  store %Value* %16, %Value** %v
  br label %endif_4
else_4:

;stmt20:
  %17 = icmp eq %TokenType %3, 5
  br i1 %17, label %then_5, label %else_5
then_5:

;stmt21:

;stmt22:
  %18 = call %Value* () @term_hash ()
  store %Value* %18, %Value** %v
  br label %endif_5
else_5:

;stmt23:

;stmt24:
  %19 = load %Str, %Str* @_func156_str3
  %20 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %19, %TokenInfo* %20)

;stmt25:
  %21 = load %Str, %Str* @_func156_str4
  %22 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %23 = load %TokenType, %TokenType* %22
  %24 = call %Int32 (%Str, ...) @printf (%Str %21, %TokenType %23)

;stmt26:
  %25 = load %Str, %Str* @_func156_str5
  %26 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2
  %27 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %26, i32 0, %Int32 0
  %28 = call %Int32 (%Str, ...) @printf (%Str %25, %Nat8* %27)
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_0
endif_0:

;stmt27:
  %29 = load %Value*, %Value** %v
  %30 = bitcast %Value* %29 to %Unit*
  %31 = inttoptr i64 0 to %Unit*
  %32 = icmp ne %Unit* %30, %31
  br i1 %32, label %then_6, label %else_6
then_6:

;stmt28:

;stmt29:
  %33 = load %Value*, %Value** %v
  %34 = getelementptr inbounds %Value, %Value* %33, i32 0, i32 15
  %35 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1
  store %TokenInfo* %35, %TokenInfo** %34
  br label %endif_6
else_6:
  br label %endif_6
endif_6:

;stmt30:
  %36 = load %Value*, %Value** %v
  ret %Value* %36
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
  %10 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 6, %TokenInfo* %2)

;stmt7:
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 12
  %12 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %13 = call %AssemblyItem* (%Assembly*, %Str, %Str, %Nat32) @asmStringAdd (%Assembly* %12, %Str %9, %Str %8, %Nat32 %7)
  store %AssemblyItem* %13, %AssemblyItem** %11

;stmt8:
  %14 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %15 = load %Type*, %Type** @typeStr
  store %Type* %15, %Type** %14

;stmt9:
  %16 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 4
  store %Str %9, %Str* %16

;stmt10:
  ret %Value* %10
}

define %Value* @term_arr () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Type* () @parse_type ()

;stmt2:
  %4 = load %Str, %Str* @_func158_str1
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
  %7 = load %Str, %Str* @_func158_str2
  %8 = call %Bool (%Str) @match (%Str %7)
  %9 = xor %Bool %8, 1
  br i1 %9, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %10 = call %Value* () @cexpr ()

;stmt9:
  %11 = bitcast %Value* %10 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp eq %Unit* %11, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt10:

;stmt11:
  %14 = load %Str, %Str* @_func158_str3
  %15 = call %Bool (%Str) @match (%Str %14)

;stmt12:
  br label %continue_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt13:
  %17 = load %Type*, %Type** @typeBaseInt
  %18 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %10, %Type* %17)

;stmt14:
  %19 = load %Nat32, %Nat32* %len
  %20 = add %Nat32 %19, 1
  store %Nat32 %20, %Nat32* %len

;stmt15:
  %21 = bitcast %Value* %18 to %Unit*
  %22 = call %Bool (%List*, %Unit*) @list_append (%List* %6, %Unit* %21)

;stmt16:
  %23 = load %Str, %Str* @_func158_str4
  %24 = call %Bool (%Str) @match (%Str %23)
  br label %continue_0
break_0:

;stmt17:
  %25 = call %Str () @get_name_arr ()

;stmt18:
  %26 = load %Nat32, %Nat32* %len
  %27 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %3, %Nat32 %26, %Bool 0)

;stmt19:
  %28 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 3, %TokenInfo* %2)

;stmt20:
  %29 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 12
  %30 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %31 = call %AssemblyItem* (%Assembly*, %Str, %Type*, %List*) @asmArrayAdd (%Assembly* %30, %Str %25, %Type* %27, %List* %6)
  store %AssemblyItem* %31, %AssemblyItem** %29

;stmt21:
  %32 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 1
  store %Type* %27, %Type** %32

;stmt22:
  %33 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 4
  store %Str %25, %Str* %33

;stmt23:
  %34 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 14
  store %TokenInfo* %2, %TokenInfo** %34

;stmt24:
  ret %Value* %28
}

define %Value* @term_func () {

;stmt0:
  %1 = load %FuncContext, %FuncContext* @fctx

;stmt1:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %3 = load %Block*, %Block** %2

;stmt2:
  %4 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %5 = inttoptr i64 0 to %Value*
  store %Value* %5, %Value** %4

;stmt3:
  %6 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %7 = inttoptr i64 0 to %Block*
  store %Block* %7, %Block** %6

;stmt4:
  %8 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  store %Nat32 0, %Nat32* %8

;stmt5:
  %9 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 3
  store %Nat32 0, %Nat32* %9

;stmt6:
  %10 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 4
  store %Nat32 0, %Nat32* %10

;stmt7:
  %11 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 5
  store %Nat32 0, %Nat32* %11

;stmt8:
  %12 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 6
  store %Nat32 0, %Nat32* %12

;stmt9:
  %13 = call %Token* () @ctok ()
  %14 = getelementptr inbounds %Token, %Token* %13, i32 0, i32 1

;stmt10:
  %15 = call %Str () @get_name_func ()

;stmt11:
  %16 = bitcast %Str %15 to %Unit*
  %17 = inttoptr i64 0 to %Unit*
  %18 = icmp eq %Unit* %16, %17
  br i1 %18, label %then_0, label %else_0
then_0:

;stmt12:

;stmt13:
  %19 = load %Str, %Str* @_func159_str1
  %20 = call %Int32 (%Str, ...) @printf (%Str %19)

;stmt14:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt15:
  %22 = call %Type* () @parse_type ()

;stmt16:
  %23 = bitcast %Type* %22 to %Unit*
  %24 = inttoptr i64 0 to %Unit*
  %25 = icmp eq %Unit* %23, %24
  br i1 %25, label %then_1, label %else_1
then_1:

;stmt17:

;stmt18:
  %26 = load %Str, %Str* @_func159_str2
  %27 = call %Int32 (%Str, ...) @printf (%Str %26)

;stmt19:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt20:
  %29 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 3, %TokenInfo* %14)

;stmt21:
  %30 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 1
  store %Type* %22, %Type** %30

;stmt22:
  %31 = bitcast %Block* %3 to %Unit*
  %32 = inttoptr i64 0 to %Unit*
  %33 = icmp ne %Unit* %31, %32
  br i1 %33, label %then_2, label %else_2
then_2:

;stmt23:

;stmt24:
  %34 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 4
  %35 = load %List*, %List** %34
  %36 = bitcast %Value* %29 to %Unit*
  %37 = call %Bool (%List*, %Unit*) @list_append (%List* %35, %Unit* %36)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt25:
  %38 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  store %Value* %29, %Value** %38

;stmt26:
  %39 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 4
  store %Str %15, %Str* %39

;stmt27:
  %40 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 14
  store %TokenInfo* %14, %TokenInfo** %40

;stmt28:
  %41 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  store %Value* %29, %Value** %41

;stmt29:
  %42 = load %Str, %Str* @_func159_str3
  %43 = call %Bool (%Str) @need (%Str %42)

;stmt30:
  %44 = call %Block* () @doblock ()

;stmt31:
  %45 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 12
  %46 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %47 = call %AssemblyItem* (%Assembly*, %Str, %Type*, %Block*) @asmFuncAdd (%Assembly* %46, %Str %15, %Type* %22, %Block* %44)
  store %AssemblyItem* %47, %AssemblyItem** %45

;stmt32:
  store %FuncContext %1, %FuncContext* @fctx

;stmt33:
  ret %Value* %29

;stmt34:
  br label %fail
fail:

;stmt35:
  store %FuncContext %1, %FuncContext* @fctx

;stmt36:
  %49 = inttoptr i64 0 to %Value*
  ret %Value* %49
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
  %14 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 4
  store %Str %3, %Str* %14

;stmt10:
  %15 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 13
  store %TokenInfo* %2, %TokenInfo** %15

;stmt11:
  call void (%Str, %Value*) @bind_value_global (%Str %3, %Value* %13)

;stmt12:
  ret %Value* %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt13:
  %17 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 4
  store %Str %3, %Str* %17

;stmt14:
  ret %Value* %9

;stmt15:
  br label %fail
fail:

;stmt16:
  %19 = inttoptr i64 0 to %Value*
  ret %Value* %19
}

define %Value* @term_num () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %d = alloca %Int64

;stmt2:
  %3 = call %Token* () @ctok ()

;stmt3:
  %4 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2
  %5 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %4, i32 0, %Int32 0
  %6 = load %Nat8, %Nat8* %5
  %7 = load %Str, %Str* @_func161_str1
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp eq %Nat8 %6, %9
  %11 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2
  %12 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %11, i32 0, %Int32 1
  %13 = load %Nat8, %Nat8* %12
  %14 = load %Str, %Str* @_func161_str2
  %15 = getelementptr inbounds %Nat8, %Str %14, %Int32 0
  %16 = load %Nat8, %Nat8* %15
  %17 = icmp eq %Nat8 %13, %16
  %18 = and %Bool %10, %17
  br i1 %18, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %19 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2
  %20 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %19, i32 0, %Int32 2
  %21 = bitcast %Nat8* %20 to %Unit*
  %22 = load %Str, %Str* @_func161_str3
  %23 = getelementptr inbounds %Int64, %Int64* %d, i32 0
  %24 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %21, %Str %22, %Int64* %23)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %25 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2
  %26 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %25, i32 0, %Int32 0
  %27 = bitcast %Nat8* %26 to %Unit*
  %28 = load %Str, %Str* @_func161_str4
  %29 = getelementptr inbounds %Int64, %Int64* %d, i32 0
  %30 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %27, %Str %28, %Int64* %29)
  br label %endif_0
endif_0:

;stmt8:
  call void () @skip ()

;stmt9:
  %31 = call %Type* (%TypeKind) @type_new (%TypeKind 1)

;stmt10:
  %32 = getelementptr inbounds %Type, %Type* %31, i32 0, i32 11
  store %TokenInfo* %2, %TokenInfo** %32

;stmt11:
  %33 = load %Int64, %Int64* %d
  %34 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %31, %Int64 %33, %TokenInfo* %2)

;stmt12:
  %35 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 14
  store %TokenInfo* %2, %TokenInfo** %35

;stmt13:
  ret %Value* %34
}

define %Value* @term_hash () {

;stmt0:
  %1 = inttoptr i64 0 to %Value*
  ret %Value* %1
}

define void @stmtLetCheck (%Stmt* %s) {

;stmt0:
  %1 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %2 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %1, i32 0, %Int32 0
  %3 = load %Value*, %Value** %2

;stmt1:
  %4 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %5 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %4, i32 0, %Int32 1
  %6 = load %Value*, %Value** %5

;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 4
  %8 = load %Str, %Str* %7

;stmt3:
  %9 = call %Type* (%Value*) @checkValue (%Value* %3)

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  store %Type* %9, %Type** %10
  ret void
}

define %Stmt* @stmtBlock (%TokenInfo* %ti) {

;stmt0:
  %1 = call %Block* () @doblock ()

;stmt1:
  %2 = bitcast %Block* %1 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 2, %TokenInfo* %ti)

;stmt5:
  %8 = getelementptr inbounds %Stmt, %Stmt* %7, i32 0, i32 2
  store %Block* %1, %Block** %8

;stmt6:
  ret %Stmt* %7
}

define %Block* @doblock () {

;stmt0:
  %1 = call %List* () @map_new ()

;stmt1:
  %2 = call %Unit* (%Nat32) @malloc (%Nat32 72)
  %3 = bitcast %Unit* %2 to %Block*

;stmt2:
  %4 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 1
  %5 = call %List* () @map_new ()
  store %List* %5, %List** %4

;stmt3:
  %6 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 4
  %7 = call %List* () @map_new ()
  store %List* %7, %List** %6

;stmt4:
  %8 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 2
  call void (%List*) @map_init (%List* %8)

;stmt5:
  %9 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 3
  call void (%List*) @map_init (%List* %9)

;stmt6:
  %10 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 0
  %11 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %12 = load %Block*, %Block** %11
  store %Block* %12, %Block** %10

;stmt7:
  %13 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  store %Block* %3, %Block** %13

;stmt8:
  br label %continue_0
continue_0:
  %14 = load %Str, %Str* @_func165_str1
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
  %18 = load %Str, %Str* @_func165_str2
  call void (%Str) @fatal (%Str %18)

;stmt14:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt15:
  %20 = load %Str, %Str* @_func165_str3
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
  %23 = call %Stmt* () @stmtParse ()

;stmt19:
  %24 = bitcast %Stmt* %23 to %Unit*
  %25 = inttoptr i64 0 to %Unit*
  %26 = icmp ne %Unit* %24, %25
  br i1 %26, label %then_2, label %else_2
then_2:

;stmt20:

;stmt21:
  %27 = call %Bool () @sep ()

;stmt22:
  call void (%Stmt*) @stmtAdd (%Stmt* %23)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  br label %continue_0
break_0:

;stmt23:
  %28 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %29 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 0
  %30 = load %Block*, %Block** %29
  store %Block* %30, %Block** %28

;stmt24:
  ret %Block* %3
}

define void @chkf (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Value*

;stmt1:
  call void (%Value*) @checkFunc (%Value* %1)
  ret void
}

define void @chkb (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Stmt*

;stmt1:
  call void (%Stmt*) @stmtCheck (%Stmt* %1)
  ret void
}

define void @stmtBlockCheck (%Block* %b) {

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %2 = load %Block*, %Block** %1

;stmt1:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  store %Block* %b, %Block** %3

;stmt2:
  %4 = getelementptr inbounds %Block, %Block* %b, i32 0, i32 4
  %5 = load %List*, %List** %4
  %6 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %5, %ListForeachHandler @chkf, %Unit* %6)

;stmt3:
  %7 = getelementptr inbounds %Block, %Block* %b, i32 0, i32 1
  %8 = load %List*, %List** %7
  %9 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %8, %ListForeachHandler @chkb, %Unit* %9)

;stmt4:
  %10 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  store %Block* %2, %Block** %10
  ret void
}

define %Stmt* @stmtExpr () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Value* () @expr ()

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
  %10 = load %Str, %Str* @_func169_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  %12 = xor %Bool %11, 1
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %13 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 3, %TokenInfo* %2)

;stmt9:
  %14 = getelementptr inbounds %Stmt, %Stmt* %13, i32 0, i32 1
  %15 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %14, i32 0, %Int32 0
  store %Value* %3, %Value** %15

;stmt10:
  %16 = getelementptr inbounds %Stmt, %Stmt* %13, i32 0, i32 7
  %17 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 15
  %18 = load %TokenInfo*, %TokenInfo** %17
  store %TokenInfo* %18, %TokenInfo** %16

;stmt11:
  ret %Stmt* %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %20 = call %Value* () @expr ()

;stmt13:
  %21 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @assign (%Value* %3, %Value* %20, %TokenInfo* %9)
  ret %Stmt* %21

;stmt14:
  br label %fail_with_restore
fail_with_restore:

;stmt15:
  %23 = load %Str, %Str* @_func169_str2
  %24 = call %Int32 (%Str, ...) @printf (%Str %23)

;stmt16:
  %25 = load %Str, %Str* @_func169_str3
  %26 = call %Token* () @ctok ()
  %27 = getelementptr inbounds %Token, %Token* %26, i32 0, i32 2
  %28 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %27, i32 0, %Int32 0
  %29 = call %Int32 (%Str, ...) @printf (%Str %25, %Nat8* %28)

;stmt17:
  %30 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %30

;stmt18:
  br label %fail
fail:

;stmt19:
  %32 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %32
}

define %Stmt* @assign (%Value* %l, %Value* %r, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %Value* %l to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = bitcast %Value* %r to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = or %Bool %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %8 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %10 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @stmt_new_assign (%Value* %l, %Value* %r, %TokenInfo* %ti)
  ret %Stmt* %10
}

define void @stmtAssignCheck (%Stmt* %s) {

;stmt0:
  %1 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %2 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %1, i32 0, %Int32 0
  %3 = load %Value*, %Value** %2

;stmt1:
  %4 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %5 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %4, i32 0, %Int32 1
  %6 = load %Value*, %Value** %5

;stmt2:
  %7 = call %Type* (%Value*) @checkValue (%Value* %3)

;stmt3:
  %8 = call %Type* (%Value*) @checkValue (%Value* %6)

;stmt4:
  %9 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = call %Value* (%Value*, %Type*) @nat (%Value* %6, %Type* %10)

;stmt5:
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = call %Bool (%Type*, %Type*) @type_eq (%Type* %7, %Type* %13)
  %15 = xor %Bool %14, 1
  br i1 %15, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %16 = load %Str, %Str* @_func171_str1
  %17 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 7
  %18 = load %TokenInfo*, %TokenInfo** %17
  call void (%Str, %TokenInfo*) @error (%Str %16, %TokenInfo* %18)

;stmt8:
  %19 = load %Str, %Str* @_func171_str2
  %20 = call %Int32 (%Str, ...) @printf (%Str %19)

;stmt9:
  call void (%Type*) @prttype (%Type* %7)

;stmt10:
  %21 = load %Str, %Str* @_func171_str3
  %22 = call %Int32 (%Str, ...) @printf (%Str %21)

;stmt11:
  %23 = load %Str, %Str* @_func171_str4
  %24 = call %Int32 (%Str, ...) @printf (%Str %23)

;stmt12:
  %25 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 1
  %26 = load %Type*, %Type** %25
  call void (%Type*) @prttype (%Type* %26)

;stmt13:
  %27 = load %Str, %Str* @_func171_str5
  %28 = call %Int32 (%Str, ...) @printf (%Str %27)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt14:
  %29 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %30 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %29, i32 0, %Int32 1
  store %Value* %11, %Value** %30
  ret void
}

define %Stmt* @stmtIf (%TokenInfo* %ti) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %If*

;stmt1:
  %3 = getelementptr inbounds %If, %If* %2, i32 0, i32 0
  %4 = call %Value* () @expr ()
  store %Value* %4, %Value** %3

;stmt2:
  %5 = load %Str, %Str* @_func172_str1
  %6 = call %Bool (%Str) @match (%Str %5)

;stmt3:
  %7 = call %Token* () @ctok ()
  %8 = getelementptr inbounds %Token, %Token* %7, i32 0, i32 1

;stmt4:
  %9 = load %Str, %Str* @_func172_str2
  %10 = call %Bool (%Str) @need (%Str %9)

;stmt5:
  %11 = getelementptr inbounds %If, %If* %2, i32 0, i32 1
  %12 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %8)
  store %Stmt* %12, %Stmt** %11

;stmt6:
  %13 = load %Str, %Str* @_func172_str3
  %14 = call %Bool (%Str) @match (%Str %13)
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %15 = load %Str, %Str* @_func172_str4
  %16 = call %Bool (%Str) @match (%Str %15)

;stmt9:
  %17 = call %Token* () @ctok ()
  %18 = getelementptr inbounds %Token, %Token* %17, i32 0, i32 1

;stmt10:
  %19 = load %Str, %Str* @_func172_str5
  %20 = call %Bool (%Str) @match (%Str %19)
  br i1 %20, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %21 = getelementptr inbounds %If, %If* %2, i32 0, i32 2
  %22 = call %Stmt* (%TokenInfo*) @stmtIf (%TokenInfo* %18)
  store %Stmt* %22, %Stmt** %21
  br label %endif_1
else_1:

;stmt13:

;stmt14:
  %23 = load %Str, %Str* @_func172_str6
  %24 = call %Bool (%Str) @need (%Str %23)

;stmt15:
  %25 = getelementptr inbounds %If, %If* %2, i32 0, i32 2
  %26 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %18)
  store %Stmt* %26, %Stmt** %25
  br label %endif_1
endif_1:
  br label %endif_0
else_0:

;stmt16:

;stmt17:
  %27 = getelementptr inbounds %If, %If* %2, i32 0, i32 2
  %28 = inttoptr i64 0 to %Stmt*
  store %Stmt* %28, %Stmt** %27
  br label %endif_0
endif_0:

;stmt18:
  %29 = getelementptr inbounds %If, %If* %2, i32 0, i32 0
  %30 = load %Value*, %Value** %29
  %31 = bitcast %Value* %30 to %Unit*
  %32 = inttoptr i64 0 to %Unit*
  %33 = icmp eq %Unit* %31, %32
  %34 = getelementptr inbounds %If, %If* %2, i32 0, i32 1
  %35 = load %Stmt*, %Stmt** %34
  %36 = bitcast %Stmt* %35 to %Unit*
  %37 = inttoptr i64 0 to %Unit*
  %38 = icmp eq %Unit* %36, %37
  %39 = or %Bool %33, %38
  br i1 %39, label %then_2, label %else_2
then_2:

;stmt19:

;stmt20:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt21:
  %41 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 5, %TokenInfo* %ti)

;stmt22:
  %42 = getelementptr inbounds %Stmt, %Stmt* %41, i32 0, i32 5
  store %If* %2, %If** %42

;stmt23:
  %43 = getelementptr inbounds %Stmt, %Stmt* %41, i32 0, i32 7
  store %TokenInfo* %ti, %TokenInfo** %43

;stmt24:
  ret %Stmt* %41

;stmt25:
  br label %fail
fail:

;stmt26:
  %45 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %45
}

define void @stmtIfCheck (%Stmt* %s) {

;stmt0:
  %1 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 5
  %2 = load %If*, %If** %1

;stmt1:
  %3 = getelementptr inbounds %If, %If* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt2:
  %6 = bitcast %Type* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %9 = load %Type*, %Type** @typeBool
  %10 = call %Bool (%Type*, %Type*) @type_eq (%Type* %5, %Type* %9)
  %11 = xor %Bool %10, 1
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %12 = load %Str, %Str* @_func173_str1
  %13 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 13
  %14 = load %TokenInfo*, %TokenInfo** %13
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %14)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %15 = getelementptr inbounds %If, %If* %2, i32 0, i32 1
  %16 = load %Stmt*, %Stmt** %15
  call void (%Stmt*) @stmtCheck (%Stmt* %16)

;stmt8:
  %17 = getelementptr inbounds %If, %If* %2, i32 0, i32 2
  %18 = load %Stmt*, %Stmt** %17
  call void (%Stmt*) @stmtCheck (%Stmt* %18)
  ret void
}

define %Stmt* @stmtWhile (%TokenInfo* %ti) {

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %3 = load %Nat32, %Nat32* %2
  %4 = add %Nat32 %3, 1
  store %Nat32 %4, %Nat32* %1

;stmt1:
  %5 = call %Unit* (%Nat32) @malloc (%Nat32 16)
  %6 = bitcast %Unit* %5 to %While*

;stmt2:
  %7 = getelementptr inbounds %While, %While* %6, i32 0, i32 0
  %8 = call %Value* () @expr ()
  store %Value* %8, %Value** %7

;stmt3:
  %9 = load %Str, %Str* @_func174_str1
  %10 = call %Bool (%Str) @match (%Str %9)

;stmt4:
  %11 = call %Token* () @ctok ()
  %12 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1

;stmt5:
  %13 = load %Str, %Str* @_func174_str2
  %14 = call %Bool (%Str) @need (%Str %13)

;stmt6:
  %15 = getelementptr inbounds %While, %While* %6, i32 0, i32 1
  %16 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %12)
  store %Stmt* %16, %Stmt** %15

;stmt7:
  %17 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %18 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %19 = load %Nat32, %Nat32* %18
  %20 = sub %Nat32 %19, 1
  store %Nat32 %20, %Nat32* %17

;stmt8:
  %21 = getelementptr inbounds %While, %While* %6, i32 0, i32 0
  %22 = load %Value*, %Value** %21
  %23 = bitcast %Value* %22 to %Unit*
  %24 = inttoptr i64 0 to %Unit*
  %25 = icmp eq %Unit* %23, %24
  %26 = getelementptr inbounds %While, %While* %6, i32 0, i32 1
  %27 = load %Stmt*, %Stmt** %26
  %28 = bitcast %Stmt* %27 to %Unit*
  %29 = inttoptr i64 0 to %Unit*
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
  %33 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 6, %TokenInfo* %ti)

;stmt12:
  %34 = getelementptr inbounds %Stmt, %Stmt* %33, i32 0, i32 4
  store %While* %6, %While** %34

;stmt13:
  %35 = getelementptr inbounds %Stmt, %Stmt* %33, i32 0, i32 7
  store %TokenInfo* %ti, %TokenInfo** %35

;stmt14:
  ret %Stmt* %33

;stmt15:
  br label %fail
fail:

;stmt16:
  %37 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %38 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %39 = load %Nat32, %Nat32* %38
  %40 = sub %Nat32 %39, 1
  store %Nat32 %40, %Nat32* %37

;stmt17:
  %41 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %41
}

define void @stmtWhileCheck (%Stmt* %s) {

;stmt0:
  %1 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 4
  %2 = load %While*, %While** %1

;stmt1:
  %3 = getelementptr inbounds %While, %While* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt2:
  %6 = bitcast %Type* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %9 = load %Type*, %Type** @typeBool
  %10 = call %Bool (%Type*, %Type*) @type_eq (%Type* %5, %Type* %9)
  %11 = xor %Bool %10, 1
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %12 = load %Str, %Str* @_func175_str1
  %13 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 13
  %14 = load %TokenInfo*, %TokenInfo** %13
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %14)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %15 = getelementptr inbounds %While, %While* %2, i32 0, i32 1
  %16 = load %Stmt*, %Stmt** %15
  call void (%Stmt*) @stmtCheck (%Stmt* %16)
  ret void
}

define %Stmt* @stmtReturn (%TokenInfo* %ti) {

;stmt0:
  %1 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 7, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 7
  store %TokenInfo* %ti, %TokenInfo** %2

;stmt2:
  %3 = call %Bool () @separator ()
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  ret %Stmt* %1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %5 = call %Token* () @ctok ()
  %6 = getelementptr inbounds %Token, %Token* %5, i32 0, i32 1

;stmt6:
  %7 = call %Value* () @expr ()

;stmt7:
  %8 = bitcast %Value* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  br i1 %10, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %11 = load %Str, %Str* @_func176_str1
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %6)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %12 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1
  %13 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %12, i32 0, %Int32 0
  store %Value* %7, %Value** %13

;stmt11:
  ret %Stmt* %1

;stmt12:
  br label %fail
fail:

;stmt13:
  %15 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %15
}

define void @stmtReturnCheck (%Stmt* %s) {

;stmt0:
  %1 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %2 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %1, i32 0, %Int32 0
  %3 = load %Value*, %Value** %2

;stmt1:
  %4 = bitcast %Value* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = call %Type* (%Value*) @checkValue (%Value* %3)

;stmt4:
  %8 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %9 = load %Value*, %Value** %8
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i32 0, i32 6
  %13 = getelementptr inbounds %TypeFunc, %TypeFunc* %12, i32 0, i32 1
  %14 = load %Type*, %Type** %13

;stmt5:
  %15 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %16 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %15, i32 0, %Int32 0
  %17 = call %Value* (%Value*, %Type*) @nat (%Value* %3, %Type* %14)
  store %Value* %17, %Value** %16
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Stmt* @stmtBreak (%TokenInfo* %ti) {

;stmt0:
  %1 = call %Bool () @sep ()

;stmt1:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %3 = load %Nat32, %Nat32* %2
  %4 = icmp eq %Nat32 %3, 0
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = load %Str, %Str* @_func178_str1
  %6 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 8, %TokenInfo* %ti)
  ret %Stmt* %7
}

define %Stmt* @stmtContinue (%TokenInfo* %ti) {

;stmt0:
  %1 = call %Bool () @sep ()

;stmt1:
  %2 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %3 = load %Nat32, %Nat32* %2
  %4 = icmp eq %Nat32 %3, 0
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %5 = load %Str, %Str* @_func179_str1
  %6 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 9, %TokenInfo* %ti)
  ret %Stmt* %7
}

define %Stmt* @stmtGoto (%TokenInfo* %ti) {

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
  %5 = load %Str, %Str* @_func180_str1
  %6 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)

;stmt4:
  %7 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %7
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 10, %TokenInfo* %ti)

;stmt6:
  %10 = getelementptr inbounds %Stmt, %Stmt* %9, i32 0, i32 6
  store %Str %1, %Str* %10

;stmt7:
  %11 = getelementptr inbounds %Stmt, %Stmt* %9, i32 0, i32 7
  store %TokenInfo* %ti, %TokenInfo** %11

;stmt8:
  ret %Stmt* %9
}

define void @stmtCheck (%Stmt* %s) {

;stmt0:
  %1 = bitcast %Stmt* %s to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %5 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 0
  %6 = load %StmtKind, %StmtKind* %5

;stmt4:
  %7 = icmp eq %StmtKind %6, 0
  br i1 %7, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  call void (%Stmt*) @stmtLetCheck (%Stmt* %s)
  br label %endif_1
else_1:

;stmt7:
  %8 = icmp eq %StmtKind %6, 3
  br i1 %8, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %9 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %10 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %9, i32 0, %Int32 0
  %11 = load %Value*, %Value** %10
  %12 = call %Type* (%Value*) @checkValue (%Value* %11)
  br label %endif_2
else_2:

;stmt10:
  %13 = icmp eq %StmtKind %6, 4
  br i1 %13, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  call void (%Stmt*) @stmtAssignCheck (%Stmt* %s)
  br label %endif_3
else_3:

;stmt13:
  %14 = icmp eq %StmtKind %6, 2
  br i1 %14, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  %15 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 2
  %16 = load %Block*, %Block** %15
  call void (%Block*) @stmtBlockCheck (%Block* %16)
  br label %endif_4
else_4:

;stmt16:
  %17 = icmp eq %StmtKind %6, 5
  br i1 %17, label %then_5, label %else_5
then_5:

;stmt17:

;stmt18:
  call void (%Stmt*) @stmtIfCheck (%Stmt* %s)
  br label %endif_5
else_5:

;stmt19:
  %18 = icmp eq %StmtKind %6, 6
  br i1 %18, label %then_6, label %else_6
then_6:

;stmt20:

;stmt21:
  call void (%Stmt*) @stmtWhileCheck (%Stmt* %s)
  br label %endif_6
else_6:

;stmt22:
  %19 = icmp eq %StmtKind %6, 7
  br i1 %19, label %then_7, label %else_7
then_7:

;stmt23:

;stmt24:
  call void (%Stmt*) @stmtReturnCheck (%Stmt* %s)
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

define void @stmtAdd (%Stmt* %s) {

;stmt0:
  %1 = bitcast %Stmt* %s to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp ne %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %5 = load %Block*, %Block** %4
  %6 = getelementptr inbounds %Block, %Block* %5, i32 0, i32 1
  %7 = load %List*, %List** %6
  %8 = bitcast %Stmt* %s to %Unit*
  %9 = call %Bool (%List*, %Unit*) @list_append (%List* %7, %Unit* %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Stmt* @stmtNew (%StmtKind %kind, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 72)
  %2 = bitcast %Unit* %1 to %Stmt*

;stmt1:
  %3 = bitcast %Stmt* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @_func183_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Stmt* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 72)

;stmt3:
  %9 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 0
  store %StmtKind %kind, %StmtKind* %9

;stmt4:
  %10 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 7
  store %TokenInfo* %ti, %TokenInfo** %10

;stmt5:
  ret %Stmt* %2
}

define %Stmt* @stmtLabelNew (%Str %lab, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 11, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 6
  store %Str %lab, %Str* %2

;stmt2:
  ret %Stmt* %1
}

define %Stmt* @stmtParse () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = load %Str, %Str* @_func185_str1
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
  %8 = load %Str, %Str* @_func185_str2
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
  %12 = load %Str, %Str* @_func185_str3
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
  %16 = load %Str, %Str* @_func185_str4
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
  %20 = load %Str, %Str* @_func185_str5
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
  %24 = load %Str, %Str* @_func185_str6
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
  %28 = load %Str, %Str* @_func185_str7
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
  %32 = load %Str, %Str* @_func185_str8
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
  %37 = load %Str, %Str* @_func185_str9
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
  %42 = load %Str, %Str* @_func185_str10
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
  %54 = load %Str, %Str* @_func185_str11
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

define %Stmt* @stmt_new_vardef (%Str %id, %Type* %t, %Value* %init_value, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %2 = bitcast %Unit* %1 to %VarDef*

;stmt1:
  %3 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 0
  store %Str %id, %Str* %3

;stmt2:
  %4 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 2
  store %Value* %init_value, %Value** %4

;stmt3:
  %5 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 1
  store %Type* %t, %Type** %5

;stmt4:
  %6 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 1, %TokenInfo* %ti)

;stmt5:
  %7 = getelementptr inbounds %Stmt, %Stmt* %6, i32 0, i32 3
  store %VarDef* %2, %VarDef** %7

;stmt6:
  %8 = getelementptr inbounds %Stmt, %Stmt* %6, i32 0, i32 7
  store %TokenInfo* %ti, %TokenInfo** %8

;stmt7:
  ret %Stmt* %6
}

define %Stmt* @stmt_new_let (%Value* %v, %Value* %xv, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 0, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0
  store %Value* %v, %Value** %3

;stmt2:
  %4 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1
  %5 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %4, i32 0, %Int32 1
  store %Value* %xv, %Value** %5

;stmt3:
  ret %Stmt* %1
}

define %Stmt* @stmt_new_assign (%Value* %l, %Value* %r, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 4, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0
  store %Value* %l, %Value** %3

;stmt2:
  %4 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1
  %5 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %4, i32 0, %Int32 1
  store %Value* %r, %Value** %5

;stmt3:
  %6 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 7
  store %TokenInfo* %ti, %TokenInfo** %6

;stmt4:
  ret %Stmt* %1
}

define void @asmInit (%Assembly* %a, %Str %name) {

;stmt0:
  %1 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 0
  store %Str %name, %Str* %1

;stmt1:
  %2 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 1
  %3 = call %List* () @map_new ()
  store %List* %3, %List** %2

;stmt2:
  %4 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 2
  %5 = call %List* () @map_new ()
  store %List* %5, %List** %4

;stmt3:
  %6 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 3
  %7 = call %List* () @map_new ()
  store %List* %7, %List** %6

;stmt4:
  %8 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 5
  %9 = call %List* () @map_new ()
  store %List* %9, %List** %8

;stmt5:
  %10 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 4
  %11 = call %List* () @map_new ()
  store %List* %11, %List** %10
  ret void
}

define %AssemblyItem* @asmTypedefAdd (%Assembly* %a, %Str %id, %Type* %t) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 160)
  %2 = bitcast %Unit* %1 to %AssemblyItem*

;stmt1:
  %3 = bitcast %AssemblyItem* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @_func191_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 0
  store %AssemblyItemKind 0, %AssemblyItemKind* %7

;stmt3:
  %8 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 1
  store %Str %id, %Str* %8

;stmt4:
  %9 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 5
  %10 = getelementptr inbounds %TypeDef, %TypeDef* %9, i32 0, i32 0
  store %Type* %t, %Type** %10

;stmt5:
  %11 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 1
  %12 = load %List*, %List** %11
  %13 = bitcast %AssemblyItem* %2 to %Unit*
  %14 = call %Bool (%List*, %Unit*) @list_append (%List* %12, %Unit* %13)

;stmt6:
  ret %AssemblyItem* %2
}

define %AssemblyItem* @asmStringAdd (%Assembly* %a, %Str %id, %Str %s, %Nat32 %len) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 160)
  %2 = bitcast %Unit* %1 to %AssemblyItem*

;stmt1:
  %3 = bitcast %AssemblyItem* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @_func192_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 0
  store %AssemblyItemKind 2, %AssemblyItemKind* %7

;stmt3:
  %8 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 1
  store %Str %id, %Str* %8

;stmt4:
  %9 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 3
  %10 = getelementptr inbounds %StringDef, %StringDef* %9, i32 0, i32 0
  store %Str %s, %Str* %10

;stmt5:
  %11 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 3
  %12 = getelementptr inbounds %StringDef, %StringDef* %11, i32 0, i32 1
  store %Nat32 %len, %Nat32* %12

;stmt6:
  %13 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 3
  %14 = load %List*, %List** %13
  %15 = bitcast %AssemblyItem* %2 to %Unit*
  %16 = call %Bool (%List*, %Unit*) @list_append (%List* %14, %Unit* %15)

;stmt7:
  ret %AssemblyItem* %2
}

define %AssemblyItem* @asmArrayAdd (%Assembly* %a, %Str %id, %Type* %t, %List* %values) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 160)
  %2 = bitcast %Unit* %1 to %AssemblyItem*

;stmt1:
  %3 = bitcast %AssemblyItem* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @_func193_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 0
  store %AssemblyItemKind 3, %AssemblyItemKind* %7

;stmt3:
  %8 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 1
  store %Str %id, %Str* %8

;stmt4:
  %9 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 9
  %10 = getelementptr inbounds %ArrayDef, %ArrayDef* %9, i32 0, i32 0
  store %Type* %t, %Type** %10

;stmt5:
  %11 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 9
  %12 = getelementptr inbounds %ArrayDef, %ArrayDef* %11, i32 0, i32 2
  store %List* %values, %List** %12

;stmt6:
  %13 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 2
  %14 = load %List*, %List** %13
  %15 = bitcast %AssemblyItem* %2 to %Unit*
  %16 = call %Bool (%List*, %Unit*) @list_append (%List* %14, %Unit* %15)

;stmt7:
  ret %AssemblyItem* %2
}

define %AssemblyItem* @asmFuncAdd (%Assembly* %a, %Str %id, %Type* %t, %Block* %b) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 160)
  %2 = bitcast %Unit* %1 to %AssemblyItem*

;stmt1:
  %3 = bitcast %AssemblyItem* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @_func194_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 0
  store %AssemblyItemKind 4, %AssemblyItemKind* %7

;stmt3:
  %8 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 1
  store %Str %id, %Str* %8

;stmt4:
  %9 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 11
  %10 = getelementptr inbounds %FuncDef, %FuncDef* %9, i32 0, i32 0
  store %Type* %t, %Type** %10

;stmt5:
  %11 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 11
  %12 = getelementptr inbounds %FuncDef, %FuncDef* %11, i32 0, i32 1
  store %Block* %b, %Block** %12

;stmt6:
  %13 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 5
  %14 = load %List*, %List** %13
  %15 = bitcast %AssemblyItem* %2 to %Unit*
  %16 = call %Bool (%List*, %Unit*) @list_append (%List* %14, %Unit* %15)

;stmt7:
  ret %AssemblyItem* %2
}

define %AssemblyItem* @asmVarAdd (%Assembly* %a, %Str %id, %Type* %t, %Value* %init_value) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 160)
  %2 = bitcast %Unit* %1 to %AssemblyItem*

;stmt1:
  %3 = bitcast %AssemblyItem* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @_func195_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 0
  store %AssemblyItemKind 5, %AssemblyItemKind* %7

;stmt3:
  %8 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 1
  store %Str %id, %Str* %8

;stmt4:
  %9 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 13
  %10 = getelementptr inbounds %AssemblyVarDef, %AssemblyVarDef* %9, i32 0, i32 1
  store %Value* %init_value, %Value** %10

;stmt5:
  %11 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %2, i32 0, i32 13
  %12 = getelementptr inbounds %AssemblyVarDef, %AssemblyVarDef* %11, i32 0, i32 0
  store %Type* %t, %Type** %12

;stmt6:
  %13 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 4
  %14 = load %List*, %List** %13
  %15 = bitcast %AssemblyItem* %2 to %Unit*
  %16 = call %Bool (%List*, %Unit*) @list_append (%List* %14, %Unit* %15)

;stmt7:
  ret %AssemblyItem* %2
}

define %Unit* @search (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %AssemblyItem*

;stmt1:
  %2 = bitcast %Unit* %ctx to %Str

;stmt2:
  %3 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 1
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, %Str) @strcmp (%Str %4, %Str %2)
  %6 = icmp eq %Int32 %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  ret %Unit* %data
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = inttoptr i64 0 to %Unit*
  ret %Unit* %8
}

define %Bool @ren (%List* %list, %Str %id_from, %Str %id_to) {

;stmt0:
  %1 = bitcast %Str %id_from to %Unit*
  %2 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %list, %ListSearchHandler @search, %Unit* %1)
  %3 = bitcast %Unit* %2 to %AssemblyItem*

;stmt1:
  %4 = bitcast %AssemblyItem* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %3, i32 0, i32 1
  store %Str %id_to, %Str* %7

;stmt4:
  ret %Bool 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  ret %Bool 0
}

define void @asmRename (%Assembly* %a, %Str %id_from, %Str %id_to) {

;stmt0:
  %1 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 5
  %2 = load %List*, %List** %1
  %3 = call %Bool (%List*, %Str, %Str) @ren (%List* %2, %Str %id_from, %Str %id_to)
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %5 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 3
  %6 = load %List*, %List** %5
  %7 = call %Bool (%List*, %Str, %Str) @ren (%List* %6, %Str %id_from, %Str %id_to)
  br i1 %7, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %9 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 2
  %10 = load %List*, %List** %9
  %11 = call %Bool (%List*, %Str, %Str) @ren (%List* %10, %Str %id_from, %Str %id_to)
  br i1 %11, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
ret void
  br label %endif_2
else_2:
  br label %endif_2
endif_2:
  ret void
}

define %Type* @parse_type () {

;stmt0:
  %t = alloca %Type*

;stmt1:
  %1 = inttoptr i64 0 to %Type*
  store %Type* %1, %Type** %t

;stmt2:
  %2 = call %Token* () @ctok ()

;stmt3:
  %3 = getelementptr inbounds %Token, %Token* %2, i32 0, i32 1

;stmt4:
  %4 = call %Token* () @ctok ()
  %5 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 0
  %6 = load %TokenType, %TokenType* %5
  %7 = icmp eq %TokenType %6, 1
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %8 = load %Str, %Str* @_func199_str1
  %9 = call %Bool (%Str) @match (%Str %8)
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %10 = call %Type* () @parse_type_record ()
  store %Type* %10, %Type** %t
  br label %endif_1
else_1:

;stmt9:
  %11 = load %Str, %Str* @_func199_str2
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %13 = call %Type* () @parse_type_enum ()
  store %Type* %13, %Type** %t
  br label %endif_2
else_2:

;stmt12:

;stmt13:
  %14 = call %Type* () @parse_type_named ()
  store %Type* %14, %Type** %t
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:

;stmt14:

;stmt15:
  %15 = load %Str, %Str* @_func199_str3
  %16 = call %Bool (%Str) @match (%Str %15)
  br i1 %16, label %then_3, label %else_3
then_3:

;stmt16:

;stmt17:
  %17 = call %Type* () @parse_type ()

;stmt18:
  %18 = bitcast %Type* %17 to %Unit*
  %19 = inttoptr i64 0 to %Unit*
  %20 = icmp eq %Unit* %18, %19
  br i1 %20, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %21 = inttoptr i64 0 to %Type*
  ret %Type* %21
  br label %endif_4
else_4:
  br label %endif_4
endif_4:

;stmt21:
  %23 = call %Type* (%Type*) @type_pointer_new (%Type* %17)
  store %Type* %23, %Type** %t
  br label %endif_3
else_3:

;stmt22:
  %24 = load %Str, %Str* @_func199_str4
  %25 = call %Bool (%Str) @match (%Str %24)
  br i1 %25, label %then_5, label %else_5
then_5:

;stmt23:

;stmt24:
  %26 = call %Type* () @parse_type_array ()
  store %Type* %26, %Type** %t
  br label %endif_5
else_5:

;stmt25:
  %27 = load %Str, %Str* @_func199_str5
  %28 = call %Bool (%Str) @match (%Str %27)
  br i1 %28, label %then_6, label %else_6
then_6:

;stmt26:

;stmt27:
  %29 = call %Type* () @parse_type_func ()
  store %Type* %29, %Type** %t
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
  %30 = load %Type*, %Type** %t
  %31 = bitcast %Type* %30 to %Unit*
  %32 = inttoptr i64 0 to %Unit*
  %33 = icmp eq %Unit* %31, %32
  br i1 %33, label %then_7, label %else_7
then_7:

;stmt29:

;stmt30:
  %34 = load %Str, %Str* @_func199_str6
  call void (%Str, %TokenInfo*) @error (%Str %34, %TokenInfo* %3)

;stmt31:
  %35 = load %Str, %Str* @_func199_str7
  %36 = call %Token* () @ctok ()
  %37 = getelementptr inbounds %Token, %Token* %36, i32 0, i32 2
  %38 = load [0 x %Nat8], [0 x %Nat8]* %37
  %39 = call %Int32 (%Str, ...) @printf (%Str %35, [0 x %Nat8] %38)
  br label %endif_7
else_7:

;stmt32:

;stmt33:
  %40 = load %Type*, %Type** %t
  %41 = getelementptr inbounds %Type, %Type* %40, i32 0, i32 0
  %42 = load %TypeKind, %TypeKind* %41
  %43 = icmp eq %TypeKind %42, 5
  %44 = load %Type*, %Type** %t
  %45 = getelementptr inbounds %Type, %Type* %44, i32 0, i32 0
  %46 = load %TypeKind, %TypeKind* %45
  %47 = icmp eq %TypeKind %46, 7
  %48 = or %Bool %43, %47
  br i1 %48, label %then_8, label %else_8
then_8:

;stmt34:

;stmt35:
  %49 = load %Type*, %Type** %t
  %50 = getelementptr inbounds %Type, %Type* %49, i32 0, i32 2
  %51 = load %Type*, %Type** %t
  %52 = getelementptr inbounds %Type, %Type* %51, i32 0, i32 3
  %53 = load %Nat32, %Nat32* %52
  store %Nat32 %53, %Nat32* %50
  br label %endif_8
else_8:
  br label %endif_8
endif_8:

;stmt36:
  %54 = load %Type*, %Type** %t
  %55 = getelementptr inbounds %Type, %Type* %54, i32 0, i32 3
  %56 = load %Type*, %Type** %t
  %57 = getelementptr inbounds %Type, %Type* %56, i32 0, i32 3
  %58 = load %Nat32, %Nat32* %57
  %59 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 1
  %60 = load %Nat32, %Nat32* %59
  %61 = trunc %Nat32 %60 to %Nat8
  %62 = call %Nat32 (%Nat32, %Nat8) @alignment (%Nat32 %58, %Nat8 %61)
  store %Nat32 %62, %Nat32* %55

;stmt37:
  %63 = load %Type*, %Type** %t
  %64 = getelementptr inbounds %Type, %Type* %63, i32 0, i32 12
  store %TokenInfo* %3, %TokenInfo** %64

;stmt38:
  %65 = load %Type*, %Type** %t
  %66 = getelementptr inbounds %Type, %Type* %65, i32 0, i32 13
  store %TokenInfo* %3, %TokenInfo** %66
  br label %endif_7
endif_7:

;stmt39:
  %67 = load %Type*, %Type** %t
  ret %Type* %67
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
  %7 = load %Str, %Str* @_func200_str1
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
  %17 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1
  call void (%List*, %Str, %Type*) @add_type (%List* %17, %Str %3, %Type* %15)

;stmt13:
  ret %Type* %15
}

define %List* @parse_fields (%Str %term) {

;stmt0:
  %1 = call %List* () @map_new ()

;stmt1:
  call void () @skip_nl ()

;stmt2:
  br label %continue_0
continue_0:
  %2 = call %Bool (%Str) @match (%Str %term)
  %3 = xor %Bool %2, 1
  br i1 %3, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  call void () @skip_nl ()

;stmt5:
  %4 = call %Token* () @ctok ()
  %5 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 1

;stmt6:
  %6 = call %List* () @parseField ()

;stmt7:
  %7 = bitcast %List* %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  %10 = load %Str, %Str* @_func201_str1
  call void (%Str, %TokenInfo*) @error (%Str %10, %TokenInfo* %5)

;stmt10:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt11:
  %12 = load %Str, %Str* @_func201_str2
  %13 = call %Bool (%Str) @match (%Str %12)

;stmt12:
  call void () @skip_nl ()

;stmt13:
  %14 = call %Bool (%List*, %List*) @list_extend (%List* %1, %List* %6)
  br label %continue_0
break_0:

;stmt14:
  ret %List* %1

;stmt15:
  br label %fail
fail:

;stmt16:
  %16 = inttoptr i64 0 to %List*
  ret %List* %16
}

define %Type* @parse_type_record () {

;stmt0:
  %1 = load %Str, %Str* @_func202_str1
  %2 = call %Bool (%Str) @need (%Str %1)

;stmt1:
  %3 = load %Str, %Str* @_func202_str2
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
  %2 = load %Str, %Str* @_func203_str1
  %3 = call %Bool (%Str) @need (%Str %2)

;stmt4:
  call void () @skip_nl ()

;stmt5:
  br label %continue_0
continue_0:
  %4 = load %Str, %Str* @_func203_str2
  %5 = call %Bool (%Str) @match (%Str %4)
  %6 = xor %Bool %5, 1
  br i1 %6, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  call void () @skip_nl ()

;stmt8:
  %7 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %8 = bitcast %Unit* %7 to %EnumConstructor*

;stmt9:
  %9 = call %Token* () @ctok ()
  %10 = getelementptr inbounds %Token, %Token* %9, i32 0, i32 1

;stmt10:
  %11 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %8, i32 0, i32 0
  %12 = call %Str () @parseId ()
  store %Str %12, %Str* %11

;stmt11:
  %13 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %8, i32 0, i32 1
  %14 = load %Int64, %Int64* %num
  store %Int64 %14, %Int64* %13

;stmt12:
  %15 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %8, i32 0, i32 2
  store %TokenInfo* %10, %TokenInfo** %15

;stmt13:
  %16 = bitcast %EnumConstructor* %8 to %Unit*
  %17 = call %Bool (%List*, %Unit*) @list_append (%List* %1, %Unit* %16)

;stmt14:
  %18 = load %Int64, %Int64* %num
  %19 = add %Int64 %18, 1
  store %Int64 %19, %Int64* %num

;stmt15:
  %20 = load %Str, %Str* @_func203_str3
  %21 = call %Bool (%Str) @match (%Str %20)
  %22 = xor %Bool %21, 1
  br i1 %22, label %then_0, label %else_0
then_0:

;stmt16:

;stmt17:
  call void () @skip_nl ()

;stmt18:
  %23 = load %Str, %Str* @_func203_str4
  %24 = call %Bool (%Str) @need (%Str %23)

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
  %26 = call %Type* (%List*) @type_enum_new (%List* %1)
  ret %Type* %26
}

define %Type* @parse_type_array () {

;stmt0:
  %1 = load %Str, %Str* @_func204_str1
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
  %15 = load %Str, %Str* @_func204_str2
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

define %Type* @parse_type_func () {

;stmt0:
  %1 = load %Str, %Str* @_func205_str1
  %2 = call %List* (%Str) @parse_fields (%Str %1)

;stmt1:
  %3 = load %Str, %Str* @_func205_str2
  %4 = call %Bool (%Str) @need (%Str %3)

;stmt2:
  %5 = call %Type* () @parse_type ()

;stmt3:
  %6 = bitcast %List* %2 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = bitcast %Type* %5 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp eq %Unit* %9, %10
  %12 = or %Bool %8, %11
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %13 = inttoptr i64 0 to %Type*
  ret %Type* %13
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %15 = load %Str, %Str* @_func205_str3
  %16 = call %Nat64 (%Str) @get (%Str %15)
  %17 = icmp eq %Nat64 %16, 1

;stmt7:
  %18 = call %Type* (%List*, %Type*, %Bool) @type_func_new (%List* %2, %Type* %5, %Bool %17)
  ret %Type* %18
}

define %Str @print_value_kind (%ValueKind %k) {

;stmt0:
  %1 = icmp eq %ValueKind %k, 1
  br i1 %1, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %2 = load %Str, %Str* @_func206_str1
  ret %Str %2
  br label %endif_0
else_0:

;stmt3:
  %4 = icmp eq %ValueKind %k, 8
  br i1 %4, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %5 = load %Str, %Str* @_func206_str2
  ret %Str %5
  br label %endif_1
else_1:

;stmt6:
  %7 = icmp eq %ValueKind %k, 9
  br i1 %7, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %8 = load %Str, %Str* @_func206_str3
  ret %Str %8
  br label %endif_2
else_2:

;stmt9:
  %10 = icmp eq %ValueKind %k, 10
  br i1 %10, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %11 = load %Str, %Str* @_func206_str4
  ret %Str %11
  br label %endif_3
else_3:

;stmt12:
  %13 = icmp eq %ValueKind %k, 11
  br i1 %13, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %14 = load %Str, %Str* @_func206_str5
  ret %Str %14
  br label %endif_4
else_4:

;stmt15:
  %16 = icmp eq %ValueKind %k, 26
  br i1 %16, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %17 = load %Str, %Str* @_func206_str6
  ret %Str %17
  br label %endif_5
else_5:

;stmt18:
  %19 = icmp eq %ValueKind %k, 27
  br i1 %19, label %then_6, label %else_6
then_6:

;stmt19:

;stmt20:
  %20 = load %Str, %Str* @_func206_str7
  ret %Str %20
  br label %endif_6
else_6:

;stmt21:
  %22 = icmp eq %ValueKind %k, 12
  br i1 %22, label %then_7, label %else_7
then_7:

;stmt22:

;stmt23:
  %23 = load %Str, %Str* @_func206_str8
  ret %Str %23
  br label %endif_7
else_7:

;stmt24:
  %25 = icmp eq %ValueKind %k, 13
  br i1 %25, label %then_8, label %else_8
then_8:

;stmt25:

;stmt26:
  %26 = load %Str, %Str* @_func206_str9
  ret %Str %26
  br label %endif_8
else_8:

;stmt27:
  %28 = icmp eq %ValueKind %k, 14
  br i1 %28, label %then_9, label %else_9
then_9:

;stmt28:

;stmt29:
  %29 = load %Str, %Str* @_func206_str10
  ret %Str %29
  br label %endif_9
else_9:

;stmt30:
  %31 = icmp eq %ValueKind %k, 15
  br i1 %31, label %then_10, label %else_10
then_10:

;stmt31:

;stmt32:
  %32 = load %Str, %Str* @_func206_str11
  ret %Str %32
  br label %endif_10
else_10:

;stmt33:
  %34 = icmp eq %ValueKind %k, 16
  br i1 %34, label %then_11, label %else_11
then_11:

;stmt34:

;stmt35:
  %35 = load %Str, %Str* @_func206_str12
  ret %Str %35
  br label %endif_11
else_11:

;stmt36:
  %37 = icmp eq %ValueKind %k, 17
  br i1 %37, label %then_12, label %else_12
then_12:

;stmt37:

;stmt38:
  %38 = load %Str, %Str* @_func206_str13
  ret %Str %38
  br label %endif_12
else_12:

;stmt39:
  %40 = icmp eq %ValueKind %k, 18
  br i1 %40, label %then_13, label %else_13
then_13:

;stmt40:

;stmt41:
  %41 = load %Str, %Str* @_func206_str14
  ret %Str %41
  br label %endif_13
else_13:

;stmt42:
  %43 = icmp eq %ValueKind %k, 19
  br i1 %43, label %then_14, label %else_14
then_14:

;stmt43:

;stmt44:
  %44 = load %Str, %Str* @_func206_str15
  ret %Str %44
  br label %endif_14
else_14:

;stmt45:
  %46 = icmp eq %ValueKind %k, 20
  br i1 %46, label %then_15, label %else_15
then_15:

;stmt46:

;stmt47:
  %47 = load %Str, %Str* @_func206_str16
  ret %Str %47
  br label %endif_15
else_15:

;stmt48:
  %49 = icmp eq %ValueKind %k, 21
  br i1 %49, label %then_16, label %else_16
then_16:

;stmt49:

;stmt50:
  %50 = load %Str, %Str* @_func206_str17
  ret %Str %50
  br label %endif_16
else_16:

;stmt51:
  %52 = icmp eq %ValueKind %k, 22
  br i1 %52, label %then_17, label %else_17
then_17:

;stmt52:

;stmt53:
  %53 = load %Str, %Str* @_func206_str18
  ret %Str %53
  br label %endif_17
else_17:

;stmt54:
  %55 = icmp eq %ValueKind %k, 23
  br i1 %55, label %then_18, label %else_18
then_18:

;stmt55:

;stmt56:
  %56 = load %Str, %Str* @_func206_str19
  ret %Str %56
  br label %endif_18
else_18:

;stmt57:
  %58 = icmp eq %ValueKind %k, 24
  br i1 %58, label %then_19, label %else_19
then_19:

;stmt58:

;stmt59:
  %59 = load %Str, %Str* @_func206_str20
  ret %Str %59
  br label %endif_19
else_19:

;stmt60:
  %61 = icmp eq %ValueKind %k, 25
  br i1 %61, label %then_20, label %else_20
then_20:

;stmt61:

;stmt62:
  %62 = load %Str, %Str* @_func206_str21
  ret %Str %62
  br label %endif_20
else_20:

;stmt63:
  %64 = icmp eq %ValueKind %k, 28
  br i1 %64, label %then_21, label %else_21
then_21:

;stmt64:

;stmt65:
  %65 = load %Str, %Str* @_func206_str22
  ret %Str %65
  br label %endif_21
else_21:

;stmt66:
  %67 = icmp eq %ValueKind %k, 29
  br i1 %67, label %then_22, label %else_22
then_22:

;stmt67:

;stmt68:
  %68 = load %Str, %Str* @_func206_str23
  ret %Str %68
  br label %endif_22
else_22:

;stmt69:
  %70 = icmp eq %ValueKind %k, 30
  br i1 %70, label %then_23, label %else_23
then_23:

;stmt70:

;stmt71:
  %71 = load %Str, %Str* @_func206_str24
  ret %Str %71
  br label %endif_23
else_23:

;stmt72:
  %73 = icmp eq %ValueKind %k, 31
  br i1 %73, label %then_24, label %else_24
then_24:

;stmt73:

;stmt74:
  %74 = load %Str, %Str* @_func206_str25
  ret %Str %74
  br label %endif_24
else_24:

;stmt75:
  %76 = icmp eq %ValueKind %k, 0
  br i1 %76, label %then_25, label %else_25
then_25:

;stmt76:

;stmt77:
  %77 = load %Str, %Str* @_func206_str26
  ret %Str %77
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
  %79 = load %Str, %Str* @_func206_str27
  ret %Str %79
}

define void @value_show (%Value* %v) {

;stmt0:
  %1 = load %Str, %Str* @_func207_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1, %Value* %v)

;stmt1:
  %3 = load %Str, %Str* @_func207_str2
  %4 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %5 = load %ValueKind, %ValueKind* %4
  %6 = call %Str (%ValueKind) @print_value_kind (%ValueKind %5)
  %7 = call %Int32 (%Str, ...) @printf (%Str %3, %Str %6)

;stmt2:
  %8 = load %Str, %Str* @_func207_str3
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)

;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*) @prttype (%Type* %11)

;stmt4:
  %12 = load %Str, %Str* @_func207_str4
  %13 = call %Int32 (%Str, ...) @printf (%Str %12)

;stmt5:
  %14 = load %Str, %Str* @_func207_str5
  %15 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 4
  %16 = load %Str, %Str* %15
  %17 = call %Int32 (%Str, ...) @printf (%Str %14, %Str %16)

;stmt6:
  %18 = load %Str, %Str* @_func207_str6
  %19 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 2
  %20 = load %Int64, %Int64* %19
  %21 = call %Int32 (%Str, ...) @printf (%Str %18, %Int64 %20)

;stmt7:
  %22 = load %Str, %Str* @_func207_str7
  %23 = call %Int32 (%Str, ...) @printf (%Str %22)
  ret void
}

define %Value* @castIfNumericTo (%Value* %v, %Type* %t) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %2 = load %Type*, %Type** %1
  %3 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = icmp eq %TypeKind %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  store %Type* %t, %Type** %6
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  ret %Value* %v
}

define %Value* @nat (%Value* %v, %Type* %t) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %2 = load %Type*, %Type** %1

;stmt1:
  %3 = bitcast %Type* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @_func209_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Type* %t to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  %10 = load %Str, %Str* @_func209_str2
  call void (%Bool, %Str) @assert (%Bool %9, %Str %10)

;stmt3:
  %11 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 0
  %12 = load %TypeKind, %TypeKind* %11
  %13 = icmp eq %TypeKind %12, 1
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %14 = call %Bool (%Type*) @type_is_basic_integer (%Type* %t)
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %15 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 2
  %16 = load %Int64, %Int64* %15
  %17 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %18 = load %TokenInfo*, %TokenInfo** %17
  %19 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %t, %Int64 %16, %TokenInfo* %18)
  ret %Value* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %21 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = call %Bool (%Type*, %Type*) @naturalConversionIsPossible (%Type* %22, %Type* %t)
  br i1 %23, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %24 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Value* (%Value*, %Type*, %TokenInfo*) @cast (%Value* %v, %Type* %t, %TokenInfo* %25)

;stmt11:
  %27 = call %Type* (%Value*) @checkValue (%Value* %26)

;stmt12:
  ret %Value* %26
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt13:
  ret %Value* %v
}

define %Bool @naturalConversionIsPossible (%Type* %a, %Type* %b) {

;stmt0:
  %1 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 0
  %2 = load %TypeKind, %TypeKind* %1

;stmt1:
  %3 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3

;stmt2:
  %5 = icmp eq %TypeKind %2, 7
  %6 = icmp eq %TypeKind %4, 7
  %7 = and %Bool %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 8
  %9 = getelementptr inbounds %TypeArray, %TypeArray* %8, i32 0, i32 2
  %10 = load %Bool, %Bool* %9
  %11 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 8
  %12 = getelementptr inbounds %TypeArray, %TypeArray* %11, i32 0, i32 2
  %13 = load %Bool, %Bool* %12
  %14 = xor %Bool %13, 1
  %15 = and %Bool %10, %14
  br i1 %15, label %then_1, label %else_1
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
  %17 = icmp eq %TypeKind %2, 6
  %18 = icmp eq %TypeKind %4, 6
  %19 = and %Bool %17, %18
  br i1 %19, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %20 = load %Type*, %Type** @typeFreePtr
  %21 = call %Bool (%Type*, %Type*) @type_eq (%Type* %a, %Type* %20)
  br i1 %21, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  ret %Bool 1
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt12:
  %23 = load %Type*, %Type** @typeFreePtr
  %24 = call %Bool (%Type*, %Type*) @type_eq (%Type* %b, %Type* %23)
  br i1 %24, label %then_4, label %else_4
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
  %26 = icmp eq %TypeKind %2, 7
  %27 = icmp eq %TypeKind %4, 6
  %28 = and %Bool %26, %27
  br i1 %28, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %29 = getelementptr inbounds %Type, %Type* %b, i32 0, i32 8
  %30 = getelementptr inbounds %TypeArray, %TypeArray* %29, i32 0, i32 2
  %31 = load %Bool, %Bool* %30
  %32 = load %Type*, %Type** @typeFreePtr
  %33 = call %Bool (%Type*, %Type*) @type_eq (%Type* %a, %Type* %32)
  %34 = and %Bool %31, %33
  br i1 %34, label %then_6, label %else_6
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
  %36 = icmp eq %TypeKind %4, 7
  %37 = icmp eq %TypeKind %2, 6
  %38 = and %Bool %36, %37
  br i1 %38, label %then_7, label %else_7
then_7:

;stmt21:

;stmt22:
  %39 = getelementptr inbounds %Type, %Type* %a, i32 0, i32 8
  %40 = getelementptr inbounds %TypeArray, %TypeArray* %39, i32 0, i32 2
  %41 = load %Bool, %Bool* %40
  %42 = load %Type*, %Type** @typeFreePtr
  %43 = call %Bool (%Type*, %Type*) @type_eq (%Type* %b, %Type* %42)
  %44 = and %Bool %41, %43
  br i1 %44, label %then_8, label %else_8
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

define %Value* @un (%ValueKind %k, %Value* %v, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %Value* %v to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = inttoptr i64 0 to %Value*
  ret %Value* %4
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %6 = icmp eq %ValueKind %k, 8
  br i1 %6, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %7 = call %Value* (%Value*, %TokenInfo*) @un_ref (%Value* %v, %TokenInfo* %ti)
  ret %Value* %7
  br label %endif_1
else_1:

;stmt6:
  %9 = icmp eq %ValueKind %k, 9
  br i1 %9, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %10 = call %Value* (%Value*, %TokenInfo*) @un_deref (%Value* %v, %TokenInfo* %ti)
  ret %Value* %10
  br label %endif_2
else_2:

;stmt9:
  %12 = icmp eq %ValueKind %k, 11
  br i1 %12, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %13 = call %Value* (%Value*, %TokenInfo*) @un_minus (%Value* %v, %TokenInfo* %ti)
  ret %Value* %13
  br label %endif_3
else_3:

;stmt12:
  %15 = icmp eq %ValueKind %k, 10
  br i1 %15, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %16 = call %Value* (%Value*, %TokenInfo*) @un_not (%Value* %v, %TokenInfo* %ti)
  ret %Value* %16
  br label %endif_4
else_4:

;stmt15:

;stmt16:
  %18 = load %Str, %Str* @_func211_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %18)
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:

;stmt17:
  %19 = inttoptr i64 0 to %Value*
  ret %Value* %19
}

define %Value* @un_minus (%Value* %v, %TokenInfo* %ti) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %2 = load %ValueKind, %ValueKind* %1
  %3 = icmp eq %ValueKind %2, 2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %5 = load %Type*, %Type** %4
  %6 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 2
  %7 = load %Int64, %Int64* %6
  %8 = sub nsw %Int64 0, %7
  %9 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %5, %Int64 %8, %TokenInfo* %ti)
  ret %Value* %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %11 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 11, %TokenInfo* %ti)

;stmt4:
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 5
  %13 = getelementptr inbounds %ValueUn, %ValueUn* %12, i32 0, i32 0
  store %Value* %v, %Value** %13

;stmt5:
  ret %Value* %11
}

define %Value* @un_not (%Value* %v, %TokenInfo* %ti) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %2 = load %ValueKind, %ValueKind* %1
  %3 = icmp eq %ValueKind %2, 2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %5 = load %Type*, %Type** %4
  %6 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 2
  %7 = load %Int64, %Int64* %6
  %8 = xor %Int64 %7, -1
  %9 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %5, %Int64 %8, %TokenInfo* %ti)
  ret %Value* %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %11 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 10, %TokenInfo* %ti)

;stmt4:
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 5
  %13 = getelementptr inbounds %ValueUn, %ValueUn* %12, i32 0, i32 0
  store %Value* %v, %Value** %13

;stmt5:
  ret %Value* %11
}

define %Value* @un_ref (%Value* %v, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 8, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 5
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  store %Value* %v, %Value** %3

;stmt2:
  ret %Value* %1
}

define %Value* @un_deref (%Value* %v, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 9, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 5
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  store %Value* %v, %Value** %3

;stmt2:
  ret %Value* %1
}

define %Type* @checkValueUnary (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 5
  %2 = getelementptr inbounds %ValueUn, %ValueUn* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2

;stmt1:
  %4 = call %Type* (%Value*) @checkValue (%Value* %3)

;stmt2:
  %t = alloca %Type*

;stmt3:
  %5 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %6 = load %ValueKind, %ValueKind* %5

;stmt4:
  %7 = icmp eq %ValueKind %6, 8
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %8 = call %Type* (%Type*) @type_pointer_new (%Type* %4)
  store %Type* %8, %Type** %t
  br label %endif_0
else_0:

;stmt7:
  %9 = icmp eq %ValueKind %6, 9
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %10 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %11 = load %TypeKind, %TypeKind* %10
  %12 = icmp ne %TypeKind %11, 6
  br i1 %12, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %13 = load %Str, %Str* @_func216_str1
  %14 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %15)

;stmt12:
  %16 = inttoptr i64 0 to %Type*
  ret %Type* %16
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt13:
  %18 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 7
  %19 = getelementptr inbounds %TypePointer, %TypePointer* %18, i32 0, i32 0
  %20 = load %Type*, %Type** %19
  store %Type* %20, %Type** %t
  br label %endif_1
else_1:

;stmt14:
  %21 = icmp eq %ValueKind %6, 11
  br i1 %21, label %then_3, label %else_3
then_3:

;stmt15:

;stmt16:
  store %Type* %4, %Type** %t
  br label %endif_3
else_3:

;stmt17:
  %22 = icmp eq %ValueKind %6, 10
  br i1 %22, label %then_4, label %else_4
then_4:

;stmt18:

;stmt19:
  store %Type* %4, %Type** %t
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
  %23 = load %Type*, %Type** %t
  ret %Type* %23
}

define %Bool @binTypeValid (%ValueKind %k, %Type* %t) {

;stmt0:
  %1 = icmp eq %ValueKind %k, 20
  %2 = icmp eq %ValueKind %k, 21
  %3 = or %Bool %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Bool 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %5 = call %Bool (%Type*) @type_is_basic_integer (%Type* %t)
  %6 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 1
  %9 = or %Bool %5, %8
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %11 = load %Type*, %Type** @typeBool
  %12 = call %Bool (%Type*, %Type*) @type_eq (%Type* %t, %Type* %11)
  br i1 %12, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %13 = icmp eq %ValueKind %k, 19
  %14 = icmp eq %ValueKind %k, 17
  %15 = icmp eq %ValueKind %k, 18
  %16 = or %Bool %14, %15
  %17 = or %Bool %13, %16
  ret %Bool %17
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt9:
  ret %Bool 0
}

define %Value* @bin (%ValueKind %k, %Value* %l, %Value* %r, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %Value* %l to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = bitcast %Value* %r to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = or %Bool %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind %k, %TokenInfo* %ti)

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 6
  %11 = getelementptr inbounds %ValueBin, %ValueBin* %10, i32 0, i32 0
  store %Value* %l, %Value** %11

;stmt5:
  %12 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 6
  %13 = getelementptr inbounds %ValueBin, %ValueBin* %12, i32 0, i32 1
  store %Value* %r, %Value** %13

;stmt6:
  ret %Value* %9

;stmt7:
  br label %fail
fail:

;stmt8:
  %15 = inttoptr i64 0 to %Value*
  ret %Value* %15
}

define %Type* @checkValueBinary (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %2 = getelementptr inbounds %ValueBin, %ValueBin* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2

;stmt1:
  %4 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %5 = getelementptr inbounds %ValueBin, %ValueBin* %4, i32 0, i32 1
  %6 = load %Value*, %Value** %5

;stmt2:
  %7 = call %Type* (%Value*) @checkValue (%Value* %3)

;stmt3:
  %8 = call %Type* (%Value*) @checkValue (%Value* %6)

;stmt4:
  %9 = bitcast %Type* %7 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp eq %Unit* %9, %10
  %12 = bitcast %Type* %8 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp eq %Unit* %12, %13
  %15 = or %Bool %11, %14
  br i1 %15, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %17 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %18 = load %Type*, %Type** %17
  %19 = call %Value* (%Value*, %Type*) @nat (%Value* %3, %Type* %18)

;stmt8:
  %20 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 1
  %21 = load %Type*, %Type** %20
  %22 = call %Value* (%Value*, %Type*) @nat (%Value* %6, %Type* %21)

;stmt9:
  %23 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 1
  %24 = load %Type*, %Type** %23

;stmt10:
  %25 = getelementptr inbounds %Value, %Value* %22, i32 0, i32 1
  %26 = load %Type*, %Type** %25

;stmt11:
  %27 = call %Bool (%Type*, %Type*) @type_eq (%Type* %24, %Type* %26)
  %28 = xor %Bool %27, 1
  br i1 %28, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %29 = load %Str, %Str* @_func219_str1
  %30 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %31 = load %TokenInfo*, %TokenInfo** %30
  call void (%Str, %TokenInfo*) @error (%Str %29, %TokenInfo* %31)

;stmt14:
  %32 = load %Str, %Str* @_func219_str2
  %33 = call %Int32 (%Str, ...) @printf (%Str %32)

;stmt15:
  call void (%Type*) @prttype (%Type* %24)

;stmt16:
  %34 = load %Str, %Str* @_func219_str3
  %35 = call %Int32 (%Str, ...) @printf (%Str %34)

;stmt17:
  %36 = load %Str, %Str* @_func219_str4
  %37 = call %Int32 (%Str, ...) @printf (%Str %36)

;stmt18:
  call void (%Type*) @prttype (%Type* %26)

;stmt19:
  %38 = load %Str, %Str* @_func219_str5
  %39 = call %Int32 (%Str, ...) @printf (%Str %38)

;stmt20:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt21:
  %41 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %42 = load %ValueKind, %ValueKind* %41

;stmt22:
  %43 = call %Bool (%ValueKind, %Type*) @binTypeValid (%ValueKind %42, %Type* %24)
  %44 = xor %Bool %43, 1
  br i1 %44, label %then_2, label %else_2
then_2:

;stmt23:

;stmt24:
  %45 = load %Str, %Str* @_func219_str6
  %46 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %47 = load %TokenInfo*, %TokenInfo** %46
  call void (%Str, %TokenInfo*) @error (%Str %45, %TokenInfo* %47)

;stmt25:
  %48 = inttoptr i64 0 to %Type*
  ret %Type* %48
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt26:
  %50 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %51 = getelementptr inbounds %ValueBin, %ValueBin* %50, i32 0, i32 0
  store %Value* %19, %Value** %51

;stmt27:
  %52 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %53 = getelementptr inbounds %ValueBin, %ValueBin* %52, i32 0, i32 1
  store %Value* %22, %Value** %53

;stmt28:
  %54 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 0
  %55 = load %ValueKind, %ValueKind* %54
  %56 = icmp eq %ValueKind %55, 2
  %57 = getelementptr inbounds %Value, %Value* %22, i32 0, i32 0
  %58 = load %ValueKind, %ValueKind* %57
  %59 = icmp eq %ValueKind %58, 2
  %60 = and %Bool %56, %59
  br i1 %60, label %then_3, label %else_3
then_3:

;stmt29:

;stmt30:
  call void (%Value*) @binFold (%Value* %v)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt31:
  %61 = call %Bool (%ValueKind) @isReletionOpKind (%ValueKind %42)
  br i1 %61, label %then_4, label %else_4
then_4:

;stmt32:

;stmt33:
  %62 = load %Type*, %Type** @typeBool
  ret %Type* %62
  br label %endif_4
else_4:

;stmt34:

;stmt35:
  %64 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 1
  %65 = load %Type*, %Type** %64
  ret %Type* %65
  br label %endif_4
endif_4:

;stmt36:
  br label %fail
fail:

;stmt37:
  %67 = inttoptr i64 0 to %Type*
  ret %Type* %67
}

define void @binFold (%Value* %vx) {

;stmt0:
  %res = alloca %Int64

;stmt1:
  %t = alloca %Type*

;stmt2:
  %1 = getelementptr inbounds %Value, %Value* %vx, i32 0, i32 6
  %2 = getelementptr inbounds %ValueBin, %ValueBin* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 2
  %5 = load %Int64, %Int64* %4

;stmt3:
  %6 = getelementptr inbounds %Value, %Value* %vx, i32 0, i32 6
  %7 = getelementptr inbounds %ValueBin, %ValueBin* %6, i32 0, i32 1
  %8 = load %Value*, %Value** %7
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 2
  %10 = load %Int64, %Int64* %9

;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %vx, i32 0, i32 0
  %12 = load %ValueKind, %ValueKind* %11

;stmt5:
  %13 = getelementptr inbounds %Value, %Value* %vx, i32 0, i32 6
  %14 = getelementptr inbounds %ValueBin, %ValueBin* %13, i32 0, i32 0
  %15 = load %Value*, %Value** %14
  %16 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 1
  %17 = load %Type*, %Type** %16
  store %Type* %17, %Type** %t

;stmt6:
  %18 = icmp eq %ValueKind %12, 12
  br i1 %18, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %19 = add %Int64 %5, %10
  store %Int64 %19, %Int64* %res
  br label %endif_0
else_0:

;stmt9:
  %20 = icmp eq %ValueKind %12, 13
  br i1 %20, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %21 = sub %Int64 %5, %10
  store %Int64 %21, %Int64* %res
  br label %endif_1
else_1:

;stmt12:
  %22 = icmp eq %ValueKind %12, 14
  br i1 %22, label %then_2, label %else_2
then_2:

;stmt13:

;stmt14:
  %23 = mul %Int64 %5, %10
  store %Int64 %23, %Int64* %res
  br label %endif_2
else_2:

;stmt15:
  %24 = icmp eq %ValueKind %12, 15
  br i1 %24, label %then_3, label %else_3
then_3:

;stmt16:

;stmt17:
  %25 = sdiv %Int64 %5, %10
  store %Int64 %25, %Int64* %res
  br label %endif_3
else_3:

;stmt18:
  %26 = icmp eq %ValueKind %12, 16
  br i1 %26, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %27 = srem %Int64 %5, %10
  store %Int64 %27, %Int64* %res
  br label %endif_4
else_4:

;stmt21:
  %28 = icmp eq %ValueKind %12, 17
  br i1 %28, label %then_5, label %else_5
then_5:

;stmt22:

;stmt23:
  %29 = or %Int64 %5, %10
  store %Int64 %29, %Int64* %res
  br label %endif_5
else_5:

;stmt24:
  %30 = icmp eq %ValueKind %12, 18
  br i1 %30, label %then_6, label %else_6
then_6:

;stmt25:

;stmt26:
  %31 = xor %Int64 %5, %10
  store %Int64 %31, %Int64* %res
  br label %endif_6
else_6:

;stmt27:
  %32 = icmp eq %ValueKind %12, 19
  br i1 %32, label %then_7, label %else_7
then_7:

;stmt28:

;stmt29:
  %33 = and %Int64 %5, %10
  store %Int64 %33, %Int64* %res
  br label %endif_7
else_7:

;stmt30:

;stmt31:
  %34 = load %Type*, %Type** @typeBool
  store %Type* %34, %Type** %t

;stmt32:
  %35 = icmp eq %ValueKind %12, 20
  br i1 %35, label %then_8, label %else_8
then_8:

;stmt33:

;stmt34:
  %36 = icmp eq %Int64 %5, %10
  %37 = sext %Bool %36 to %Int64
  store %Int64 %37, %Int64* %res
  br label %endif_8
else_8:

;stmt35:
  %38 = icmp eq %ValueKind %12, 21
  br i1 %38, label %then_9, label %else_9
then_9:

;stmt36:

;stmt37:
  %39 = icmp ne %Int64 %5, %10
  %40 = sext %Bool %39 to %Int64
  store %Int64 %40, %Int64* %res
  br label %endif_9
else_9:

;stmt38:
  %41 = icmp eq %ValueKind %12, 22
  br i1 %41, label %then_10, label %else_10
then_10:

;stmt39:

;stmt40:
  %42 = icmp slt %Int64 %5, %10
  %43 = sext %Bool %42 to %Int64
  store %Int64 %43, %Int64* %res
  br label %endif_10
else_10:

;stmt41:
  %44 = icmp eq %ValueKind %12, 23
  br i1 %44, label %then_11, label %else_11
then_11:

;stmt42:

;stmt43:
  %45 = icmp sgt %Int64 %5, %10
  %46 = sext %Bool %45 to %Int64
  store %Int64 %46, %Int64* %res
  br label %endif_11
else_11:

;stmt44:
  %47 = icmp eq %ValueKind %12, 24
  br i1 %47, label %then_12, label %else_12
then_12:

;stmt45:

;stmt46:
  %48 = icmp sle %Int64 %5, %10
  %49 = sext %Bool %48 to %Int64
  store %Int64 %49, %Int64* %res
  br label %endif_12
else_12:

;stmt47:
  %50 = icmp eq %ValueKind %12, 25
  br i1 %50, label %then_13, label %else_13
then_13:

;stmt48:

;stmt49:
  %51 = icmp sge %Int64 %5, %10
  %52 = sext %Bool %51 to %Int64
  store %Int64 %52, %Int64* %res
  br label %endif_13
else_13:

;stmt50:

;stmt51:
  %53 = load %Str, %Str* @_func220_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %53)
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
  %54 = getelementptr inbounds %Value, %Value* %vx, i32 0, i32 0
  store %ValueKind 2, %ValueKind* %54

;stmt53:
  %55 = getelementptr inbounds %Value, %Value* %vx, i32 0, i32 2
  %56 = load %Int64, %Int64* %res
  store %Int64 %56, %Int64* %55
  ret void
}

define %Value* @shift (%ValueKind %k, %Value* %l, %Value* %r, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %Value* %l to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = bitcast %Value* %r to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = or %Bool %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %retv = alloca %Value*

;stmt4:
  %9 = inttoptr i64 0 to %Value*
  store %Value* %9, %Value** %retv

;stmt5:
  %10 = getelementptr inbounds %Value, %Value* %l, i32 0, i32 0
  %11 = load %ValueKind, %ValueKind* %10
  %12 = icmp eq %ValueKind %11, 2
  %13 = getelementptr inbounds %Value, %Value* %r, i32 0, i32 0
  %14 = load %ValueKind, %ValueKind* %13
  %15 = icmp eq %ValueKind %14, 2
  %16 = and %Bool %12, %15
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %v = alloca %Int64

;stmt8:
  %17 = icmp eq %ValueKind %k, 26
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %18 = getelementptr inbounds %Value, %Value* %l, i32 0, i32 2
  %19 = load %Int64, %Int64* %18
  %20 = getelementptr inbounds %Value, %Value* %r, i32 0, i32 2
  %21 = load %Int64, %Int64* %20
  %22 = shl %Int64 %19, %21
  store %Int64 %22, %Int64* %v
  br label %endif_2
else_2:

;stmt11:
  %23 = icmp eq %ValueKind %k, 27
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt12:

;stmt13:
  %24 = getelementptr inbounds %Value, %Value* %l, i32 0, i32 2
  %25 = load %Int64, %Int64* %24
  %26 = getelementptr inbounds %Value, %Value* %r, i32 0, i32 2
  %27 = load %Int64, %Int64* %26
  %28 = ashr %Int64 %25, %27
  store %Int64 %28, %Int64* %v
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:

;stmt14:
  %29 = getelementptr inbounds %Value, %Value* %l, i32 0, i32 1
  %30 = load %Type*, %Type** %29
  %31 = load %Int64, %Int64* %v
  %32 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %30, %Int64 %31, %TokenInfo* %ti)
  store %Value* %32, %Value** %retv
  br label %endif_1
else_1:

;stmt15:

;stmt16:
  %33 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind %k, %TokenInfo* %ti)
  store %Value* %33, %Value** %retv

;stmt17:
  %34 = load %Value*, %Value** %retv
  %35 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 6
  %36 = getelementptr inbounds %ValueBin, %ValueBin* %35, i32 0, i32 0
  store %Value* %l, %Value** %36

;stmt18:
  %37 = load %Value*, %Value** %retv
  %38 = getelementptr inbounds %Value, %Value* %37, i32 0, i32 6
  %39 = getelementptr inbounds %ValueBin, %ValueBin* %38, i32 0, i32 1
  store %Value* %r, %Value** %39
  br label %endif_1
endif_1:

;stmt19:
  %40 = load %Value*, %Value** %retv
  ret %Value* %40

;stmt20:
  br label %fail
fail:

;stmt21:
  %42 = inttoptr i64 0 to %Value*
  ret %Value* %42
}

define %Type* @checkValueShift (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %2 = getelementptr inbounds %ValueBin, %ValueBin* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2

;stmt1:
  %4 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %5 = getelementptr inbounds %ValueBin, %ValueBin* %4, i32 0, i32 1
  %6 = load %Value*, %Value** %5

;stmt2:
  %7 = call %Type* (%Value*) @checkValue (%Value* %3)

;stmt3:
  %8 = call %Type* (%Value*) @checkValue (%Value* %6)

;stmt4:
  %9 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %10 = getelementptr inbounds %ValueBin, %ValueBin* %9, i32 0, i32 1
  %11 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 15
  %14 = load %TokenInfo*, %TokenInfo** %13
  %15 = call %Value* (%Value*, %Type*, %TokenInfo*) @cast (%Value* %6, %Type* %12, %TokenInfo* %14)
  store %Value* %15, %Value** %10

;stmt5:
  %16 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %17 = getelementptr inbounds %ValueBin, %ValueBin* %16, i32 0, i32 1
  %18 = load %Value*, %Value** %17

;stmt6:
  %19 = call %Type* (%Value*) @checkValue (%Value* %18)

;stmt7:
  %20 = load %Type*, %Type** @typeBaseInt
  %21 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %3, %Type* %20)

;stmt8:
  %22 = load %Type*, %Type** @typeBaseInt
  %23 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %18, %Type* %22)

;stmt9:
  %24 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 1
  %25 = load %Type*, %Type** %24
  ret %Type* %25
}

define %Value* @indx (%Value* %a, %Value* %i, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %Value* %a to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = bitcast %Value* %i to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = or %Bool %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 29, %TokenInfo* %ti)

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 7
  %11 = getelementptr inbounds %ValueIndex, %ValueIndex* %10, i32 0, i32 0
  store %Value* %a, %Value** %11

;stmt5:
  %12 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 7
  %13 = getelementptr inbounds %ValueIndex, %ValueIndex* %12, i32 0, i32 1
  store %Value* %i, %Value** %13

;stmt6:
  ret %Value* %9

;stmt7:
  br label %fail
fail:

;stmt8:
  %15 = inttoptr i64 0 to %Value*
  ret %Value* %15
}

define %Type* @checkValueIndex (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 7
  %2 = getelementptr inbounds %ValueIndex, %ValueIndex* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2

;stmt1:
  %4 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 7
  %5 = getelementptr inbounds %ValueIndex, %ValueIndex* %4, i32 0, i32 1
  %6 = load %Value*, %Value** %5

;stmt2:
  %7 = call %Type* (%Value*) @checkValue (%Value* %3)

;stmt3:
  %8 = call %Type* (%Value*) @checkValue (%Value* %6)

;stmt4:
  %9 = load %Type*, %Type** @typeBaseInt
  %10 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %3, %Type* %9)

;stmt5:
  %11 = load %Type*, %Type** @typeBaseInt
  %12 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %6, %Type* %11)

;stmt6:
  %13 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i32 0, i32 8
  %16 = getelementptr inbounds %TypeArray, %TypeArray* %15, i32 0, i32 0
  %17 = load %Type*, %Type** %16
  ret %Type* %17
}

define %Value* @access (%Value* %r, %Str %fid, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %Value* %r to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = bitcast %Str %fid to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = or %Bool %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 30, %TokenInfo* %ti)

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 8
  %11 = getelementptr inbounds %ValueAccess, %ValueAccess* %10, i32 0, i32 0
  store %Value* %r, %Value** %11

;stmt5:
  %12 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 8
  %13 = getelementptr inbounds %ValueAccess, %ValueAccess* %12, i32 0, i32 1
  store %Str %fid, %Str* %13

;stmt6:
  ret %Value* %9

;stmt7:
  br label %fail
fail:

;stmt8:
  %15 = inttoptr i64 0 to %Value*
  ret %Value* %15
}

define %Type* @checkValueAccess (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 8
  %2 = getelementptr inbounds %ValueAccess, %ValueAccess* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2

;stmt1:
  %4 = call %Type* (%Value*) @checkValue (%Value* %3)

;stmt2:
  %record_type = alloca %Type*

;stmt3:
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  %7 = icmp eq %TypeKind %6, 6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %8 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 7
  %9 = getelementptr inbounds %TypePointer, %TypePointer* %8, i32 0, i32 0
  %10 = load %Type*, %Type** %9
  store %Type* %10, %Type** %record_type
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  store %Type* %4, %Type** %record_type
  br label %endif_0
endif_0:

;stmt8:
  %11 = load %Type*, %Type** %record_type
  %12 = getelementptr inbounds %Type, %Type* %11, i32 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 5
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %15 = load %Str, %Str* @_func226_str1
  %16 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %17 = load %TokenInfo*, %TokenInfo** %16
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %17)

;stmt11:
  %18 = inttoptr i64 0 to %Type*
  ret %Type* %18
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %20 = load %Type*, %Type** %record_type
  %21 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 8
  %22 = getelementptr inbounds %ValueAccess, %ValueAccess* %21, i32 0, i32 1
  %23 = load %Str, %Str* %22
  %24 = call %Field* (%Type*, %Str) @type_record_get_field (%Type* %20, %Str %23)

;stmt13:
  %25 = bitcast %Field* %24 to %Unit*
  %26 = inttoptr i64 0 to %Unit*
  %27 = icmp eq %Unit* %25, %26
  br i1 %27, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %28 = load %Str, %Str* @_func226_str2
  %29 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %30 = load %TokenInfo*, %TokenInfo** %29
  call void (%Str, %TokenInfo*) @error (%Str %28, %TokenInfo* %30)

;stmt16:
  %31 = inttoptr i64 0 to %Type*
  ret %Type* %31
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt17:
  %33 = getelementptr inbounds %Field, %Field* %24, i32 0, i32 1
  %34 = load %Type*, %Type** %33
  ret %Type* %34
}

define %Value* @call (%Value* %f, %List* %a, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %Value* %f to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = bitcast %List* %a to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = or %Bool %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 28, %TokenInfo* %ti)

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 10
  %11 = getelementptr inbounds %ValueCall, %ValueCall* %10, i32 0, i32 0
  store %Value* %f, %Value** %11

;stmt5:
  %12 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 10
  %13 = getelementptr inbounds %ValueCall, %ValueCall* %12, i32 0, i32 1
  store %List* %a, %List** %13

;stmt6:
  ret %Value* %9

;stmt7:
  br label %fail
fail:

;stmt8:
  %15 = inttoptr i64 0 to %Value*
  ret %Value* %15
}

define %Type* @checkValueCall (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 10
  %2 = getelementptr inbounds %ValueCall, %ValueCall* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2

;stmt1:
  %4 = call %Type* (%Value*) @checkValue (%Value* %3)

;stmt2:
  %5 = bitcast %Type* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp eq %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = load %Str, %Str* @_func228_str1
  %9 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 15
  %10 = load %TokenInfo*, %TokenInfo** %9
  call void (%Str, %TokenInfo*) @error (%Str %8, %TokenInfo* %10)

;stmt5:
  %11 = inttoptr i64 0 to %Type*
  ret %Type* %11
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %13 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %14 = load %TypeKind, %TypeKind* %13
  %15 = icmp ne %TypeKind %14, 3
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %16 = load %Str, %Str* @_func228_str2
  %17 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %18 = load %TokenInfo*, %TokenInfo** %17
  call void (%Str, %TokenInfo*) @error (%Str %16, %TokenInfo* %18)

;stmt9:
  %19 = inttoptr i64 0 to %Type*
  ret %Type* %19
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %21 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 10
  %22 = getelementptr inbounds %ValueCall, %ValueCall* %21, i32 0, i32 1
  %23 = load %List*, %List** %22
  %24 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Bool (%Value*, %List*, %TokenInfo*) @checkParams (%Value* %3, %List* %23, %TokenInfo* %25)

;stmt11:
  %27 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 6
  %28 = getelementptr inbounds %TypeFunc, %TypeFunc* %27, i32 0, i32 1
  %29 = load %Type*, %Type** %28

;stmt12:
  ret %Type* %29
}

define %Bool @checkParams (%Value* %f, %List* %a, %TokenInfo* %ti) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %f, i32 0, i32 1
  %2 = load %Type*, %Type** %1
  %3 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 6
  %4 = getelementptr inbounds %TypeFunc, %TypeFunc* %3, i32 0, i32 0
  %5 = load %List*, %List** %4

;stmt1:
  %6 = getelementptr inbounds %List, %List* %a, i32 0, i32 2
  %7 = load %Nat64, %Nat64* %6
  %8 = getelementptr inbounds %List, %List* %5, i32 0, i32 2
  %9 = load %Nat64, %Nat64* %8
  %10 = icmp ult %Nat64 %7, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %11 = load %Str, %Str* @_func229_str1
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %ti)

;stmt4:
  ret %Bool 0
  br label %endif_0
else_0:

;stmt5:
  %13 = getelementptr inbounds %List, %List* %5, i32 0, i32 2
  %14 = load %Nat64, %Nat64* %13
  %15 = getelementptr inbounds %List, %List* %a, i32 0, i32 2
  %16 = load %Nat64, %Nat64* %15
  %17 = icmp ult %Nat64 %14, %16
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %18 = getelementptr inbounds %Value, %Value* %f, i32 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = getelementptr inbounds %Type, %Type* %19, i32 0, i32 6
  %21 = getelementptr inbounds %TypeFunc, %TypeFunc* %20, i32 0, i32 2
  %22 = load %Bool, %Bool* %21
  %23 = xor %Bool %22, 1
  br i1 %23, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %24 = load %Str, %Str* @_func229_str2
  call void (%Str, %TokenInfo*) @error (%Str %24, %TokenInfo* %ti)
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
  %25 = getelementptr inbounds %List, %List* %5, i32 0, i32 0
  %26 = load %Node*, %Node** %25
  store %Node* %26, %Node** %pln

;stmt13:
  %27 = getelementptr inbounds %List, %List* %a, i32 0, i32 0
  %28 = load %Node*, %Node** %27
  store %Node* %28, %Node** %aln

;stmt14:
  br label %continue_0
continue_0:
  %29 = load %Node*, %Node** %pln
  %30 = bitcast %Node* %29 to %Unit*
  %31 = inttoptr i64 0 to %Unit*
  %32 = icmp ne %Unit* %30, %31
  br i1 %32, label %body_0, label %break_0
body_0:

;stmt15:

;stmt16:
  %33 = load %Node*, %Node** %pln
  %34 = getelementptr inbounds %Node, %Node* %33, i32 0, i32 3
  %35 = load %Unit*, %Unit** %34
  %36 = bitcast %Unit* %35 to %Field*

;stmt17:
  %37 = load %Node*, %Node** %aln
  %38 = getelementptr inbounds %Node, %Node* %37, i32 0, i32 3
  %39 = load %Unit*, %Unit** %38
  %40 = bitcast %Unit* %39 to %Value*

;stmt18:
  %41 = call %Type* (%Value*) @checkValue (%Value* %40)

;stmt19:
  %42 = getelementptr inbounds %Field, %Field* %36, i32 0, i32 1
  %43 = load %Type*, %Type** %42
  %44 = call %Value* (%Value*, %Type*) @nat (%Value* %40, %Type* %43)

;stmt20:
  %45 = getelementptr inbounds %Field, %Field* %36, i32 0, i32 1
  %46 = load %Type*, %Type** %45
  %47 = getelementptr inbounds %Value, %Value* %44, i32 0, i32 1
  %48 = load %Type*, %Type** %47
  %49 = call %Bool (%Type*, %Type*) @type_eq (%Type* %46, %Type* %48)
  %50 = xor %Bool %49, 1
  br i1 %50, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  %51 = load %Str, %Str* @_func229_str3
  call void (%Str, %TokenInfo*) @error (%Str %51, %TokenInfo* %ti)

;stmt23:
  %52 = load %Str, %Str* @_func229_str4
  %53 = call %Int32 (%Str, ...) @printf (%Str %52)

;stmt24:
  %54 = getelementptr inbounds %Value, %Value* %44, i32 0, i32 1
  %55 = load %Type*, %Type** %54
  call void (%Type*) @prttype (%Type* %55)

;stmt25:
  %56 = load %Str, %Str* @_func229_str5
  %57 = call %Int32 (%Str, ...) @printf (%Str %56)

;stmt26:
  %58 = load %Str, %Str* @_func229_str6
  %59 = call %Int32 (%Str, ...) @printf (%Str %58)

;stmt27:
  %60 = getelementptr inbounds %Field, %Field* %36, i32 0, i32 1
  %61 = load %Type*, %Type** %60
  call void (%Type*) @prttype (%Type* %61)

;stmt28:
  %62 = load %Str, %Str* @_func229_str7
  %63 = call %Int32 (%Str, ...) @printf (%Str %62)

;stmt29:
  br label %nextarg
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt30:
  %65 = bitcast %Value* %40 to %Unit*
  %66 = bitcast %Value* %44 to %Unit*
  %67 = call %Bool (%List*, %Unit*, %Unit*) @list_subst (%List* %a, %Unit* %65, %Unit* %66)

;stmt31:
  br label %nextarg
nextarg:

;stmt32:
  %68 = load %Node*, %Node** %aln
  %69 = getelementptr inbounds %Node, %Node* %68, i32 0, i32 1
  %70 = load %Node*, %Node** %69
  store %Node* %70, %Node** %aln

;stmt33:
  %71 = load %Node*, %Node** %pln
  %72 = getelementptr inbounds %Node, %Node* %71, i32 0, i32 1
  %73 = load %Node*, %Node** %72
  store %Node* %73, %Node** %pln
  br label %continue_0
break_0:

;stmt34:
  br label %continue_1
continue_1:
  %74 = load %Node*, %Node** %aln
  %75 = bitcast %Node* %74 to %Unit*
  %76 = inttoptr i64 0 to %Unit*
  %77 = icmp ne %Unit* %75, %76
  br i1 %77, label %body_1, label %break_1
body_1:

;stmt35:

;stmt36:
  %78 = load %Node*, %Node** %aln
  %79 = getelementptr inbounds %Node, %Node* %78, i32 0, i32 3
  %80 = load %Unit*, %Unit** %79
  %81 = bitcast %Unit* %80 to %Value*

;stmt37:
  %82 = call %Type* (%Value*) @checkValue (%Value* %81)

;stmt38:
  %83 = load %Type*, %Type** @typeBaseInt
  %84 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %81, %Type* %83)

;stmt39:
  %85 = bitcast %Value* %81 to %Unit*
  %86 = bitcast %Value* %84 to %Unit*
  %87 = call %Bool (%List*, %Unit*, %Unit*) @list_subst (%List* %a, %Unit* %85, %Unit* %86)

;stmt40:
  %88 = load %Node*, %Node** %aln
  %89 = getelementptr inbounds %Node, %Node* %88, i32 0, i32 1
  %90 = load %Node*, %Node** %89
  store %Node* %90, %Node** %aln
  br label %continue_1
break_1:

;stmt41:
  ret %Bool 1
}

define %Bool @immCastIsPossible (%Value* %v, %Type* %t) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %2 = load %ValueKind, %ValueKind* %1
  %3 = icmp eq %ValueKind %2, 2
  br i1 %3, label %then_0, label %else_0
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

define %Value* @cast (%Value* %v, %Type* %t, %TokenInfo* %ti) {

;stmt0:
  %1 = bitcast %Value* %v to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  %4 = bitcast %Type* %t to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  %7 = or %Bool %3, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %9 = call %Bool (%Value*, %Type*) @immCastIsPossible (%Value* %v, %Type* %t)
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %10 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 2
  %11 = load %Int64, %Int64* %10
  %12 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %t, %Int64 %11, %TokenInfo* %ti)
  ret %Value* %12
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %14 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 31, %TokenInfo* %ti)

;stmt7:
  %15 = getelementptr inbounds %Value, %Value* %14, i32 0, i32 9
  %16 = getelementptr inbounds %ValueCast, %ValueCast* %15, i32 0, i32 0
  store %Value* %v, %Value** %16

;stmt8:
  %17 = getelementptr inbounds %Value, %Value* %14, i32 0, i32 9
  %18 = getelementptr inbounds %ValueCast, %ValueCast* %17, i32 0, i32 1
  store %Type* %t, %Type** %18

;stmt9:
  ret %Value* %14

;stmt10:
  br label %fail
fail:

;stmt11:
  %20 = inttoptr i64 0 to %Value*
  ret %Value* %20
}

define %Type* @checkValueCast (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 9
  %2 = getelementptr inbounds %ValueCast, %ValueCast* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %Type* (%Value*) @checkValue (%Value* %3)

;stmt1:
  %5 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 9
  %6 = getelementptr inbounds %ValueCast, %ValueCast* %5, i32 0, i32 1
  %7 = load %Type*, %Type** %6

;stmt2:
  ret %Type* %7
}

define %Value* @size_of (%Type* %t, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 32, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 11
  store %Type* %t, %Type** %2

;stmt2:
  ret %Value* %1
}

define %Type* @checkValueSizeof (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 11
  %2 = load %Type*, %Type** %1

;stmt1:
  %3 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = icmp eq %TypeKind %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Str, %Str* @_func234_str1
  %7 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %8 = load %TokenInfo*, %TokenInfo** %7
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %9 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  store %ValueKind 2, %ValueKind* %9

;stmt5:
  %10 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %11 = call %Type* (%TypeKind) @type_new (%TypeKind 1)
  store %Type* %11, %Type** %10

;stmt6:
  %12 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 2
  %13 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 2
  %14 = load %Nat32, %Nat32* %13
  %15 = sext %Nat32 %14 to %Int64
  store %Int64 %15, %Int64* %12

;stmt7:
  %16 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %17 = load %Type*, %Type** %16
  ret %Type* %17
}

define %Value* @align_of (%Type* %t, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 33, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 11
  store %Type* %t, %Type** %2

;stmt2:
  ret %Value* %1
}

define %Type* @checkValueAlignof (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 11
  %2 = load %Type*, %Type** %1

;stmt1:
  %3 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 0
  %4 = load %TypeKind, %TypeKind* %3
  %5 = icmp eq %TypeKind %4, 0
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Str, %Str* @_func236_str1
  %7 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 15
  %8 = load %TokenInfo*, %TokenInfo** %7
  call void (%Str, %TokenInfo*) @error (%Str %6, %TokenInfo* %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %9 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  store %ValueKind 2, %ValueKind* %9

;stmt5:
  %10 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %11 = call %Type* (%TypeKind) @type_new (%TypeKind 1)
  store %Type* %11, %Type** %10

;stmt6:
  %12 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 2
  %13 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 4
  %14 = load %Nat8, %Nat8* %13
  %15 = sext %Nat8 %14 to %Int64
  store %Int64 %15, %Int64* %12

;stmt7:
  %16 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %17 = load %Type*, %Type** %16
  ret %Type* %17
}

define void @value_init () {

;stmt0:
  %1 = load %Type*, %Type** @typeBool
  %2 = inttoptr i64 0 to %TokenInfo*
  %3 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %1, %Int64 0, %TokenInfo* %2)

;stmt1:
  %4 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  %5 = load %Str, %Str* @_func237_str1
  %6 = bitcast %Value* %3 to %Unit*
  %7 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %5, %Unit* %6)

;stmt2:
  %8 = load %Type*, %Type** @typeBool
  %9 = inttoptr i64 0 to %TokenInfo*
  %10 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %8, %Int64 1, %TokenInfo* %9)

;stmt3:
  %11 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  %12 = load %Str, %Str* @_func237_str2
  %13 = bitcast %Value* %10 to %Unit*
  %14 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %11, %Str %12, %Unit* %13)

;stmt4:
  %15 = load %Type*, %Type** @typeUnit
  %16 = inttoptr i64 0 to %TokenInfo*
  %17 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %15, %Int64 1, %TokenInfo* %16)

;stmt5:
  %18 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  %19 = load %Str, %Str* @_func237_str3
  %20 = bitcast %Value* %17 to %Unit*
  %21 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %18, %Str %19, %Unit* %20)

;stmt6:
  %22 = load %Type*, %Type** @typeFreePtr
  %23 = inttoptr i64 0 to %TokenInfo*
  %24 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %22, %Int64 0, %TokenInfo* %23)

;stmt7:
  %25 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  %26 = load %Str, %Str* @_func237_str4
  %27 = bitcast %Value* %24 to %Unit*
  %28 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %25, %Str %26, %Unit* %27)
  ret void
}

define %Value* @valueNew (%ValueKind %k, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 168)
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @_func238_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Value* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 168)

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 0
  store %ValueKind %k, %ValueKind* %9

;stmt4:
  %10 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 15
  store %TokenInfo* %ti, %TokenInfo** %10

;stmt5:
  ret %Value* %2
}

define %Value* @valueNewImm (%Type* %t, %Int64 %dx, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 2, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1
  store %Type* %t, %Type** %2

;stmt2:
  %3 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2
  store %Int64 %dx, %Int64* %3

;stmt3:
  ret %Value* %1
}

define %Bool @isUnaryOpKind (%ValueKind %k) {

;stmt0:
  %1 = icmp eq %ValueKind %k, 8
  %2 = icmp eq %ValueKind %k, 9
  %3 = icmp eq %ValueKind %k, 11
  %4 = icmp eq %ValueKind %k, 10
  %5 = or %Bool %3, %4
  %6 = or %Bool %2, %5
  %7 = or %Bool %1, %6
  ret %Bool %7
}

define %Bool @isBinaryOpKind (%ValueKind %k) {

;stmt0:
  %1 = icmp eq %ValueKind %k, 12
  %2 = icmp eq %ValueKind %k, 13
  %3 = icmp eq %ValueKind %k, 14
  %4 = icmp eq %ValueKind %k, 15
  %5 = icmp eq %ValueKind %k, 16
  %6 = icmp eq %ValueKind %k, 19
  %7 = icmp eq %ValueKind %k, 17
  %8 = icmp eq %ValueKind %k, 18
  %9 = call %Bool (%ValueKind) @isReletionOpKind (%ValueKind %k)
  %10 = or %Bool %8, %9
  %11 = or %Bool %7, %10
  %12 = or %Bool %6, %11
  %13 = or %Bool %5, %12
  %14 = or %Bool %4, %13
  %15 = or %Bool %3, %14
  %16 = or %Bool %2, %15
  %17 = or %Bool %1, %16
  ret %Bool %17
}

define %Bool @isReletionOpKind (%ValueKind %k) {

;stmt0:
  %1 = icmp eq %ValueKind %k, 20
  %2 = icmp eq %ValueKind %k, 21
  %3 = icmp eq %ValueKind %k, 22
  %4 = icmp eq %ValueKind %k, 23
  %5 = icmp eq %ValueKind %k, 24
  %6 = icmp eq %ValueKind %k, 25
  %7 = or %Bool %5, %6
  %8 = or %Bool %4, %7
  %9 = or %Bool %3, %8
  %10 = or %Bool %2, %9
  %11 = or %Bool %1, %10
  ret %Bool %11
}

define %Bool @valueIsReadonly (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %2 = load %ValueKind, %ValueKind* %1

;stmt1:
  %3 = icmp eq %ValueKind %2, 3
  %4 = icmp eq %ValueKind %2, 2
  %5 = icmp eq %ValueKind %2, 7
  %6 = icmp eq %ValueKind %2, 4
  %7 = or %Bool %5, %6
  %8 = or %Bool %4, %7
  %9 = or %Bool %3, %8
  ret %Bool %9
}

define %Bool @valueIsMutable (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %2 = load %ValueKind, %ValueKind* %1

;stmt1:
  %3 = icmp eq %ValueKind %2, 5
  %4 = icmp eq %ValueKind %2, 6
  %5 = or %Bool %3, %4
  ret %Bool %5
}

define void @comment (%Str %c) {
  ret void
}

define void @parse (%Source* %src) {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %2 = load %Source*, %Source** %1

;stmt1:
  %3 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  store %Source* %src, %Source** %3

;stmt2:
  store %Bool 1, %Bool* @comments

;stmt3:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt4:

;stmt5:
  call void () @skip_nl ()

;stmt6:
  %4 = call %Token* () @ctok ()

;stmt7:
  %5 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 0
  %6 = load %TokenType, %TokenType* %5
  %7 = icmp eq %TokenType %6, 6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  %8 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 2
  %9 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %8, i32 0, %Int32 0
  %10 = bitcast %Nat8* %9 to %Str
  call void (%Str) @comment (%Str %10)

;stmt10:
  call void () @skip ()
  br label %endif_0
else_0:

;stmt11:
  %11 = load %Str, %Str* @_func246_str1
  %12 = call %Bool (%Str) @match (%Str %11)
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  call void () @parseImport ()
  br label %endif_1
else_1:

;stmt14:

;stmt15:
  br label %break_0
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:
  br label %continue_0
break_0:

;stmt16:
  store %Bool 0, %Bool* @comments

;stmt17:
  %14 = load %Str, %Str* @_func246_str2
  call void (%Str, %Nat64) @set (%Str %14, %Nat64 0)

;stmt18:
  br label %continue_1
continue_1:
  br i1 1, label %body_1, label %break_1
body_1:

;stmt19:

;stmt20:
  call void () @skip_nl ()

;stmt21:
  %15 = call %Token* () @ctok ()

;stmt22:
  %16 = load %Str, %Str* @_func246_str3
  %17 = call %Bool (%Str) @match (%Str %16)
  br i1 %17, label %then_2, label %else_2
then_2:

;stmt23:

;stmt24:
  %18 = call %Stmt* () @parseLet ()
  br label %endif_2
else_2:

;stmt25:
  %19 = load %Str, %Str* @_func246_str4
  %20 = call %Bool (%Str) @match (%Str %19)
  br i1 %20, label %then_3, label %else_3
then_3:

;stmt26:

;stmt27:
  call void () @parseTypedef ()
  br label %endif_3
else_3:

;stmt28:
  %21 = load %Str, %Str* @_func246_str5
  %22 = call %Bool (%Str) @match (%Str %21)
  br i1 %22, label %then_4, label %else_4
then_4:

;stmt29:

;stmt30:
  call void () @parseExtern ()
  br label %endif_4
else_4:

;stmt31:
  %23 = load %Str, %Str* @_func246_str6
  %24 = call %Bool (%Str) @match (%Str %23)
  br i1 %24, label %then_5, label %else_5
then_5:

;stmt32:

;stmt33:
  call void () @parseVardef ()
  br label %endif_5
else_5:

;stmt34:

;stmt35:
  %25 = load %Str, %Str* @_func246_str7
  %26 = call %Bool (%Str) @match (%Str %25)
  br i1 %26, label %then_6, label %else_6
then_6:

;stmt36:

;stmt37:
  %27 = load %Str, %Str* @_func246_str8
  call void (%Str, %Nat64) @set (%Str %27, %Nat64 1)

;stmt38:
  br label %continue_1
  br label %endif_6
else_6:
  br label %endif_6
endif_6:

;stmt39:
  %29 = load %Str, %Str* @_func246_str9
  %30 = call %Bool (%Str) @match (%Str %29)
  br i1 %30, label %then_7, label %else_7
then_7:

;stmt40:

;stmt41:
  br label %continue_1
  br label %endif_7
else_7:
  br label %endif_7
endif_7:

;stmt42:
  %32 = call %Bool () @eof ()
  br i1 %32, label %then_8, label %else_8
then_8:

;stmt43:

;stmt44:
  br label %break_1
  br label %endif_8
else_8:
  br label %endif_8
endif_8:

;stmt45:
  br label %continue_2
continue_2:
  br i1 1, label %body_2, label %break_2
body_2:

;stmt46:

;stmt47:
  %34 = call %Token* () @ctok ()

;stmt48:
  %35 = getelementptr inbounds %Token, %Token* %34, i32 0, i32 0
  %36 = load %TokenType, %TokenType* %35
  %37 = icmp eq %TokenType %36, 1
  br i1 %37, label %then_9, label %else_9
then_9:

;stmt49:

;stmt50:
  %38 = load %Str, %Str* @_func246_str10
  %39 = getelementptr inbounds %Token, %Token* %34, i32 0, i32 2
  %40 = bitcast [0 x %Nat8]* %39 to %Str
  %41 = call %Int32 (%Str, %Str) @strcmp (%Str %38, %Str %40)
  %42 = icmp eq %Int32 %41, 0
  %43 = load %Str, %Str* @_func246_str11
  %44 = getelementptr inbounds %Token, %Token* %34, i32 0, i32 2
  %45 = bitcast [0 x %Nat8]* %44 to %Str
  %46 = call %Int32 (%Str, %Str) @strcmp (%Str %43, %Str %45)
  %47 = icmp eq %Int32 %46, 0
  %48 = load %Str, %Str* @_func246_str12
  %49 = getelementptr inbounds %Token, %Token* %34, i32 0, i32 2
  %50 = bitcast [0 x %Nat8]* %49 to %Str
  %51 = call %Int32 (%Str, %Str) @strcmp (%Str %48, %Str %50)
  %52 = icmp eq %Int32 %51, 0
  %53 = or %Bool %47, %52
  %54 = or %Bool %42, %53
  br i1 %54, label %then_10, label %else_10
then_10:

;stmt51:

;stmt52:
  br label %break_2
  br label %endif_10
else_10:
  br label %endif_10
endif_10:
  br label %endif_9
else_9:

;stmt53:
  %56 = getelementptr inbounds %Token, %Token* %34, i32 0, i32 0
  %57 = load %TokenType, %TokenType* %56
  %58 = icmp eq %TokenType %57, 0
  br i1 %58, label %then_11, label %else_11
then_11:

;stmt54:

;stmt55:
  br label %break_2
  br label %endif_11
else_11:
  br label %endif_11
endif_11:
  br label %endif_9
endif_9:

;stmt56:
  call void () @skip ()
  br label %continue_2
break_2:
  br label %endif_5
endif_5:
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:

;stmt57:
  %60 = load %Str, %Str* @_func246_str13
  call void (%Str, %Nat64) @set (%Str %60, %Nat64 0)
  br label %continue_1
break_1:

;stmt58:
  %61 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  store %Source* %2, %Source** %61
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
  %5 = load %Str, %Str* @_func247_str1
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
  %14 = call %Str (%Nat32) @str_new (%Nat32 512)

;stmt8:
  %15 = call %Str (%Str, %Nat32) @getcwd (%Str %14, %Nat32 512)

;stmt9:
  %16 = call %Source* (%Str) @source_open (%Str %13)

;stmt10:
  %17 = bitcast %Source* %16 to %Unit*
  %18 = inttoptr i64 0 to %Unit*
  %19 = icmp eq %Unit* %17, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %20 = load %Str, %Str* @_func247_str2
  %21 = call %Int32 (%Str, ...) @printf (%Str %20, %Str %13)

;stmt13:
  %22 = load %Str, %Str* @_func247_str3
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
ret void

;stmt17:
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
  %6 = load %Str, %Str* @_func248_str1
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
  %22 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1
  call void (%List*, %Str, %Type*) @add_type (%List* %22, %Str %1, %Type* %8)

;stmt15:
  %23 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %24 = call %AssemblyItem* (%Assembly*, %Str, %Type*) @asmTypedefAdd (%Assembly* %23, %Str %1, %Type* %8)
  ret void
}

define %Stmt* @parseLet () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Str () @parseId ()

;stmt2:
  %4 = load %Str, %Str* @_func249_str1
  %5 = call %Bool (%Str) @need (%Str %4)

;stmt3:
  %6 = call %Value* () @expr ()

;stmt4:
  %7 = bitcast %Str %3 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp eq %Unit* %7, %8
  %10 = bitcast %Value* %6 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp eq %Unit* %10, %11
  %13 = or %Bool %9, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %14 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %14
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  call void (%Value*, %Str) @rename (%Value* %6, %Str %3)

;stmt8:
  %16 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 14
  store %TokenInfo* %2, %TokenInfo** %16

;stmt9:
  %17 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %18 = load %Value*, %Value** %17
  %19 = bitcast %Value* %18 to %Unit*
  %20 = inttoptr i64 0 to %Unit*
  %21 = icmp eq %Unit* %19, %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  call void (%Str, %Value*, %TokenInfo*) @def_global (%Str %3, %Value* %6, %TokenInfo* %2)

;stmt12:
  %22 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %22
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt13:
  %24 = call %Bool (%Value*) @valueIsReadonly (%Value* %6)
  %25 = xor %Bool %24, 1
  %26 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 0
  %27 = load %ValueKind, %ValueKind* %26
  %28 = icmp eq %ValueKind %27, 1
  %29 = or %Bool %25, %28
  br i1 %29, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %30 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 7, %TokenInfo* %2)

;stmt16:
  %31 = getelementptr inbounds %Value, %Value* %30, i32 0, i32 4
  store %Str %3, %Str* %31

;stmt17:
  call void (%Str, %Value*) @bind_value_local (%Str %3, %Value* %30)

;stmt18:
  %32 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @stmt_new_let (%Value* %6, %Value* %30, %TokenInfo* %2)
  ret %Stmt* %32
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt19:
  %34 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %35 = load %Block*, %Block** %34
  call void (%Block*, %Str, %Value*) @bind_value_in_block (%Block* %35, %Str %3, %Value* %6)

;stmt20:
  %36 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %36
}

define void @handle_fields (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*

;stmt1:
  %2 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 0
  %3 = load %Str, %Str* %2

;stmt2:
  %4 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 1
  %5 = load %Type*, %Type** %4

;stmt3:
  %6 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %7 = load %Value*, %Value** %6
  %8 = bitcast %Value* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %11 = inttoptr i64 0 to %Value*
  %12 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 3
  %13 = load %TokenInfo*, %TokenInfo** %12
  %14 = call %Value* (%Str, %Type*, %Value*, %TokenInfo*) @create_local_var (%Str %3, %Type* %5, %Value* %11, %TokenInfo* %13)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %15 = inttoptr i64 0 to %Value*
  %16 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 3
  %17 = load %TokenInfo*, %TokenInfo** %16
  call void (%Str, %Type*, %Value*, %TokenInfo*) @create_global_var (%Str %3, %Type* %5, %Value* %15, %TokenInfo* %17)
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

define void @extern_decl (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*

;stmt1:
  %2 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 0
  %3 = load %Str, %Str* %2
  %4 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 1
  %5 = load %Type*, %Type** %4
  %6 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 3
  %7 = load %TokenInfo*, %TokenInfo** %6
  call void (%Str, %Type*, %TokenInfo*) @declare (%Str %3, %Type* %5, %TokenInfo* %7)
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
  %5 = load %Str, %Str* @_func254_str1
  %6 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)

;stmt4:
  %7 = load %Str, %Str* @_func254_str2
  %8 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %9 = load %TokenType, %TokenType* %8
  %10 = call %Int32 (%Str, ...) @printf (%Str %7, %TokenType %9)

;stmt5:
  %11 = load %Str, %Str* @_func254_str3
  %12 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2
  %13 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %12, i32 0, %Int32 0
  %14 = load %Nat8, %Nat8* %13
  %15 = call %Int32 (%Str, ...) @printf (%Str %11, %Nat8 %14)

;stmt6:
  %16 = load %Str, %Str* @_func254_str4
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

define void @set_type (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*

;stmt1:
  %2 = bitcast %Unit* %ctx to %Type*

;stmt2:
  %3 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 1
  store %Type* %2, %Type** %3
  ret void
}

define %List* @parseField () {

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
  %9 = load %Str, %Str* @_func255_str1
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
  %13 = load %Str, %Str* @_func255_str2
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

define %Value* @create_local_var (%Str %id, %Type* %t, %Value* %init_value, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 5, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1
  store %Type* %t, %Type** %2

;stmt2:
  %3 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 4
  store %Str %id, %Str* %3

;stmt3:
  call void (%Str, %Value*) @bind_value_local (%Str %id, %Value* %1)

;stmt4:
  %4 = inttoptr i64 0 to %TokenInfo*
  %5 = call %Stmt* (%Str, %Type*, %Value*, %TokenInfo*) @stmt_new_vardef (%Str %id, %Type* %t, %Value* %init_value, %TokenInfo* %4)
  call void (%Stmt*) @stmtAdd (%Stmt* %5)

;stmt5:
  %6 = bitcast %Value* %init_value to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %9 = inttoptr i64 0 to %TokenInfo*
  %10 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @stmt_new_assign (%Value* %1, %Value* %init_value, %TokenInfo* %9)
  call void (%Stmt*) @stmtAdd (%Stmt* %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  ret %Value* %1
}

define void @create_global_var (%Str %id, %Type* %t, %Value* %init_value, %TokenInfo* %ti) {

;stmt0:
  %1 = call %Value* (%ValueKind, %TokenInfo*) @valueNew (%ValueKind 6, %TokenInfo* %ti)

;stmt1:
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 12
  %3 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %4 = call %AssemblyItem* (%Assembly*, %Str, %Type*, %Value*) @asmVarAdd (%Assembly* %3, %Str %id, %Type* %t, %Value* %init_value)
  store %AssemblyItem* %4, %AssemblyItem** %2

;stmt2:
  %5 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1
  store %Type* %t, %Type** %5

;stmt3:
  %6 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 4
  store %Str %id, %Str* %6

;stmt4:
  call void (%Str, %Value*) @bind_value_global (%Str %id, %Value* %1)
  ret void
}

define %Node* @gett () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %2 = load %Source*, %Source** %1
  %3 = getelementptr inbounds %Source, %Source* %2, i32 0, i32 4
  %4 = load %Node*, %Node** %3
  ret %Node* %4
}

define void @sett (%Node* %tn) {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %2 = load %Source*, %Source** %1
  %3 = getelementptr inbounds %Source, %Source* %2, i32 0, i32 4
  store %Node* %tn, %Node** %3
  ret void
}

define void @skip () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %2 = load %Source*, %Source** %1
  %3 = getelementptr inbounds %Source, %Source* %2, i32 0, i32 4
  %4 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %5 = load %Source*, %Source** %4
  %6 = getelementptr inbounds %Source, %Source* %5, i32 0, i32 4
  %7 = load %Node*, %Node** %6
  %8 = getelementptr inbounds %Node, %Node* %7, i32 0, i32 1
  %9 = load %Node*, %Node** %8
  store %Node* %9, %Node** %3
  ret void
}

define void @skip_nl () {

;stmt0:
  br label %continue_0
continue_0:
  %1 = load %Str, %Str* @_func262_str1
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
  %4 = load %Str, %Str* @_func266_str1
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
  %5 = load %Str, %Str* @_func267_str1
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %4, %7
  %9 = load %Str, %Str* @_func267_str2
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
  %15 = load %Str, %Str* @_func267_str3
  %16 = getelementptr inbounds %Nat8, %Str %15, %Int32 0
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp eq %Nat8 %4, %17
  %19 = load %Str, %Str* @_func267_str4
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

define void @skipto (%Str %s) {

;stmt0:
  %1 = load %Str, %Str* @_func268_str1
  %2 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %1, %TokenInfo* %2)

;stmt1:
  %3 = load %Str, %Str* @_func268_str2
  %4 = call %Token* () @ctok ()
  %5 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 2
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, [0 x %Nat8]* %5)

;stmt2:
  %7 = load %Str, %Str* @_func268_str3
  %8 = call %Int32 (%Str, ...) @printf (%Str %7, %Str %s)

;stmt3:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define %Bool @match (%Str %s) {

;stmt0:
  %1 = call %Token* () @ctok ()

;stmt1:
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %3 = load %TokenType, %TokenType* %2

;stmt2:
  %4 = icmp eq %TokenType %3, 4
  %5 = icmp eq %TokenType %3, 0
  %6 = or %Bool %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  ret %Bool 0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %8 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2
  %9 = bitcast [0 x %Nat8]* %8 to %Str
  %10 = call %Int32 (%Str, %Str) @strcmp (%Str %s, %Str %9)
  %11 = icmp eq %Int32 %10, 0

;stmt6:
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  call void () @skip ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  ret %Bool %11
}

define %Bool @need (%Str %s) {

;stmt0:
  %1 = call %Bool (%Str) @match (%Str %s)

;stmt1:
  %2 = icmp eq %Bool %1, 0
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %3 = call %Token* () @ctok ()

;stmt4:
  %4 = load %Str, %Str* @_func270_str1
  %5 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %4, %TokenInfo* %5)

;stmt5:
  %6 = load %Str, %Str* @_func270_str2
  %7 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2
  %8 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %7, i32 0, %Int32 0
  %9 = call %Int32 (%Str, ...) @printf (%Str %6, %Str %s, %Nat8* %8)

;stmt6:
  %10 = load %Str, %Str* @_func270_str3
  %11 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 0
  %12 = load %TokenType, %TokenType* %11
  %13 = call %Int32 (%Str, ...) @printf (%Str %10, %TokenType %12)

;stmt7:
  call void (%Int32) @exit (%Int32 0)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  ret %Bool %1
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

define void @o (%Str %s) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func273_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %s)
  ret void
}

define void @nl () {

;stmt0:
  %1 = load %Str, %Str* @_func274_str1
  call void (%Str) @o (%Str %1)
  ret void
}

define void @space () {

;stmt0:
  %1 = load %Str, %Str* @_func275_str1
  call void (%Str) @o (%Str %1)
  ret void
}

define void @comma () {

;stmt0:
  %1 = load %Str, %Str* @_func276_str1
  call void (%Str) @o (%Str %1)
  ret void
}

define %Nat32 @get_metadata () {

;stmt0:
  %1 = load %Nat32, %Nat32* @meta

;stmt1:
  %2 = load %Nat32, %Nat32* @meta
  %3 = add %Nat32 %2, 1
  store %Nat32 %3, %Nat32* @meta

;stmt2:
  ret %Nat32 %1
}

define void @dbg (%Nat32 %md) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func278_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Nat32 %md)
  ret void
}

define void @print_md (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Metadata*

;stmt1:
  call void (%Metadata*) @print_metadata (%Metadata* %1)
  ret void
}

define void @print_metadata_list (%List* %md_list) {

;stmt0:
  %1 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %md_list, %ListForeachHandler @print_md, %Unit* %1)
  ret void
}

define void @print_metadata (%Metadata* %md) {
  ret void
}

define void @printType (%Type* %t, %Bool %print_alias, %Bool %func_as_ptr) {

;stmt0:
  %1 = bitcast %Type* %t to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp ne %Unit* %1, %2
  %4 = load %Str, %Str* @_func282_str1
  call void (%Bool, %Str) @assert (%Bool %3, %Str %4)

;stmt1:
  %5 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 1
  %6 = load %Str, %Str* %5
  %7 = bitcast %Str %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  %10 = and %Bool %print_alias, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %11 = load %Unit*, %Unit** @fout
  %12 = load %Str, %Str* @_func282_str2
  %13 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 1
  %14 = load %Str, %Str* %13
  %15 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12, %Str %14)

;stmt4:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %17 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 0
  %18 = load %TypeKind, %TypeKind* %17

;stmt6:
  %19 = icmp eq %TypeKind %18, 2
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %20 = load %Unit*, %Unit** @fout
  %21 = load %Str, %Str* @_func282_str3
  %22 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 5
  %23 = getelementptr inbounds %TypeBasic, %TypeBasic* %22, i32 0, i32 0
  %24 = load %Str, %Str* %23
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %20, %Str %21, %Str %24)
  br label %endif_1
else_1:

;stmt9:
  %26 = icmp eq %TypeKind %18, 4
  br i1 %26, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %27 = load %Type*, %Type** @typeEnum
  call void (%Type*, %Bool, %Bool) @printType (%Type* %27, %Bool 1, %Bool 1)
  br label %endif_2
else_2:

;stmt12:
  %28 = icmp eq %TypeKind %18, 5
  br i1 %28, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %29 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 9
  call void (%TypeRecord*) @printTypeRecord (%TypeRecord* %29)
  br label %endif_3
else_3:

;stmt15:
  %30 = icmp eq %TypeKind %18, 7
  br i1 %30, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %31 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 8
  call void (%TypeArray*) @printTypeArray (%TypeArray* %31)
  br label %endif_4
else_4:

;stmt18:
  %32 = icmp eq %TypeKind %18, 6
  br i1 %32, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %33 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 7
  call void (%TypePointer*) @printTypePointer (%TypePointer* %33)
  br label %endif_5
else_5:

;stmt21:
  %34 = icmp eq %TypeKind %18, 3
  br i1 %34, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %35 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 6
  call void (%TypeFunc*, %Bool) @printTypeFunc (%TypeFunc* %35, %Bool %func_as_ptr)
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

define void @print_struct_field (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*

;stmt1:
  %2 = bitcast %Unit* %ctx to %Bool*

;stmt2:
  %3 = load %Bool, %Bool* %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func284_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %7 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*, %Bool, %Bool) @printType (%Type* %8, %Bool 1, %Bool 1)

;stmt6:
  store %Bool 1, %Bool* %2
  ret void
}

define void @printTypeRecord (%TypeRecord* %r) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func283_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  %need_comma = alloca %Bool

;stmt2:
  store %Bool 0, %Bool* %need_comma

;stmt3:
  %4 = getelementptr inbounds %TypeRecord, %TypeRecord* %r, i32 0, i32 0
  %5 = load %List*, %List** %4
  %6 = getelementptr inbounds %Bool, %Bool* %need_comma, i32 0
  %7 = bitcast %Bool* %6 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %5, %ListForeachHandler @print_struct_field, %Unit* %7)

;stmt4:
  %8 = load %Unit*, %Unit** @fout
  %9 = load %Str, %Str* @_func283_str2
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9)
  ret void
}

define void @printTypeArray (%TypeArray* %a) {

;stmt0:
  %1 = getelementptr inbounds %TypeArray, %TypeArray* %a, i32 0, i32 0
  %2 = load %Type*, %Type** %1

;stmt1:
  %3 = getelementptr inbounds %TypeArray, %TypeArray* %a, i32 0, i32 2
  %4 = load %Bool, %Bool* %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %2, %Bool 1, %Bool 1)

;stmt4:
  %5 = load %Str, %Str* @_func285_str1
  call void (%Str) @o (%Str %5)
  br label %endif_0
else_0:

;stmt5:

;stmt6:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @_func285_str2
  %8 = getelementptr inbounds %TypeArray, %TypeArray* %a, i32 0, i32 1
  %9 = load %Nat32, %Nat32* %8
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7, %Nat32 %9)

;stmt7:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %2, %Bool 1, %Bool 1)

;stmt8:
  %11 = load %Unit*, %Unit** @fout
  %12 = load %Str, %Str* @_func285_str3
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12)
  br label %endif_0
endif_0:
  ret void
}

define void @printTypePointer (%TypePointer* %p) {

;stmt0:
  %1 = getelementptr inbounds %TypePointer, %TypePointer* %p, i32 0, i32 0
  %2 = load %Type*, %Type** %1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %2, %Bool 1, %Bool 1)

;stmt1:
  %3 = load %Unit*, %Unit** @fout
  %4 = load %Str, %Str* @_func286_str1
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4)
  ret void
}

define void @pt_print_param (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %ctx to %Bool*

;stmt1:
  %2 = load %Bool, %Bool* %1
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %3 = load %Unit*, %Unit** @fout
  %4 = load %Str, %Str* @_func288_str1
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %6 = bitcast %Unit* %data to %Field*
  %7 = getelementptr inbounds %Field, %Field* %6, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*, %Bool, %Bool) @printType (%Type* %8, %Bool 1, %Bool 1)

;stmt5:
  store %Bool 1, %Bool* %1
  ret void
}

define void @printTypeFunc (%TypeFunc* %f, %Bool %func_as_ptr) {

;stmt0:
  %1 = getelementptr inbounds %TypeFunc, %TypeFunc* %f, i32 0, i32 1
  %2 = load %Type*, %Type** %1
  %3 = load %Type*, %Type** @typeUnit
  %4 = call %Bool (%Type*, %Type*) @type_eq (%Type* %2, %Type* %3)
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = load %Unit*, %Unit** @fout
  %6 = load %Str, %Str* @_func287_str1
  %7 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %5, %Str %6)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %8 = getelementptr inbounds %TypeFunc, %TypeFunc* %f, i32 0, i32 1
  %9 = load %Type*, %Type** %8
  call void (%Type*, %Bool, %Bool) @printType (%Type* %9, %Bool 1, %Bool 1)
  br label %endif_0
endif_0:

;stmt5:
  %10 = load %Unit*, %Unit** @fout
  %11 = load %Str, %Str* @_func287_str2
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11)

;stmt6:
  %need_comma = alloca %Bool

;stmt7:
  store %Bool 0, %Bool* %need_comma

;stmt8:
  %13 = getelementptr inbounds %TypeFunc, %TypeFunc* %f, i32 0, i32 0
  %14 = load %List*, %List** %13
  %15 = getelementptr inbounds %Bool, %Bool* %need_comma, i32 0
  %16 = bitcast %Bool* %15 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %14, %ListForeachHandler @pt_print_param, %Unit* %16)

;stmt9:
  %17 = getelementptr inbounds %TypeFunc, %TypeFunc* %f, i32 0, i32 2
  %18 = load %Bool, %Bool* %17
  br i1 %18, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %19 = load %Str, %Str* @_func287_str3
  call void (%Str) @o (%Str %19)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %20 = load %Unit*, %Unit** @fout
  %21 = load %Str, %Str* @_func287_str4
  %22 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %20, %Str %21)

;stmt13:
  br i1 %func_as_ptr, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %23 = load %Unit*, %Unit** @fout
  %24 = load %Str, %Str* @_func287_str5
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %23, %Str %24)
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

define void @print_stmt (%Stmt* %s) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func290_str1
  %3 = load %Nat32, %Nat32* @stmtno
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Nat32 %3)

;stmt1:
  %5 = load %Nat32, %Nat32* @stmtno
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* @stmtno

;stmt2:
  %7 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 0
  %8 = load %StmtKind, %StmtKind* %7

;stmt3:
  %9 = icmp eq %StmtKind %8, 2
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %10 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 2
  %11 = load %Block*, %Block** %10
  call void (%Block*) @print_block (%Block* %11)
  br label %endif_0
else_0:

;stmt6:
  %12 = icmp eq %StmtKind %8, 0
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %13 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %14 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %13, i32 0, %Int32 0
  %15 = load %Value*, %Value** %14
  %16 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %17 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %16, i32 0, %Int32 1
  %18 = load %Value*, %Value** %17
  call void (%Value*, %Value*) @print_stmt_let (%Value* %15, %Value* %18)
  br label %endif_1
else_1:

;stmt9:
  %19 = icmp eq %StmtKind %8, 3
  br i1 %19, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %20 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %21 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %20, i32 0, %Int32 0
  %22 = load %Value*, %Value** %21
  call void (%Value*) @print_stmt_expr (%Value* %22)
  br label %endif_2
else_2:

;stmt12:
  %23 = icmp eq %StmtKind %8, 1
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %24 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 3
  %25 = load %VarDef*, %VarDef** %24
  call void (%VarDef*) @print_stmt_var (%VarDef* %25)
  br label %endif_3
else_3:

;stmt15:
  %26 = icmp eq %StmtKind %8, 4
  br i1 %26, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %27 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %28 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %27, i32 0, %Int32 0
  %29 = load %Value*, %Value** %28
  %30 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %31 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %30, i32 0, %Int32 1
  %32 = load %Value*, %Value** %31
  call void (%Value*, %Value*) @print_st (%Value* %29, %Value* %32)
  br label %endif_4
else_4:

;stmt18:
  %33 = icmp eq %StmtKind %8, 5
  br i1 %33, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %34 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 5
  %35 = load %If*, %If** %34
  call void (%If*) @print_stmt_if (%If* %35)
  br label %endif_5
else_5:

;stmt21:
  %36 = icmp eq %StmtKind %8, 6
  br i1 %36, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %37 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 4
  %38 = load %While*, %While** %37
  call void (%While*) @print_stmt_while (%While* %38)
  br label %endif_6
else_6:

;stmt24:
  %39 = icmp eq %StmtKind %8, 7
  br i1 %39, label %then_7, label %else_7
then_7:

;stmt25:

;stmt26:
  %40 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 1
  %41 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %40, i32 0, %Int32 0
  %42 = load %Value*, %Value** %41
  call void (%Value*) @print_stmt_return (%Value* %42)
  br label %endif_7
else_7:

;stmt27:
  %43 = icmp eq %StmtKind %8, 8
  br i1 %43, label %then_8, label %else_8
then_8:

;stmt28:

;stmt29:
  call void () @print_stmt_break ()
  br label %endif_8
else_8:

;stmt30:
  %44 = icmp eq %StmtKind %8, 9
  br i1 %44, label %then_9, label %else_9
then_9:

;stmt31:

;stmt32:
  call void () @print_stmt_continue ()
  br label %endif_9
else_9:

;stmt33:
  %45 = icmp eq %StmtKind %8, 10
  br i1 %45, label %then_10, label %else_10
then_10:

;stmt34:

;stmt35:
  %46 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 6
  %47 = load %Str, %Str* %46
  call void (%Str) @print_stmt_goto (%Str %47)
  br label %endif_10
else_10:

;stmt36:
  %48 = icmp eq %StmtKind %8, 11
  br i1 %48, label %then_11, label %else_11
then_11:

;stmt37:

;stmt38:
  %49 = getelementptr inbounds %Stmt, %Stmt* %s, i32 0, i32 6
  %50 = load %Str, %Str* %49
  call void (%Str) @print_stmt_label (%Str %50)
  br label %endif_11
else_11:

;stmt39:

;stmt40:
  %51 = load %Unit*, %Unit** @fout
  %52 = load %Str, %Str* @_func290_str2
  %53 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %51, %Str %52)

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

define void @print_stmt_var (%VarDef* %v) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func291_str1
  %3 = getelementptr inbounds %VarDef, %VarDef* %v, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %4)

;stmt1:
  %6 = getelementptr inbounds %VarDef, %VarDef* %v, i32 0, i32 1
  %7 = load %Type*, %Type** %6
  call void (%Type*, %Bool, %Bool) @printType (%Type* %7, %Bool 1, %Bool 1)
  ret void
}

define void @print_stmt_expr (%Value* %e) {

;stmt0:
  %1 = call %Obj (%Value*) @eval (%Value* %e)
  ret void
}

define void @print_stmt_let (%Value* %e, %Value* %x) {

;stmt0:
  %ee = alloca %Obj

;stmt1:
  %1 = call %Obj (%Value*) @eval (%Value* %e)
  %2 = call %Obj (%Obj) @load (%Obj %1)
  store %Obj %2, %Obj* %ee

;stmt2:
  %3 = getelementptr inbounds %Value, %Value* %x, i32 0, i32 3
  %4 = getelementptr inbounds %Obj, %Obj* %ee, i32 0, i32 4
  %5 = load %Nat32, %Nat32* %4
  store %Nat32 %5, %Nat32* %3
  ret void
}

define void @print_stmt_if (%If* %i) {

;stmt0:
  %1 = load %Nat32, %Nat32* @global_if_id

;stmt1:
  %2 = load %Nat32, %Nat32* @global_if_id
  %3 = add %Nat32 %2, 1
  store %Nat32 %3, %Nat32* @global_if_id

;stmt2:
  %c = alloca %Obj

;stmt3:
  %4 = getelementptr inbounds %If, %If* %i, i32 0, i32 0
  %5 = load %Value*, %Value** %4
  %6 = call %Obj (%Value*) @eval (%Value* %5)
  %7 = call %Obj (%Obj) @load (%Obj %6)
  store %Obj %7, %Obj* %c

;stmt4:
  %8 = load %Unit*, %Unit** @fout
  %9 = load %Str, %Str* @_func294_str1
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9)

;stmt5:
  %11 = load %Obj, %Obj* %c
  call void (%Obj) @print_obj (%Obj %11)

;stmt6:
  %12 = load %Unit*, %Unit** @fout
  %13 = load %Str, %Str* @_func294_str2
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13, %Nat32 %1, %Nat32 %1)

;stmt7:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @_func294_str3
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16, %Nat32 %1)

;stmt8:
  %18 = getelementptr inbounds %If, %If* %i, i32 0, i32 1
  %19 = load %Stmt*, %Stmt** %18
  call void (%Stmt*) @print_stmt (%Stmt* %19)

;stmt9:
  %20 = load %Unit*, %Unit** @fout
  %21 = load %Str, %Str* @_func294_str4
  %22 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %20, %Str %21, %Nat32 %1)

;stmt10:
  %23 = load %Unit*, %Unit** @fout
  %24 = load %Str, %Str* @_func294_str5
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %23, %Str %24, %Nat32 %1)

;stmt11:
  %26 = getelementptr inbounds %If, %If* %i, i32 0, i32 2
  %27 = load %Stmt*, %Stmt** %26
  %28 = bitcast %Stmt* %27 to %Unit*
  %29 = inttoptr i64 0 to %Unit*
  %30 = icmp ne %Unit* %28, %29
  br i1 %30, label %then_0, label %else_0
then_0:

;stmt12:

;stmt13:
  %31 = getelementptr inbounds %If, %If* %i, i32 0, i32 2
  %32 = load %Stmt*, %Stmt** %31
  call void (%Stmt*) @print_stmt (%Stmt* %32)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt14:
  %33 = load %Unit*, %Unit** @fout
  %34 = load %Str, %Str* @_func294_str6
  %35 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %33, %Str %34, %Nat32 %1)

;stmt15:
  %36 = load %Unit*, %Unit** @fout
  %37 = load %Str, %Str* @_func294_str7
  %38 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %36, %Str %37, %Nat32 %1)
  ret void
}

define void @print_stmt_while (%While* %w) {

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
  %6 = load %Str, %Str* @_func295_str1
  %7 = load %Nat32, %Nat32* @while_id
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %5, %Str %6, %Nat32 %7)

;stmt4:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @_func295_str2
  %11 = load %Nat32, %Nat32* @while_id
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10, %Nat32 %11)

;stmt5:
  %c = alloca %Obj

;stmt6:
  %13 = getelementptr inbounds %While, %While* %w, i32 0, i32 0
  %14 = load %Value*, %Value** %13
  %15 = call %Obj (%Value*) @eval (%Value* %14)
  %16 = call %Obj (%Obj) @load (%Obj %15)
  store %Obj %16, %Obj* %c

;stmt7:
  %17 = load %Unit*, %Unit** @fout
  %18 = load %Str, %Str* @_func295_str3
  %19 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %17, %Str %18)

;stmt8:
  %20 = load %Obj, %Obj* %c
  call void (%Obj) @print_obj (%Obj %20)

;stmt9:
  %21 = load %Unit*, %Unit** @fout
  %22 = load %Str, %Str* @_func295_str4
  %23 = load %Nat32, %Nat32* @while_id
  %24 = load %Nat32, %Nat32* @while_id
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22, %Nat32 %23, %Nat32 %24)

;stmt10:
  %26 = load %Unit*, %Unit** @fout
  %27 = load %Str, %Str* @_func295_str5
  %28 = load %Nat32, %Nat32* @while_id
  %29 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %26, %Str %27, %Nat32 %28)

;stmt11:
  %30 = getelementptr inbounds %While, %While* %w, i32 0, i32 1
  %31 = load %Stmt*, %Stmt** %30
  call void (%Stmt*) @print_stmt (%Stmt* %31)

;stmt12:
  %32 = load %Unit*, %Unit** @fout
  %33 = load %Str, %Str* @_func295_str6
  %34 = load %Nat32, %Nat32* @while_id
  %35 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %32, %Str %33, %Nat32 %34)

;stmt13:
  %36 = load %Unit*, %Unit** @fout
  %37 = load %Str, %Str* @_func295_str7
  %38 = load %Nat32, %Nat32* @while_id
  %39 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %36, %Str %37, %Nat32 %38)

;stmt14:
  store %Nat32 %1, %Nat32* @while_id
  ret void
}

define void @print_stmt_return (%Value* %rv) {

;stmt0:
  %1 = bitcast %Value* %rv to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %4 = call %Nat32 () @lab_get ()

;stmt3:
  %5 = load %Str, %Str* @_func296_str1
  call void (%Str) @o (%Str %5)

;stmt4:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %v = alloca %Obj

;stmt6:
  %7 = call %Obj (%Value*) @eval (%Value* %rv)
  %8 = call %Obj (%Obj) @load (%Obj %7)
  store %Obj %8, %Obj* %v

;stmt7:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @_func296_str2
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10)

;stmt8:
  %12 = getelementptr inbounds %Obj, %Obj* %v, i32 0, i32 1
  %13 = load %Type*, %Type** %12
  call void (%Type*, %Bool, %Bool) @printType (%Type* %13, %Bool 1, %Bool 1)

;stmt9:
  call void () @space ()

;stmt10:
  %14 = load %Obj, %Obj* %v
  call void (%Obj) @print_obj (%Obj %14)

;stmt11:
  %15 = call %Nat32 () @lab_get ()
  ret void
}

define void @print_stmt_break () {

;stmt0:
  %1 = call %Nat32 () @lab_get ()

;stmt1:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func297_str1
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @print_stmt_continue () {

;stmt0:
  %1 = call %Nat32 () @lab_get ()

;stmt1:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func298_str1
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @print_stmt_goto (%Str %l) {

;stmt0:
  %1 = call %Nat32 () @lab_get ()

;stmt1:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func299_str1
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Str %l)
  ret void
}

define void @print_stmt_label (%Str %l) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func300_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %l)

;stmt1:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func300_str2
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5, %Str %l)
  ret void
}

define void @for_stmt (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = load %Nat32, %Nat32* @blockno
  %2 = add %Nat32 %1, 1
  store %Nat32 %2, %Nat32* @blockno

;stmt1:
  %3 = bitcast %Unit* %data to %Stmt*
  call void (%Stmt*) @print_stmt (%Stmt* %3)
  ret void
}

define void @print_block (%Block* %b) {

;stmt0:
  %1 = getelementptr inbounds %Block, %Block* %b, i32 0, i32 1
  %2 = load %List*, %List** %1
  %3 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %2, %ListForeachHandler @for_stmt, %Unit* %3)
  ret void
}

define %Obj @new_obj (%Type* %t, %ObjKind %k, %Nat32 %reg) {

;stmt0:
  %o = alloca %Obj

;stmt1:
  %1 = getelementptr inbounds %Obj, %Obj* %o, i32 0, i32 1
  store %Type* %t, %Type** %1

;stmt2:
  %2 = getelementptr inbounds %Obj, %Obj* %o, i32 0, i32 0
  store %ObjKind %k, %ObjKind* %2

;stmt3:
  %3 = getelementptr inbounds %Obj, %Obj* %o, i32 0, i32 4
  store %Nat32 %reg, %Nat32* %3

;stmt4:
  %4 = getelementptr inbounds %Obj, %Obj* %o, i32 0, i32 3
  %5 = inttoptr i64 0 to %Str
  store %Str %5, %Str* %4

;stmt5:
  %6 = getelementptr inbounds %Obj, %Obj* %o, i32 0, i32 2
  store %Int64 0, %Int64* %6

;stmt6:
  %7 = load %Obj, %Obj* %o
  ret %Obj %7
}

define %Obj @eval (%Value* %v) {

;stmt0:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %2 = load %ValueKind, %ValueKind* %1

;stmt1:
  %obj = alloca %Obj

;stmt2:
  %3 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 1
  %4 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %5 = load %Type*, %Type** %4
  store %Type* %5, %Type** %3

;stmt3:
  %6 = icmp eq %ValueKind %2, 2
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %7 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 0
  store %ObjKind 1, %ObjKind* %7

;stmt6:
  %8 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 2
  %9 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 2
  %10 = load %Int64, %Int64* %9
  store %Int64 %10, %Int64* %8

;stmt7:
  %11 = load %Obj, %Obj* %obj
  ret %Obj %11
  br label %endif_0
else_0:

;stmt8:
  %13 = icmp eq %ValueKind %2, 3
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %14 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 0
  store %ObjKind 2, %ObjKind* %14

;stmt11:
  %15 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 3
  %16 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 4
  %17 = load %Str, %Str* %16
  store %Str %17, %Str* %15

;stmt12:
  %18 = load %Obj, %Obj* %obj
  ret %Obj %18
  br label %endif_1
else_1:

;stmt13:
  %20 = icmp eq %ValueKind %2, 4
  br i1 %20, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %21 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 0
  store %ObjKind 3, %ObjKind* %21

;stmt16:
  %22 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 3
  %23 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 4
  %24 = load %Str, %Str* %23
  store %Str %24, %Str* %22

;stmt17:
  %25 = load %Obj, %Obj* %obj
  ret %Obj %25
  br label %endif_2
else_2:

;stmt18:
  %27 = icmp eq %ValueKind %2, 5
  br i1 %27, label %then_3, label %else_3
then_3:

;stmt19:

;stmt20:
  %28 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 0
  store %ObjKind 4, %ObjKind* %28

;stmt21:
  %29 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 3
  %30 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 4
  %31 = load %Str, %Str* %30
  store %Str %31, %Str* %29

;stmt22:
  %32 = load %Obj, %Obj* %obj
  ret %Obj %32
  br label %endif_3
else_3:

;stmt23:
  %34 = icmp eq %ValueKind %2, 6
  br i1 %34, label %then_4, label %else_4
then_4:

;stmt24:

;stmt25:
  %35 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 0
  store %ObjKind 5, %ObjKind* %35

;stmt26:
  %36 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 3
  %37 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 4
  %38 = load %Str, %Str* %37
  store %Str %38, %Str* %36

;stmt27:
  %39 = load %Obj, %Obj* %obj
  ret %Obj %39
  br label %endif_4
else_4:

;stmt28:
  %41 = icmp eq %ValueKind %2, 7
  br i1 %41, label %then_5, label %else_5
then_5:

;stmt29:

;stmt30:
  %42 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 0
  store %ObjKind 7, %ObjKind* %42

;stmt31:
  %43 = getelementptr inbounds %Obj, %Obj* %obj, i32 0, i32 4
  %44 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 3
  %45 = load %Nat32, %Nat32* %44
  store %Nat32 %45, %Nat32* %43

;stmt32:
  %46 = load %Obj, %Obj* %obj
  ret %Obj %46
  br label %endif_5
else_5:

;stmt33:
  %48 = icmp eq %ValueKind %2, 28
  br i1 %48, label %then_6, label %else_6
then_6:

;stmt34:

;stmt35:
  %49 = call %Obj (%Value*) @eval_call (%Value* %v)
  ret %Obj %49
  br label %endif_6
else_6:

;stmt36:
  %51 = icmp eq %ValueKind %2, 29
  br i1 %51, label %then_7, label %else_7
then_7:

;stmt37:

;stmt38:
  %52 = call %Obj (%Value*) @eval_index (%Value* %v)
  ret %Obj %52
  br label %endif_7
else_7:

;stmt39:
  %54 = icmp eq %ValueKind %2, 30
  br i1 %54, label %then_8, label %else_8
then_8:

;stmt40:

;stmt41:
  %55 = call %Obj (%Value*) @eval_access (%Value* %v)
  ret %Obj %55
  br label %endif_8
else_8:

;stmt42:
  %57 = icmp eq %ValueKind %2, 8
  br i1 %57, label %then_9, label %else_9
then_9:

;stmt43:

;stmt44:
  %58 = call %Obj (%Value*) @eval_ref (%Value* %v)
  ret %Obj %58
  br label %endif_9
else_9:

;stmt45:
  %60 = icmp eq %ValueKind %2, 9
  br i1 %60, label %then_10, label %else_10
then_10:

;stmt46:

;stmt47:
  %61 = call %Obj (%Value*) @eval_deref (%Value* %v)
  ret %Obj %61
  br label %endif_10
else_10:

;stmt48:
  %63 = icmp eq %ValueKind %2, 11
  br i1 %63, label %then_11, label %else_11
then_11:

;stmt49:

;stmt50:
  %64 = call %Obj (%Value*) @eval_minus (%Value* %v)
  ret %Obj %64
  br label %endif_11
else_11:

;stmt51:
  %66 = icmp eq %ValueKind %2, 10
  br i1 %66, label %then_12, label %else_12
then_12:

;stmt52:

;stmt53:
  %67 = call %Obj (%Value*) @eval_not (%Value* %v)
  ret %Obj %67
  br label %endif_12
else_12:

;stmt54:
  %69 = icmp eq %ValueKind %2, 31
  br i1 %69, label %then_13, label %else_13
then_13:

;stmt55:

;stmt56:
  %70 = call %Obj (%Value*) @eval_cast (%Value* %v)
  ret %Obj %70
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

;stmt57:
  %72 = call %Obj (%Value*) @eval_bin (%Value* %v)
  ret %Obj %72
}

define void @eval_args (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Value*

;stmt1:
  %2 = bitcast %Unit* %ctx to %Arguments*

;stmt2:
  %argg = alloca %Obj

;stmt3:
  %3 = call %Obj (%Value*) @eval (%Value* %1)
  %4 = call %Obj (%Obj) @load (%Obj %3)
  store %Obj %4, %Obj* %argg

;stmt4:
  %5 = getelementptr inbounds %Arguments, %Arguments* %2, i32 0, i32 0
  %6 = getelementptr inbounds %Arguments, %Arguments* %2, i32 0, i32 1
  %7 = load %Nat16, %Nat16* %6
  %8 = getelementptr inbounds [256 x %Obj], [256 x %Obj]* %5, i32 0, %Nat16 %7
  %9 = load %Obj, %Obj* %argg
  store %Obj %9, %Obj* %8

;stmt5:
  %10 = getelementptr inbounds %Arguments, %Arguments* %2, i32 0, i32 1
  %11 = getelementptr inbounds %Arguments, %Arguments* %2, i32 0, i32 1
  %12 = load %Nat16, %Nat16* %11
  %13 = add %Nat16 %12, 1
  store %Nat16 %13, %Nat16* %10
  ret void
}

define %Obj @eval_call (%Value* %v) {

;stmt0:
  %f = alloca %Obj

;stmt1:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 10
  %2 = getelementptr inbounds %ValueCall, %ValueCall* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %Obj (%Value*) @eval (%Value* %3)
  %5 = call %Obj (%Obj) @load (%Obj %4)
  store %Obj %5, %Obj* %f

;stmt2:
  %args = alloca %Arguments

;stmt3:
  %6 = getelementptr inbounds %Arguments, %Arguments* %args, i32 0, i32 1
  store %Nat16 0, %Nat16* %6

;stmt4:
  %7 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 10
  %8 = getelementptr inbounds %ValueCall, %ValueCall* %7, i32 0, i32 1
  %9 = load %List*, %List** %8
  %10 = getelementptr inbounds %Arguments, %Arguments* %args, i32 0
  %11 = bitcast %Arguments* %10 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %9, %ListForeachHandler @eval_args, %Unit* %11)

;stmt5:
  %retval_reg = alloca %Nat32

;stmt6:
  %12 = getelementptr inbounds %Obj, %Obj* %f, i32 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = getelementptr inbounds %Type, %Type* %13, i32 0, i32 6
  %15 = getelementptr inbounds %TypeFunc, %TypeFunc* %14, i32 0, i32 1
  %16 = load %Type*, %Type** %15
  %17 = load %Type*, %Type** @typeUnit
  %18 = call %Bool (%Type*, %Type*) @type_eq (%Type* %16, %Type* %17)
  br i1 %18, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %19 = load %Unit*, %Unit** @fout
  %20 = load %Str, %Str* @_func305_str1
  %21 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %19, %Str %20)
  br label %endif_0
else_0:

;stmt9:

;stmt10:
  %22 = call %Nat32 () @lab_get ()
  store %Nat32 %22, %Nat32* %retval_reg

;stmt11:
  %23 = load %Unit*, %Unit** @fout
  %24 = load %Str, %Str* @_func305_str2
  %25 = load %Nat32, %Nat32* %retval_reg
  %26 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %23, %Str %24, %Nat32 %25)
  br label %endif_0
endif_0:

;stmt12:
  %27 = getelementptr inbounds %Obj, %Obj* %f, i32 0, i32 1
  %28 = load %Type*, %Type** %27
  call void (%Type*, %Bool, %Bool) @printType (%Type* %28, %Bool 0, %Bool 0)

;stmt13:
  call void () @space ()

;stmt14:
  %29 = load %Obj, %Obj* %f
  call void (%Obj) @print_obj (%Obj %29)

;stmt15:
  %30 = load %Str, %Str* @_func305_str3
  call void (%Str) @o (%Str %30)

;stmt16:
  %need_comma = alloca %Bool

;stmt17:
  store %Bool 0, %Bool* %need_comma

;stmt18:
  %c = alloca %Nat16

;stmt19:
  store %Nat16 0, %Nat16* %c

;stmt20:
  br label %continue_0
continue_0:
  %31 = load %Nat16, %Nat16* %c
  %32 = getelementptr inbounds %Arguments, %Arguments* %args, i32 0, i32 1
  %33 = load %Nat16, %Nat16* %32
  %34 = icmp ult %Nat16 %31, %33
  br i1 %34, label %body_0, label %break_0
body_0:

;stmt21:

;stmt22:
  %35 = load %Bool, %Bool* %need_comma
  br i1 %35, label %then_1, label %else_1
then_1:

;stmt23:

;stmt24:
  call void () @comma ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt25:
  %36 = getelementptr inbounds %Arguments, %Arguments* %args, i32 0, i32 0
  %37 = load %Nat16, %Nat16* %c
  %38 = getelementptr inbounds [256 x %Obj], [256 x %Obj]* %36, i32 0, %Nat16 %37
  %39 = getelementptr inbounds %Obj, %Obj* %38, i32 0, i32 1
  %40 = load %Type*, %Type** %39
  call void (%Type*, %Bool, %Bool) @printType (%Type* %40, %Bool 1, %Bool 1)

;stmt26:
  call void () @space ()

;stmt27:
  %41 = getelementptr inbounds %Arguments, %Arguments* %args, i32 0, i32 0
  %42 = load %Nat16, %Nat16* %c
  %43 = getelementptr inbounds [256 x %Obj], [256 x %Obj]* %41, i32 0, %Nat16 %42
  %44 = load %Obj, %Obj* %43
  call void (%Obj) @print_obj (%Obj %44)

;stmt28:
  store %Bool 1, %Bool* %need_comma

;stmt29:
  %45 = load %Nat16, %Nat16* %c
  %46 = add %Nat16 %45, 1
  store %Nat16 %46, %Nat16* %c
  br label %continue_0
break_0:

;stmt30:
  %47 = load %Str, %Str* @_func305_str4
  call void (%Str) @o (%Str %47)

;stmt31:
  %48 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %49 = load %Type*, %Type** %48
  %50 = load %Nat32, %Nat32* %retval_reg
  %51 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %49, %ObjKind 7, %Nat32 %50)
  ret %Obj %51
}

define %Obj @eval_index (%Value* %v) {

;stmt0:
  %a = alloca %Obj

;stmt1:
  %i = alloca %Obj

;stmt2:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 7
  %2 = getelementptr inbounds %ValueIndex, %ValueIndex* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %Obj (%Value*) @eval (%Value* %3)
  store %Obj %4, %Obj* %a

;stmt3:
  %5 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 7
  %6 = getelementptr inbounds %ValueIndex, %ValueIndex* %5, i32 0, i32 1
  %7 = load %Value*, %Value** %6
  %8 = call %Obj (%Value*) @eval (%Value* %7)
  %9 = call %Obj (%Obj) @load (%Obj %8)
  store %Obj %9, %Obj* %i

;stmt4:
  %10 = getelementptr inbounds %Obj, %Obj* %a, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i32 0, i32 8
  %13 = getelementptr inbounds %TypeArray, %TypeArray* %12, i32 0, i32 2
  %14 = load %Bool, %Bool* %13
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %15 = load %Obj, %Obj* %a
  %16 = call %Obj (%Obj) @load (%Obj %15)
  store %Obj %16, %Obj* %a
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %17 = call %Nat32 () @lab_get ()

;stmt8:
  %18 = load %Unit*, %Unit** @fout
  %19 = load %Str, %Str* @_func307_str1
  %20 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %18, %Str %19, %Nat32 %17)

;stmt9:
  %21 = getelementptr inbounds %Obj, %Obj* %a, i32 0, i32 1
  %22 = load %Type*, %Type** %21

;stmt10:
  %23 = getelementptr inbounds %Type, %Type* %22, i32 0, i32 8
  %24 = getelementptr inbounds %TypeArray, %TypeArray* %23, i32 0, i32 2
  %25 = load %Bool, %Bool* %24
  br i1 %25, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %26 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %27 = load %Type*, %Type** %26
  call void (%Type*, %Bool, %Bool) @printType (%Type* %27, %Bool 1, %Bool 1)
  br label %endif_1
else_1:

;stmt13:

;stmt14:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %22, %Bool 1, %Bool 1)
  br label %endif_1
endif_1:

;stmt15:
  call void () @comma ()

;stmt16:
  %28 = getelementptr inbounds %Obj, %Obj* %a, i32 0, i32 1
  %29 = load %Type*, %Type** %28
  call void (%Type*, %Bool, %Bool) @printType (%Type* %29, %Bool 1, %Bool 1)

;stmt17:
  %30 = getelementptr inbounds %Obj, %Obj* %a, i32 0, i32 1
  %31 = load %Type*, %Type** %30
  %32 = getelementptr inbounds %Type, %Type* %31, i32 0, i32 8
  %33 = getelementptr inbounds %TypeArray, %TypeArray* %32, i32 0, i32 2
  %34 = load %Bool, %Bool* %33
  br i1 %34, label %then_2, label %else_2
then_2:

;stmt18:

;stmt19:
  call void () @space ()
  br label %endif_2
else_2:

;stmt20:

;stmt21:
  %35 = load %Str, %Str* @_func307_str2
  call void (%Str) @o (%Str %35)
  br label %endif_2
endif_2:

;stmt22:
  %36 = load %Obj, %Obj* %a
  call void (%Obj) @print_obj (%Obj %36)

;stmt23:
  %37 = getelementptr inbounds %Obj, %Obj* %a, i32 0, i32 1
  %38 = load %Type*, %Type** %37
  %39 = getelementptr inbounds %Type, %Type* %38, i32 0, i32 8
  %40 = getelementptr inbounds %TypeArray, %TypeArray* %39, i32 0, i32 2
  %41 = load %Bool, %Bool* %40
  %42 = xor %Bool %41, 1
  br i1 %42, label %then_3, label %else_3
then_3:

;stmt24:

;stmt25:
  %43 = load %Str, %Str* @_func307_str3
  call void (%Str) @o (%Str %43)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt26:
  call void () @comma ()

;stmt27:
  %44 = getelementptr inbounds %Obj, %Obj* %i, i32 0, i32 1
  %45 = load %Type*, %Type** %44
  call void (%Type*, %Bool, %Bool) @printType (%Type* %45, %Bool 1, %Bool 1)

;stmt28:
  call void () @space ()

;stmt29:
  %46 = load %Obj, %Obj* %i
  call void (%Obj) @print_obj (%Obj %46)

;stmt30:
  %47 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %48 = load %Type*, %Type** %47
  %49 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %48, %ObjKind 6, %Nat32 %17)
  ret %Obj %49
}

define %Obj @eval_access (%Value* %v) {

;stmt0:
  %s = alloca %Obj

;stmt1:
  %record_type = alloca %Type*

;stmt2:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 8
  %2 = getelementptr inbounds %ValueAccess, %ValueAccess* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %Obj (%Value*) @eval (%Value* %3)
  store %Obj %4, %Obj* %s

;stmt3:
  %5 = getelementptr inbounds %Obj, %Obj* %s, i32 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 0
  %8 = load %TypeKind, %TypeKind* %7
  %9 = icmp eq %TypeKind %8, 6
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %10 = getelementptr inbounds %Obj, %Obj* %s, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  %12 = getelementptr inbounds %Type, %Type* %11, i32 0, i32 7
  %13 = getelementptr inbounds %TypePointer, %TypePointer* %12, i32 0, i32 0
  %14 = load %Type*, %Type** %13
  store %Type* %14, %Type** %record_type

;stmt6:
  %15 = load %Obj, %Obj* %s
  %16 = call %Obj (%Obj) @load (%Obj %15)
  store %Obj %16, %Obj* %s
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %17 = getelementptr inbounds %Obj, %Obj* %s, i32 0, i32 1
  %18 = load %Type*, %Type** %17
  store %Type* %18, %Type** %record_type
  br label %endif_0
endif_0:

;stmt9:
  %19 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 8
  %20 = getelementptr inbounds %ValueAccess, %ValueAccess* %19, i32 0, i32 1
  %21 = load %Str, %Str* %20
  %22 = bitcast %Str %21 to %Unit*
  %23 = inttoptr i64 0 to %Unit*
  %24 = icmp ne %Unit* %22, %23
  %25 = load %Str, %Str* @_func308_str1
  call void (%Bool, %Str) @assert (%Bool %24, %Str %25)

;stmt10:
  %26 = load %Type*, %Type** %record_type
  %27 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 8
  %28 = getelementptr inbounds %ValueAccess, %ValueAccess* %27, i32 0, i32 1
  %29 = load %Str, %Str* %28
  %30 = call %Field* (%Type*, %Str) @type_record_get_field (%Type* %26, %Str %29)
  %31 = getelementptr inbounds %Field, %Field* %30, i32 0, i32 2
  %32 = load %Nat16, %Nat16* %31

;stmt11:
  %33 = call %Nat32 () @lab_get ()

;stmt12:
  %34 = getelementptr inbounds %Obj, %Obj* %s, i32 0, i32 0
  %35 = load %ObjKind, %ObjKind* %34
  %36 = icmp eq %ObjKind %35, 3
  %37 = getelementptr inbounds %Obj, %Obj* %s, i32 0, i32 1
  %38 = load %Type*, %Type** %37
  %39 = getelementptr inbounds %Type, %Type* %38, i32 0, i32 0
  %40 = load %TypeKind, %TypeKind* %39
  %41 = icmp eq %TypeKind %40, 5
  %42 = and %Bool %36, %41

;stmt13:
  br i1 %42, label %then_1, label %else_1
then_1:

;stmt14:

;stmt15:
  %43 = load %Unit*, %Unit** @fout
  %44 = load %Str, %Str* @_func308_str2
  %45 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %43, %Str %44, %Nat32 %33)

;stmt16:
  %46 = load %Type*, %Type** %record_type
  call void (%Type*, %Bool, %Bool) @printType (%Type* %46, %Bool 1, %Bool 1)

;stmt17:
  call void () @space ()

;stmt18:
  %47 = load %Obj, %Obj* %s
  call void (%Obj) @print_obj (%Obj %47)

;stmt19:
  %48 = load %Unit*, %Unit** @fout
  %49 = load %Str, %Str* @_func308_str3
  %50 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %48, %Str %49, %Nat16 %32)

;stmt20:
  %51 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %52 = load %Type*, %Type** %51
  %53 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %52, %ObjKind 7, %Nat32 %33)
  ret %Obj %53
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt21:
  %55 = load %Unit*, %Unit** @fout
  %56 = load %Str, %Str* @_func308_str4
  %57 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %55, %Str %56, %Nat32 %33)

;stmt22:
  %58 = load %Type*, %Type** %record_type
  call void (%Type*, %Bool, %Bool) @printType (%Type* %58, %Bool 1, %Bool 1)

;stmt23:
  call void () @comma ()

;stmt24:
  %59 = load %Type*, %Type** %record_type
  call void (%Type*, %Bool, %Bool) @printType (%Type* %59, %Bool 1, %Bool 1)

;stmt25:
  %60 = load %Str, %Str* @_func308_str5
  call void (%Str) @o (%Str %60)

;stmt26:
  %61 = load %Obj, %Obj* %s
  call void (%Obj) @print_obj (%Obj %61)

;stmt27:
  %62 = load %Unit*, %Unit** @fout
  %63 = load %Str, %Str* @_func308_str6
  %64 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %62, %Str %63, %Nat16 %32)

;stmt28:
  %65 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %66 = load %Type*, %Type** %65
  %67 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %66, %ObjKind 6, %Nat32 %33)
  ret %Obj %67
}

define %Obj @eval_ref (%Value* %v) {

;stmt0:
  %vx = alloca %Obj

;stmt1:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 5
  %2 = getelementptr inbounds %ValueUn, %ValueUn* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %Obj (%Value*) @eval (%Value* %3)
  store %Obj %4, %Obj* %vx

;stmt2:
  %5 = getelementptr inbounds %Obj, %Obj* %vx, i32 0, i32 0
  %6 = load %ObjKind, %ObjKind* %5
  %7 = icmp eq %ObjKind %6, 6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %Obj, %Obj* %vx, i32 0, i32 4
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %9, %ObjKind 7, %Nat32 %11)
  ret %Obj %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %14 = call %Nat32 () @lab_get ()

;stmt6:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @_func309_str1
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16, %Nat32 %14)

;stmt7:
  %18 = getelementptr inbounds %Obj, %Obj* %vx, i32 0, i32 1
  %19 = load %Type*, %Type** %18
  call void (%Type*, %Bool, %Bool) @printType (%Type* %19, %Bool 1, %Bool 1)

;stmt8:
  call void () @comma ()

;stmt9:
  %20 = getelementptr inbounds %Obj, %Obj* %vx, i32 0, i32 1
  %21 = load %Type*, %Type** %20
  call void (%Type*, %Bool, %Bool) @printType (%Type* %21, %Bool 1, %Bool 1)

;stmt10:
  %22 = load %Str, %Str* @_func309_str2
  call void (%Str) @o (%Str %22)

;stmt11:
  %23 = load %Obj, %Obj* %vx
  call void (%Obj) @print_obj (%Obj %23)

;stmt12:
  call void () @comma ()

;stmt13:
  %24 = load %Str, %Str* @_func309_str3
  call void (%Str) @o (%Str %24)

;stmt14:
  %25 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %26 = load %Type*, %Type** %25
  %27 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %26, %ObjKind 7, %Nat32 %14)
  ret %Obj %27
}

define %Obj @eval_deref (%Value* %v) {

;stmt0:
  %vx = alloca %Obj

;stmt1:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 5
  %2 = getelementptr inbounds %ValueUn, %ValueUn* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %Obj (%Value*) @eval (%Value* %3)
  %5 = call %Obj (%Obj) @load (%Obj %4)
  store %Obj %5, %Obj* %vx

;stmt2:
  %6 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = getelementptr inbounds %Obj, %Obj* %vx, i32 0, i32 4
  %9 = load %Nat32, %Nat32* %8
  %10 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %7, %ObjKind 6, %Nat32 %9)
  ret %Obj %10
}

define %Obj @eval_not (%Value* %v) {

;stmt0:
  %vx = alloca %Obj

;stmt1:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 5
  %2 = getelementptr inbounds %ValueUn, %ValueUn* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %Obj (%Value*) @eval (%Value* %3)
  %5 = call %Obj (%Obj) @load (%Obj %4)
  store %Obj %5, %Obj* %vx

;stmt2:
  %6 = call %Nat32 () @lab_get ()

;stmt3:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @_func311_str1
  %9 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8, %Nat32 %6)

;stmt4:
  %10 = getelementptr inbounds %Obj, %Obj* %vx, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)

;stmt5:
  call void () @space ()

;stmt6:
  %12 = load %Obj, %Obj* %vx
  call void (%Obj) @print_obj (%Obj %12)

;stmt7:
  %13 = getelementptr inbounds %Obj, %Obj* %vx, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = load %Type*, %Type** @typeBool
  %16 = call %Bool (%Type*, %Type*) @type_eq (%Type* %14, %Type* %15)
  br i1 %16, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  %17 = load %Str, %Str* @_func311_str2
  call void (%Str) @o (%Str %17)
  br label %endif_0
else_0:

;stmt10:

;stmt11:
  %18 = load %Str, %Str* @_func311_str3
  call void (%Str) @o (%Str %18)
  br label %endif_0
endif_0:

;stmt12:
  %19 = getelementptr inbounds %Obj, %Obj* %vx, i32 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %20, %ObjKind 7, %Nat32 %6)
  ret %Obj %21
}

define %Obj @eval_minus (%Value* %v) {

;stmt0:
  %vx = alloca %Obj

;stmt1:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 5
  %2 = getelementptr inbounds %ValueUn, %ValueUn* %1, i32 0, i32 0
  %3 = load %Value*, %Value** %2
  %4 = call %Obj (%Value*) @eval (%Value* %3)
  %5 = call %Obj (%Obj) @load (%Obj %4)
  store %Obj %5, %Obj* %vx

;stmt2:
  %6 = call %Nat32 () @lab_get ()

;stmt3:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @_func312_str1
  %9 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8, %Nat32 %6)

;stmt4:
  %10 = getelementptr inbounds %Obj, %Obj* %vx, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)

;stmt5:
  %12 = load %Unit*, %Unit** @fout
  %13 = load %Str, %Str* @_func312_str2
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13)

;stmt6:
  call void () @comma ()

;stmt7:
  %15 = load %Obj, %Obj* %vx
  call void (%Obj) @print_obj (%Obj %15)

;stmt8:
  %16 = getelementptr inbounds %Obj, %Obj* %vx, i32 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %17, %ObjKind 7, %Nat32 %6)
  ret %Obj %18
}

define %Obj @eval_cast (%Value* %v) {

;stmt0:
  %xx = alloca %Nat32

;stmt1:
  store %Nat32 0, %Nat32* %xx

;stmt2:
  %1 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 9
  %2 = getelementptr inbounds %ValueCast, %ValueCast* %1, i32 0, i32 1
  %3 = load %Type*, %Type** %2

;stmt3:
  %ee = alloca %Obj

;stmt4:
  %4 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 9
  %5 = getelementptr inbounds %ValueCast, %ValueCast* %4, i32 0, i32 0
  %6 = load %Value*, %Value** %5
  %7 = call %Obj (%Value*) @eval (%Value* %6)
  %8 = call %Obj (%Obj) @load (%Obj %7)
  store %Obj %8, %Obj* %ee

;stmt5:
  %9 = getelementptr inbounds %Obj, %Obj* %ee, i32 0, i32 1
  %10 = load %Type*, %Type** %9
  %11 = call %Bool (%Type*, %Type*) @type_eq (%Type* %10, %Type* %3)
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %12 = load %Obj, %Obj* %ee
  ret %Obj %12
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %14 = call %Nat32 () @lab_get ()

;stmt9:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @_func313_str1
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16, %Nat32 %14)

;stmt10:
  %18 = getelementptr inbounds %Obj, %Obj* %ee, i32 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = getelementptr inbounds %Type, %Type* %19, i32 0, i32 0
  %21 = load %TypeKind, %TypeKind* %20

;stmt11:
  %22 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  %23 = load %TypeKind, %TypeKind* %22
  %24 = icmp eq %TypeKind %23, 7
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %25 = icmp eq %TypeKind %21, 2
  br i1 %25, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %26 = load %Unit*, %Unit** @fout
  %27 = load %Str, %Str* @_func313_str2
  %28 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %26, %Str %27)
  br label %endif_2
else_2:

;stmt16:

;stmt17:
  %29 = load %Unit*, %Unit** @fout
  %30 = load %Str, %Str* @_func313_str3
  %31 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %29, %Str %30)
  br label %endif_2
endif_2:
  br label %endif_1
else_1:

;stmt18:
  %32 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  %33 = load %TypeKind, %TypeKind* %32
  %34 = icmp eq %TypeKind %33, 6
  %35 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  %36 = load %TypeKind, %TypeKind* %35
  %37 = icmp eq %TypeKind %36, 3
  %38 = or %Bool %34, %37
  br i1 %38, label %then_3, label %else_3
then_3:

;stmt19:

;stmt20:
  %39 = icmp eq %TypeKind %21, 6
  %40 = icmp eq %TypeKind %21, 7
  %41 = icmp eq %TypeKind %21, 3
  %42 = or %Bool %40, %41
  %43 = or %Bool %39, %42
  br i1 %43, label %then_4, label %else_4
then_4:

;stmt21:

;stmt22:
  %44 = load %Unit*, %Unit** @fout
  %45 = load %Str, %Str* @_func313_str4
  %46 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %44, %Str %45)
  br label %endif_4
else_4:

;stmt23:

;stmt24:
  %47 = load %Unit*, %Unit** @fout
  %48 = load %Str, %Str* @_func313_str5
  %49 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %47, %Str %48)
  br label %endif_4
endif_4:
  br label %endif_3
else_3:

;stmt25:
  %50 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  %51 = load %TypeKind, %TypeKind* %50
  %52 = icmp eq %TypeKind %51, 2
  br i1 %52, label %then_5, label %else_5
then_5:

;stmt26:

;stmt27:
  %53 = icmp eq %TypeKind %21, 2
  br i1 %53, label %then_6, label %else_6
then_6:

;stmt28:

;stmt29:
  %54 = getelementptr inbounds %Obj, %Obj* %ee, i32 0, i32 1
  %55 = load %Type*, %Type** %54
  %56 = getelementptr inbounds %Type, %Type* %55, i32 0, i32 5
  %57 = getelementptr inbounds %TypeBasic, %TypeBasic* %56, i32 0, i32 1
  %58 = load %Nat32, %Nat32* %57
  %59 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5
  %60 = getelementptr inbounds %TypeBasic, %TypeBasic* %59, i32 0, i32 1
  %61 = load %Nat32, %Nat32* %60
  %62 = icmp ugt %Nat32 %58, %61
  br i1 %62, label %then_7, label %else_7
then_7:

;stmt30:

;stmt31:
  %63 = load %Unit*, %Unit** @fout
  %64 = load %Str, %Str* @_func313_str6
  %65 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %63, %Str %64)
  br label %endif_7
else_7:

;stmt32:
  %66 = getelementptr inbounds %Obj, %Obj* %ee, i32 0, i32 1
  %67 = load %Type*, %Type** %66
  %68 = getelementptr inbounds %Type, %Type* %67, i32 0, i32 5
  %69 = getelementptr inbounds %TypeBasic, %TypeBasic* %68, i32 0, i32 1
  %70 = load %Nat32, %Nat32* %69
  %71 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5
  %72 = getelementptr inbounds %TypeBasic, %TypeBasic* %71, i32 0, i32 1
  %73 = load %Nat32, %Nat32* %72
  %74 = icmp ult %Nat32 %70, %73
  br i1 %74, label %then_8, label %else_8
then_8:

;stmt33:

;stmt34:
  %75 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5
  %76 = getelementptr inbounds %TypeBasic, %TypeBasic* %75, i32 0, i32 3
  %77 = load %Bool, %Bool* %76
  br i1 %77, label %then_9, label %else_9
then_9:

;stmt35:

;stmt36:
  %78 = load %Unit*, %Unit** @fout
  %79 = load %Str, %Str* @_func313_str7
  %80 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %78, %Str %79)
  br label %endif_9
else_9:

;stmt37:

;stmt38:
  %81 = load %Unit*, %Unit** @fout
  %82 = load %Str, %Str* @_func313_str8
  %83 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %81, %Str %82)
  br label %endif_9
endif_9:

;stmt39:
  %84 = load %Unit*, %Unit** @fout
  %85 = load %Str, %Str* @_func313_str9
  %86 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %84, %Str %85)
  br label %endif_8
else_8:

;stmt40:

;stmt41:
  %87 = load %Unit*, %Unit** @fout
  %88 = load %Str, %Str* @_func313_str10
  %89 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %87, %Str %88)
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
else_6:

;stmt42:
  %90 = icmp eq %TypeKind %21, 6
  br i1 %90, label %then_10, label %else_10
then_10:

;stmt43:

;stmt44:
  %91 = load %Unit*, %Unit** @fout
  %92 = load %Str, %Str* @_func313_str11
  %93 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %91, %Str %92)
  br label %endif_10
else_10:

;stmt45:
  %94 = icmp eq %TypeKind %21, 4
  br i1 %94, label %then_11, label %else_11
then_11:

;stmt46:

;stmt47:
  %95 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 3
  %96 = load %Nat32, %Nat32* %95
  %97 = mul %Nat32 %96, 8

;stmt48:
  %98 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5
  %99 = getelementptr inbounds %TypeBasic, %TypeBasic* %98, i32 0, i32 1
  %100 = load %Nat32, %Nat32* %99
  %101 = icmp ugt %Nat32 %97, %100
  br i1 %101, label %then_12, label %else_12
then_12:

;stmt49:

;stmt50:
  %102 = load %Unit*, %Unit** @fout
  %103 = load %Str, %Str* @_func313_str12
  %104 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %102, %Str %103)
  br label %endif_12
else_12:

;stmt51:
  %105 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5
  %106 = getelementptr inbounds %TypeBasic, %TypeBasic* %105, i32 0, i32 1
  %107 = load %Nat32, %Nat32* %106
  %108 = icmp ult %Nat32 %97, %107
  br i1 %108, label %then_13, label %else_13
then_13:

;stmt52:

;stmt53:
  %109 = load %Unit*, %Unit** @fout
  %110 = load %Str, %Str* @_func313_str13
  %111 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %109, %Str %110)
  br label %endif_13
else_13:

;stmt54:

;stmt55:
  %112 = load %Unit*, %Unit** @fout
  %113 = load %Str, %Str* @_func313_str14
  %114 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %112, %Str %113)
  br label %endif_13
endif_13:
  br label %endif_12
endif_12:
  br label %endif_11
else_11:

;stmt56:
  %115 = icmp eq %TypeKind %21, 7
  br i1 %115, label %then_14, label %else_14
then_14:

;stmt57:
  br label %endif_14
else_14:

;stmt58:

;stmt59:
  %116 = load %Str, %Str* @_func313_str15
  %117 = call %Int32 (%Str, ...) @printf (%Str %116, %TypeKind %21)

;stmt60:
  %118 = load %Str, %Str* @_func313_str16
  call void (%Str) @fatal (%Str %118)
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
  %119 = getelementptr inbounds %Obj, %Obj* %ee, i32 0, i32 1
  %120 = load %Type*, %Type** %119
  call void (%Type*, %Bool, %Bool) @printType (%Type* %120, %Bool 1, %Bool 1)

;stmt62:
  call void () @space ()

;stmt63:
  %121 = load %Obj, %Obj* %ee
  call void (%Obj) @print_obj (%Obj %121)

;stmt64:
  %122 = load %Str, %Str* @_func313_str17
  call void (%Str) @o (%Str %122)

;stmt65:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt66:
  %123 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %124 = load %Type*, %Type** %123
  %125 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %124, %ObjKind 7, %Nat32 %14)
  ret %Obj %125
}

define %Obj @eval_bin (%Value* %v) {

;stmt0:
  %o = alloca %Str

;stmt1:
  %1 = load %Str, %Str* @_func314_str1
  store %Str %1, %Str* %o

;stmt2:
  %2 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %3 = getelementptr inbounds %ValueBin, %ValueBin* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 5
  %8 = getelementptr inbounds %TypeBasic, %TypeBasic* %7, i32 0, i32 3
  %9 = load %Bool, %Bool* %8

;stmt3:
  %10 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %11 = load %ValueKind, %ValueKind* %10

;stmt4:
  %12 = icmp eq %ValueKind %11, 12
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %13 = load %Str, %Str* @_func314_str2
  store %Str %13, %Str* %o
  br label %endif_0
else_0:

;stmt7:
  %14 = icmp eq %ValueKind %11, 13
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %15 = load %Str, %Str* @_func314_str3
  store %Str %15, %Str* %o
  br label %endif_1
else_1:

;stmt10:
  %16 = icmp eq %ValueKind %11, 14
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %17 = load %Str, %Str* @_func314_str4
  store %Str %17, %Str* %o
  br label %endif_2
else_2:

;stmt13:
  %18 = icmp eq %ValueKind %11, 15
  br i1 %18, label %then_3, label %else_3
then_3:

;stmt14:

;stmt15:
  br i1 %9, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %19 = load %Str, %Str* @_func314_str5
  store %Str %19, %Str* %o
  br label %endif_4
else_4:

;stmt18:

;stmt19:
  %20 = load %Str, %Str* @_func314_str6
  store %Str %20, %Str* %o
  br label %endif_4
endif_4:
  br label %endif_3
else_3:

;stmt20:
  %21 = icmp eq %ValueKind %11, 16
  br i1 %21, label %then_5, label %else_5
then_5:

;stmt21:

;stmt22:
  br i1 %9, label %then_6, label %else_6
then_6:

;stmt23:

;stmt24:
  %22 = load %Str, %Str* @_func314_str7
  store %Str %22, %Str* %o
  br label %endif_6
else_6:

;stmt25:

;stmt26:
  %23 = load %Str, %Str* @_func314_str8
  store %Str %23, %Str* %o
  br label %endif_6
endif_6:
  br label %endif_5
else_5:

;stmt27:
  %24 = icmp eq %ValueKind %11, 17
  br i1 %24, label %then_7, label %else_7
then_7:

;stmt28:

;stmt29:
  %25 = load %Str, %Str* @_func314_str9
  store %Str %25, %Str* %o
  br label %endif_7
else_7:

;stmt30:
  %26 = icmp eq %ValueKind %11, 18
  br i1 %26, label %then_8, label %else_8
then_8:

;stmt31:

;stmt32:
  %27 = load %Str, %Str* @_func314_str10
  store %Str %27, %Str* %o
  br label %endif_8
else_8:

;stmt33:
  %28 = icmp eq %ValueKind %11, 19
  br i1 %28, label %then_9, label %else_9
then_9:

;stmt34:

;stmt35:
  %29 = load %Str, %Str* @_func314_str11
  store %Str %29, %Str* %o
  br label %endif_9
else_9:

;stmt36:
  %30 = icmp eq %ValueKind %11, 20
  br i1 %30, label %then_10, label %else_10
then_10:

;stmt37:

;stmt38:
  %31 = load %Str, %Str* @_func314_str12
  store %Str %31, %Str* %o
  br label %endif_10
else_10:

;stmt39:
  %32 = icmp eq %ValueKind %11, 21
  br i1 %32, label %then_11, label %else_11
then_11:

;stmt40:

;stmt41:
  %33 = load %Str, %Str* @_func314_str13
  store %Str %33, %Str* %o
  br label %endif_11
else_11:

;stmt42:
  %34 = icmp eq %ValueKind %11, 22
  br i1 %34, label %then_12, label %else_12
then_12:

;stmt43:

;stmt44:
  br i1 %9, label %then_13, label %else_13
then_13:

;stmt45:

;stmt46:
  %35 = load %Str, %Str* @_func314_str14
  store %Str %35, %Str* %o
  br label %endif_13
else_13:

;stmt47:

;stmt48:
  %36 = load %Str, %Str* @_func314_str15
  store %Str %36, %Str* %o
  br label %endif_13
endif_13:
  br label %endif_12
else_12:

;stmt49:
  %37 = icmp eq %ValueKind %11, 23
  br i1 %37, label %then_14, label %else_14
then_14:

;stmt50:

;stmt51:
  br i1 %9, label %then_15, label %else_15
then_15:

;stmt52:

;stmt53:
  %38 = load %Str, %Str* @_func314_str16
  store %Str %38, %Str* %o
  br label %endif_15
else_15:

;stmt54:

;stmt55:
  %39 = load %Str, %Str* @_func314_str17
  store %Str %39, %Str* %o
  br label %endif_15
endif_15:
  br label %endif_14
else_14:

;stmt56:
  %40 = icmp eq %ValueKind %11, 24
  br i1 %40, label %then_16, label %else_16
then_16:

;stmt57:

;stmt58:
  br i1 %9, label %then_17, label %else_17
then_17:

;stmt59:

;stmt60:
  %41 = load %Str, %Str* @_func314_str18
  store %Str %41, %Str* %o
  br label %endif_17
else_17:

;stmt61:

;stmt62:
  %42 = load %Str, %Str* @_func314_str19
  store %Str %42, %Str* %o
  br label %endif_17
endif_17:
  br label %endif_16
else_16:

;stmt63:
  %43 = icmp eq %ValueKind %11, 25
  br i1 %43, label %then_18, label %else_18
then_18:

;stmt64:

;stmt65:
  br i1 %9, label %then_19, label %else_19
then_19:

;stmt66:

;stmt67:
  %44 = load %Str, %Str* @_func314_str20
  store %Str %44, %Str* %o
  br label %endif_19
else_19:

;stmt68:

;stmt69:
  %45 = load %Str, %Str* @_func314_str21
  store %Str %45, %Str* %o
  br label %endif_19
endif_19:
  br label %endif_18
else_18:

;stmt70:
  %46 = icmp eq %ValueKind %11, 26
  br i1 %46, label %then_20, label %else_20
then_20:

;stmt71:

;stmt72:
  %47 = load %Str, %Str* @_func314_str22
  store %Str %47, %Str* %o
  br label %endif_20
else_20:

;stmt73:
  %48 = icmp eq %ValueKind %11, 27
  br i1 %48, label %then_21, label %else_21
then_21:

;stmt74:

;stmt75:
  br i1 %9, label %then_22, label %else_22
then_22:

;stmt76:

;stmt77:
  %49 = load %Str, %Str* @_func314_str23
  store %Str %49, %Str* %o
  br label %endif_22
else_22:

;stmt78:

;stmt79:
  %50 = load %Str, %Str* @_func314_str24
  store %Str %50, %Str* %o
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
  %l = alloca %Obj

;stmt81:
  %r = alloca %Obj

;stmt82:
  %51 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %52 = getelementptr inbounds %ValueBin, %ValueBin* %51, i32 0, i32 0
  %53 = load %Value*, %Value** %52
  %54 = call %Obj (%Value*) @eval (%Value* %53)
  %55 = call %Obj (%Obj) @load (%Obj %54)
  store %Obj %55, %Obj* %l

;stmt83:
  %56 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 6
  %57 = getelementptr inbounds %ValueBin, %ValueBin* %56, i32 0, i32 1
  %58 = load %Value*, %Value** %57
  %59 = call %Obj (%Value*) @eval (%Value* %58)
  %60 = call %Obj (%Obj) @load (%Obj %59)
  store %Obj %60, %Obj* %r

;stmt84:
  %61 = call %Nat32 () @lab_get ()

;stmt85:
  %62 = load %Unit*, %Unit** @fout
  %63 = load %Str, %Str* @_func314_str25
  %64 = load %Str, %Str* %o
  %65 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %62, %Str %63, %Nat32 %61, %Str %64)

;stmt86:
  %66 = getelementptr inbounds %Obj, %Obj* %l, i32 0, i32 1
  %67 = load %Type*, %Type** %66
  call void (%Type*, %Bool, %Bool) @printType (%Type* %67, %Bool 1, %Bool 1)

;stmt87:
  call void () @space ()

;stmt88:
  %68 = load %Obj, %Obj* %l
  call void (%Obj) @print_obj (%Obj %68)

;stmt89:
  call void () @comma ()

;stmt90:
  %69 = load %Obj, %Obj* %r
  call void (%Obj) @print_obj (%Obj %69)

;stmt91:
  %70 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %71 = load %Type*, %Type** %70
  %72 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %71, %ObjKind 7, %Nat32 %61)
  ret %Obj %72
}

define void @print_st (%Value* %l, %Value* %r) {

;stmt0:
  %lx = alloca %Obj

;stmt1:
  %rx = alloca %Obj

;stmt2:
  %1 = call %Obj (%Value*) @eval (%Value* %l)
  store %Obj %1, %Obj* %lx

;stmt3:
  %2 = call %Obj (%Value*) @eval (%Value* %r)
  %3 = call %Obj (%Obj) @load (%Obj %2)
  store %Obj %3, %Obj* %rx

;stmt4:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func315_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5)

;stmt5:
  %7 = getelementptr inbounds %Obj, %Obj* %rx, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*, %Bool, %Bool) @printType (%Type* %8, %Bool 1, %Bool 1)

;stmt6:
  call void () @space ()

;stmt7:
  %9 = load %Obj, %Obj* %rx
  call void (%Obj) @print_obj (%Obj %9)

;stmt8:
  call void () @comma ()

;stmt9:
  %10 = getelementptr inbounds %Obj, %Obj* %rx, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)

;stmt10:
  %12 = load %Str, %Str* @_func315_str2
  call void (%Str) @o (%Str %12)

;stmt11:
  %13 = load %Obj, %Obj* %lx
  call void (%Obj) @print_obj (%Obj %13)
  ret void
}

define %Obj @loadImmPtr (%Obj %x) {

;stmt0:
  %1 = extractvalue %Obj %x, 1

;stmt1:
  %2 = call %Nat32 () @lab_get ()

;stmt2:
  %3 = load %Unit*, %Unit** @fout
  %4 = load %Str, %Str* @_func317_str1
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4, %Nat32 %2)

;stmt3:
  call void (%Obj) @print_obj (%Obj %x)

;stmt4:
  %6 = load %Str, %Str* @_func317_str2
  call void (%Str) @o (%Str %6)

;stmt5:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %1, %Bool 1, %Bool 1)

;stmt6:
  %7 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %1, %ObjKind 7, %Nat32 %2)
  ret %Obj %7
}

define %Obj @load (%Obj %x) {

;stmt0:
  %1 = extractvalue %Obj %x, 0
  %2 = icmp eq %ObjKind %1, 0
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  ret %Obj %x
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %4 = extractvalue %Obj %x, 0
  %5 = icmp eq %ObjKind %4, 1
  br i1 %5, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %6 = extractvalue %Obj %x, 1
  %7 = call %Bool (%Type*) @typeIsReference (%Type* %6)
  br i1 %7, label %then_2, label %else_2
then_2:

;stmt6:

;stmt7:
  %8 = call %Obj (%Obj) @loadImmPtr (%Obj %x)
  ret %Obj %8
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt8:
  ret %Obj %x
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %11 = extractvalue %Obj %x, 0
  %12 = icmp ne %ObjKind %11, 4
  %13 = extractvalue %Obj %x, 0
  %14 = icmp ne %ObjKind %13, 5
  %15 = extractvalue %Obj %x, 0
  %16 = icmp ne %ObjKind %15, 6
  %17 = and %Bool %14, %16
  %18 = and %Bool %12, %17
  br i1 %18, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  ret %Obj %x
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt12:
  %20 = call %Nat32 () @lab_get ()

;stmt13:
  %21 = load %Unit*, %Unit** @fout
  %22 = load %Str, %Str* @_func316_str1
  %23 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22, %Nat32 %20)

;stmt14:
  %24 = extractvalue %Obj %x, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %24, %Bool 1, %Bool 1)

;stmt15:
  call void () @comma ()

;stmt16:
  %25 = extractvalue %Obj %x, 1
  call void (%Type*, %Bool, %Bool) @printType (%Type* %25, %Bool 1, %Bool 1)

;stmt17:
  %26 = load %Str, %Str* @_func316_str2
  call void (%Str) @o (%Str %26)

;stmt18:
  call void (%Obj) @print_obj (%Obj %x)

;stmt19:
  %27 = extractvalue %Obj %x, 1
  %28 = call %Obj (%Type*, %ObjKind, %Nat32) @new_obj (%Type* %27, %ObjKind 7, %Nat32 %20)
  ret %Obj %28
}

define void @print_obj (%Obj %o) {

;stmt0:
  %1 = extractvalue %Obj %o, 0

;stmt1:
  %2 = icmp eq %ObjKind %1, 1
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %3 = load %Unit*, %Unit** @fout
  %4 = load %Str, %Str* @_func318_str1
  %5 = extractvalue %Obj %o, 2
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4, %Int64 %5)
  br label %endif_0
else_0:

;stmt4:
  %7 = icmp eq %ObjKind %1, 7
  %8 = icmp eq %ObjKind %1, 6
  %9 = or %Bool %7, %8
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %10 = load %Unit*, %Unit** @fout
  %11 = load %Str, %Str* @_func318_str2
  %12 = extractvalue %Obj %o, 4
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11, %Nat32 %12)
  br label %endif_1
else_1:

;stmt7:
  %14 = icmp eq %ObjKind %1, 5
  %15 = icmp eq %ObjKind %1, 2
  %16 = or %Bool %14, %15
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %17 = load %Unit*, %Unit** @fout
  %18 = load %Str, %Str* @_func318_str3
  %19 = extractvalue %Obj %o, 3
  %20 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %17, %Str %18, %Str %19)
  br label %endif_2
else_2:

;stmt10:
  %21 = icmp eq %ObjKind %1, 4
  %22 = icmp eq %ObjKind %1, 3
  %23 = or %Bool %21, %22
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %24 = load %Unit*, %Unit** @fout
  %25 = load %Str, %Str* @_func318_str4
  %26 = extractvalue %Obj %o, 3
  %27 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25, %Str %26)
  br label %endif_3
else_3:

;stmt13:
  %28 = icmp eq %ObjKind %1, 0
  br i1 %28, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  %29 = load %Unit*, %Unit** @fout
  %30 = load %Str, %Str* @_func318_str5
  %31 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %29, %Str %30)
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

define void @typedef (%Str %id, %Type* %t) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func319_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %id)

;stmt1:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %t, %Bool 0, %Bool 1)
  ret void
}

define void @print_array_item (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Value*

;stmt1:
  %2 = bitcast %Unit* %ctx to %Bool*

;stmt2:
  %3 = load %Bool, %Bool* %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %4 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1
  %5 = load %Type*, %Type** %4
  call void (%Type*, %Bool, %Bool) @printType (%Type* %5, %Bool 1, %Bool 1)

;stmt6:
  call void () @space ()

;stmt7:
  store %Bool 1, %Bool* %2
  ret void
}

define void @arraydef (%Str %id, %Type* %t, %List* %items) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func320_str1
  %3 = getelementptr inbounds %List, %List* %items, i32 0, i32 2
  %4 = load %Nat64, %Nat64* %3
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %id, %Nat64 %4)

;stmt1:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %t, %Bool 1, %Bool 1)

;stmt2:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @_func320_str2
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)

;stmt3:
  %need_comma = alloca %Bool

;stmt4:
  store %Bool 0, %Bool* %need_comma

;stmt5:
  %9 = getelementptr inbounds %Bool, %Bool* %need_comma, i32 0
  %10 = bitcast %Bool* %9 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %items, %ListForeachHandler @print_array_item, %Unit* %10)

;stmt6:
  %11 = load %Unit*, %Unit** @fout
  %12 = load %Str, %Str* @_func320_str3
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12)
  ret void
}

define void @stringdef (%Str %id, %Nat32 %len, %Str %s) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func322_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %id, %Nat32 %len)

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
  %4 = load %Nat32, %Nat32* %i
  %5 = getelementptr inbounds %Nat8, %Str %s, %Nat32 %4
  %6 = load %Nat8, %Nat8* %5

;stmt6:
  %7 = load %Nat32, %Nat32* %i
  %8 = add %Nat32 %7, 1
  store %Nat32 %8, %Nat32* %i

;stmt7:
  %9 = icmp eq %Nat8 %6, 0
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt10:
  %11 = load %Str, %Str* @_func322_str2
  %12 = getelementptr inbounds %Nat8, %Str %11, %Int32 0
  %13 = load %Nat8, %Nat8* %12
  %14 = icmp eq %Nat8 %6, %13
  %15 = load %Str, %Str* @_func322_str3
  %16 = getelementptr inbounds %Nat8, %Str %15, %Int32 0
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp eq %Nat8 %6, %17
  %19 = load %Str, %Str* @_func322_str4
  %20 = getelementptr inbounds %Nat8, %Str %19, %Int32 0
  %21 = load %Nat8, %Nat8* %20
  %22 = icmp eq %Nat8 %6, %21
  %23 = load %Str, %Str* @_func322_str5
  %24 = getelementptr inbounds %Nat8, %Str %23, %Int32 0
  %25 = load %Nat8, %Nat8* %24
  %26 = icmp eq %Nat8 %6, %25
  %27 = load %Str, %Str* @_func322_str6
  %28 = getelementptr inbounds %Nat8, %Str %27, %Int32 0
  %29 = load %Nat8, %Nat8* %28
  %30 = icmp eq %Nat8 %6, %29
  %31 = load %Str, %Str* @_func322_str7
  %32 = getelementptr inbounds %Nat8, %Str %31, %Int32 0
  %33 = load %Nat8, %Nat8* %32
  %34 = icmp eq %Nat8 %6, %33
  %35 = load %Str, %Str* @_func322_str8
  %36 = getelementptr inbounds %Nat8, %Str %35, %Int32 0
  %37 = load %Nat8, %Nat8* %36
  %38 = icmp eq %Nat8 %6, %37
  %39 = load %Str, %Str* @_func322_str9
  %40 = getelementptr inbounds %Nat8, %Str %39, %Int32 0
  %41 = load %Nat8, %Nat8* %40
  %42 = icmp eq %Nat8 %6, %41
  %43 = or %Bool %38, %42
  %44 = or %Bool %34, %43
  %45 = or %Bool %30, %44
  %46 = or %Bool %26, %45
  %47 = or %Bool %22, %46
  %48 = or %Bool %18, %47
  %49 = or %Bool %14, %48
  br i1 %49, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %50 = load %Unit*, %Unit** @fout
  %51 = load %Str, %Str* @_func322_str10
  %52 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %50, %Str %51, %Nat8 %6)
  br label %endif_1
else_1:

;stmt13:

;stmt14:
  %53 = load %Unit*, %Unit** @fout
  %54 = load %Str, %Str* @_func322_str11
  %55 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %53, %Str %54, %Nat8 %6)
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt15:
  %56 = load %Unit*, %Unit** @fout
  %57 = load %Str, %Str* @_func322_str12
  %58 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %56, %Str %57, %Int32 0)

;stmt16:
  %59 = load %Unit*, %Unit** @fout
  %60 = load %Str, %Str* @_func322_str13
  %61 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %59, %Str %60, %Str %id, %Nat32 %len, %Nat32 %len, %Str %id)
  ret void
}

define void @vardef (%Str %id, %Type* %t, %Value* %v) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func323_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %id)

;stmt1:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %t, %Bool 1, %Bool 1)

;stmt2:
  call void () @space ()

;stmt3:
  %4 = load %Str, %Str* @_func323_str2
  call void (%Str) @o (%Str %4)
  ret void
}

define void @vf_print_param (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %Field*

;stmt1:
  %2 = bitcast %Unit* %ctx to %Bool*

;stmt2:
  %3 = load %Bool, %Bool* %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @_func325_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %7 = getelementptr inbounds %Field, %Field* %1, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  call void (%Type*, %Bool, %Bool) @printType (%Type* %8, %Bool 1, %Bool 1)

;stmt6:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @_func325_str2
  %11 = bitcast %Unit* %data to %Field*
  %12 = getelementptr inbounds %Field, %Field* %11, i32 0, i32 0
  %13 = load %Str, %Str* %12
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10, %Str %13)

;stmt7:
  store %Bool 1, %Bool* %2
  ret void
}

define void @funcdef (%Str %id, %Type* %t, %Block* %b) {

;stmt0:
  call void () @lab_reset ()

;stmt1:
  %1 = call %Nat32 () @lab_get ()

;stmt2:
  %2 = bitcast %Type* %t to %Unit*
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  %5 = load %Str, %Str* @_func324_str1
  call void (%Bool, %Str) @assert (%Bool %4, %Str %5)

;stmt3:
  %6 = bitcast %Block* %b to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %9 = load %Str, %Str* @_func324_str2
  call void (%Str) @o (%Str %9)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %10 = load %Str, %Str* @_func324_str3
  call void (%Str) @o (%Str %10)
  br label %endif_0
endif_0:

;stmt8:
  call void () @space ()

;stmt9:
  %11 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 6
  %12 = getelementptr inbounds %TypeFunc, %TypeFunc* %11, i32 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = load %Type*, %Type** @typeUnit
  %15 = call %Bool (%Type*, %Type*) @type_eq (%Type* %13, %Type* %14)

;stmt10:
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %16 = load %Str, %Str* @_func324_str4
  call void (%Str) @o (%Str %16)
  br label %endif_1
else_1:

;stmt13:

;stmt14:
  %17 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 6
  %18 = getelementptr inbounds %TypeFunc, %TypeFunc* %17, i32 0, i32 1
  %19 = load %Type*, %Type** %18
  call void (%Type*, %Bool, %Bool) @printType (%Type* %19, %Bool 1, %Bool 1)
  br label %endif_1
endif_1:

;stmt15:
  %20 = load %Unit*, %Unit** @fout
  %21 = load %Str, %Str* @_func324_str5
  %22 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %20, %Str %21, %Str %id)

;stmt16:
  %need_comma = alloca %Bool

;stmt17:
  store %Bool 0, %Bool* %need_comma

;stmt18:
  %23 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 6
  %24 = getelementptr inbounds %TypeFunc, %TypeFunc* %23, i32 0, i32 0
  %25 = load %List*, %List** %24
  %26 = getelementptr inbounds %Bool, %Bool* %need_comma, i32 0
  %27 = bitcast %Bool* %26 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %25, %ListForeachHandler @vf_print_param, %Unit* %27)

;stmt19:
  %28 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 6
  %29 = getelementptr inbounds %TypeFunc, %TypeFunc* %28, i32 0, i32 2
  %30 = load %Bool, %Bool* %29
  br i1 %30, label %then_2, label %else_2
then_2:

;stmt20:

;stmt21:
  %31 = load %Str, %Str* @_func324_str6
  call void (%Str) @o (%Str %31)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt22:
  %32 = load %Str, %Str* @_func324_str7
  call void (%Str) @o (%Str %32)

;stmt23:
  %33 = bitcast %Block* %b to %Unit*
  %34 = inttoptr i64 0 to %Unit*
  %35 = icmp ne %Unit* %33, %34
  br i1 %35, label %then_3, label %else_3
then_3:

;stmt24:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt25:
  %36 = bitcast %Block* %b to %Unit*
  %37 = inttoptr i64 0 to %Unit*
  %38 = icmp ne %Unit* %36, %37
  br i1 %38, label %then_4, label %else_4
then_4:

;stmt26:

;stmt27:
  %39 = load %Str, %Str* @_func324_str8
  call void (%Str) @o (%Str %39)

;stmt28:
  call void () @reset_local_labels ()

;stmt29:
  call void (%Block*) @print_block (%Block* %b)

;stmt30:
  br i1 %15, label %then_5, label %else_5
then_5:

;stmt31:

;stmt32:
  %40 = load %Str, %Str* @_func324_str9
  call void (%Str) @o (%Str %40)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:

;stmt33:
  %41 = load %Str, %Str* @_func324_str10
  call void (%Str) @o (%Str %41)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
  ret void
}

define void @prt_itype (%Unit* %k, %Unit* %v, %Unit* %ctx) {

;stmt0:
  %1 = bitcast %Unit* %k to %Str

;stmt1:
  %2 = bitcast %Unit* %v to %Type*

;stmt2:
  %3 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 5
  %4 = getelementptr inbounds %TypeBasic, %TypeBasic* %3, i32 0, i32 2
  %5 = load %Bool, %Bool* %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @_func327_str1
  %8 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 5
  %9 = getelementptr inbounds %TypeBasic, %TypeBasic* %8, i32 0, i32 1
  %10 = load %Nat32, %Nat32* %9
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7, %Str %1, %Nat32 %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @printer_init (%Arch %a, %Str %fname) {

;stmt0:
  %1 = load %Str, %Str* @_func326_str1
  %2 = call %Unit* (%Str, %Str) @fopen (%Str %fname, %Str %1)
  store %Unit* %2, %Unit** @fout

;stmt1:
  %3 = load %Unit*, %Unit** @fout
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Str, %Str* @_func326_str2
  call void (%Str) @fatal (%Str %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @_func326_str3
  %9 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8)

;stmt5:
  %10 = load %Unit*, %Unit** @fout
  %11 = load %Str, %Str* @_func326_str4
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11)

;stmt6:
  call void (%Arch) @print_head (%Arch %a)

;stmt7:
  %13 = load %Unit*, %Unit** @fout
  %14 = load %Str, %Str* @_func326_str5
  %15 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %13, %Str %14)

;stmt8:
  %16 = load %Unit*, %Unit** @fout
  %17 = load %Str, %Str* @_func326_str6
  %18 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %16, %Str %17)

;stmt9:
  %19 = load %Unit*, %Unit** @fout
  %20 = load %Str, %Str* @_func326_str7
  %21 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %19, %Str %20)

;stmt10:
  %22 = load %Unit*, %Unit** @fout
  %23 = load %Str, %Str* @_func326_str8
  %24 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %22, %Str %23)

;stmt11:
  %25 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %26 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %25, %MapForeachHandler @prt_itype, %Unit* %26)

;stmt12:
  %27 = load %Unit*, %Unit** @fout
  %28 = load %Str, %Str* @_func326_str9
  %29 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %27, %Str %28)
  ret void
}

define void @foreach_typedef (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %AssemblyItem*

;stmt1:
  %2 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 5

;stmt2:
  %3 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 1
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %TypeDef, %TypeDef* %2, i32 0, i32 0
  %6 = load %Type*, %Type** %5
  call void (%Str, %Type*) @typedef (%Str %4, %Type* %6)
  ret void
}

define void @foreach_stringdef (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %AssemblyItem*

;stmt1:
  %2 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 3

;stmt2:
  %3 = getelementptr inbounds %StringDef, %StringDef* %2, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = bitcast %Str %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp eq %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = load %Str, %Str* @_func330_str1
  %9 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 1
  %10 = load %Str, %Str* %9
  %11 = call %Int32 (%Str, ...) @printf (%Str %8, %Str %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %12 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 1
  %13 = load %Str, %Str* %12
  %14 = getelementptr inbounds %StringDef, %StringDef* %2, i32 0, i32 1
  %15 = load %Nat32, %Nat32* %14
  %16 = getelementptr inbounds %StringDef, %StringDef* %2, i32 0, i32 0
  %17 = load %Str, %Str* %16
  call void (%Str, %Nat32, %Str) @stringdef (%Str %13, %Nat32 %15, %Str %17)
  ret void
}

define void @foreach_arraydef (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %AssemblyItem*

;stmt1:
  %2 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 9

;stmt2:
  %3 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 1
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %ArrayDef, %ArrayDef* %2, i32 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %ArrayDef, %ArrayDef* %2, i32 0, i32 2
  %8 = load %List*, %List** %7
  call void (%Str, %Type*, %List*) @arraydef (%Str %4, %Type* %6, %List* %8)
  ret void
}

define void @foreach_vardef (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %AssemblyItem*

;stmt1:
  %2 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 13

;stmt2:
  %3 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 1
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %AssemblyVarDef, %AssemblyVarDef* %2, i32 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %AssemblyVarDef, %AssemblyVarDef* %2, i32 0, i32 1
  %8 = load %Value*, %Value** %7
  call void (%Str, %Type*, %Value*) @vardef (%Str %4, %Type* %6, %Value* %8)
  ret void
}

define void @foreach_funcdef (%Unit* %data, %Unit* %ctx, %Nat32 %index) {

;stmt0:
  %1 = bitcast %Unit* %data to %AssemblyItem*

;stmt1:
  %2 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 11

;stmt2:
  %3 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %1, i32 0, i32 1
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 0
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 1
  %8 = load %Block*, %Block** %7
  call void (%Str, %Type*, %Block*) @funcdef (%Str %4, %Type* %6, %Block* %8)
  ret void
}

define void @print_assembly (%Assembly* %a) {

;stmt0:
  %1 = load %Str, %Str* @_func328_str1
  %2 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 0
  %3 = load %Str, %Str* %2
  %4 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %3)

;stmt1:
  %5 = getelementptr inbounds %List, %List* @md_list, i32 0
  call void (%List*) @map_init (%List* %5)

;stmt2:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @_func328_str2
  %8 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 0
  %9 = load %Str, %Str* %8
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7, %Str %9)

;stmt3:
  %11 = load %Str, %Str* @_func328_str3
  call void (%Str) @o (%Str %11)

;stmt4:
  %12 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 1
  %13 = load %List*, %List** %12
  %14 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %13, %ListForeachHandler @foreach_typedef, %Unit* %14)

;stmt5:
  %15 = load %Str, %Str* @_func328_str4
  call void (%Str) @o (%Str %15)

;stmt6:
  %16 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 3
  %17 = load %List*, %List** %16
  %18 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %17, %ListForeachHandler @foreach_stringdef, %Unit* %18)

;stmt7:
  %19 = load %Str, %Str* @_func328_str5
  call void (%Str) @o (%Str %19)

;stmt8:
  %20 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 2
  %21 = load %List*, %List** %20
  %22 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %21, %ListForeachHandler @foreach_arraydef, %Unit* %22)

;stmt9:
  %23 = load %Str, %Str* @_func328_str6
  call void (%Str) @o (%Str %23)

;stmt10:
  %24 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 4
  %25 = load %List*, %List** %24
  %26 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %25, %ListForeachHandler @foreach_vardef, %Unit* %26)

;stmt11:
  %27 = load %Str, %Str* @_func328_str7
  call void (%Str) @o (%Str %27)

;stmt12:
  %28 = getelementptr inbounds %Assembly, %Assembly* %a, i32 0, i32 5
  %29 = load %List*, %List** %28
  %30 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %29, %ListForeachHandler @foreach_funcdef, %Unit* %30)

;stmt13:
  %31 = load %Str, %Str* @_func328_str8
  call void (%Str) @o (%Str %31)

;stmt14:
  %32 = getelementptr inbounds %List, %List* @md_list, i32 0
  call void (%List*) @print_metadata_list (%List* %32)
  ret void
}

define void @print_head (%Arch %a) {

;stmt0:
  %1 = icmp eq %Arch %a, 0
  br i1 %1, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func334_str1
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3)

;stmt3:
  %5 = load %Unit*, %Unit** @fout
  %6 = load %Str, %Str* @_func334_str2
  %7 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %5, %Str %6)
  br label %endif_0
else_0:

;stmt4:
  %8 = icmp eq %Arch %a, 1
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @_func334_str3
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10)

;stmt7:
  %12 = load %Unit*, %Unit** @fout
  %13 = load %Str, %Str* @_func334_str4
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt8:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @_func334_str5
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16)
  ret void
}

define void @tshow (%Unit* %k, %Unit* %v, %Unit* %ctx) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func336_str1
  %3 = bitcast %Unit* %k to %Str
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %3, %Unit* %v)
  ret void
}

define void @print_type_index (%List* %index) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func335_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  %4 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %index, void (%Unit*, %Unit*, %Unit*)* @tshow, %Unit* %4)
  ret void
}

define void @vshow (%Unit* %k, %Unit* %v, %Unit* %ctx) {

;stmt0:
  %1 = bitcast %Unit* %v to %Value*

;stmt1:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @_func338_str1
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Unit* %k, %Value* %1)

;stmt2:
  %5 = load %Unit*, %Unit** @fout
  %6 = load %Str, %Str* @_func338_str2
  %7 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 0
  %8 = load %ValueKind, %ValueKind* %7
  %9 = call %Str (%ValueKind) @print_value_kind (%ValueKind %8)
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %5, %Str %6, %Str %9)

;stmt3:
  %11 = load %Unit*, %Unit** @fout
  %12 = load %Str, %Str* @_func338_str3
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12)
  ret void
}

define void @print_value_index (%List* %index) {

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @_func337_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  %4 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %index, void (%Unit*, %Unit*, %Unit*)* @vshow, %Unit* %4)
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
  call void (%List*) @map_init (%List* %5)

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
  %11 = load %Str, %Str* @_func339_str1
  call void (%Str) @fatal (%Str %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  call void (%Str) @liblist_add (%Str %7)

;stmt8:
  %12 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %13 = load %Str, %Str* @_func339_str2
  call void (%Assembly*, %Str) @asmInit (%Assembly* %12, %Str %13)

;stmt9:
  %14 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  call void (%List*) @map_init (%List* %14)

;stmt10:
  %15 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  call void (%List*) @map_init (%List* %15)

;stmt11:
  %16 = call %List* () @map_new ()
  store %List* %16, %List** @settings

;stmt12:
  %17 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 0
  store %Nat32 64, %Nat32* %17

;stmt13:
  %18 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 1
  store %Nat32 8, %Nat32* %18

;stmt14:
  %19 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 2
  store %Nat32 1, %Nat32* %19

;stmt15:
  %20 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 3
  store %Nat32 2, %Nat32* %20

;stmt16:
  %21 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 4
  store %Nat32 8, %Nat32* %21

;stmt17:
  %22 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  store %Nat32 8, %Nat32* %22

;stmt18:
  call void () @type_init ()

;stmt19:
  call void () @value_init ()

;stmt20:
  store %Arch 0, %Arch* @arch
  ret void
}

define void @readConfig (%Str %fname) {

;stmt0:
  %1 = load %Str, %Str* @_func340_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %fname)

;stmt1:
  %3 = call %List* (%Str) @tokenize (%Str %fname)

;stmt2:
  %4 = load %Str, %Str* @_func340_str2
  %5 = call %Source* (%Str, %List*) @src_new (%Str %4, %List* %3)

;stmt3:
  %6 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %7 = load %Source*, %Source** %6

;stmt4:
  %8 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  store %Source* %5, %Source** %8

;stmt5:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  %d = alloca %Nat64

;stmt8:
  call void () @skip_nl ()

;stmt9:
  %9 = call %Bool () @eof ()
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt10:

;stmt11:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt12:
  %11 = call %Str () @parseId ()

;stmt13:
  %12 = load %Str, %Str* @_func340_str3
  %13 = call %Bool (%Str) @need (%Str %12)

;stmt14:
  %14 = call %Token* () @ctok ()

;stmt15:
  %15 = getelementptr inbounds %Token, %Token* %14, i32 0, i32 0
  %16 = load %TokenType, %TokenType* %15
  %17 = icmp eq %TokenType %16, 2
  br i1 %17, label %then_1, label %else_1
then_1:

;stmt16:

;stmt17:
  %18 = getelementptr inbounds %Token, %Token* %14, i32 0, i32 2
  %19 = bitcast [0 x %Nat8]* %18 to %Unit*
  %20 = load %Str, %Str* @_func340_str4
  %21 = getelementptr inbounds %Nat64, %Nat64* %d, i32 0
  %22 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %19, %Str %20, %Nat64* %21)

;stmt18:
  call void () @skip ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt19:
  %23 = load %Str, %Str* @_func340_str5
  %24 = load %Nat64, %Nat64* %d
  %25 = call %Int32 (%Str, ...) @printf (%Str %23, %Str %11, %Nat64 %24)

;stmt20:
  %26 = load %Nat64, %Nat64* %d
  call void (%Str, %Nat64) @set (%Str %11, %Nat64 %26)
  br label %continue_0
break_0:

;stmt21:
  %27 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  store %Source* %7, %Source** %27
  ret void
}

define void @typeCheck (%Type* %t) {

;stmt0:
  %1 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 0
  %2 = load %TypeKind, %TypeKind* %1

;stmt1:
  %3 = icmp eq %TypeKind %2, 6
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %4 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 7
  call void (%TypePointer*) @typePointerCheck (%TypePointer* %4)
  br label %endif_0
else_0:

;stmt4:
  %5 = icmp eq %TypeKind %2, 7
  br i1 %5, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %6 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 8
  call void (%TypeArray*) @typeArrayCheck (%TypeArray* %6)
  br label %endif_1
else_1:

;stmt7:
  %7 = icmp eq %TypeKind %2, 3
  br i1 %7, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %8 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 6
  call void (%TypeFunc*) @typeFuncCheck (%TypeFunc* %8)
  br label %endif_2
else_2:

;stmt10:
  %9 = icmp eq %TypeKind %2, 5
  br i1 %9, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %10 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 9
  call void (%TypeRecord*) @typeRecordCheck (%TypeRecord* %10)
  br label %endif_3
else_3:

;stmt13:
  %11 = icmp eq %TypeKind %2, 0
  br i1 %11, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  %12 = load %Str, %Str* @_func341_str1
  %13 = getelementptr inbounds %Type, %Type* %t, i32 0, i32 13
  %14 = load %TokenInfo*, %TokenInfo** %13
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %14)
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

define void @tchk (%Unit* %k, %Unit* %v, %Unit* %ctx) {

;stmt0:
  %1 = bitcast %Unit* %v to %Type*

;stmt1:
  call void (%Type*) @typeCheck (%Type* %1)
  ret void
}

define void @vchk (%Unit* %k, %Unit* %v, %Unit* %ctx) {

;stmt0:
  %1 = bitcast %Unit* %v to %Value*

;stmt1:
  %2 = call %Type* (%Value*) @checkValue (%Value* %1)

;stmt2:
  %3 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1
  %4 = load %Type*, %Type** %3
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5
  %7 = icmp eq %TypeKind %6, 3
  %8 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 0
  %9 = load %ValueKind, %ValueKind* %8
  %10 = icmp eq %ValueKind %9, 3
  %11 = and %Bool %7, %10
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  call void (%Value*) @checkFunc (%Value* %1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define void @checkMain () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1
  %2 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @tchk, %Unit* %2)

;stmt1:
  %3 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2
  %4 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %3, %MapForeachHandler @vchk, %Unit* %4)
  ret void
}

define void @checkFunc (%Value* %f) {

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %2 = load %Value*, %Value** %1

;stmt1:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  store %Value* %f, %Value** %3

;stmt2:
  %4 = getelementptr inbounds %Value, %Value* %f, i32 0, i32 12
  %5 = load %AssemblyItem*, %AssemblyItem** %4
  %6 = getelementptr inbounds %AssemblyItem, %AssemblyItem* %5, i32 0, i32 11
  %7 = getelementptr inbounds %FuncDef, %FuncDef* %6, i32 0, i32 1
  %8 = load %Block*, %Block** %7

;stmt3:
  %9 = bitcast %Block* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  call void (%Block*) @stmtBlockCheck (%Block* %8)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %12 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  store %Value* %2, %Value** %12
  ret void
}

define %Type* @checkValue (%Value* %v) {

;stmt0:
  %1 = bitcast %Value* %v to %Unit*
  %2 = inttoptr i64 0 to %Unit*
  %3 = icmp eq %Unit* %1, %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %5 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = bitcast %Type* %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %10 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  ret %Type* %11
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %t = alloca %Type*

;stmt7:
  %13 = inttoptr i64 0 to %Type*
  store %Type* %13, %Type** %t

;stmt8:
  %14 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 0
  %15 = load %ValueKind, %ValueKind* %14

;stmt9:
  %16 = call %Bool (%ValueKind) @isBinaryOpKind (%ValueKind %15)
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %17 = call %Type* (%Value*) @checkValueBinary (%Value* %v)
  store %Type* %17, %Type** %t
  br label %endif_2
else_2:

;stmt12:
  %18 = call %Bool (%ValueKind) @isUnaryOpKind (%ValueKind %15)
  br i1 %18, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %19 = call %Type* (%Value*) @checkValueUnary (%Value* %v)
  store %Type* %19, %Type** %t
  br label %endif_3
else_3:

;stmt15:
  %20 = icmp eq %ValueKind %15, 28
  br i1 %20, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %21 = call %Type* (%Value*) @checkValueCall (%Value* %v)
  store %Type* %21, %Type** %t
  br label %endif_4
else_4:

;stmt18:
  %22 = icmp eq %ValueKind %15, 29
  br i1 %22, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %23 = call %Type* (%Value*) @checkValueIndex (%Value* %v)
  store %Type* %23, %Type** %t
  br label %endif_5
else_5:

;stmt21:
  %24 = icmp eq %ValueKind %15, 30
  br i1 %24, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %25 = call %Type* (%Value*) @checkValueAccess (%Value* %v)
  store %Type* %25, %Type** %t
  br label %endif_6
else_6:

;stmt24:
  %26 = icmp eq %ValueKind %15, 31
  br i1 %26, label %then_7, label %else_7
then_7:

;stmt25:

;stmt26:
  %27 = call %Type* (%Value*) @checkValueCast (%Value* %v)
  store %Type* %27, %Type** %t
  br label %endif_7
else_7:

;stmt27:
  %28 = icmp eq %ValueKind %15, 26
  %29 = icmp eq %ValueKind %15, 27
  %30 = or %Bool %28, %29
  br i1 %30, label %then_8, label %else_8
then_8:

;stmt28:

;stmt29:
  %31 = call %Type* (%Value*) @checkValueShift (%Value* %v)
  store %Type* %31, %Type** %t
  br label %endif_8
else_8:

;stmt30:
  %32 = icmp eq %ValueKind %15, 32
  br i1 %32, label %then_9, label %else_9
then_9:

;stmt31:

;stmt32:
  %33 = call %Type* (%Value*) @checkValueSizeof (%Value* %v)
  store %Type* %33, %Type** %t
  br label %endif_9
else_9:

;stmt33:
  %34 = icmp eq %ValueKind %15, 33
  br i1 %34, label %then_10, label %else_10
then_10:

;stmt34:

;stmt35:
  %35 = call %Type* (%Value*) @checkValueAlignof (%Value* %v)
  store %Type* %35, %Type** %t
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
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:

;stmt36:
  %36 = getelementptr inbounds %Value, %Value* %v, i32 0, i32 1
  %37 = load %Type*, %Type** %t
  store %Type* %37, %Type** %36

;stmt37:
  %38 = load %Type*, %Type** %t
  ret %Type* %38

;stmt38:
  br label %fail
fail:

;stmt39:
  %40 = load %Str, %Str* @_func346_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %40)

;stmt40:
  %41 = inttoptr i64 0 to %Type*
  ret %Type* %41
}

define %Int32 @main (%Int32 %argc, %Str* %argv) {

;stmt0:
  %1 = load %Str, %Str* @_func347_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 0, %Int32 5)

;stmt1:
  call void () @init ()

;stmt2:
  call void (%Int32, %Str*) @parseArgs (%Int32 %argc, %Str* %argv)

;stmt3:
  %3 = load %Str, %Str* @_func347_str2
  %4 = call %Source* (%Str) @source_open (%Str %3)

;stmt4:
  %5 = bitcast %Source* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp eq %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  ret %Int32 -1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  call void (%Source*) @parse (%Source* %4)

;stmt8:
  %9 = load %Str, %Str* @_func347_str3
  %10 = load %Nat32, %Nat32* @lines
  %11 = call %Int32 (%Str, ...) @printf (%Str %9, %Nat32 %10)

;stmt9:
  call void () @checkMain ()

;stmt10:
  %12 = load %Nat32, %Nat32* @errcnt
  %13 = icmp ugt %Nat32 %12, 0
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %14 = load %Str, %Str* @_func347_str4
  %15 = load %Nat32, %Nat32* @errcnt
  %16 = call %Int32 (%Str, ...) @printf (%Str %14, %Nat32 %15)

;stmt13:
  %17 = load %Nat32, %Nat32* @errcnt
  %18 = bitcast %Nat32 %17 to %Int32
  ret %Int32 %18
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt14:
  %20 = load %Arch, %Arch* @arch
  %21 = load %Str, %Str* @_func347_str5
  call void (%Arch, %Str) @printer_init (%Arch %20, %Str %21)

;stmt15:
  %22 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  call void (%Assembly*) @print_assembly (%Assembly* %22)

;stmt16:
  %23 = load %Nat32, %Nat32* @errcnt
  %24 = icmp ne %Nat32 %23, 0
  %25 = sext %Bool %24 to %Int32
  ret %Int32 %25
}

define void @parseArgs (%Int32 %argc, %Str* %argv) {

;stmt0:
  %argp = alloca %Int32

;stmt1:
  store %Int32 1, %Int32* %argp

;stmt2:
  br label %continue_0
continue_0:
  %1 = load %Int32, %Int32* %argp
  %2 = icmp slt %Int32 %1, %argc
  br i1 %2, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %3 = load %Int32, %Int32* %argp
  %4 = getelementptr inbounds %Str, %Str* %argv, %Int32 %3
  %5 = load %Str, %Str* %4

;stmt5:
  %6 = load %Str, %Str* @_func348_str1
  %7 = call %Int32 (%Str, %Str, %Nat32) @strncmp (%Str %5, %Str %6, %Nat32 6)
  %8 = icmp eq %Int32 %7, 0
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %9 = getelementptr inbounds %Nat8, %Str %5, %Int32 6
  %10 = bitcast %Nat8* %9 to %Str
  %11 = load %Str, %Str* @_func348_str2
  %12 = call %Int32 (%Str, %Str) @strcmp (%Str %10, %Str %11)
  %13 = icmp eq %Int32 %12, 0
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  store %Arch 1, %Arch* @arch
  br label %endif_1
else_1:

;stmt10:
  %14 = getelementptr inbounds %Nat8, %Str %5, %Int32 6
  %15 = bitcast %Nat8* %14 to %Str
  %16 = load %Str, %Str* @_func348_str3
  %17 = call %Int32 (%Str, %Str) @strcmp (%Str %15, %Str %16)
  %18 = icmp eq %Int32 %17, 0
  br i1 %18, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  store %Arch 0, %Arch* @arch
  br label %endif_2
else_2:

;stmt13:

;stmt14:
  %19 = load %Str, %Str* @_func348_str4
  call void (%Str) @fatal (%Str %19)
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt15:
  %20 = load %Str, %Str* @_func348_str5
  %21 = call %Int32 (%Str, %Str, %Nat32) @strncmp (%Str %5, %Str %20, %Nat32 5)
  %22 = icmp eq %Int32 %21, 0
  br i1 %22, label %then_3, label %else_3
then_3:

;stmt16:

;stmt17:
  %23 = getelementptr inbounds %Nat8, %Str %5, %Int32 5
  %24 = bitcast %Nat8* %23 to %Str
  call void (%Str) @liblist_add (%Str %24)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt18:
  %25 = load %Str, %Str* @_func348_str6
  %26 = call %Int32 (%Str, %Str, %Nat32) @strncmp (%Str %5, %Str %25, %Nat32 6)
  %27 = icmp eq %Int32 %26, 0
  br i1 %27, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %28 = getelementptr inbounds %Nat8, %Str %5, %Int32 6
  %29 = bitcast %Nat8* %28 to %Str
  call void (%Str) @readConfig (%Str %29)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:

;stmt21:
  %30 = load %Int32, %Int32* %argp
  %31 = add %Int32 %30, 1
  store %Int32 %31, %Int32* %argp
  br label %continue_0
break_0:
  ret void
}

define void @usage () {

;stmt0:
  %1 = load %Str, %Str* @_func349_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %3 = load %Str, %Str* @_func349_str2
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)

;stmt2:
  %5 = load %Str, %Str* @_func349_str3
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)

;stmt3:
  %7 = load %Str, %Str* @_func349_str4
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
  ret void
}

define void @shwt (%Unit* %k, %Unit* %v, %Unit* %ctx) {

;stmt0:
  %1 = bitcast %Unit* %k to %Str
  %2 = call %Nat32 (%Str) @strlen (%Str %1)

;stmt1:
  %3 = load %Str, %Str* @_func351_str1
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Unit* %k)

;stmt2:
  %i = alloca %Nat32

;stmt3:
  store %Nat32 0, %Nat32* %i

;stmt4:
  br label %continue_0
continue_0:
  %5 = load %Nat32, %Nat32* %i
  %6 = sub %Nat32 40, %2
  %7 = icmp ult %Nat32 %5, %6
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %8 = load %Str, %Str* @_func351_str2
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)

;stmt7:
  %10 = load %Nat32, %Nat32* %i
  %11 = add %Nat32 %10, 1
  store %Nat32 %11, %Nat32* %i
  br label %continue_0
break_0:

;stmt8:
  %12 = bitcast %Unit* %v to %Type*

;stmt9:
  call void (%Type*) @prttype (%Type* %12)

;stmt10:
  %13 = load %Str, %Str* @_func351_str3
  %14 = call %Int32 (%Str, ...) @printf (%Str %13)
  ret void
}

define void @showTypes () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1
  %2 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @shwt, %Unit* %2)
  ret void
}

define void @shwv (%Unit* %k, %Unit* %v, %Unit* %ctx) {

;stmt0:
  %1 = bitcast %Unit* %k to %Str
  %2 = call %Nat32 (%Str) @strlen (%Str %1)

;stmt1:
  %3 = load %Str, %Str* @_func353_str1
  %4 = call %Int32 (%Str, ...) @printf (%Str %3, %Unit* %k)

;stmt2:
  %i = alloca %Nat32

;stmt3:
  store %Nat32 0, %Nat32* %i

;stmt4:
  br label %continue_0
continue_0:
  %5 = load %Nat32, %Nat32* %i
  %6 = sub %Nat32 40, %2
  %7 = icmp ult %Nat32 %5, %6
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %8 = load %Str, %Str* @_func353_str2
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)

;stmt7:
  %10 = load %Nat32, %Nat32* %i
  %11 = add %Nat32 %10, 1
  store %Nat32 %11, %Nat32* %i
  br label %continue_0
break_0:

;stmt8:
  %12 = bitcast %Unit* %v to %Value*
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  call void (%Type*) @prttype (%Type* %14)

;stmt9:
  %15 = load %Str, %Str* @_func353_str3
  %16 = call %Int32 (%Str, ...) @printf (%Str %15)
  ret void
}

define void @showValues () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2
  %2 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @shwv, %Unit* %2)
  ret void
}

;metadata:
