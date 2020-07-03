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
%Type = type {%TypeKind, %Str, %Nat32, %Nat8, %TypeBasic, %TypeFunc, %TypePointer, %TypeArray, %TypeRecord, %TypeEnum, %TokenInfo*, %TokenInfo*, %TokenInfo*}
%TypeParser = type %Type* ()*
%ValueParser = type %Value* ()*
%StmtParser = type %Stmt* (%TokenInfo*)*
%Block = type {%Block*, %List*, %List, %List, %List*}
%If = type {%Value*, %Stmt*, %Stmt*}
%While = type {%Value*, %Stmt*}
%StmtKind = type %Int16
%Stmt = type {%StmtKind, [2 x %Value*], %Block*, %VarDef*, %While*, %If*, %Str, %TokenInfo*}
%TypeDef = type {%Str, %Type*}
%ConstDef = type {%Str, %Value*}
%StringDef = type {%Str, %Str, %Nat32}
%ArrayDef = type {%Str, %Type*, %Nat32, %List*}
%FuncDef = type {%Str, %Type*, %Block*}
%VarDef = type {%Str, %Type*, %Value*}
%Assembly = type {%Str, %List*, %List*, %List*, %List*, %List*}
%ValueUn = type {%Value*}
%ValueBin = type {%Value*, %Value*}
%ValueIndex = type {%Value*, %Value*}
%ValueAccess = type {%Value*, %Str}
%ValueCall = type {%Value*, %List*}
%ValueCast = type {%Value*, %Type*}
%StorageClass = type %Int16
%Storage = type {%StorageClass, %Int64, %Nat32, %Str}
%ValueKind = type %Int16
%Value = type {%ValueKind, %Type*, %Storage, %Block*, %ValueUn, %ValueBin, %ValueIndex, %ValueAccess, %ValueCast, %ValueCall, %Type*, %TokenInfo*, %TokenInfo*, %TokenInfo*}
%ModuleContext = type {%Source*, %List, %List}
%FuncContext = type {%Value*, %Block*, %Nat32, %Nat32, %Nat32, %Nat32, %Nat32}
%MetadataClass = type %Int16
%Metadata = type {%MetadataClass}
%Eval = type %Value* (%Value*)*
%PrintArgsCtx = type {%Bool, %Node*}
%Arch = type %Int16

;strings:

@.str.func7_str1 = private unnamed_addr constant [19 x i8] c"assert failed: %s\0A\00", align 1
@func7_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func7_str1, i32 0, i32 0), align 8
@.str.func8_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func8_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func8_str1, i32 0, i32 0), align 8
@.str.func42_str1 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@func42_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func42_str1, i32 0, i32 0), align 8
@.str.func42_str2 = private unnamed_addr constant [2 x i8] c"Z\00", align 1
@func42_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func42_str2, i32 0, i32 0), align 8
@.str.func42_str3 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@func42_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func42_str3, i32 0, i32 0), align 8
@.str.func42_str4 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@func42_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func42_str4, i32 0, i32 0), align 8
@.str.func43_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func43_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func43_str1, i32 0, i32 0), align 8
@.str.func43_str2 = private unnamed_addr constant [2 x i8] c"9\00", align 1
@func43_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func43_str2, i32 0, i32 0), align 8
@.str.func45_str1 = private unnamed_addr constant [11 x i8] c"module=%s\0A\00", align 1
@func45_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func45_str1, i32 0, i32 0), align 8
@.str.func45_str2 = private unnamed_addr constant [17 x i8] c"module not exist\00", align 1
@func45_str2 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func45_str2, i32 0, i32 0), align 8
@.str.func45_str3 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func45_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func45_str3, i32 0, i32 0), align 8
@.str.func47_str1 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func47_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func47_str1, i32 0, i32 0), align 8
@.str.func47_str2 = private unnamed_addr constant [16 x i8] c"too long token\0A\00", align 1
@func47_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func47_str2, i32 0, i32 0), align 8
@.str.func48_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func48_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func48_str1, i32 0, i32 0), align 8
@.str.func48_str2 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func48_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func48_str2, i32 0, i32 0), align 8
@.str.func49_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func49_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func49_str1, i32 0, i32 0), align 8
@.str.func50_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func50_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func50_str1, i32 0, i32 0), align 8
@.str.func50_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func50_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func50_str2, i32 0, i32 0), align 8
@.str.func51_str1 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func51_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func51_str1, i32 0, i32 0), align 8
@.str.func51_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func51_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func51_str2, i32 0, i32 0), align 8
@.str.func52_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func52_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func52_str1, i32 0, i32 0), align 8
@.str.func52_str2 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func52_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func52_str2, i32 0, i32 0), align 8
@.str.func53_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func53_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func53_str1, i32 0, i32 0), align 8
@.str.func54_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func54_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func54_str1, i32 0, i32 0), align 8
@.str.func55_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func55_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func55_str1, i32 0, i32 0), align 8
@.str.func57_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func57_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func57_str1, i32 0, i32 0), align 8
@.str.func58_str1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@func58_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func58_str1, i32 0, i32 0), align 8
@.str.func58_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func58_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func58_str2, i32 0, i32 0), align 8
@.str.func58_str3 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func58_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func58_str3, i32 0, i32 0), align 8
@.str.func59_str1 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@func59_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func59_str1, i32 0, i32 0), align 8
@.str.func59_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func59_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func59_str2, i32 0, i32 0), align 8
@.str.func59_str3 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func59_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func59_str3, i32 0, i32 0), align 8
@.str.func59_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func59_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func59_str4, i32 0, i32 0), align 8
@.str.func59_str5 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func59_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func59_str5, i32 0, i32 0), align 8
@.str.func59_str6 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func59_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func59_str6, i32 0, i32 0), align 8
@.str.func59_str7 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func59_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func59_str7, i32 0, i32 0), align 8
@.str.func59_str8 = private unnamed_addr constant [2 x i8] c"!\00", align 1
@func59_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func59_str8, i32 0, i32 0), align 8
@.str.func59_str9 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@func59_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func59_str9, i32 0, i32 0), align 8
@.str.func59_str10 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func59_str10 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func59_str10, i32 0, i32 0), align 8
@.str.func60_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func60_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func60_str1, i32 0, i32 0), align 8
@.str.func60_str2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func60_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func60_str2, i32 0, i32 0), align 8
@.str.func60_str3 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func60_str3 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func60_str3, i32 0, i32 0), align 8
@.str.func60_str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func60_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func60_str4, i32 0, i32 0), align 8
@.str.func60_str5 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func60_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func60_str5, i32 0, i32 0), align 8
@.str.func60_str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func60_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func60_str6, i32 0, i32 0), align 8
@.str.func61_str1 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func61_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str1, i32 0, i32 0), align 8
@.str.func61_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func61_str2 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func61_str2, i32 0, i32 0), align 8
@.str.func61_str3 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func61_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str3, i32 0, i32 0), align 8
@.str.func61_str4 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@func61_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str4, i32 0, i32 0), align 8
@.str.func61_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func61_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str5, i32 0, i32 0), align 8
@.str.func61_str6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@func61_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str6, i32 0, i32 0), align 8
@.str.func61_str7 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func61_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str7, i32 0, i32 0), align 8
@.str.func61_str8 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@func61_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str8, i32 0, i32 0), align 8
@.str.func61_str9 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func61_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str9, i32 0, i32 0), align 8
@.str.func61_str10 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func61_str10 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str10, i32 0, i32 0), align 8
@.str.func61_str11 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func61_str11 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str11, i32 0, i32 0), align 8
@.str.func61_str12 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func61_str12 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str12, i32 0, i32 0), align 8
@.str.func61_str13 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func61_str13 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str13, i32 0, i32 0), align 8
@.str.func61_str14 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@func61_str14 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str14, i32 0, i32 0), align 8
@.str.func61_str15 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func61_str15 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str15, i32 0, i32 0), align 8
@.str.func61_str16 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@func61_str16 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str16, i32 0, i32 0), align 8
@.str.func61_str17 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func61_str17 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str17, i32 0, i32 0), align 8
@.str.func61_str18 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@func61_str18 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str18, i32 0, i32 0), align 8
@.str.func61_str19 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func61_str19 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str19, i32 0, i32 0), align 8
@.str.func61_str20 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func61_str20 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func61_str20, i32 0, i32 0), align 8
@.str.func61_str21 = private unnamed_addr constant [17 x i8] c"too long string\0A\00", align 1
@func61_str21 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func61_str21, i32 0, i32 0), align 8
@.str.func68_str1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func68_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func68_str1, i32 0, i32 0), align 8
@.str.func69_str1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func69_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func69_str1, i32 0, i32 0), align 8
@.str.func69_str2 = private unnamed_addr constant [3 x i8] c".m\00", align 1
@func69_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func69_str2, i32 0, i32 0), align 8
@.str.func69_str3 = private unnamed_addr constant [8 x i8] c"/main.m\00", align 1
@func69_str3 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func69_str3, i32 0, i32 0), align 8
@.str.func69_str4 = private unnamed_addr constant [7 x i8] c"main.m\00", align 1
@func69_str4 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func69_str4, i32 0, i32 0), align 8
@.str.func70_str1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func70_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func70_str1, i32 0, i32 0), align 8
@.str.func72_str1 = private unnamed_addr constant [23 x i8] c"\0A%c[0;%dminfo:%c[0m %s\00", align 1
@func72_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func72_str1, i32 0, i32 0), align 8
@.str.func73_str1 = private unnamed_addr constant [35 x i8] c"\0A%c[0;%dmwarning%c[0m (%s:%d) : %s\00", align 1
@func73_str1 = constant i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.func73_str1, i32 0, i32 0), align 8
@.str.func73_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func73_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func73_str2, i32 0, i32 0), align 8
@.str.func73_str3 = private unnamed_addr constant [26 x i8] c"\0A%c[0;%dmwarning:%c[0m %s\00", align 1
@func73_str3 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.func73_str3, i32 0, i32 0), align 8
@.str.func74_str1 = private unnamed_addr constant [24 x i8] c"\0A%c[0;%dmerror:%c[0m %s\00", align 1
@func74_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.func74_str1, i32 0, i32 0), align 8
@.str.func74_str2 = private unnamed_addr constant [33 x i8] c"\0A%c[0;%dmerror%c[0m (%s:%d) : %s\00", align 1
@func74_str2 = constant i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.func74_str2, i32 0, i32 0), align 8
@.str.func74_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func74_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func74_str3, i32 0, i32 0), align 8
@.str.func74_str4 = private unnamed_addr constant [14 x i8] c"*** STOP ***\0A\00", align 1
@func74_str4 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func74_str4, i32 0, i32 0), align 8
@.str.func75_str1 = private unnamed_addr constant [17 x i8] c"\0A%c[0;%dm%s%c[0m\00", align 1
@func75_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func75_str1, i32 0, i32 0), align 8
@.str.func75_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func75_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func75_str2, i32 0, i32 0), align 8
@.str.func76_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func76_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func76_str1, i32 0, i32 0), align 8
@.str.func76_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func76_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func76_str2, i32 0, i32 0), align 8
@.str.func77_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func77_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func77_str1, i32 0, i32 0), align 8
@.str.func77_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func77_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func77_str2, i32 0, i32 0), align 8
@.str.func77_str3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func77_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func77_str3, i32 0, i32 0), align 8
@.str.func77_str4 = private unnamed_addr constant [15 x i8] c"%c[0;%dm^%c[0m\00", align 1
@func77_str4 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.func77_str4, i32 0, i32 0), align 8
@.str.func78_str1 = private unnamed_addr constant [24 x i8] c"%c[0;%dmfatal:%c[0m %s\0A\00", align 1
@func78_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.func78_str1, i32 0, i32 0), align 8
@.str.func79_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func79_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func79_str1, i32 0, i32 0), align 8
@.str.func79_str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func79_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func79_str2, i32 0, i32 0), align 8
@.str.func79_str3 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func79_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func79_str3, i32 0, i32 0), align 8
@.str.func79_str4 = private unnamed_addr constant [14 x i8] c"<TypeUnknown>\00", align 1
@func79_str4 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func79_str4, i32 0, i32 0), align 8
@.str.func79_str5 = private unnamed_addr constant [14 x i8] c"<TypeNumeric>\00", align 1
@func79_str5 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func79_str5, i32 0, i32 0), align 8
@.str.func79_str6 = private unnamed_addr constant [31 x i8] c"unkn type kind %d, maybe func?\00", align 1
@func79_str6 = constant i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.func79_str6, i32 0, i32 0), align 8
@.str.func80_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func80_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func80_str1, i32 0, i32 0), align 8
@.str.func81_str1 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@func81_str1 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func81_str1, i32 0, i32 0), align 8
@.str.func81_str2 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func81_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func81_str2, i32 0, i32 0), align 8
@.str.func80_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func80_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func80_str2, i32 0, i32 0), align 8
@.str.func80_str3 = private unnamed_addr constant [16 x i8] c"<record:0x%02x>\00", align 1
@func80_str3 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func80_str3, i32 0, i32 0), align 8
@.str.func82_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func82_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func82_str1, i32 0, i32 0), align 8
@.str.func83_str1 = private unnamed_addr constant [5 x i8] c"%s, \00", align 1
@func83_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func83_str1, i32 0, i32 0), align 8
@.str.func82_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func82_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func82_str2, i32 0, i32 0), align 8
@.str.func84_str1 = private unnamed_addr constant [3 x i8] c"[]\00", align 1
@func84_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func84_str1, i32 0, i32 0), align 8
@.str.func84_str2 = private unnamed_addr constant [5 x i8] c"[%d]\00", align 1
@func84_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func84_str2, i32 0, i32 0), align 8
@.str.func85_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func85_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func85_str1, i32 0, i32 0), align 8
@.str.func86_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func86_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func86_str1, i32 0, i32 0), align 8
@.str.func86_str2 = private unnamed_addr constant [6 x i8] c"%s : \00", align 1
@func86_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func86_str2, i32 0, i32 0), align 8
@.str.func85_str2 = private unnamed_addr constant [6 x i8] c") -> \00", align 1
@func85_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func85_str2, i32 0, i32 0), align 8
@.str.func89_str1 = private unnamed_addr constant [10 x i8] c"field_new\00", align 1
@func89_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func89_str1, i32 0, i32 0), align 8
@.str.func106_str1 = private unnamed_addr constant [26 x i8] c"type_eq unknown type kind\00", align 1
@func106_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.func106_str1, i32 0, i32 0), align 8
@.str.func107_str1 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func107_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func107_str1, i32 0, i32 0), align 8
@.str.func107_str2 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func107_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func107_str2, i32 0, i32 0), align 8
@.str.func107_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func107_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func107_str3, i32 0, i32 0), align 8
@.str.func107_str4 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@func107_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func107_str4, i32 0, i32 0), align 8
@.str.func107_str5 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func107_str5 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func107_str5, i32 0, i32 0), align 8
@.str.func107_str6 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func107_str6 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str6, i32 0, i32 0), align 8
@.str.func107_str7 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func107_str7 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str7, i32 0, i32 0), align 8
@.str.func107_str8 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func107_str8 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str8, i32 0, i32 0), align 8
@.str.func107_str9 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func107_str9 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str9, i32 0, i32 0), align 8
@.str.func107_str10 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func107_str10 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str10, i32 0, i32 0), align 8
@.str.func107_str11 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func107_str11 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str11, i32 0, i32 0), align 8
@.str.func107_str12 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func107_str12 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func107_str12, i32 0, i32 0), align 8
@.str.func107_str13 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func107_str13 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func107_str13, i32 0, i32 0), align 8
@.str.func107_str14 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func107_str14 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str14, i32 0, i32 0), align 8
@.str.func107_str15 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func107_str15 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str15, i32 0, i32 0), align 8
@.str.func107_str16 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func107_str16 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str16, i32 0, i32 0), align 8
@.str.func107_str17 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func107_str17 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str17, i32 0, i32 0), align 8
@.str.func107_str18 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func107_str18 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str18, i32 0, i32 0), align 8
@.str.func107_str19 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func107_str19 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str19, i32 0, i32 0), align 8
@.str.func107_str20 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func107_str20 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func107_str20, i32 0, i32 0), align 8
@.str.func107_str21 = private unnamed_addr constant [6 x i8] c"Int64\00", align 1
@func107_str21 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str21, i32 0, i32 0), align 8
@.str.func107_str22 = private unnamed_addr constant [6 x i8] c"Nat64\00", align 1
@func107_str22 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str22, i32 0, i32 0), align 8
@.str.func107_str23 = private unnamed_addr constant [6 x i8] c"Int32\00", align 1
@func107_str23 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str23, i32 0, i32 0), align 8
@.str.func107_str24 = private unnamed_addr constant [6 x i8] c"Nat32\00", align 1
@func107_str24 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str24, i32 0, i32 0), align 8
@.str.func107_str25 = private unnamed_addr constant [5 x i8] c"Int8\00", align 1
@func107_str25 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func107_str25, i32 0, i32 0), align 8
@.str.func107_str26 = private unnamed_addr constant [5 x i8] c"Nat8\00", align 1
@func107_str26 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func107_str26, i32 0, i32 0), align 8
@.str.func107_str27 = private unnamed_addr constant [6 x i8] c"Int16\00", align 1
@func107_str27 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str27, i32 0, i32 0), align 8
@.str.func107_str28 = private unnamed_addr constant [6 x i8] c"Nat16\00", align 1
@func107_str28 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func107_str28, i32 0, i32 0), align 8
@.str.func107_str29 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func107_str29 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func107_str29, i32 0, i32 0), align 8
@.str.func107_str30 = private unnamed_addr constant [4 x i8] c"Str\00", align 1
@func107_str30 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func107_str30, i32 0, i32 0), align 8
@.str.func107_str31 = private unnamed_addr constant [7 x i8] c"Int128\00", align 1
@func107_str31 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str31, i32 0, i32 0), align 8
@.str.func107_str32 = private unnamed_addr constant [7 x i8] c"Int256\00", align 1
@func107_str32 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str32, i32 0, i32 0), align 8
@.str.func107_str33 = private unnamed_addr constant [7 x i8] c"Int512\00", align 1
@func107_str33 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str33, i32 0, i32 0), align 8
@.str.func107_str34 = private unnamed_addr constant [8 x i8] c"Int1024\00", align 1
@func107_str34 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func107_str34, i32 0, i32 0), align 8
@.str.func107_str35 = private unnamed_addr constant [7 x i8] c"Nat128\00", align 1
@func107_str35 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str35, i32 0, i32 0), align 8
@.str.func107_str36 = private unnamed_addr constant [7 x i8] c"Nat256\00", align 1
@func107_str36 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str36, i32 0, i32 0), align 8
@.str.func107_str37 = private unnamed_addr constant [7 x i8] c"Nat512\00", align 1
@func107_str37 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func107_str37, i32 0, i32 0), align 8
@.str.func107_str38 = private unnamed_addr constant [8 x i8] c"Nat1024\00", align 1
@func107_str38 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func107_str38, i32 0, i32 0), align 8
@.str.func108_str1 = private unnamed_addr constant [9 x i8] c"type_new\00", align 1
@func108_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func108_str1, i32 0, i32 0), align 8
@.str.func119_str1 = private unnamed_addr constant [44 x i8] c"type bind error: attempt to id redefinition\00", align 1
@func119_str1 = constant i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.func119_str1, i32 0, i32 0), align 8
@.str.func125_str1 = private unnamed_addr constant [45 x i8] c"value bind error: attempt to id redefinition\00", align 1
@func125_str1 = constant i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.func125_str1, i32 0, i32 0), align 8
@.str.func129_str1 = private unnamed_addr constant [5 x i8] c"self\00", align 1
@func129_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func129_str1, i32 0, i32 0), align 8
@.str.func132_str1 = private unnamed_addr constant [25 x i8] c"attempt to redeclaration\00", align 1
@func132_str1 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.func132_str1, i32 0, i32 0), align 8
@.str.func132_str2 = private unnamed_addr constant [14 x i8] c"declared at: \00", align 1
@func132_str2 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func132_str2, i32 0, i32 0), align 8
@.str.func133_str1 = private unnamed_addr constant [18 x i8] c"define: id == Nil\00", align 1
@func133_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func133_str1, i32 0, i32 0), align 8
@.str.func133_str2 = private unnamed_addr constant [17 x i8] c"define: v == Nil\00", align 1
@func133_str2 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func133_str2, i32 0, i32 0), align 8
@.str.func135_str1 = private unnamed_addr constant [5 x i8] c"%s%u\00", align 1
@func135_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func135_str1, i32 0, i32 0), align 8
@.str.func136_str1 = private unnamed_addr constant [4 x i8] c"%s_\00", align 1
@func136_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func136_str1, i32 0, i32 0), align 8
@.str.func136_str2 = private unnamed_addr constant [1 x i8] c"\00", align 1
@func136_str2 = constant i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.func136_str2, i32 0, i32 0), align 8
@.str.func137_str1 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@func137_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func137_str1, i32 0, i32 0), align 8
@.str.func138_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func138_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func138_str1, i32 0, i32 0), align 8
@.str.func139_str1 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@func139_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func139_str1, i32 0, i32 0), align 8
@.str.func139_str2 = private unnamed_addr constant [4 x i8] c"str\00", align 1
@func139_str2 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func139_str2, i32 0, i32 0), align 8
@.str.func140_str1 = private unnamed_addr constant [4 x i8] c"arr\00", align 1
@func140_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func140_str1, i32 0, i32 0), align 8
@.str.func141_str1 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func141_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func141_str1, i32 0, i32 0), align 8
@.str.func142_str1 = private unnamed_addr constant [5 x i8] c"Type\00", align 1
@func142_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func142_str1, i32 0, i32 0), align 8
@.str.func146_str1 = private unnamed_addr constant [7 x i8] c"record\00", align 1
@func146_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func146_str1, i32 0, i32 0), align 8
@.str.func146_str2 = private unnamed_addr constant [5 x i8] c"enum\00", align 1
@func146_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func146_str2, i32 0, i32 0), align 8
@.str.func146_str3 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func146_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func146_str3, i32 0, i32 0), align 8
@.str.func146_str4 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func146_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func146_str4, i32 0, i32 0), align 8
@.str.func146_str5 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func146_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func146_str5, i32 0, i32 0), align 8
@.str.func146_str6 = private unnamed_addr constant [14 x i8] c"expected type\00", align 1
@func146_str6 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func146_str6, i32 0, i32 0), align 8
@.str.func146_str7 = private unnamed_addr constant [8 x i8] c"tok=%s\0A\00", align 1
@func146_str7 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func146_str7, i32 0, i32 0), align 8
@.str.func147_str1 = private unnamed_addr constant [12 x i8] c"expected id\00", align 1
@func147_str1 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func147_str1, i32 0, i32 0), align 8
@.str.func148_str1 = private unnamed_addr constant [14 x i8] c"dofield error\00", align 1
@func148_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func148_str1, i32 0, i32 0), align 8
@.str.func148_str2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func148_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func148_str2, i32 0, i32 0), align 8
@.str.func149_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func149_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func149_str1, i32 0, i32 0), align 8
@.str.func149_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func149_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func149_str2, i32 0, i32 0), align 8
@.str.func150_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func150_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func150_str1, i32 0, i32 0), align 8
@.str.func150_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func150_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func150_str2, i32 0, i32 0), align 8
@.str.func150_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func150_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func150_str3, i32 0, i32 0), align 8
@.str.func150_str4 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func150_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func150_str4, i32 0, i32 0), align 8
@.str.func151_str1 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func151_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func151_str1, i32 0, i32 0), align 8
@.str.func151_str2 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func151_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func151_str2, i32 0, i32 0), align 8
@.str.func152_str1 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func152_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func152_str1, i32 0, i32 0), align 8
@.str.func152_str2 = private unnamed_addr constant [3 x i8] c"->\00", align 1
@func152_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func152_str2, i32 0, i32 0), align 8
@.str.func152_str3 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@func152_str3 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func152_str3, i32 0, i32 0), align 8
@.str.func154_str1 = private unnamed_addr constant [24 x i8] c"expected constant value\00", align 1
@func154_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.func154_str1, i32 0, i32 0), align 8
@.str.func155_str1 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func155_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func155_str1, i32 0, i32 0), align 8
@.str.func156_str1 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func156_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func156_str1, i32 0, i32 0), align 8
@.str.func157_str1 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func157_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func157_str1, i32 0, i32 0), align 8
@.str.func158_str1 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@func158_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func158_str1, i32 0, i32 0), align 8
@.str.func158_str2 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@func158_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func158_str2, i32 0, i32 0), align 8
@.str.func159_str1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@func159_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func159_str1, i32 0, i32 0), align 8
@.str.func159_str2 = private unnamed_addr constant [2 x i8] c">\00", align 1
@func159_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func159_str2, i32 0, i32 0), align 8
@.str.func159_str3 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@func159_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func159_str3, i32 0, i32 0), align 8
@.str.func159_str4 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@func159_str4 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func159_str4, i32 0, i32 0), align 8
@.str.func160_str1 = private unnamed_addr constant [3 x i8] c"<<\00", align 1
@func160_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func160_str1, i32 0, i32 0), align 8
@.str.func160_str2 = private unnamed_addr constant [3 x i8] c">>\00", align 1
@func160_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func160_str2, i32 0, i32 0), align 8
@.str.func161_str1 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@func161_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func161_str1, i32 0, i32 0), align 8
@.str.func161_str2 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func161_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func161_str2, i32 0, i32 0), align 8
@.str.func162_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func162_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func162_str1, i32 0, i32 0), align 8
@.str.func162_str2 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@func162_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func162_str2, i32 0, i32 0), align 8
@.str.func162_str3 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@func162_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func162_str3, i32 0, i32 0), align 8
@.str.func163_str1 = private unnamed_addr constant [3 x i8] c"to\00", align 1
@func163_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func163_str1, i32 0, i32 0), align 8
@.str.func164_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func164_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func164_str1, i32 0, i32 0), align 8
@.str.func164_str2 = private unnamed_addr constant [2 x i8] c"&\00", align 1
@func164_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func164_str2, i32 0, i32 0), align 8
@.str.func164_str3 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@func164_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func164_str3, i32 0, i32 0), align 8
@.str.func164_str4 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@func164_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func164_str4, i32 0, i32 0), align 8
@.str.func164_str5 = private unnamed_addr constant [7 x i8] c"sizeof\00", align 1
@func164_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func164_str5, i32 0, i32 0), align 8
@.str.func164_str6 = private unnamed_addr constant [23 x i8] c"sizeof expected <type>\00", align 1
@func164_str6 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func164_str6, i32 0, i32 0), align 8
@.str.func164_str7 = private unnamed_addr constant [8 x i8] c"alignof\00", align 1
@func164_str7 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func164_str7, i32 0, i32 0), align 8
@.str.func164_str8 = private unnamed_addr constant [24 x i8] c"alignof expected <type>\00", align 1
@func164_str8 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.func164_str8, i32 0, i32 0), align 8
@.str.func165_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func165_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func165_str1, i32 0, i32 0), align 8
@.str.func165_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func165_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func165_str2, i32 0, i32 0), align 8
@.str.func165_str3 = private unnamed_addr constant [3 x i8] c",)\00", align 1
@func165_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func165_str3, i32 0, i32 0), align 8
@.str.func165_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func165_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func165_str4, i32 0, i32 0), align 8
@.str.func165_str5 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func165_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func165_str5, i32 0, i32 0), align 8
@.str.func165_str6 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func165_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func165_str6, i32 0, i32 0), align 8
@.str.func165_str7 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func165_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func165_str7, i32 0, i32 0), align 8
@.str.func165_str8 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@func165_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func165_str8, i32 0, i32 0), align 8
@.str.func165_str9 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func165_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func165_str9, i32 0, i32 0), align 8
@.str.func165_str10 = private unnamed_addr constant [2 x i8] c".\00", align 1
@func165_str10 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func165_str10, i32 0, i32 0), align 8
@.str.func166_str1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@func166_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func166_str1, i32 0, i32 0), align 8
@.str.func166_str2 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func166_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func166_str2, i32 0, i32 0), align 8
@.str.func167_str1 = private unnamed_addr constant [5 x i8] c"func\00", align 1
@func167_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func167_str1, i32 0, i32 0), align 8
@.str.func167_str2 = private unnamed_addr constant [6 x i8] c"array\00", align 1
@func167_str2 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func167_str2, i32 0, i32 0), align 8
@.str.func167_str3 = private unnamed_addr constant [24 x i8] c"term: unexpected token\0A\00", align 1
@func167_str3 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.func167_str3, i32 0, i32 0), align 8
@.str.func167_str4 = private unnamed_addr constant [7 x i8] c"tt=%d\0A\00", align 1
@func167_str4 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func167_str4, i32 0, i32 0), align 8
@.str.func167_str5 = private unnamed_addr constant [12 x i8] c"token = %s\0A\00", align 1
@func167_str5 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func167_str5, i32 0, i32 0), align 8
@.str.func169_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func169_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func169_str1, i32 0, i32 0), align 8
@.str.func169_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func169_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func169_str2, i32 0, i32 0), align 8
@.str.func169_str3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func169_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func169_str3, i32 0, i32 0), align 8
@.str.func169_str4 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func169_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func169_str4, i32 0, i32 0), align 8
@.str.func170_str1 = private unnamed_addr constant [16 x i8] c"funcdef id fail\00", align 1
@func170_str1 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func170_str1, i32 0, i32 0), align 8
@.str.func170_str2 = private unnamed_addr constant [18 x i8] c"funcdef type fail\00", align 1
@func170_str2 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func170_str2, i32 0, i32 0), align 8
@.str.func170_str3 = private unnamed_addr constant [19 x i8] c"expected func type\00", align 1
@func170_str3 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func170_str3, i32 0, i32 0), align 8
@.str.func170_str4 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func170_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func170_str4, i32 0, i32 0), align 8
@.str.func172_str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@func172_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func172_str1, i32 0, i32 0), align 8
@.str.func172_str2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@func172_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func172_str2, i32 0, i32 0), align 8
@.str.func172_str3 = private unnamed_addr constant [5 x i8] c"%llx\00", align 1
@func172_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func172_str3, i32 0, i32 0), align 8
@.str.func172_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@func172_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func172_str4, i32 0, i32 0), align 8
@.str.func176_str1 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func176_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func176_str1, i32 0, i32 0), align 8
@.str.func176_str2 = private unnamed_addr constant [23 x i8] c"unexpected end-of-file\00", align 1
@func176_str2 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func176_str2, i32 0, i32 0), align 8
@.str.func176_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func176_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func176_str3, i32 0, i32 0), align 8
@.str.func180_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func180_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func180_str1, i32 0, i32 0), align 8
@.str.func180_str2 = private unnamed_addr constant [25 x i8] c"stmt::fail_with_restore\0A\00", align 1
@func180_str2 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.func180_str2, i32 0, i32 0), align 8
@.str.func180_str3 = private unnamed_addr constant [10 x i8] c"YYY = %s\0A\00", align 1
@func180_str3 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func180_str3, i32 0, i32 0), align 8
@.str.func182_str1 = private unnamed_addr constant [13 x i8] c"invalid lval\00", align 1
@func182_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.func182_str1, i32 0, i32 0), align 8
@.str.func182_str2 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func182_str2 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func182_str2, i32 0, i32 0), align 8
@.str.func182_str3 = private unnamed_addr constant [9 x i8] c"LTYPE = \00", align 1
@func182_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func182_str3, i32 0, i32 0), align 8
@.str.func182_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func182_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func182_str4, i32 0, i32 0), align 8
@.str.func182_str5 = private unnamed_addr constant [9 x i8] c"RTYPE = \00", align 1
@func182_str5 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func182_str5, i32 0, i32 0), align 8
@.str.func182_str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func182_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func182_str6, i32 0, i32 0), align 8
@.str.func183_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func183_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func183_str1, i32 0, i32 0), align 8
@.str.func183_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func183_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func183_str2, i32 0, i32 0), align 8
@.str.func183_str3 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@func183_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func183_str3, i32 0, i32 0), align 8
@.str.func183_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func183_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func183_str4, i32 0, i32 0), align 8
@.str.func183_str5 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func183_str5 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func183_str5, i32 0, i32 0), align 8
@.str.func183_str6 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func183_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func183_str6, i32 0, i32 0), align 8
@.str.func184_str1 = private unnamed_addr constant [25 x i8] c"expected Bool expression\00", align 1
@func184_str1 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.func184_str1, i32 0, i32 0), align 8
@.str.func185_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func185_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func185_str1, i32 0, i32 0), align 8
@.str.func185_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func185_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func185_str2, i32 0, i32 0), align 8
@.str.func186_str1 = private unnamed_addr constant [25 x i8] c"expected Bool expression\00", align 1
@func186_str1 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.func186_str1, i32 0, i32 0), align 8
@.str.func187_str1 = private unnamed_addr constant [27 x i8] c"expected return expression\00", align 1
@func187_str1 = constant i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.func187_str1, i32 0, i32 0), align 8
@.str.func189_str1 = private unnamed_addr constant [34 x i8] c"`break` outside any loop operator\00", align 1
@func189_str1 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.func189_str1, i32 0, i32 0), align 8
@.str.func190_str1 = private unnamed_addr constant [37 x i8] c"`continue` outside any loop operator\00", align 1
@func190_str1 = constant i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.func190_str1, i32 0, i32 0), align 8
@.str.func191_str1 = private unnamed_addr constant [15 x i8] c"expected label\00", align 1
@func191_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.func191_str1, i32 0, i32 0), align 8
@.str.func193_str1 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@func193_str1 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func193_str1, i32 0, i32 0), align 8
@.str.func193_str2 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func193_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func193_str2, i32 0, i32 0), align 8
@.str.func193_str3 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@func193_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func193_str3, i32 0, i32 0), align 8
@.str.func193_str4 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@func193_str4 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func193_str4, i32 0, i32 0), align 8
@.str.func193_str5 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@func193_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func193_str5, i32 0, i32 0), align 8
@.str.func193_str6 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@func193_str6 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func193_str6, i32 0, i32 0), align 8
@.str.func193_str7 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@func193_str7 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func193_str7, i32 0, i32 0), align 8
@.str.func193_str8 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func193_str8 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func193_str8, i32 0, i32 0), align 8
@.str.func193_str9 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@func193_str9 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func193_str9, i32 0, i32 0), align 8
@.str.func193_str10 = private unnamed_addr constant [5 x i8] c"goto\00", align 1
@func193_str10 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func193_str10, i32 0, i32 0), align 8
@.str.func193_str11 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func193_str11 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func193_str11, i32 0, i32 0), align 8
@.str.func196_str1 = private unnamed_addr constant [9 x i8] c"stmt_new\00", align 1
@func196_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func196_str1, i32 0, i32 0), align 8
@.str.func201_str1 = private unnamed_addr constant [14 x i8] c"asmTypedefAdd\00", align 1
@func201_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func201_str1, i32 0, i32 0), align 8
@.str.func202_str1 = private unnamed_addr constant [13 x i8] c"asmStringAdd\00", align 1
@func202_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.func202_str1, i32 0, i32 0), align 8
@.str.func203_str1 = private unnamed_addr constant [12 x i8] c"asmArrayAdd\00", align 1
@func203_str1 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func203_str1, i32 0, i32 0), align 8
@.str.func204_str1 = private unnamed_addr constant [11 x i8] c"asmFuncAdd\00", align 1
@func204_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func204_str1, i32 0, i32 0), align 8
@.str.func205_str1 = private unnamed_addr constant [10 x i8] c"asmVarAdd\00", align 1
@func205_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func205_str1, i32 0, i32 0), align 8
@.str.func209_str1 = private unnamed_addr constant [8 x i8] c"ValueId\00", align 1
@func209_str1 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func209_str1, i32 0, i32 0), align 8
@.str.func209_str2 = private unnamed_addr constant [9 x i8] c"ValueRef\00", align 1
@func209_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str2, i32 0, i32 0), align 8
@.str.func209_str3 = private unnamed_addr constant [11 x i8] c"ValueDeref\00", align 1
@func209_str3 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func209_str3, i32 0, i32 0), align 8
@.str.func209_str4 = private unnamed_addr constant [9 x i8] c"ValueNot\00", align 1
@func209_str4 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str4, i32 0, i32 0), align 8
@.str.func209_str5 = private unnamed_addr constant [11 x i8] c"ValueMinus\00", align 1
@func209_str5 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func209_str5, i32 0, i32 0), align 8
@.str.func209_str6 = private unnamed_addr constant [9 x i8] c"ValueShl\00", align 1
@func209_str6 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str6, i32 0, i32 0), align 8
@.str.func209_str7 = private unnamed_addr constant [9 x i8] c"ValueShr\00", align 1
@func209_str7 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str7, i32 0, i32 0), align 8
@.str.func209_str8 = private unnamed_addr constant [9 x i8] c"ValueAdd\00", align 1
@func209_str8 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str8, i32 0, i32 0), align 8
@.str.func209_str9 = private unnamed_addr constant [9 x i8] c"ValueSub\00", align 1
@func209_str9 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str9, i32 0, i32 0), align 8
@.str.func209_str10 = private unnamed_addr constant [9 x i8] c"ValueMul\00", align 1
@func209_str10 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str10, i32 0, i32 0), align 8
@.str.func209_str11 = private unnamed_addr constant [9 x i8] c"ValueDiv\00", align 1
@func209_str11 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str11, i32 0, i32 0), align 8
@.str.func209_str12 = private unnamed_addr constant [9 x i8] c"ValueMod\00", align 1
@func209_str12 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str12, i32 0, i32 0), align 8
@.str.func209_str13 = private unnamed_addr constant [8 x i8] c"ValueOr\00", align 1
@func209_str13 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func209_str13, i32 0, i32 0), align 8
@.str.func209_str14 = private unnamed_addr constant [9 x i8] c"ValueXor\00", align 1
@func209_str14 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str14, i32 0, i32 0), align 8
@.str.func209_str15 = private unnamed_addr constant [9 x i8] c"ValueAnd\00", align 1
@func209_str15 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func209_str15, i32 0, i32 0), align 8
@.str.func209_str16 = private unnamed_addr constant [8 x i8] c"ValueEq\00", align 1
@func209_str16 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func209_str16, i32 0, i32 0), align 8
@.str.func209_str17 = private unnamed_addr constant [8 x i8] c"ValueNe\00", align 1
@func209_str17 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func209_str17, i32 0, i32 0), align 8
@.str.func209_str18 = private unnamed_addr constant [8 x i8] c"ValueLt\00", align 1
@func209_str18 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func209_str18, i32 0, i32 0), align 8
@.str.func209_str19 = private unnamed_addr constant [8 x i8] c"ValueGt\00", align 1
@func209_str19 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func209_str19, i32 0, i32 0), align 8
@.str.func209_str20 = private unnamed_addr constant [8 x i8] c"ValueLe\00", align 1
@func209_str20 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func209_str20, i32 0, i32 0), align 8
@.str.func209_str21 = private unnamed_addr constant [8 x i8] c"ValueGe\00", align 1
@func209_str21 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func209_str21, i32 0, i32 0), align 8
@.str.func209_str22 = private unnamed_addr constant [10 x i8] c"ValueCall\00", align 1
@func209_str22 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func209_str22, i32 0, i32 0), align 8
@.str.func209_str23 = private unnamed_addr constant [11 x i8] c"ValueIndex\00", align 1
@func209_str23 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func209_str23, i32 0, i32 0), align 8
@.str.func209_str24 = private unnamed_addr constant [12 x i8] c"ValueAccess\00", align 1
@func209_str24 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func209_str24, i32 0, i32 0), align 8
@.str.func209_str25 = private unnamed_addr constant [10 x i8] c"ValueCast\00", align 1
@func209_str25 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func209_str25, i32 0, i32 0), align 8
@.str.func209_str26 = private unnamed_addr constant [13 x i8] c"ValueInvalid\00", align 1
@func209_str26 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.func209_str26, i32 0, i32 0), align 8
@.str.func209_str27 = private unnamed_addr constant [13 x i8] c"ValueUnknown\00", align 1
@func209_str27 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.func209_str27, i32 0, i32 0), align 8
@.str.func210_str1 = private unnamed_addr constant [17 x i8] c"StorageUndefined\00", align 1
@func210_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func210_str1, i32 0, i32 0), align 8
@.str.func210_str2 = private unnamed_addr constant [17 x i8] c"StorageImmediate\00", align 1
@func210_str2 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func210_str2, i32 0, i32 0), align 8
@.str.func210_str3 = private unnamed_addr constant [19 x i8] c"StorageGlobalConst\00", align 1
@func210_str3 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func210_str3, i32 0, i32 0), align 8
@.str.func210_str4 = private unnamed_addr constant [16 x i8] c"StorageRegister\00", align 1
@func210_str4 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func210_str4, i32 0, i32 0), align 8
@.str.func210_str5 = private unnamed_addr constant [15 x i8] c"StorageAddress\00", align 1
@func210_str5 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.func210_str5, i32 0, i32 0), align 8
@.str.func210_str6 = private unnamed_addr constant [13 x i8] c"StorageLocal\00", align 1
@func210_str6 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.func210_str6, i32 0, i32 0), align 8
@.str.func210_str7 = private unnamed_addr constant [14 x i8] c"StorageGlobal\00", align 1
@func210_str7 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func210_str7, i32 0, i32 0), align 8
@.str.func210_str8 = private unnamed_addr constant [20 x i8] c"StorageClassUnknown\00", align 1
@func210_str8 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.func210_str8, i32 0, i32 0), align 8
@.str.func211_str1 = private unnamed_addr constant [13 x i8] c"value: %p {\0A\00", align 1
@func211_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.func211_str1, i32 0, i32 0), align 8
@.str.func211_str2 = private unnamed_addr constant [12 x i8] c"  kind: %s\0A\00", align 1
@func211_str2 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func211_str2, i32 0, i32 0), align 8
@.str.func211_str3 = private unnamed_addr constant [9 x i8] c"  type: \00", align 1
@func211_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func211_str3, i32 0, i32 0), align 8
@.str.func211_str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func211_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func211_str4, i32 0, i32 0), align 8
@.str.func211_str5 = private unnamed_addr constant [21 x i8] c"  storage.class: %s\0A\00", align 1
@func211_str5 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.func211_str5, i32 0, i32 0), align 8
@.str.func211_str6 = private unnamed_addr constant [18 x i8] c"  storage.id: %s\0A\00", align 1
@func211_str6 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func211_str6, i32 0, i32 0), align 8
@.str.func211_str7 = private unnamed_addr constant [19 x i8] c"  storage.reg: %d\0A\00", align 1
@func211_str7 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func211_str7, i32 0, i32 0), align 8
@.str.func211_str8 = private unnamed_addr constant [19 x i8] c"  storage.val: %d\0A\00", align 1
@func211_str8 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func211_str8, i32 0, i32 0), align 8
@.str.func211_str9 = private unnamed_addr constant [3 x i8] c"}\0A\00", align 1
@func211_str9 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func211_str9, i32 0, i32 0), align 8
@.str.func213_str1 = private unnamed_addr constant [20 x i8] c"nat:: v.type == Nil\00", align 1
@func213_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.func213_str1, i32 0, i32 0), align 8
@.str.func213_str2 = private unnamed_addr constant [15 x i8] c"nat:: t == Nil\00", align 1
@func213_str2 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.func213_str2, i32 0, i32 0), align 8
@.str.func215_str1 = private unnamed_addr constant [40 x i8] c"value/un :: unknown value kind received\00", align 1
@func215_str1 = constant i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.func215_str1, i32 0, i32 0), align 8
@.str.func218_str1 = private unnamed_addr constant [26 x i8] c"cannot ref constant value\00", align 1
@func218_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.func218_str1, i32 0, i32 0), align 8
@.str.func220_str1 = private unnamed_addr constant [18 x i8] c"expected pointer\0A\00", align 1
@func220_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func220_str1, i32 0, i32 0), align 8
@.str.func225_str1 = private unnamed_addr constant [32 x i8] c"binImm :: unknown bin operation\00", align 1
@func225_str1 = constant i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.func225_str1, i32 0, i32 0), align 8
@.str.func226_str1 = private unnamed_addr constant [11 x i8] c"type error\00", align 1
@func226_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func226_str1, i32 0, i32 0), align 8
@.str.func226_str2 = private unnamed_addr constant [9 x i8] c"LTYPE = \00", align 1
@func226_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func226_str2, i32 0, i32 0), align 8
@.str.func226_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func226_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func226_str3, i32 0, i32 0), align 8
@.str.func226_str4 = private unnamed_addr constant [9 x i8] c"RTYPE = \00", align 1
@func226_str4 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func226_str4, i32 0, i32 0), align 8
@.str.func226_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func226_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func226_str5, i32 0, i32 0), align 8
@.str.func226_str6 = private unnamed_addr constant [18 x i8] c"binary type error\00", align 1
@func226_str6 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func226_str6, i32 0, i32 0), align 8
@.str.func232_str1 = private unnamed_addr constant [41 x i8] c"expected record / pointer to record type\00", align 1
@func232_str1 = constant i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.func232_str1, i32 0, i32 0), align 8
@.str.func232_str2 = private unnamed_addr constant [16 x i8] c"undefined field\00", align 1
@func232_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func232_str2, i32 0, i32 0), align 8
@.str.func234_str1 = private unnamed_addr constant [19 x i8] c"undefined function\00", align 1
@func234_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func234_str1, i32 0, i32 0), align 8
@.str.func234_str2 = private unnamed_addr constant [18 x i8] c"expected function\00", align 1
@func234_str2 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func234_str2, i32 0, i32 0), align 8
@.str.func235_str1 = private unnamed_addr constant [21 x i8] c"not enough arguments\00", align 1
@func235_str1 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.func235_str1, i32 0, i32 0), align 8
@.str.func235_str2 = private unnamed_addr constant [19 x i8] c"too many arguments\00", align 1
@func235_str2 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func235_str2, i32 0, i32 0), align 8
@.str.func235_str3 = private unnamed_addr constant [37 x i8] c"argument type not match param type: \00", align 1
@func235_str3 = constant i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.func235_str3, i32 0, i32 0), align 8
@.str.func235_str4 = private unnamed_addr constant [7 x i8] c"arg = \00", align 1
@func235_str4 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func235_str4, i32 0, i32 0), align 8
@.str.func235_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func235_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func235_str5, i32 0, i32 0), align 8
@.str.func235_str6 = private unnamed_addr constant [7 x i8] c"par = \00", align 1
@func235_str6 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func235_str6, i32 0, i32 0), align 8
@.str.func235_str7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func235_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func235_str7, i32 0, i32 0), align 8
@.str.func240_str1 = private unnamed_addr constant [20 x i8] c"sizeof unknown type\00", align 1
@func240_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.func240_str1, i32 0, i32 0), align 8
@.str.func242_str1 = private unnamed_addr constant [21 x i8] c"alignof unknown type\00", align 1
@func242_str1 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.func242_str1, i32 0, i32 0), align 8
@.str.func246_str1 = private unnamed_addr constant [6 x i8] c"False\00", align 1
@func246_str1 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func246_str1, i32 0, i32 0), align 8
@.str.func246_str2 = private unnamed_addr constant [5 x i8] c"True\00", align 1
@func246_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func246_str2, i32 0, i32 0), align 8
@.str.func246_str3 = private unnamed_addr constant [5 x i8] c"Unit\00", align 1
@func246_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func246_str3, i32 0, i32 0), align 8
@.str.func246_str4 = private unnamed_addr constant [4 x i8] c"Nil\00", align 1
@func246_str4 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func246_str4, i32 0, i32 0), align 8
@.str.func247_str1 = private unnamed_addr constant [10 x i8] c"value_new\00", align 1
@func247_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func247_str1, i32 0, i32 0), align 8
@.str.func255_str1 = private unnamed_addr constant [7 x i8] c"import\00", align 1
@func255_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func255_str1, i32 0, i32 0), align 8
@.str.func255_str2 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@func255_str2 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func255_str2, i32 0, i32 0), align 8
@.str.func255_str3 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@func255_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func255_str3, i32 0, i32 0), align 8
@.str.func255_str4 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@func255_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func255_str4, i32 0, i32 0), align 8
@.str.func255_str5 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@func255_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func255_str5, i32 0, i32 0), align 8
@.str.func255_str6 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func255_str6 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func255_str6, i32 0, i32 0), align 8
@.str.func255_str7 = private unnamed_addr constant [8 x i8] c"arghack\00", align 1
@func255_str7 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func255_str7, i32 0, i32 0), align 8
@.str.func255_str8 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@func255_str8 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func255_str8, i32 0, i32 0), align 8
@.str.func255_str9 = private unnamed_addr constant [11 x i8] c"nodecorate\00", align 1
@func255_str9 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func255_str9, i32 0, i32 0), align 8
@.str.func255_str10 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@func255_str10 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func255_str10, i32 0, i32 0), align 8
@.str.func255_str11 = private unnamed_addr constant [4 x i8] c"var\00", align 1
@func255_str11 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func255_str11, i32 0, i32 0), align 8
@.str.func255_str12 = private unnamed_addr constant [5 x i8] c"type\00", align 1
@func255_str12 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func255_str12, i32 0, i32 0), align 8
@.str.func255_str13 = private unnamed_addr constant [12 x i8] c"flagArghack\00", align 1
@func255_str13 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func255_str13, i32 0, i32 0), align 8
@.str.func256_str1 = private unnamed_addr constant [23 x i8] c"expected import string\00", align 1
@func256_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func256_str1, i32 0, i32 0), align 8
@.str.func256_str2 = private unnamed_addr constant [18 x i8] c"when import = %s\0A\00", align 1
@func256_str2 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func256_str2, i32 0, i32 0), align 8
@.str.func256_str3 = private unnamed_addr constant [14 x i8] c"cannot import\00", align 1
@func256_str3 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func256_str3, i32 0, i32 0), align 8
@.str.func257_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func257_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func257_str1, i32 0, i32 0), align 8
@.str.func258_str1 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func258_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func258_str1, i32 0, i32 0), align 8
@.str.func263_str1 = private unnamed_addr constant [12 x i8] c"expected id\00", align 1
@func263_str1 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func263_str1, i32 0, i32 0), align 8
@.str.func263_str2 = private unnamed_addr constant [9 x i8] c"tt = %d\0A\00", align 1
@func263_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func263_str2, i32 0, i32 0), align 8
@.str.func263_str3 = private unnamed_addr constant [9 x i8] c"tx = %d\0A\00", align 1
@func263_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func263_str3, i32 0, i32 0), align 8
@.str.func263_str4 = private unnamed_addr constant [14 x i8] c"instead '%s'\0A\00", align 1
@func263_str4 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func263_str4, i32 0, i32 0), align 8
@.str.func264_str1 = private unnamed_addr constant [2 x i8] c",\00", align 1
@func264_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func264_str1, i32 0, i32 0), align 8
@.str.func264_str2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@func264_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func264_str2, i32 0, i32 0), align 8
@.str.func269_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func269_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func269_str1, i32 0, i32 0), align 8
@.str.func273_str1 = private unnamed_addr constant [19 x i8] c"expected separator\00", align 1
@func273_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func273_str1, i32 0, i32 0), align 8
@.str.func274_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func274_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func274_str1, i32 0, i32 0), align 8
@.str.func274_str2 = private unnamed_addr constant [2 x i8] c";\00", align 1
@func274_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func274_str2, i32 0, i32 0), align 8
@.str.func274_str3 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func274_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func274_str3, i32 0, i32 0), align 8
@.str.func274_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func274_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func274_str4, i32 0, i32 0), align 8
@.str.func275_str1 = private unnamed_addr constant [29 x i8] c"lex::skipto not implemented\0A\00", align 1
@func275_str1 = constant i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.func275_str1, i32 0, i32 0), align 8
@.str.func275_str2 = private unnamed_addr constant [12 x i8] c"tok = '%s'\0A\00", align 1
@func275_str2 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func275_str2, i32 0, i32 0), align 8
@.str.func275_str3 = private unnamed_addr constant [18 x i8] c"skip_target = %s\0A\00", align 1
@func275_str3 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func275_str3, i32 0, i32 0), align 8
@.str.func277_str1 = private unnamed_addr constant [18 x i8] c"unexpected symbol\00", align 1
@func277_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func277_str1, i32 0, i32 0), align 8
@.str.func277_str2 = private unnamed_addr constant [24 x i8] c"expected %s instead %s\0A\00", align 1
@func277_str2 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.func277_str2, i32 0, i32 0), align 8
@.str.func277_str3 = private unnamed_addr constant [16 x i8] c"ctok.type = %d\0A\00", align 1
@func277_str3 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func277_str3, i32 0, i32 0), align 8
@.str.func280_str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@func280_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func280_str1, i32 0, i32 0), align 8
@.str.func281_str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func281_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func281_str1, i32 0, i32 0), align 8
@.str.func282_str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func282_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func282_str1, i32 0, i32 0), align 8
@.str.func283_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func283_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func283_str1, i32 0, i32 0), align 8
@.str.func285_str1 = private unnamed_addr constant [10 x i8] c" !dbg !%u\00", align 1
@func285_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func285_str1, i32 0, i32 0), align 8
@.str.func289_str1 = private unnamed_addr constant [26 x i8] c"prn/printType :: t = Nil\0A\00", align 1
@func289_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.func289_str1, i32 0, i32 0), align 8
@.str.func289_str2 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func289_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func289_str2, i32 0, i32 0), align 8
@.str.func289_str3 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func289_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func289_str3, i32 0, i32 0), align 8
@.str.func290_str1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@func290_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func290_str1, i32 0, i32 0), align 8
@.str.func291_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func291_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func291_str1, i32 0, i32 0), align 8
@.str.func290_str2 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@func290_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func290_str2, i32 0, i32 0), align 8
@.str.func292_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func292_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func292_str1, i32 0, i32 0), align 8
@.str.func292_str2 = private unnamed_addr constant [7 x i8] c"[%d x \00", align 1
@func292_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func292_str2, i32 0, i32 0), align 8
@.str.func292_str3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@func292_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func292_str3, i32 0, i32 0), align 8
@.str.func293_str1 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func293_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func293_str1, i32 0, i32 0), align 8
@.str.func294_str1 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func294_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func294_str1, i32 0, i32 0), align 8
@.str.func294_str2 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func294_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func294_str2, i32 0, i32 0), align 8
@.str.func295_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func295_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func295_str1, i32 0, i32 0), align 8
@.str.func294_str3 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func294_str3 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func294_str3, i32 0, i32 0), align 8
@.str.func294_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func294_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func294_str4, i32 0, i32 0), align 8
@.str.func294_str5 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@func294_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func294_str5, i32 0, i32 0), align 8
@.str.func297_str1 = private unnamed_addr constant [11 x i8] c"\0A\0A;stmt%d:\00", align 1
@func297_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func297_str1, i32 0, i32 0), align 8
@.str.func297_str2 = private unnamed_addr constant [19 x i8] c"print::StmtUnknown\00", align 1
@func297_str2 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func297_str2, i32 0, i32 0), align 8
@.str.func298_str1 = private unnamed_addr constant [18 x i8] c"\0A  %%%s = alloca \00", align 1
@func298_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func298_str1, i32 0, i32 0), align 8
@.str.func301_str1 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func301_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func301_str1, i32 0, i32 0), align 8
@.str.func301_str2 = private unnamed_addr constant [35 x i8] c", label %%then_%d, label %%else_%d\00", align 1
@func301_str2 = constant i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.func301_str2, i32 0, i32 0), align 8
@.str.func301_str3 = private unnamed_addr constant [10 x i8] c"\0Athen_%d:\00", align 1
@func301_str3 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func301_str3, i32 0, i32 0), align 8
@.str.func301_str4 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func301_str4 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func301_str4, i32 0, i32 0), align 8
@.str.func301_str5 = private unnamed_addr constant [10 x i8] c"\0Aelse_%d:\00", align 1
@func301_str5 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func301_str5, i32 0, i32 0), align 8
@.str.func301_str6 = private unnamed_addr constant [23 x i8] c"\0A  br label %%endif_%d\00", align 1
@func301_str6 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func301_str6, i32 0, i32 0), align 8
@.str.func301_str7 = private unnamed_addr constant [11 x i8] c"\0Aendif_%d:\00", align 1
@func301_str7 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func301_str7, i32 0, i32 0), align 8
@.str.func302_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func302_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.func302_str1, i32 0, i32 0), align 8
@.str.func302_str2 = private unnamed_addr constant [14 x i8] c"\0Acontinue_%d:\00", align 1
@func302_str2 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func302_str2, i32 0, i32 0), align 8
@.str.func302_str3 = private unnamed_addr constant [10 x i8] c"\0A  br i1 \00", align 1
@func302_str3 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func302_str3, i32 0, i32 0), align 8
@.str.func302_str4 = private unnamed_addr constant [36 x i8] c", label %%body_%d, label %%break_%d\00", align 1
@func302_str4 = constant i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.func302_str4, i32 0, i32 0), align 8
@.str.func302_str5 = private unnamed_addr constant [10 x i8] c"\0Abody_%d:\00", align 1
@func302_str5 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func302_str5, i32 0, i32 0), align 8
@.str.func302_str6 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func302_str6 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.func302_str6, i32 0, i32 0), align 8
@.str.func302_str7 = private unnamed_addr constant [11 x i8] c"\0Abreak_%d:\00", align 1
@func302_str7 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func302_str7, i32 0, i32 0), align 8
@.str.func303_str1 = private unnamed_addr constant [10 x i8] c"\0Aret void\00", align 1
@func303_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func303_str1, i32 0, i32 0), align 8
@.str.func303_str2 = private unnamed_addr constant [8 x i8] c"\0A  ret \00", align 1
@func303_str2 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func303_str2, i32 0, i32 0), align 8
@.str.func304_str1 = private unnamed_addr constant [23 x i8] c"\0A  br label %%break_%d\00", align 1
@func304_str1 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func304_str1, i32 0, i32 0), align 8
@.str.func305_str1 = private unnamed_addr constant [26 x i8] c"\0A  br label %%continue_%d\00", align 1
@func305_str1 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.func305_str1, i32 0, i32 0), align 8
@.str.func306_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func306_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func306_str1, i32 0, i32 0), align 8
@.str.func307_str1 = private unnamed_addr constant [17 x i8] c"\0A  br label %%%s\00", align 1
@func307_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func307_str1, i32 0, i32 0), align 8
@.str.func307_str2 = private unnamed_addr constant [5 x i8] c"\0A%s:\00", align 1
@func307_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func307_str2, i32 0, i32 0), align 8
@.str.func310_str1 = private unnamed_addr constant [25 x i8] c"getelementptr inbounds (\00", align 1
@func310_str1 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.func310_str1, i32 0, i32 0), align 8
@.str.func310_str2 = private unnamed_addr constant [17 x i8] c", i32 0, i32 %d)\00", align 1
@func310_str2 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func310_str2, i32 0, i32 0), align 8
@.str.func311_str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@func311_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func311_str1, i32 0, i32 0), align 8
@.str.func311_str2 = private unnamed_addr constant [5 x i8] c"%%%d\00", align 1
@func311_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func311_str2, i32 0, i32 0), align 8
@.str.func311_str3 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@func311_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func311_str3, i32 0, i32 0), align 8
@.str.func311_str4 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func311_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func311_str4, i32 0, i32 0), align 8
@.str.func311_str5 = private unnamed_addr constant [19 x i8] c"<StorageUndefined>\00", align 1
@func311_str5 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func311_str5, i32 0, i32 0), align 8
@.str.func313_str1 = private unnamed_addr constant [24 x i8] c"\0A  %%%d = inttoptr i64 \00", align 1
@func313_str1 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.func313_str1, i32 0, i32 0), align 8
@.str.func313_str2 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@func313_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func313_str2, i32 0, i32 0), align 8
@.str.func314_str1 = private unnamed_addr constant [16 x i8] c"\0A  %%%d = load \00", align 1
@func314_str1 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func314_str1, i32 0, i32 0), align 8
@.str.func314_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func314_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func314_str2, i32 0, i32 0), align 8
@.str.func315_str1 = private unnamed_addr constant [9 x i8] c"\0A  call \00", align 1
@func315_str1 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func315_str1, i32 0, i32 0), align 8
@.str.func315_str2 = private unnamed_addr constant [16 x i8] c"\0A  %%%d = call \00", align 1
@func315_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func315_str2, i32 0, i32 0), align 8
@.str.func315_str3 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@func315_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func315_str3, i32 0, i32 0), align 8
@.str.func315_str4 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func315_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func315_str4, i32 0, i32 0), align 8
@.str.func318_str1 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@func318_str1 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.func318_str1, i32 0, i32 0), align 8
@.str.func318_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func318_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func318_str2, i32 0, i32 0), align 8
@.str.func318_str3 = private unnamed_addr constant [8 x i8] c", i32 0\00", align 1
@func318_str3 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func318_str3, i32 0, i32 0), align 8
@.str.func319_str1 = private unnamed_addr constant [29 x i8] c"print/expr:: v.field == Nil\0A\00", align 1
@func319_str1 = constant i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.func319_str1, i32 0, i32 0), align 8
@.str.func319_str2 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@func319_str2 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.func319_str2, i32 0, i32 0), align 8
@.str.func319_str3 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func319_str3 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func319_str3, i32 0, i32 0), align 8
@.str.func319_str4 = private unnamed_addr constant [16 x i8] c", i32 0, i32 %u\00", align 1
@func319_str4 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func319_str4, i32 0, i32 0), align 8
@.str.func320_str1 = private unnamed_addr constant [34 x i8] c"\0A  %%%d = getelementptr inbounds \00", align 1
@func320_str1 = constant i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.func320_str1, i32 0, i32 0), align 8
@.str.func320_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func320_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func320_str2, i32 0, i32 0), align 8
@.str.func320_str3 = private unnamed_addr constant [6 x i8] c"i32 0\00", align 1
@func320_str3 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func320_str3, i32 0, i32 0), align 8
@.str.func322_str1 = private unnamed_addr constant [15 x i8] c"\0A  %%%d = xor \00", align 1
@func322_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.func322_str1, i32 0, i32 0), align 8
@.str.func322_str2 = private unnamed_addr constant [4 x i8] c", 1\00", align 1
@func322_str2 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func322_str2, i32 0, i32 0), align 8
@.str.func322_str3 = private unnamed_addr constant [5 x i8] c", -1\00", align 1
@func322_str3 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func322_str3, i32 0, i32 0), align 8
@.str.func323_str1 = private unnamed_addr constant [19 x i8] c"\0A  %%%d = sub nsw \00", align 1
@func323_str1 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func323_str1, i32 0, i32 0), align 8
@.str.func323_str2 = private unnamed_addr constant [3 x i8] c" 0\00", align 1
@func323_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func323_str2, i32 0, i32 0), align 8
@.str.func324_str1 = private unnamed_addr constant [11 x i8] c"\0A  %%%d = \00", align 1
@func324_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func324_str1, i32 0, i32 0), align 8
@.str.func324_str2 = private unnamed_addr constant [10 x i8] c"inttoptr \00", align 1
@func324_str2 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func324_str2, i32 0, i32 0), align 8
@.str.func324_str3 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@func324_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func324_str3, i32 0, i32 0), align 8
@.str.func324_str4 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@func324_str4 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func324_str4, i32 0, i32 0), align 8
@.str.func324_str5 = private unnamed_addr constant [10 x i8] c"inttoptr \00", align 1
@func324_str5 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func324_str5, i32 0, i32 0), align 8
@.str.func324_str6 = private unnamed_addr constant [7 x i8] c"trunc \00", align 1
@func324_str6 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func324_str6, i32 0, i32 0), align 8
@.str.func324_str7 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@func324_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func324_str7, i32 0, i32 0), align 8
@.str.func324_str8 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@func324_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func324_str8, i32 0, i32 0), align 8
@.str.func324_str9 = private unnamed_addr constant [5 x i8] c"ext \00", align 1
@func324_str9 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func324_str9, i32 0, i32 0), align 8
@.str.func324_str10 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@func324_str10 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func324_str10, i32 0, i32 0), align 8
@.str.func324_str11 = private unnamed_addr constant [10 x i8] c"ptrtoint \00", align 1
@func324_str11 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func324_str11, i32 0, i32 0), align 8
@.str.func324_str12 = private unnamed_addr constant [9 x i8] c"enumSize\00", align 1
@func324_str12 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func324_str12, i32 0, i32 0), align 8
@.str.func324_str13 = private unnamed_addr constant [7 x i8] c"trunc \00", align 1
@func324_str13 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func324_str13, i32 0, i32 0), align 8
@.str.func324_str14 = private unnamed_addr constant [6 x i8] c"zext \00", align 1
@func324_str14 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func324_str14, i32 0, i32 0), align 8
@.str.func324_str15 = private unnamed_addr constant [9 x i8] c"bitcast \00", align 1
@func324_str15 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func324_str15, i32 0, i32 0), align 8
@.str.func324_str16 = private unnamed_addr constant [18 x i8] c"e.type.kind = %d\0A\00", align 1
@func324_str16 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func324_str16, i32 0, i32 0), align 8
@.str.func324_str17 = private unnamed_addr constant [33 x i8] c"printer/expr/cast :: e.type.kind\00", align 1
@func324_str17 = constant i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.func324_str17, i32 0, i32 0), align 8
@.str.func324_str18 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@func324_str18 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func324_str18, i32 0, i32 0), align 8
@.str.func325_str1 = private unnamed_addr constant [7 x i8] c"<oper>\00", align 1
@func325_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func325_str1, i32 0, i32 0), align 8
@.str.func325_str2 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@func325_str2 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func325_str2, i32 0, i32 0), align 8
@.str.func325_str3 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@func325_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func325_str3, i32 0, i32 0), align 8
@.str.func325_str4 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@func325_str4 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func325_str4, i32 0, i32 0), align 8
@.str.func325_str5 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@func325_str5 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func325_str5, i32 0, i32 0), align 8
@.str.func325_str6 = private unnamed_addr constant [5 x i8] c"udiv\00", align 1
@func325_str6 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func325_str6, i32 0, i32 0), align 8
@.str.func325_str7 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@func325_str7 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func325_str7, i32 0, i32 0), align 8
@.str.func325_str8 = private unnamed_addr constant [5 x i8] c"urem\00", align 1
@func325_str8 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func325_str8, i32 0, i32 0), align 8
@.str.func325_str9 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@func325_str9 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func325_str9, i32 0, i32 0), align 8
@.str.func325_str10 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@func325_str10 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func325_str10, i32 0, i32 0), align 8
@.str.func325_str11 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@func325_str11 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func325_str11, i32 0, i32 0), align 8
@.str.func325_str12 = private unnamed_addr constant [8 x i8] c"icmp eq\00", align 1
@func325_str12 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func325_str12, i32 0, i32 0), align 8
@.str.func325_str13 = private unnamed_addr constant [8 x i8] c"icmp ne\00", align 1
@func325_str13 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func325_str13, i32 0, i32 0), align 8
@.str.func325_str14 = private unnamed_addr constant [9 x i8] c"icmp slt\00", align 1
@func325_str14 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func325_str14, i32 0, i32 0), align 8
@.str.func325_str15 = private unnamed_addr constant [9 x i8] c"icmp ult\00", align 1
@func325_str15 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func325_str15, i32 0, i32 0), align 8
@.str.func325_str16 = private unnamed_addr constant [9 x i8] c"icmp sgt\00", align 1
@func325_str16 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func325_str16, i32 0, i32 0), align 8
@.str.func325_str17 = private unnamed_addr constant [9 x i8] c"icmp ugt\00", align 1
@func325_str17 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func325_str17, i32 0, i32 0), align 8
@.str.func325_str18 = private unnamed_addr constant [9 x i8] c"icmp sle\00", align 1
@func325_str18 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func325_str18, i32 0, i32 0), align 8
@.str.func325_str19 = private unnamed_addr constant [9 x i8] c"icmp ule\00", align 1
@func325_str19 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func325_str19, i32 0, i32 0), align 8
@.str.func325_str20 = private unnamed_addr constant [9 x i8] c"icmp sge\00", align 1
@func325_str20 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func325_str20, i32 0, i32 0), align 8
@.str.func325_str21 = private unnamed_addr constant [9 x i8] c"icmp uge\00", align 1
@func325_str21 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func325_str21, i32 0, i32 0), align 8
@.str.func325_str22 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@func325_str22 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func325_str22, i32 0, i32 0), align 8
@.str.func325_str23 = private unnamed_addr constant [5 x i8] c"ashr\00", align 1
@func325_str23 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func325_str23, i32 0, i32 0), align 8
@.str.func325_str24 = private unnamed_addr constant [5 x i8] c"lshr\00", align 1
@func325_str24 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func325_str24, i32 0, i32 0), align 8
@.str.func325_str25 = private unnamed_addr constant [14 x i8] c"\0A  %%%d = %s \00", align 1
@func325_str25 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func325_str25, i32 0, i32 0), align 8
@.str.func326_str1 = private unnamed_addr constant [10 x i8] c"\0A  store \00", align 1
@func326_str1 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func326_str1, i32 0, i32 0), align 8
@.str.func326_str2 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func326_str2 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func326_str2, i32 0, i32 0), align 8
@.str.func327_str1 = private unnamed_addr constant [12 x i8] c"printer::nv\00", align 1
@func327_str1 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func327_str1, i32 0, i32 0), align 8
@.str.func328_str1 = private unnamed_addr constant [14 x i8] c"\0A%%%s = type \00", align 1
@func328_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func328_str1, i32 0, i32 0), align 8
@.str.func329_str1 = private unnamed_addr constant [44 x i8] c"\0A@%s = private unnamed_addr constant [%d x \00", align 1
@func329_str1 = constant i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.func329_str1, i32 0, i32 0), align 8
@.str.func329_str2 = private unnamed_addr constant [4 x i8] c"] [\00", align 1
@func329_str2 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func329_str2, i32 0, i32 0), align 8
@.str.func329_str3 = private unnamed_addr constant [12 x i8] c"], align 16\00", align 1
@func329_str3 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func329_str3, i32 0, i32 0), align 8
@.str.func331_str1 = private unnamed_addr constant [55 x i8] c"\0A@.str.%s = private unnamed_addr constant [%d x i8] c\22\00", align 1
@func331_str1 = constant i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.func331_str1, i32 0, i32 0), align 8
@.str.func331_str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func331_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func331_str2, i32 0, i32 0), align 8
@.str.func331_str3 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@func331_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func331_str3, i32 0, i32 0), align 8
@.str.func331_str4 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@func331_str4 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func331_str4, i32 0, i32 0), align 8
@.str.func331_str5 = private unnamed_addr constant [2 x i8] c"\0B\00", align 1
@func331_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func331_str5, i32 0, i32 0), align 8
@.str.func331_str6 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@func331_str6 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func331_str6, i32 0, i32 0), align 8
@.str.func331_str7 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@func331_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func331_str7, i32 0, i32 0), align 8
@.str.func331_str8 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@func331_str8 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func331_str8, i32 0, i32 0), align 8
@.str.func331_str9 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@func331_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func331_str9, i32 0, i32 0), align 8
@.str.func331_str10 = private unnamed_addr constant [6 x i8] c"\5C%02X\00", align 1
@func331_str10 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func331_str10, i32 0, i32 0), align 8
@.str.func331_str11 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@func331_str11 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func331_str11, i32 0, i32 0), align 8
@.str.func331_str12 = private unnamed_addr constant [16 x i8] c"\5C%02d\22, align 1\00", align 1
@func331_str12 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func331_str12, i32 0, i32 0), align 8
@.str.func331_str13 = private unnamed_addr constant [99 x i8] c"\0A@%s = constant i8* getelementptr inbounds ([%d x i8], [%d x i8]* @.str.%s, i32 0, i32 0), align 8\00", align 1
@func331_str13 = constant i8* getelementptr inbounds ([99 x i8], [99 x i8]* @.str.func331_str13, i32 0, i32 0), align 8
@.str.func332_str1 = private unnamed_addr constant [15 x i8] c"\0A@%s = global \00", align 1
@func332_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.func332_str1, i32 0, i32 0), align 8
@.str.func332_str2 = private unnamed_addr constant [16 x i8] c"zeroinitializer\00", align 1
@func332_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func332_str2, i32 0, i32 0), align 8
@.str.func333_str1 = private unnamed_addr constant [20 x i8] c"prn/funcdef t = Nil\00", align 1
@func333_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.func333_str1, i32 0, i32 0), align 8
@.str.func333_str2 = private unnamed_addr constant [9 x i8] c"\0Adeclare\00", align 1
@func333_str2 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func333_str2, i32 0, i32 0), align 8
@.str.func333_str3 = private unnamed_addr constant [9 x i8] c"\0A\0Adefine\00", align 1
@func333_str3 = constant i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.func333_str3, i32 0, i32 0), align 8
@.str.func333_str4 = private unnamed_addr constant [5 x i8] c"void\00", align 1
@func333_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func333_str4, i32 0, i32 0), align 8
@.str.func333_str5 = private unnamed_addr constant [7 x i8] c" @%s (\00", align 1
@func333_str5 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func333_str5, i32 0, i32 0), align 8
@.str.func334_str1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@func334_str1 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func334_str1, i32 0, i32 0), align 8
@.str.func334_str2 = private unnamed_addr constant [7 x i8] c" %%_%s\00", align 1
@func334_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func334_str2, i32 0, i32 0), align 8
@.str.func333_str6 = private unnamed_addr constant [6 x i8] c", ...\00", align 1
@func333_str6 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func333_str6, i32 0, i32 0), align 8
@.str.func333_str7 = private unnamed_addr constant [2 x i8] c")\00", align 1
@func333_str7 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func333_str7, i32 0, i32 0), align 8
@.str.func333_str8 = private unnamed_addr constant [3 x i8] c" {\00", align 1
@func333_str8 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func333_str8, i32 0, i32 0), align 8
@.str.func335_str1 = private unnamed_addr constant [18 x i8] c"\0A  %%%s = alloca \00", align 1
@func335_str1 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func335_str1, i32 0, i32 0), align 8
@.str.func335_str2 = private unnamed_addr constant [10 x i8] c"\0A  store \00", align 1
@func335_str2 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func335_str2, i32 0, i32 0), align 8
@.str.func335_str3 = private unnamed_addr constant [8 x i8] c"%%_%s, \00", align 1
@func335_str3 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func335_str3, i32 0, i32 0), align 8
@.str.func335_str4 = private unnamed_addr constant [3 x i8] c"* \00", align 1
@func335_str4 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func335_str4, i32 0, i32 0), align 8
@.str.func335_str5 = private unnamed_addr constant [5 x i8] c"%%%s\00", align 1
@func335_str5 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func335_str5, i32 0, i32 0), align 8
@.str.func333_str9 = private unnamed_addr constant [12 x i8] c"\0A  ret void\00", align 1
@func333_str9 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func333_str9, i32 0, i32 0), align 8
@.str.func333_str10 = private unnamed_addr constant [3 x i8] c"\0A}\00", align 1
@func333_str10 = constant i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.func333_str10, i32 0, i32 0), align 8
@.str.func336_str1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@func336_str1 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func336_str1, i32 0, i32 0), align 8
@.str.func336_str2 = private unnamed_addr constant [26 x i8] c"cannot create output file\00", align 1
@func336_str2 = constant i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.func336_str2, i32 0, i32 0), align 8
@.str.func336_str3 = private unnamed_addr constant [29 x i8] c"; clang out2.ll && ./a.out\0A\0A\00", align 1
@func336_str3 = constant i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.func336_str3, i32 0, i32 0), align 8
@.str.func336_str4 = private unnamed_addr constant [45 x i8] c"; llc out2.ll ; for create .s file from .ll\0A\00", align 1
@func336_str4 = constant i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.func336_str4, i32 0, i32 0), align 8
@.str.func336_str5 = private unnamed_addr constant [19 x i8] c"%%Enum = type i32\0A\00", align 1
@func336_str5 = constant i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.func336_str5, i32 0, i32 0), align 8
@.str.func336_str6 = private unnamed_addr constant [18 x i8] c"%%Bool = type i1\0A\00", align 1
@func336_str6 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func336_str6, i32 0, i32 0), align 8
@.str.func336_str7 = private unnamed_addr constant [18 x i8] c"%%Unit = type i1\0A\00", align 1
@func336_str7 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func336_str7, i32 0, i32 0), align 8
@.str.func336_str8 = private unnamed_addr constant [18 x i8] c"%%Str = type i8*\0A\00", align 1
@func336_str8 = constant i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.func336_str8, i32 0, i32 0), align 8
@.str.func337_str1 = private unnamed_addr constant [17 x i8] c"%%%s = type i%d\0A\00", align 1
@func337_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func337_str1, i32 0, i32 0), align 8
@.str.func336_str9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func336_str9 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func336_str9, i32 0, i32 0), align 8
@.str.func338_str1 = private unnamed_addr constant [20 x i8] c"print_assembly: %s\0A\00", align 1
@func338_str1 = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.func338_str1, i32 0, i32 0), align 8
@.str.func338_str2 = private unnamed_addr constant [17 x i8] c"\0A; assembly: %s\0A\00", align 1
@func338_str2 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func338_str2, i32 0, i32 0), align 8
@.str.func338_str3 = private unnamed_addr constant [11 x i8] c"\0A\0A;types:\0A\00", align 1
@func338_str3 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func338_str3, i32 0, i32 0), align 8
@.str.func338_str4 = private unnamed_addr constant [13 x i8] c"\0A\0A;strings:\0A\00", align 1
@func338_str4 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.func338_str4, i32 0, i32 0), align 8
@.str.func338_str5 = private unnamed_addr constant [12 x i8] c"\0A\0A;arrays:\0A\00", align 1
@func338_str5 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func338_str5, i32 0, i32 0), align 8
@.str.func338_str6 = private unnamed_addr constant [10 x i8] c"\0A\0A;vars:\0A\00", align 1
@func338_str6 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func338_str6, i32 0, i32 0), align 8
@.str.func338_str7 = private unnamed_addr constant [11 x i8] c"\0A\0A;funcs:\0A\00", align 1
@func338_str7 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func338_str7, i32 0, i32 0), align 8
@.str.func338_str8 = private unnamed_addr constant [14 x i8] c"\0A\0A;metadata:\0A\00", align 1
@func338_str8 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func338_str8, i32 0, i32 0), align 8
@.str.func344_str1 = private unnamed_addr constant [61 x i8] c"target datalayout = \22e-m:o-i64:64-f80:128-n8:16:32:64-S128\22\0A\00", align 1
@func344_str1 = constant i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.func344_str1, i32 0, i32 0), align 8
@.str.func344_str2 = private unnamed_addr constant [46 x i8] c"target triple = \22x86_64-apple-macosx10.14.0\22\0A\00", align 1
@func344_str2 = constant i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.func344_str2, i32 0, i32 0), align 8
@.str.func344_str3 = private unnamed_addr constant [71 x i8] c"target datalayout = \22e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64\22\0A\00", align 1
@func344_str3 = constant i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.func344_str3, i32 0, i32 0), align 8
@.str.func344_str4 = private unnamed_addr constant [47 x i8] c"target triple = \22thumbv7em-unknown-none-eabi\22\0A\00", align 1
@func344_str4 = constant i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.func344_str4, i32 0, i32 0), align 8
@.str.func344_str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func344_str5 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func344_str5, i32 0, i32 0), align 8
@.str.func345_str1 = private unnamed_addr constant [15 x i8] c"\0A;type_index:\0A\00", align 1
@func345_str1 = constant i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.func345_str1, i32 0, i32 0), align 8
@.str.func346_str1 = private unnamed_addr constant [13 x i8] c";* %s -> %p\0A\00", align 1
@func346_str1 = constant i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.func346_str1, i32 0, i32 0), align 8
@.str.func347_str1 = private unnamed_addr constant [16 x i8] c"\0A;value_index:\0A\00", align 1
@func347_str1 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func347_str1, i32 0, i32 0), align 8
@.str.func348_str1 = private unnamed_addr constant [14 x i8] c"\0A;#%s -> %p {\00", align 1
@func348_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func348_str1, i32 0, i32 0), align 8
@.str.func348_str2 = private unnamed_addr constant [16 x i8] c"\0A;  v.kind = %s\00", align 1
@func348_str2 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func348_str2, i32 0, i32 0), align 8
@.str.func348_str3 = private unnamed_addr constant [25 x i8] c"\0A;  v.storage.class = %s\00", align 1
@func348_str3 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.func348_str3, i32 0, i32 0), align 8
@.str.func348_str4 = private unnamed_addr constant [23 x i8] c"\0A;  v.storage.reg = %d\00", align 1
@func348_str4 = constant i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.func348_str4, i32 0, i32 0), align 8
@.str.func348_str5 = private unnamed_addr constant [5 x i8] c"\0A;}\0A\00", align 1
@func348_str5 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func348_str5, i32 0, i32 0), align 8
@.str.MINOR_LIB_ENV_VAR = private unnamed_addr constant [10 x i8] c"MINOR_LIB\00", align 1
@MINOR_LIB_ENV_VAR = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.MINOR_LIB_ENV_VAR, i32 0, i32 0), align 8
@.str.func349_str1 = private unnamed_addr constant [42 x i8] c"enviroment variable MINOR_LIB not defined\00", align 1
@func349_str1 = constant i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.func349_str1, i32 0, i32 0), align 8
@.str.func349_str2 = private unnamed_addr constant [7 x i8] c"<asm0>\00", align 1
@func349_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func349_str2, i32 0, i32 0), align 8
@.str.func350_str1 = private unnamed_addr constant [17 x i8] c"readConfig = %s\0A\00", align 1
@func350_str1 = constant i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.func350_str1, i32 0, i32 0), align 8
@.str.func350_str2 = private unnamed_addr constant [7 x i8] c"config\00", align 1
@func350_str2 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func350_str2, i32 0, i32 0), align 8
@.str.func350_str3 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@func350_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func350_str3, i32 0, i32 0), align 8
@.str.func350_str4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@func350_str4 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func350_str4, i32 0, i32 0), align 8
@.str.func350_str5 = private unnamed_addr constant [11 x i8] c"%s = %lld\0A\00", align 1
@func350_str5 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func350_str5, i32 0, i32 0), align 8
@.str.func354_str1 = private unnamed_addr constant [14 x i8] c"unknown value\00", align 1
@func354_str1 = constant i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.func354_str1, i32 0, i32 0), align 8
@.str.func354_str2 = private unnamed_addr constant [28 x i8] c"checkValue:: unknown v.kind\00", align 1
@func354_str2 = constant i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.func354_str2, i32 0, i32 0), align 8
@.str.func355_str1 = private unnamed_addr constant [11 x i8] c"m2 v%d.%d\0A\00", align 1
@func355_str1 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func355_str1, i32 0, i32 0), align 8
@.str.func355_str2 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@func355_str2 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func355_str2, i32 0, i32 0), align 8
@.str.func355_str3 = private unnamed_addr constant [11 x i8] c"lines: %d\0A\00", align 1
@func355_str3 = constant i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.func355_str3, i32 0, i32 0), align 8
@.str.func355_str4 = private unnamed_addr constant [12 x i8] c"error : %d\0A\00", align 1
@func355_str4 = constant i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.func355_str4, i32 0, i32 0), align 8
@.str.func355_str5 = private unnamed_addr constant [8 x i8] c"main.ll\00", align 1
@func355_str5 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func355_str5, i32 0, i32 0), align 8
@.str.func356_str1 = private unnamed_addr constant [7 x i8] c"-arch=\00", align 1
@func356_str1 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func356_str1, i32 0, i32 0), align 8
@.str.func356_str2 = private unnamed_addr constant [10 x i8] c"cortex-m3\00", align 1
@func356_str2 = constant i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.func356_str2, i32 0, i32 0), align 8
@.str.func356_str3 = private unnamed_addr constant [4 x i8] c"x64\00", align 1
@func356_str3 = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.func356_str3, i32 0, i32 0), align 8
@.str.func356_str4 = private unnamed_addr constant [21 x i8] c"unknown architecture\00", align 1
@func356_str4 = constant i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.func356_str4, i32 0, i32 0), align 8
@.str.func356_str5 = private unnamed_addr constant [6 x i8] c"-lib=\00", align 1
@func356_str5 = constant i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.func356_str5, i32 0, i32 0), align 8
@.str.func356_str6 = private unnamed_addr constant [7 x i8] c"-conf=\00", align 1
@func356_str6 = constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.func356_str6, i32 0, i32 0), align 8
@.str.func357_str1 = private unnamed_addr constant [8 x i8] c"usage:\0A\00", align 1
@func357_str1 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func357_str1, i32 0, i32 0), align 8
@.str.func357_str2 = private unnamed_addr constant [25 x i8] c"  -lib=/path/to/lib/dir\0A\00", align 1
@func357_str2 = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.func357_str2, i32 0, i32 0), align 8
@.str.func357_str3 = private unnamed_addr constant [24 x i8] c"  -arch=x86, cortex-m3\0A\00", align 1
@func357_str3 = constant i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.func357_str3, i32 0, i32 0), align 8
@.str.func357_str4 = private unnamed_addr constant [16 x i8] c"  m2 <target>\0A\0A\00", align 1
@func357_str4 = constant i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.func357_str4, i32 0, i32 0), align 8
@.str.func359_str1 = private unnamed_addr constant [5 x i8] c"* %s\00", align 1
@func359_str1 = constant i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.func359_str1, i32 0, i32 0), align 8
@.str.func359_str2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func359_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func359_str2, i32 0, i32 0), align 8
@.str.func359_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func359_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func359_str3, i32 0, i32 0), align 8
@.str.func361_str1 = private unnamed_addr constant [8 x i8] c"VAL: %s\00", align 1
@func361_str1 = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.func361_str1, i32 0, i32 0), align 8
@.str.func361_str2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@func361_str2 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func361_str2, i32 0, i32 0), align 8
@.str.func361_str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@func361_str3 = constant i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.func361_str3, i32 0, i32 0), align 8

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

declare %Unit* @malloc (%Nat32 %_size)
declare %Unit* @memset (%Unit* %_mem, %Nat8 %_c, %Nat32 %_n)
declare %Unit* @memcpy (%Unit* %_dst, %Unit* %_src, %Nat32 %_len)
declare %Int32 @memcmp (%Unit* %_ptr1, %Unit* %_ptr2, %Nat32 %_num)
declare void @free (%Unit* %_mem)
declare %Int32 @putchar (%Int8 %_char)
declare %Int32 @strcmp (%Str %_s1, %Str %_s2)
declare %Int32 @strncmp (%Str %_s1, %Str %_s2, %Nat32 %_n)
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
  %9 = getelementptr inbounds %Nat8, %Str %8, %Int32 0
  %10 = bitcast %Nat8* %9 to %Str
  %11 = load %Str, %Str* %s1
  %12 = call %Nat8* (%Str, %Str) @strcpy (%Str %10, %Str %11)

;stmt5:
  %13 = getelementptr inbounds %Nat8, %Str %8, %Nat32 %2
  %14 = bitcast %Nat8* %13 to %Str
  %15 = load %Str, %Str* %s2
  %16 = call %Nat8* (%Str, %Str) @strcpy (%Str %14, %Str %15)

;stmt6:
  %17 = getelementptr inbounds %Nat8, %Str %8, %Nat32 %5
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
  %12 = getelementptr inbounds %Nat8, %Str %11, %Int32 0
  %13 = bitcast %Nat8* %12 to %Str
  %14 = load %Str, %Str* %s1
  %15 = call %Nat8* (%Str, %Str) @strcpy (%Str %13, %Str %14)

;stmt7:
  %16 = getelementptr inbounds %Nat8, %Str %11, %Nat32 %2
  %17 = bitcast %Nat8* %16 to %Str
  %18 = load %Str, %Str* %s2
  %19 = call %Nat8* (%Str, %Str) @strcpy (%Str %17, %Str %18)

;stmt8:
  %20 = getelementptr inbounds %Nat8, %Str %11, %Nat32 %7
  %21 = bitcast %Nat8* %20 to %Str
  %22 = load %Str, %Str* %s3
  %23 = call %Nat8* (%Str, %Str) @strcpy (%Str %21, %Str %22)

;stmt9:
  %24 = getelementptr inbounds %Nat8, %Str %11, %Nat32 %8
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
  %15 = getelementptr inbounds %Nat8, %Str %14, %Int32 0
  %16 = bitcast %Nat8* %15 to %Str
  %17 = load %Str, %Str* %s1
  %18 = call %Nat8* (%Str, %Str) @strcpy (%Str %16, %Str %17)

;stmt9:
  %19 = getelementptr inbounds %Nat8, %Str %14, %Nat32 %2
  %20 = bitcast %Nat8* %19 to %Str
  %21 = load %Str, %Str* %s2
  %22 = call %Nat8* (%Str, %Str) @strcpy (%Str %20, %Str %21)

;stmt10:
  %23 = getelementptr inbounds %Nat8, %Str %14, %Nat32 %9
  %24 = bitcast %Nat8* %23 to %Str
  %25 = load %Str, %Str* %s3
  %26 = call %Nat8* (%Str, %Str) @strcpy (%Str %24, %Str %25)

;stmt11:
  %27 = getelementptr inbounds %Nat8, %Str %14, %Nat32 %10
  %28 = bitcast %Nat8* %27 to %Str
  %29 = load %Str, %Str* %s4
  %30 = call %Nat8* (%Str, %Str) @strcpy (%Str %28, %Str %29)

;stmt12:
  %31 = getelementptr inbounds %Nat8, %Str %14, %Nat32 %11
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
  %18 = getelementptr inbounds %Nat8, %Str %17, %Int32 0
  %19 = bitcast %Nat8* %18 to %Str
  %20 = load %Str, %Str* %s1
  %21 = call %Nat8* (%Str, %Str) @strcpy (%Str %19, %Str %20)

;stmt11:
  %22 = getelementptr inbounds %Nat8, %Str %17, %Nat32 %2
  %23 = bitcast %Nat8* %22 to %Str
  %24 = load %Str, %Str* %s2
  %25 = call %Nat8* (%Str, %Str) @strcpy (%Str %23, %Str %24)

;stmt12:
  %26 = getelementptr inbounds %Nat8, %Str %17, %Nat32 %11
  %27 = bitcast %Nat8* %26 to %Str
  %28 = load %Str, %Str* %s3
  %29 = call %Nat8* (%Str, %Str) @strcpy (%Str %27, %Str %28)

;stmt13:
  %30 = getelementptr inbounds %Nat8, %Str %17, %Nat32 %12
  %31 = bitcast %Nat8* %30 to %Str
  %32 = load %Str, %Str* %s4
  %33 = call %Nat8* (%Str, %Str) @strcpy (%Str %31, %Str %32)

;stmt14:
  %34 = getelementptr inbounds %Nat8, %Str %17, %Nat32 %13
  %35 = bitcast %Nat8* %34 to %Str
  %36 = load %Str, %Str* %s5
  %37 = call %Nat8* (%Str, %Str) @strcpy (%Str %35, %Str %36)

;stmt15:
  %38 = getelementptr inbounds %Nat8, %Str %17, %Nat32 %14
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
  %3 = load %Str, %Str* @func7_str1
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
  %3 = getelementptr inbounds %Nat8, %Str %2, %Nat32 %1
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp ne %Nat8 %4, 0
  br i1 %5, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %6 = load %Nat32, %Nat32* %c
  %7 = load %Str, %Str* %path
  %8 = getelementptr inbounds %Nat8, %Str %7, %Nat32 %6
  %9 = load %Nat8, %Nat8* %8
  %10 = load %Str, %Str* @func8_str1
  %11 = getelementptr inbounds %Nat8, %Str %10, %Int32 0
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
  %10 = getelementptr inbounds %Nat8, %Str %5, %Nat32 %2
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
  %11 = getelementptr inbounds %Nat8, %Str %10, %Nat32 %2
  %12 = bitcast %Nat8* %11 to %Unit*
  %13 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %9, %Unit* %12, %Nat32 %5)

;stmt4:
  %14 = getelementptr inbounds %Nat8, %Str %8, %Nat32 %5
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
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 1
  %3 = load %Node*, %Node** %2

;stmt1:
  %4 = bitcast %Node* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = load %Node*, %Node** %an
  %8 = getelementptr inbounds %Node, %Node* %7, i32 0, i32 1
  store %Node* %3, %Node** %8

;stmt4:
  %9 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 0
  %10 = load %Node*, %Node** %an
  store %Node* %10, %Node** %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %11 = load %Node*, %Node** %n
  %12 = getelementptr inbounds %Node, %Node* %11, i32 0, i32 1
  %13 = load %Node*, %Node** %an
  store %Node* %13, %Node** %12

;stmt6:
  %14 = load %Node*, %Node** %an
  %15 = getelementptr inbounds %Node, %Node* %14, i32 0, i32 0
  %16 = load %Node*, %Node** %n
  store %Node* %16, %Node** %15
  ret void
}

define void @node_exclude (%Node* %_node) {
  %node = alloca %Node*
  store %Node* %_node, %Node** %node

;stmt0:
  %1 = load %Node*, %Node** %node
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 0
  %3 = load %Node*, %Node** %2

;stmt1:
  %4 = load %Node*, %Node** %node
  %5 = getelementptr inbounds %Node, %Node* %4, i32 0, i32 1
  %6 = load %Node*, %Node** %5

;stmt2:
  %7 = bitcast %Node* %3 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %10 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 1
  store %Node* %6, %Node** %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %11 = bitcast %Node* %6 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %14 = getelementptr inbounds %Node, %Node* %6, i32 0, i32 0
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
  %9 = inttoptr i64 0 to %Unit*
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
  %16 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 1
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = inttoptr i64 0 to %Node*
  ret %Node* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %n = alloca %Node*

;stmt4:
  %7 = load %Node*, %Node** %node_chain
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
  %12 = load %NodeSearchHandler, %NodeSearchHandler* %f
  %13 = load %Node*, %Node** %n
  %14 = load %Unit*, %Unit** %ctx
  %15 = load %Nat32, %Nat32* %index
  %16 = call %Bool (%Node*, %Unit*, %Nat32) %12 (%Node* %13, %Unit* %14, %Nat32 %15)
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %17 = load %Node*, %Node** %n
  ret %Node* %17
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %19 = load %Node*, %Node** %n
  %20 = getelementptr inbounds %Node, %Node* %19, i32 0, i32 1
  %21 = load %Node*, %Node** %20
  store %Node* %21, %Node** %n

;stmt13:
  %22 = load %Nat32, %Nat32* %index
  %23 = add %Nat32 %22, 1
  store %Nat32 %23, %Nat32* %index
  br label %continue_0
break_0:

;stmt14:
  %24 = inttoptr i64 0 to %Node*
  ret %Node* %24
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
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 3
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Unit*, %Unit** %obj
  %6 = inttoptr i64 0 to %Unit*
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
  %11 = getelementptr inbounds %Node, %Node* %10, i32 0, i32 3
  %12 = load %Unit*, %Unit** %obj
  store %Unit* %12, %Unit** %11

;stmt5:
  %13 = load %List*, %List** %list
  %14 = getelementptr inbounds %List, %List* %13, i32 0, i32 0
  %15 = load %Node*, %Node** %14
  %16 = bitcast %Node* %15 to %Unit*
  %17 = inttoptr i64 0 to %Unit*
  %18 = icmp eq %Unit* %16, %17
  br i1 %18, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %19 = load %List*, %List** %list
  %20 = getelementptr inbounds %List, %List* %19, i32 0, i32 0
  store %Node* %10, %Node** %20
  br label %endif_1
else_1:

;stmt8:

;stmt9:
  %21 = load %List*, %List** %list
  %22 = getelementptr inbounds %List, %List* %21, i32 0, i32 1
  %23 = load %Node*, %Node** %22
  call void (%Node*, %Node*) @node_append (%Node* %23, %Node* %10)
  br label %endif_1
endif_1:

;stmt10:
  %24 = load %List*, %List** %list
  %25 = getelementptr inbounds %List, %List* %24, i32 0, i32 1
  store %Node* %10, %Node** %25

;stmt11:
  %26 = load %List*, %List** %list
  %27 = getelementptr inbounds %List, %List* %26, i32 0, i32 2
  %28 = load %List*, %List** %list
  %29 = getelementptr inbounds %List, %List* %28, i32 0, i32 2
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %List*, %List** %list2
  %6 = bitcast %List* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
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
  %12 = getelementptr inbounds %List, %List* %11, i32 0, i32 1
  %13 = load %Node*, %Node** %12

;stmt4:
  %14 = load %List*, %List** %list1
  %15 = getelementptr inbounds %List, %List* %14, i32 0, i32 2
  %16 = load %List*, %List** %list1
  %17 = getelementptr inbounds %List, %List* %16, i32 0, i32 2
  %18 = load %Nat64, %Nat64* %17
  %19 = load %List*, %List** %list2
  %20 = getelementptr inbounds %List, %List* %19, i32 0, i32 2
  %21 = load %Nat64, %Nat64* %20
  %22 = add %Nat64 %18, %21
  store %Nat64 %22, %Nat64* %15

;stmt5:
  %23 = bitcast %Node* %13 to %Unit*
  %24 = inttoptr i64 0 to %Unit*
  %25 = icmp eq %Unit* %23, %24
  br i1 %25, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %26 = load %List*, %List** %list1
  %27 = getelementptr inbounds %List, %List* %26, i32 0, i32 0
  %28 = load %List*, %List** %list2
  %29 = getelementptr inbounds %List, %List* %28, i32 0, i32 0
  %30 = load %Node*, %Node** %29
  store %Node* %30, %Node** %27

;stmt8:
  %31 = load %List*, %List** %list1
  %32 = getelementptr inbounds %List, %List* %31, i32 0, i32 1
  %33 = load %List*, %List** %list2
  %34 = getelementptr inbounds %List, %List* %33, i32 0, i32 1
  %35 = load %Node*, %Node** %34
  store %Node* %35, %Node** %32

;stmt9:
  ret %Bool 1
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %37 = getelementptr inbounds %Node, %Node* %13, i32 0, i32 1
  %38 = load %List*, %List** %list2
  %39 = getelementptr inbounds %List, %List* %38, i32 0, i32 0
  %40 = load %Node*, %Node** %39
  store %Node* %40, %Node** %37

;stmt11:
  %41 = load %List*, %List** %list2
  %42 = getelementptr inbounds %List, %List* %41, i32 0, i32 0
  %43 = load %Node*, %Node** %42
  %44 = bitcast %Node* %43 to %Unit*
  %45 = inttoptr i64 0 to %Unit*
  %46 = icmp ne %Unit* %44, %45
  %47 = load %List*, %List** %list2
  %48 = getelementptr inbounds %List, %List* %47, i32 0, i32 1
  %49 = load %Node*, %Node** %48
  %50 = bitcast %Node* %49 to %Unit*
  %51 = inttoptr i64 0 to %Unit*
  %52 = icmp ne %Unit* %50, %51
  %53 = and %Bool %46, %52
  br i1 %53, label %then_2, label %else_2
then_2:

;stmt12:

;stmt13:
  %54 = load %List*, %List** %list2
  %55 = getelementptr inbounds %List, %List* %54, i32 0, i32 0
  %56 = load %Node*, %Node** %55
  %57 = getelementptr inbounds %Node, %Node* %56, i32 0, i32 0
  store %Node* %13, %Node** %57

;stmt14:
  %58 = load %List*, %List** %list1
  %59 = getelementptr inbounds %List, %List* %58, i32 0, i32 1
  %60 = load %List*, %List** %list2
  %61 = getelementptr inbounds %List, %List* %60, i32 0, i32 1
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
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %3 = load %Node*, %Node** %2
  %4 = load %Unit*, %Unit** %o1
  %5 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %3, %Unit* %4)

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
  %10 = getelementptr inbounds %Node, %Node* %5, i32 0, i32 3
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
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 0
  %3 = load %Node*, %Node** %2

;stmt1:
  %4 = load %Node*, %Node** %n
  %5 = getelementptr inbounds %Node, %Node* %4, i32 0, i32 1
  %6 = load %Node*, %Node** %5

;stmt2:
  %7 = load %Node*, %Node** %n
  call void (%Node*) @node_exclude (%Node* %7)

;stmt3:
  %8 = load %List*, %List** %list
  %9 = getelementptr inbounds %List, %List* %8, i32 0, i32 0
  %10 = load %Node*, %Node** %9
  %11 = load %Node*, %Node** %n
  %12 = icmp eq %Node* %10, %11
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %13 = load %List*, %List** %list
  %14 = getelementptr inbounds %List, %List* %13, i32 0, i32 0
  store %Node* %6, %Node** %14
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %15 = load %List*, %List** %list
  %16 = getelementptr inbounds %List, %List* %15, i32 0, i32 1
  %17 = load %Node*, %Node** %16
  %18 = load %Node*, %Node** %n
  %19 = icmp eq %Node* %17, %18
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %20 = load %List*, %List** %list
  %21 = getelementptr inbounds %List, %List* %20, i32 0, i32 1
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
  %25 = getelementptr inbounds %List, %List* %24, i32 0, i32 2
  %26 = load %List*, %List** %list
  %27 = getelementptr inbounds %List, %List* %26, i32 0, i32 2
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
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %3 = load %Node*, %Node** %2
  %4 = load %Unit*, %Unit** %o
  %5 = call %Node* (%Node*, %Unit*) @node_search_by_data (%Node* %3, %Unit* %4)

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
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %3 = load %Node*, %Node** %2
  store %Node* %3, %Node** %n

;stmt4:
  br label %continue_0
continue_0:
  %4 = load %Node*, %Node** %n
  %5 = bitcast %Node* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt5:

;stmt6:
  %8 = load %ListForeachHandler, %ListForeachHandler* %f
  %9 = load %Node*, %Node** %n
  %10 = getelementptr inbounds %Node, %Node* %9, i32 0, i32 3
  %11 = load %Unit*, %Unit** %10
  %12 = load %Unit*, %Unit** %ctx
  %13 = load %Nat32, %Nat32* %index
  call void (%Unit*, %Unit*, %Nat32) %8 (%Unit* %11, %Unit* %12, %Nat32 %13)

;stmt7:
  %14 = load %Node*, %Node** %n
  %15 = getelementptr inbounds %Node, %Node* %14, i32 0, i32 1
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
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %3 = load %Node*, %Node** %2
  store %Node* %3, %Node** %n1

;stmt3:
  %4 = load %List*, %List** %list2
  %5 = getelementptr inbounds %List, %List* %4, i32 0, i32 0
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
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  %11 = load %Node*, %Node** %n2
  %12 = bitcast %Node* %11 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  %15 = and %Bool %10, %14
  br i1 %15, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %16 = load %ListForeachHandler2, %ListForeachHandler2* %f
  %17 = load %Node*, %Node** %n1
  %18 = getelementptr inbounds %Node, %Node* %17, i32 0, i32 3
  %19 = load %Unit*, %Unit** %18
  %20 = load %Node*, %Node** %n2
  %21 = getelementptr inbounds %Node, %Node* %20, i32 0, i32 3
  %22 = load %Unit*, %Unit** %21
  %23 = load %Unit*, %Unit** %ctx
  %24 = load %Nat32, %Nat32* %index
  call void (%Unit*, %Unit*, %Unit*, %Nat32) %16 (%Unit* %19, %Unit* %22, %Unit* %23, %Nat32 %24)

;stmt9:
  %25 = load %Node*, %Node** %n1
  %26 = getelementptr inbounds %Node, %Node* %25, i32 0, i32 1
  %27 = load %Node*, %Node** %26
  store %Node* %27, %Node** %n1

;stmt10:
  %28 = load %Node*, %Node** %n2
  %29 = getelementptr inbounds %Node, %Node* %28, i32 0, i32 1
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
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 2
  %3 = load %Nat64, %Nat64* %2
  %4 = load %List*, %List** %list2
  %5 = getelementptr inbounds %List, %List* %4, i32 0, i32 2
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
  %10 = getelementptr inbounds %List, %List* %9, i32 0, i32 0
  %11 = load %Node*, %Node** %10
  store %Node* %11, %Node** %n1

;stmt6:
  %12 = load %List*, %List** %list2
  %13 = getelementptr inbounds %List, %List* %12, i32 0, i32 0
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
  %17 = inttoptr i64 0 to %Unit*
  %18 = icmp ne %Unit* %16, %17
  %19 = load %Node*, %Node** %n2
  %20 = bitcast %Node* %19 to %Unit*
  %21 = inttoptr i64 0 to %Unit*
  %22 = icmp ne %Unit* %20, %21
  %23 = and %Bool %18, %22
  br i1 %23, label %body_0, label %break_0
body_0:

;stmt10:

;stmt11:
  %24 = load %ListCompareHandler, %ListCompareHandler* %f
  %25 = load %Node*, %Node** %n1
  %26 = getelementptr inbounds %Node, %Node* %25, i32 0, i32 3
  %27 = load %Unit*, %Unit** %26
  %28 = load %Node*, %Node** %n2
  %29 = getelementptr inbounds %Node, %Node* %28, i32 0, i32 3
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
  %37 = getelementptr inbounds %Node, %Node* %36, i32 0, i32 1
  %38 = load %Node*, %Node** %37
  store %Node* %38, %Node** %n1

;stmt15:
  %39 = load %Node*, %Node** %n2
  %40 = getelementptr inbounds %Node, %Node* %39, i32 0, i32 1
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = inttoptr i64 0 to %Unit*
  ret %Unit* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %n = alloca %Node*

;stmt4:
  %7 = load %List*, %List** %list
  %8 = getelementptr inbounds %List, %List* %7, i32 0, i32 0
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
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %14 = load %ListSearchHandler, %ListSearchHandler* %f
  %15 = load %Node*, %Node** %n
  %16 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 3
  %17 = load %Unit*, %Unit** %16
  %18 = load %Unit*, %Unit** %ctx
  %19 = load %Nat32, %Nat32* %index
  %20 = call %Unit* (%Unit*, %Unit*, %Nat32) %14 (%Unit* %17, %Unit* %18, %Nat32 %19)

;stmt10:
  %21 = inttoptr i64 0 to %Unit*
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
  %25 = getelementptr inbounds %Node, %Node* %24, i32 0, i32 1
  %26 = load %Node*, %Node** %25
  store %Node* %26, %Node** %n

;stmt14:
  %27 = load %Nat32, %Nat32* %index
  %28 = add %Nat32 %27, 1
  store %Nat32 %28, %Nat32* %index
  br label %continue_0
break_0:

;stmt15:
  %29 = inttoptr i64 0 to %Unit*
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = inttoptr i64 0 to %List*
  ret %List* %5
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
  %7 = load %List*, %List** %list
  %8 = getelementptr inbounds %List, %List* %7, i32 0, i32 0
  %9 = load %Node*, %Node** %8
  store %Node* %9, %Node** %n

;stmt7:
  %10 = call %List* () @map_new ()

;stmt8:
  br label %continue_0
continue_0:
  %11 = load %Node*, %Node** %n
  %12 = bitcast %Node* %11 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  br i1 %14, label %body_0, label %break_0
body_0:

;stmt9:

;stmt10:
  %15 = load %ListMapHandler, %ListMapHandler* %f
  %16 = load %Node*, %Node** %n
  %17 = getelementptr inbounds %Node, %Node* %16, i32 0, i32 3
  %18 = load %Unit*, %Unit** %17
  %19 = load %Unit*, %Unit** %ctx
  %20 = load %Nat32, %Nat32* %index
  %21 = call %Unit* (%Unit*, %Unit*, %Nat32) %15 (%Unit* %18, %Unit* %19, %Nat32 %20)

;stmt11:
  %22 = inttoptr i64 0 to %Unit*
  %23 = icmp ne %Unit* %21, %22
  br i1 %23, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %24 = call %Bool (%List*, %Unit*) @list_append (%List* %10, %Unit* %21)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt14:
  %25 = load %Nat32, %Nat32* %index
  %26 = add %Nat32 %25, 1
  store %Nat32 %26, %Nat32* %index

;stmt15:
  %27 = load %Node*, %Node** %n
  %28 = getelementptr inbounds %Node, %Node* %27, i32 0, i32 1
  %29 = load %Node*, %Node** %28
  store %Node* %29, %Node** %n
  br label %continue_0
break_0:

;stmt16:
  ret %List* %10
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Str, %Str* %k
  %6 = bitcast %Str %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = load %Unit*, %Unit** %v
  %10 = inttoptr i64 0 to %Unit*
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
  %16 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 2
  %17 = load %Str, %Str* %k
  %18 = bitcast %Str %17 to %Unit*
  store %Unit* %18, %Unit** %16

;stmt5:
  %19 = getelementptr inbounds %Node, %Node* %15, i32 0, i32 3
  %20 = load %Unit*, %Unit** %v
  store %Unit* %20, %Unit** %19

;stmt6:
  %21 = load %List*, %List** %m
  %22 = getelementptr inbounds %List, %List* %21, i32 0, i32 0
  %23 = load %Node*, %Node** %22
  %24 = bitcast %Node* %23 to %Unit*
  %25 = inttoptr i64 0 to %Unit*
  %26 = icmp eq %Unit* %24, %25
  br i1 %26, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %27 = load %List*, %List** %m
  %28 = getelementptr inbounds %List, %List* %27, i32 0, i32 0
  store %Node* %15, %Node** %28
  br label %endif_1
else_1:

;stmt9:

;stmt10:
  %29 = load %List*, %List** %m
  %30 = getelementptr inbounds %List, %List* %29, i32 0, i32 1
  %31 = load %Node*, %Node** %30
  call void (%Node*, %Node*) @node_append (%Node* %31, %Node* %15)
  br label %endif_1
endif_1:

;stmt11:
  %32 = load %List*, %List** %m
  %33 = getelementptr inbounds %List, %List* %32, i32 0, i32 1
  store %Node* %15, %Node** %33

;stmt12:
  %34 = load %List*, %List** %m
  %35 = getelementptr inbounds %List, %List* %34, i32 0, i32 2
  %36 = load %List*, %List** %m
  %37 = getelementptr inbounds %List, %List* %36, i32 0, i32 2
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
  %2 = getelementptr inbounds %Node, %Node* %1, i32 0, i32 2
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
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
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
  %4 = getelementptr inbounds %Node, %Node* %3, i32 0, i32 3
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
  %2 = getelementptr inbounds %List, %List* %1, i32 0, i32 0
  %3 = load %Node*, %Node** %2
  store %Node* %3, %Node** %n

;stmt2:
  br label %continue_0
continue_0:
  %4 = load %Node*, %Node** %n
  %5 = bitcast %Node* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %8 = load %MapForeachHandler, %MapForeachHandler* %f
  %9 = load %Node*, %Node** %n
  %10 = getelementptr inbounds %Node, %Node* %9, i32 0, i32 2
  %11 = load %Unit*, %Unit** %10
  %12 = load %Node*, %Node** %n
  %13 = getelementptr inbounds %Node, %Node* %12, i32 0, i32 3
  %14 = load %Unit*, %Unit** %13
  %15 = load %Unit*, %Unit** %ctx
  call void (%Unit*, %Unit*, %Unit*) %8 (%Unit* %11, %Unit* %14, %Unit* %15)

;stmt5:
  %16 = load %Node*, %Node** %n
  %17 = getelementptr inbounds %Node, %Node* %16, i32 0, i32 1
  %18 = load %Node*, %Node** %17
  store %Node* %18, %Node** %n
  br label %continue_0
break_0:
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
  %7 = inttoptr i64 0 to %Unit*
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

define %Bool @isalpha (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = load %Str, %Str* @func42_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp uge %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = load %Str, %Str* @func42_str2
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp ule %Nat8 %6, %9
  %11 = and %Bool %5, %10
  %12 = load %Nat8, %Nat8* %c
  %13 = load %Str, %Str* @func42_str3
  %14 = getelementptr inbounds %Nat8, %Str %13, %Int32 0
  %15 = load %Nat8, %Nat8* %14
  %16 = icmp uge %Nat8 %12, %15
  %17 = load %Nat8, %Nat8* %c
  %18 = load %Str, %Str* @func42_str4
  %19 = getelementptr inbounds %Nat8, %Str %18, %Int32 0
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
  %2 = load %Str, %Str* @func43_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp uge %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = load %Str, %Str* @func43_str2
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0
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
  %4 = load %Str, %Str* @func45_str1
  %5 = load %Str, %Str* %fname
  %6 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %5)

;stmt3:
  %7 = load %Str, %Str* @func45_str2
  call void (%Str) @fatal (%Str %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 0
  %9 = load %Str, %Str* %fname
  %10 = call %Int32 (%Str, %Int32) @open (%Str %9, %Int32 0)
  store %Int32 %10, %Int32* %8

;stmt5:
  %11 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5
  store %Nat32 1, %Nat32* %11

;stmt6:
  %12 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 3
  store %Nat16 1, %Nat16* %12

;stmt7:
  %13 = call %Str () @cwd ()

;stmt8:
  %14 = load %Str, %Str* @func45_str3
  %15 = load %Str, %Str* %fname
  %16 = call %Str (%Str, %Str, %Str) @cat3 (%Str %13, %Str %14, %Str %15)

;stmt9:
  %17 = bitcast %Str %13 to %Unit*
  call void (%Unit*) @free (%Unit* %17)

;stmt10:
  %18 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 7
  store %Str %16, %Str* %18
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
  %1 = call %Nat8 () @getcc ()

;stmt3:
  %2 = icmp eq %Nat8 %1, 0
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %3 = load %Str, %Str* @func47_str1
  call void (%Str) @fatal (%Str %3)

;stmt6:
  call void (%Int32) @exit (%Int32 1)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %4 = load %Rule, %Rule* %rule
  %5 = call %Bool (%Nat8) %4 (%Nat8 %1)
  br i1 %5, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %6 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 2
  %7 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %8 = load %Nat32, %Nat32* %7
  %9 = getelementptr inbounds [256 x %Nat8], [256 x %Nat8]* %6, i32 0, %Nat32 %8
  store %Nat8 %1, %Nat8* %9

;stmt10:
  %10 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 4
  %11 = load %Nat32, %Nat32* %10
  %12 = icmp uge %Nat32 %11, 255
  br i1 %12, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %13 = load %Str, %Str* @func47_str2
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
  call void (%Nat8) @lex_putback (%Nat8 %1)

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

define %Bool @blank (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = load %Str, %Str* @func48_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = load %Str, %Str* @func48_str2
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0
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
  %2 = load %Str, %Str* @func49_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  ret %Bool %5
}

define %Bool @slash (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = load %Str, %Str* @func50_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = load %Str, %Str* @func50_str2
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0
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
  %2 = load %Str, %Str* @func51_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = load %Str, %Str* @func51_str2
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0
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
  %2 = load %Str, %Str* @func52_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  %6 = load %Nat8, %Nat8* %c
  %7 = load %Str, %Str* @func52_str2
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0
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
  %2 = load %Str, %Str* @func53_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp eq %Nat8 %1, %4
  ret %Bool %5
}

define %Bool @bang (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = load %Str, %Str* @func54_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
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
  %4 = load %Str, %Str* @func55_str1
  %5 = getelementptr inbounds %Nat8, %Str %4, %Int32 0
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

define %Bool @cpp_com (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Nat8, %Nat8* %c
  %2 = load %Str, %Str* @func57_str1
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = icmp ne %Nat8 %1, %4
  ret %Bool %5
}

define %Bool @c_com (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = load %Str, %Str* @func58_str1
  %2 = load %Nat8, %Nat8* %c
  %3 = call %Int32 (%Str, ...) @printf (%Str %1, %Nat8 %2)

;stmt1:
  %4 = load %Nat8, %Nat8* %c
  %5 = load %Str, %Str* @func58_str2
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %4, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %9 = call %Nat8 () @getcc ()
  store %Nat8 %9, %Nat8* %c

;stmt4:
  %10 = load %Nat8, %Nat8* %c
  %11 = load %Str, %Str* @func58_str3
  %12 = getelementptr inbounds %Nat8, %Str %11, %Int32 0
  %13 = load %Nat8, %Nat8* %12
  %14 = icmp eq %Nat8 %10, %13
  br i1 %14, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  ret %Bool 0
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  %16 = load %Nat8, %Nat8* %c
  call void (%Nat8) @lex_putback (%Nat8 %16)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  ret %Bool 1
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
  %22 = load %Str, %Str* @func59_str1
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
  %33 = load %Str, %Str* @func59_str2
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
  %39 = load %Str, %Str* @func59_str3
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
  %44 = load %Str, %Str* @func59_str4
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
  %49 = load %Str, %Str* @func59_str5
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
  %54 = load %Str, %Str* @func59_str6
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
  %59 = load %Str, %Str* @func59_str7
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
  %64 = load %Str, %Str* @func59_str8
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
  %69 = load %Str, %Str* @func59_str9
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
  %75 = load %Str, %Str* @func59_str10
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
  %2 = load %Str, %Str* @func60_str1
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
  %7 = load %Str, %Str* @func60_str2
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
  %17 = load %Str, %Str* @func60_str3
  call void (%Str) @fatal (%Str %17)
  br label %endif_2
else_2:

;stmt17:
  %18 = load %Nat8, %Nat8* %c
  %19 = load %Str, %Str* @func60_str4
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
  %25 = load %Str, %Str* @func60_str5
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
  %36 = load %Str, %Str* @func60_str6
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
  %5 = load %Str, %Str* @func61_str1
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
  %12 = load %Str, %Str* @func61_str2
  call void (%Str) @fatal (%Str %12)
  br label %endif_1
else_1:

;stmt12:

;stmt13:
  %13 = load %Nat8, %Nat8* %c
  %14 = load %Str, %Str* @func61_str3
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
  %20 = load %Str, %Str* @func61_str4
  %21 = getelementptr inbounds %Nat8, %Str %20, %Int32 0
  %22 = load %Nat8, %Nat8* %21
  %23 = icmp eq %Nat8 %19, %22
  br i1 %23, label %then_3, label %else_3
then_3:

;stmt17:

;stmt18:
  %24 = load %Str, %Str* @func61_str5
  %25 = getelementptr inbounds %Nat8, %Str %24, %Int32 0
  %26 = load %Nat8, %Nat8* %25
  store %Nat8 %26, %Nat8* %c
  br label %endif_3
else_3:

;stmt19:
  %27 = load %Nat8, %Nat8* %c
  %28 = load %Str, %Str* @func61_str6
  %29 = getelementptr inbounds %Nat8, %Str %28, %Int32 0
  %30 = load %Nat8, %Nat8* %29
  %31 = icmp eq %Nat8 %27, %30
  br i1 %31, label %then_4, label %else_4
then_4:

;stmt20:

;stmt21:
  %32 = load %Str, %Str* @func61_str7
  %33 = getelementptr inbounds %Nat8, %Str %32, %Int32 0
  %34 = load %Nat8, %Nat8* %33
  store %Nat8 %34, %Nat8* %c
  br label %endif_4
else_4:

;stmt22:
  %35 = load %Nat8, %Nat8* %c
  %36 = load %Str, %Str* @func61_str8
  %37 = getelementptr inbounds %Nat8, %Str %36, %Int32 0
  %38 = load %Nat8, %Nat8* %37
  %39 = icmp eq %Nat8 %35, %38
  br i1 %39, label %then_5, label %else_5
then_5:

;stmt23:

;stmt24:
  %40 = load %Str, %Str* @func61_str9
  %41 = getelementptr inbounds %Nat8, %Str %40, %Int32 0
  %42 = load %Nat8, %Nat8* %41
  store %Nat8 %42, %Nat8* %c
  br label %endif_5
else_5:

;stmt25:
  %43 = load %Nat8, %Nat8* %c
  %44 = load %Str, %Str* @func61_str10
  %45 = getelementptr inbounds %Nat8, %Str %44, %Int32 0
  %46 = load %Nat8, %Nat8* %45
  %47 = icmp eq %Nat8 %43, %46
  br i1 %47, label %then_6, label %else_6
then_6:

;stmt26:

;stmt27:
  %48 = load %Str, %Str* @func61_str11
  %49 = getelementptr inbounds %Nat8, %Str %48, %Int32 0
  %50 = load %Nat8, %Nat8* %49
  store %Nat8 %50, %Nat8* %c
  br label %endif_6
else_6:

;stmt28:
  %51 = load %Nat8, %Nat8* %c
  %52 = load %Str, %Str* @func61_str12
  %53 = getelementptr inbounds %Nat8, %Str %52, %Int32 0
  %54 = load %Nat8, %Nat8* %53
  %55 = icmp eq %Nat8 %51, %54
  br i1 %55, label %then_7, label %else_7
then_7:

;stmt29:

;stmt30:
  %56 = load %Str, %Str* @func61_str13
  %57 = getelementptr inbounds %Nat8, %Str %56, %Int32 0
  %58 = load %Nat8, %Nat8* %57
  store %Nat8 %58, %Nat8* %c
  br label %endif_7
else_7:

;stmt31:
  %59 = load %Nat8, %Nat8* %c
  %60 = load %Str, %Str* @func61_str14
  %61 = getelementptr inbounds %Nat8, %Str %60, %Int32 0
  %62 = load %Nat8, %Nat8* %61
  %63 = icmp eq %Nat8 %59, %62
  br i1 %63, label %then_8, label %else_8
then_8:

;stmt32:

;stmt33:
  %64 = load %Str, %Str* @func61_str15
  %65 = getelementptr inbounds %Nat8, %Str %64, %Int32 0
  %66 = load %Nat8, %Nat8* %65
  store %Nat8 %66, %Nat8* %c
  br label %endif_8
else_8:

;stmt34:
  %67 = load %Nat8, %Nat8* %c
  %68 = load %Str, %Str* @func61_str16
  %69 = getelementptr inbounds %Nat8, %Str %68, %Int32 0
  %70 = load %Nat8, %Nat8* %69
  %71 = icmp eq %Nat8 %67, %70
  br i1 %71, label %then_9, label %else_9
then_9:

;stmt35:

;stmt36:
  %72 = load %Str, %Str* @func61_str17
  %73 = getelementptr inbounds %Nat8, %Str %72, %Int32 0
  %74 = load %Nat8, %Nat8* %73
  store %Nat8 %74, %Nat8* %c
  br label %endif_9
else_9:

;stmt37:
  %75 = load %Nat8, %Nat8* %c
  %76 = load %Str, %Str* @func61_str18
  %77 = getelementptr inbounds %Nat8, %Str %76, %Int32 0
  %78 = load %Nat8, %Nat8* %77
  %79 = icmp eq %Nat8 %75, %78
  br i1 %79, label %then_10, label %else_10
then_10:

;stmt38:

;stmt39:
  %80 = load %Str, %Str* @func61_str19
  %81 = getelementptr inbounds %Nat8, %Str %80, %Int32 0
  %82 = load %Nat8, %Nat8* %81
  store %Nat8 %82, %Nat8* %c
  br label %endif_10
else_10:

;stmt40:
  %83 = load %Nat8, %Nat8* %c
  %84 = load %Str, %Str* @func61_str20
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
  %91 = load %Str, %Str* @func61_str21
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
  %46 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 5
  %47 = load %Nat32, %Nat32* %46
  %48 = add %Nat32 %45, %47
  store %Nat32 %48, %Nat32* @lines

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

define void @lex_putback (%Nat8 %_c) {
  %c = alloca %Nat8
  store %Nat8 %_c, %Nat8* %c

;stmt0:
  %1 = getelementptr inbounds %State, %State* @lstate, i32 0, i32 8
  %2 = load %Nat8, %Nat8* %c
  store %Nat8 %2, %Nat8* %1
  ret void
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
  %1 = getelementptr inbounds %List, %List* @liblist, i32 0
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
  %5 = getelementptr inbounds %Nat8, %Str %4, %Nat32 %3
  %6 = load %Nat8, %Nat8* %5
  %7 = icmp ne %Nat8 %6, 0
  br i1 %7, label %body_0, label %break_0
body_0:

;stmt6:

;stmt7:
  %8 = load %Nat32, %Nat32* %i
  %9 = load %Str, %Str* %path
  %10 = getelementptr inbounds %Nat8, %Str %9, %Nat32 %8
  %11 = load %Nat8, %Nat8* %10
  %12 = load %Nat32, %Nat32* %i
  %13 = load %Str, %Str* @pdir
  %14 = getelementptr inbounds %Nat8, %Str %13, %Nat32 %12
  %15 = load %Nat8, %Nat8* %14
  %16 = icmp ne %Nat8 %11, %15
  br i1 %16, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  %17 = load %Nat32, %Nat32* %j
  %18 = getelementptr inbounds %Nat8, %Str %2, %Nat32 %17
  %19 = load %Nat32, %Nat32* %i
  %20 = load %Str, %Str* %path
  %21 = getelementptr inbounds %Nat8, %Str %20, %Nat32 %19
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
  %28 = getelementptr inbounds %Nat8, %Str %2, %Nat32 %27
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
  %3 = getelementptr inbounds %Nat8, %Str %2, %Int32 0
  %4 = load %Nat8, %Nat8* %3
  %5 = load %Str, %Str* @func68_str1
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %4, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %9 = call %Str () @cwd ()

;stmt5:
  %10 = load %Str, %Str* %name
  %11 = getelementptr inbounds %Nat8, %Str %10, %Int32 1
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
  %16 = getelementptr inbounds %Source, %Source* %15, i32 0, i32 0
  %17 = load %Str, %Str* %fullpath
  store %Str %17, %Str* %16

;stmt8:
  %18 = getelementptr inbounds %Source, %Source* %15, i32 0, i32 3
  %19 = load %List*, %List** %tokens
  store %List* %19, %List** %18

;stmt9:
  %20 = getelementptr inbounds %Source, %Source* %15, i32 0, i32 4
  %21 = getelementptr inbounds %Source, %Source* %15, i32 0, i32 3
  %22 = load %List*, %List** %21
  %23 = getelementptr inbounds %List, %List* %22, i32 0, i32 0
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
  %2 = load %Str, %Str* @func69_str1
  %3 = load %Str, %Str* %resource
  %4 = call %Str (%Str, %Str, %Str) @cat3 (%Str %1, %Str %2, %Str %3)

;stmt1:
  %tokens = alloca %List*

;stmt2:
  %5 = inttoptr i64 0 to %List*
  store %List* %5, %List** %tokens

;stmt3:
  %fname = alloca %Str

;stmt4:
  %6 = load %Str, %Str* @func69_str2
  %7 = call %Str (%Str, %Str) @cat (%Str %4, %Str %6)

;stmt5:
  %8 = call %Bool (%Str) @exists (%Str %7)
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %9 = call %Str (%Str) @getprefix (%Str %7)
  %10 = call %Int32 (%Str) @chdir (%Str %9)

;stmt8:
  %11 = call %Str (%Str) @get_last (%Str %7)
  %12 = call %List* (%Str) @tokenize (%Str %11)
  store %List* %12, %List** %tokens

;stmt9:
  store %Str %7, %Str* %fname
  br label %endif_0
else_0:

;stmt10:

;stmt11:
  %13 = load %Str, %Str* @func69_str3
  %14 = call %Str (%Str, %Str) @cat (%Str %4, %Str %13)

;stmt12:
  %15 = call %Bool (%Str) @exists (%Str %14)
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt13:

;stmt14:
  %16 = call %Str (%Str) @getprefix (%Str %14)
  %17 = call %Int32 (%Str) @chdir (%Str %16)

;stmt15:
  %18 = load %Str, %Str* @func69_str4
  %19 = call %List* (%Str) @tokenize (%Str %18)
  store %List* %19, %List** %tokens

;stmt16:
  store %Str %14, %Str* %fname
  br label %endif_1
else_1:

;stmt17:

;stmt18:
  %20 = bitcast %Str %14 to %Unit*
  call void (%Unit*) @free (%Unit* %20)
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt19:
  %21 = load %List*, %List** %tokens
  %22 = bitcast %List* %21 to %Unit*
  %23 = inttoptr i64 0 to %Unit*
  %24 = icmp eq %Unit* %22, %23
  br i1 %24, label %then_2, label %else_2
then_2:

;stmt20:

;stmt21:
  %25 = inttoptr i64 0 to %Source*
  ret %Source* %25
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt22:
  %27 = load %Str, %Str* %fname
  %28 = load %List*, %List** %tokens
  %29 = call %Source* (%Str, %List*) @src_new (%Str %27, %List* %28)
  ret %Source* %29
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
  %1 = load %Str, %Str* @func70_str1
  %2 = load %Str, %Str* %import_string
  %3 = call %Source* (%Str, %Str) @src_open (%Str %1, %Str %2)

;stmt1:
  %4 = bitcast %Source* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
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
  %12 = inttoptr i64 0 to %Unit*
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
  %15 = getelementptr inbounds %List, %List* @liblist, i32 0
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
  %1 = load %Str, %Str* @func72_str1
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = load %Str, %Str* @func73_str1
  %6 = load %TokenInfo*, %TokenInfo** %ti
  %7 = getelementptr inbounds %TokenInfo, %TokenInfo* %6, i32 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = load %TokenInfo*, %TokenInfo** %ti
  %10 = getelementptr inbounds %TokenInfo, %TokenInfo* %9, i32 0, i32 1
  %11 = load %Nat32, %Nat32* %10
  %12 = load %Str, %Str* %s
  %13 = call %Int32 (%Str, ...) @printf (%Str %5, %Int32 27, %Int32 34, %Int32 27, %Str %8, %Nat32 %11, %Str %12)

;stmt3:
  %14 = load %TokenInfo*, %TokenInfo** %ti
  call void (%TokenInfo*) @show (%TokenInfo* %14)

;stmt4:
  %15 = load %Str, %Str* @func73_str2
  %16 = call %Int32 (%Str, ...) @printf (%Str %15)
  br label %endif_0
else_0:

;stmt5:

;stmt6:
  %17 = load %Str, %Str* @func73_str3
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = load %Str, %Str* @func74_str1
  %6 = load %Str, %Str* %s
  %7 = call %Int32 (%Str, ...) @printf (%Str %5, %Int32 27, %Int32 35, %Int32 27, %Str %6)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %8 = load %Str, %Str* @func74_str2
  %9 = load %TokenInfo*, %TokenInfo** %ti
  %10 = getelementptr inbounds %TokenInfo, %TokenInfo* %9, i32 0, i32 0
  %11 = load %Str, %Str* %10
  %12 = load %TokenInfo*, %TokenInfo** %ti
  %13 = getelementptr inbounds %TokenInfo, %TokenInfo* %12, i32 0, i32 1
  %14 = load %Nat32, %Nat32* %13
  %15 = load %Str, %Str* %s
  %16 = call %Int32 (%Str, ...) @printf (%Str %8, %Int32 27, %Int32 35, %Int32 27, %Str %11, %Nat32 %14, %Str %15)

;stmt5:
  %17 = load %TokenInfo*, %TokenInfo** %ti
  call void (%TokenInfo*) @show (%TokenInfo* %17)

;stmt6:
  %18 = load %Str, %Str* @func74_str3
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
  %24 = load %Str, %Str* @func74_str4
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
  %1 = load %Str, %Str* @func75_str1
  %2 = load %Str, %Str* %s
  %3 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 27, %Int32 33, %Str %2, %Int32 27)

;stmt1:
  %4 = load %TokenInfo*, %TokenInfo** %ti
  %5 = bitcast %TokenInfo* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = load %TokenInfo*, %TokenInfo** %ti
  call void (%TokenInfo*) @show (%TokenInfo* %8)

;stmt4:
  %9 = load %Str, %Str* @func75_str2
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
  %2 = getelementptr inbounds %TokenInfo, %TokenInfo* %1, i32 0, i32 0
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
  %8 = getelementptr inbounds %TokenInfo, %TokenInfo* %7, i32 0, i32 1
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
  %12 = getelementptr inbounds %Nat8, %Nat8* %c, i32 0
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
  %18 = getelementptr inbounds %Nat8, %Nat8* %17, %Nat32 %16
  %19 = load %Nat8, %Nat8* %c
  store %Nat8 %19, %Nat8* %18

;stmt20:
  %20 = load %Nat32, %Nat32* %pos
  %21 = add %Nat32 %20, 1
  store %Nat32 %21, %Nat32* %pos

;stmt21:
  %22 = load %Nat8, %Nat8* %c
  %23 = load %Str, %Str* @func76_str1
  %24 = getelementptr inbounds %Nat8, %Str %23, %Int32 0
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
  %28 = getelementptr inbounds %Nat8, %Nat8* %c, i32 0
  %29 = call %Int32 (%Int32, %Nat8*, %Nat32) @read (%Int32 %4, %Nat8* %28, %Nat32 1)

;stmt26:
  %30 = load %Nat8, %Nat8* %c
  %31 = load %Str, %Str* @func76_str2
  %32 = getelementptr inbounds %Nat8, %Str %31, %Int32 0
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
  %40 = getelementptr inbounds %Nat8, %Nat8* %39, %Nat32 %38
  store %Nat8 0, %Nat8* %40

;stmt32:
ret void
  ret void
}

define void @show (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Str, %Str* @func77_str1
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
  %8 = load %TokenInfo*, %TokenInfo** %ti
  call void (%Nat8*, %TokenInfo*) @gline (%Nat8* %7, %TokenInfo* %8)

;stmt4:
  %9 = load %Str, %Str* @func77_str2
  %10 = getelementptr inbounds [512 x %Nat8], [512 x %Nat8]* %line, i32 0, %Int32 0
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
  %14 = getelementptr inbounds %TokenInfo, %TokenInfo* %13, i32 0, i32 2
  %15 = load %Nat16, %Nat16* %14
  %16 = icmp ult %Nat16 %12, %15
  br i1 %16, label %body_0, label %break_0
body_0:

;stmt8:

;stmt9:
  %17 = load %Str, %Str* @func77_str3
  %18 = call %Int32 (%Str, ...) @printf (%Str %17)

;stmt10:
  %19 = load %Nat16, %Nat16* %vpos
  %20 = add %Nat16 %19, 1
  store %Nat16 %20, %Nat16* %vpos
  br label %continue_0
break_0:

;stmt11:
  %21 = load %Str, %Str* @func77_str4
  %22 = call %Int32 (%Str, ...) @printf (%Str %21, %Int32 27, %Int32 32, %Int32 27)
  ret void
}

define void @fatal (%Str %_s) {
  %s = alloca %Str
  store %Str %_s, %Str* %s

;stmt0:
  %1 = load %Str, %Str* @func78_str1
  %2 = load %Str, %Str* %s
  %3 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 27, %Int32 31, %Int32 27, %Str %2)

;stmt1:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define void @prttype (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 1
  %3 = load %Str, %Str* %2
  %4 = bitcast %Str %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = load %Str, %Str* @func79_str1
  %8 = load %Type*, %Type** %t
  %9 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 1
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
  %14 = getelementptr inbounds %Type, %Type* %13, i32 0, i32 0
  %15 = load %TypeKind, %TypeKind* %14

;stmt5:
  %16 = icmp eq %TypeKind %15, 2
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %17 = load %Str, %Str* @func79_str2
  %18 = load %Type*, %Type** %t
  %19 = getelementptr inbounds %Type, %Type* %18, i32 0, i32 4
  %20 = getelementptr inbounds %TypeBasic, %TypeBasic* %19, i32 0, i32 0
  %21 = load %Str, %Str* %20
  %22 = call %Int32 (%Str, ...) @printf (%Str %17, %Str %21)
  br label %endif_1
else_1:

;stmt8:
  %23 = icmp eq %TypeKind %15, 6
  br i1 %23, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %24 = load %Str, %Str* @func79_str3
  %25 = call %Int32 (%Str, ...) @printf (%Str %24)

;stmt11:
  %26 = load %Type*, %Type** %t
  %27 = getelementptr inbounds %Type, %Type* %26, i32 0, i32 6
  %28 = getelementptr inbounds %TypePointer, %TypePointer* %27, i32 0, i32 0
  %29 = load %Type*, %Type** %28
  call void (%Type*) @prttype (%Type* %29)
  br label %endif_2
else_2:

;stmt12:
  %30 = icmp eq %TypeKind %15, 7
  br i1 %30, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %31 = load %Type*, %Type** %t
  call void (%Type*) @print_type_array (%Type* %31)
  br label %endif_3
else_3:

;stmt15:
  %32 = icmp eq %TypeKind %15, 5
  br i1 %32, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %33 = load %Type*, %Type** %t
  call void (%Type*) @print_type_record (%Type* %33)
  br label %endif_4
else_4:

;stmt18:
  %34 = icmp eq %TypeKind %15, 4
  br i1 %34, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %35 = load %Type*, %Type** %t
  call void (%Type*) @print_type_enum (%Type* %35)
  br label %endif_5
else_5:

;stmt21:
  %36 = icmp eq %TypeKind %15, 3
  br i1 %36, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %37 = load %Type*, %Type** %t
  %38 = getelementptr inbounds %Type, %Type* %37, i32 0, i32 5
  call void (%TypeFunc*) @print_type_func (%TypeFunc* %38)
  br label %endif_6
else_6:

;stmt24:
  %39 = icmp eq %TypeKind %15, 0
  br i1 %39, label %then_7, label %else_7
then_7:

;stmt25:

;stmt26:
  %40 = load %Str, %Str* @func79_str4
  %41 = call %Int32 (%Str, ...) @printf (%Str %40)
  br label %endif_7
else_7:

;stmt27:
  %42 = icmp eq %TypeKind %15, 1
  br i1 %42, label %then_8, label %else_8
then_8:

;stmt28:

;stmt29:
  %43 = load %Str, %Str* @func79_str5
  %44 = call %Int32 (%Str, ...) @printf (%Str %43)
  br label %endif_8
else_8:

;stmt30:

;stmt31:
  %45 = load %Str, %Str* @func79_str6
  %46 = call %Int32 (%Str, ...) @printf (%Str %45, %TypeKind %15)

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
  %1 = load %Str, %Str* @func81_str1
  %2 = load %Unit*, %Unit** %data
  %3 = bitcast %Unit* %2 to %Field*
  %4 = getelementptr inbounds %Field, %Field* %3, i32 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %5)

;stmt1:
  %7 = load %Unit*, %Unit** %data
  %8 = bitcast %Unit* %7 to %Field*
  %9 = getelementptr inbounds %Field, %Field* %8, i32 0, i32 1
  %10 = load %Type*, %Type** %9
  call void (%Type*) @prttype (%Type* %10)

;stmt2:
  %11 = load %Str, %Str* @func81_str2
  %12 = call %Int32 (%Str, ...) @printf (%Str %11)
  ret void
}

define void @print_type_record (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Str, %Str* @func80_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %3 = load %Type*, %Type** %t
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 8
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %4, i32 0, i32 0
  %6 = load %List*, %List** %5
  %7 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %6, %ListForeachHandler @print_field, %Unit* %7)

;stmt2:
  %8 = load %Str, %Str* @func80_str2
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)

;stmt3:
  %10 = load %Str, %Str* @func80_str3
  %11 = load %Type*, %Type** %t
  %12 = getelementptr inbounds %Type, %Type* %11, i32 0, i32 8
  %13 = getelementptr inbounds %TypeRecord, %TypeRecord* %12, i32 0, i32 1
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
  %1 = load %Str, %Str* @func83_str1
  %2 = load %Unit*, %Unit** %data
  %3 = bitcast %Unit* %2 to %Value*
  %4 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 2
  %5 = getelementptr inbounds %Storage, %Storage* %4, i32 0, i32 3
  %6 = load %Str, %Str* %5
  %7 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %6)
  ret void
}

define void @print_type_enum (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Str, %Str* @func82_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %3 = load %Type*, %Type** %t
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 9
  %5 = getelementptr inbounds %TypeEnum, %TypeEnum* %4, i32 0, i32 0
  %6 = load %List*, %List** %5
  %7 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %6, %ListForeachHandler @print_cons, %Unit* %7)

;stmt2:
  %8 = load %Str, %Str* @func82_str2
  %9 = call %Int32 (%Str, ...) @printf (%Str %8)
  ret void
}

define void @print_type_array (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 7
  %3 = getelementptr inbounds %TypeArray, %TypeArray* %2, i32 0, i32 2
  %4 = load %Bool, %Bool* %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = load %Str, %Str* @func84_str1
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %7 = load %Str, %Str* @func84_str2
  %8 = load %Type*, %Type** %t
  %9 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 7
  %10 = getelementptr inbounds %TypeArray, %TypeArray* %9, i32 0, i32 1
  %11 = load %Nat32, %Nat32* %10
  %12 = call %Int32 (%Str, ...) @printf (%Str %7, %Nat32 %11)
  br label %endif_0
endif_0:

;stmt5:
  %13 = load %Type*, %Type** %t
  %14 = getelementptr inbounds %Type, %Type* %13, i32 0, i32 7
  %15 = getelementptr inbounds %TypeArray, %TypeArray* %14, i32 0, i32 0
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
  %4 = load %Str, %Str* @func86_str1
  %5 = call %Int32 (%Str, ...) @printf (%Str %4)
  br label %endif_0
else_0:

;stmt4:

;stmt5:
  store %Bool 1, %Bool* @needs
  br label %endif_0
endif_0:

;stmt6:
  %6 = load %Str, %Str* @func86_str2
  %7 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %8 = load %Str, %Str* %7
  %9 = call %Int32 (%Str, ...) @printf (%Str %6, %Str %8)

;stmt7:
  %10 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*) @prttype (%Type* %11)
  ret void
}

define void @print_type_func (%TypeFunc* %_t) {
  %t = alloca %TypeFunc*
  store %TypeFunc* %_t, %TypeFunc** %t

;stmt0:
  %1 = load %Str, %Str* @func85_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  store %Bool 0, %Bool* @needs

;stmt2:
  %3 = load %TypeFunc*, %TypeFunc** %t
  %4 = getelementptr inbounds %TypeFunc, %TypeFunc* %3, i32 0, i32 0
  %5 = load %List*, %List** %4
  %6 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %5, %ListForeachHandler @print_params, %Unit* %6)

;stmt3:
  %7 = load %Str, %Str* @func85_str2
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)

;stmt4:
  %9 = load %TypeFunc*, %TypeFunc** %t
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %9, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*) @prttype (%Type* %11)
  ret void
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
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 2)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2
  %3 = load %Nat32, %Nat32* %size
  store %Nat32 %3, %Nat32* %2

;stmt2:
  %4 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 1
  %5 = load %Str, %Str* %id
  store %Str %5, %Str* %4

;stmt3:
  %6 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 4
  %7 = getelementptr inbounds %TypeBasic, %TypeBasic* %6, i32 0, i32 0
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt4:
  %9 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 4
  %10 = getelementptr inbounds %TypeBasic, %TypeBasic* %9, i32 0, i32 1
  %11 = load %Nat32, %Nat32* %p
  store %Nat32 %11, %Nat32* %10

;stmt5:
  %12 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 4
  %13 = getelementptr inbounds %TypeBasic, %TypeBasic* %12, i32 0, i32 2
  %14 = load %Bool, %Bool* %i
  store %Bool %14, %Bool* %13

;stmt6:
  %15 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 4
  %16 = getelementptr inbounds %TypeBasic, %TypeBasic* %15, i32 0, i32 3
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
  %2 = getelementptr inbounds %TypeBasic, %TypeBasic* %1, i32 0, i32 0
  %3 = load %Str, %Str* %2
  %4 = load %TypeBasic*, %TypeBasic** %b
  %5 = getelementptr inbounds %TypeBasic, %TypeBasic* %4, i32 0, i32 0
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func89_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %10 = load %Type*, %Type** %t
  store %Type* %10, %Type** %9

;stmt4:
  %11 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 2
  store %Nat16 0, %Nat16* %11

;stmt5:
  %12 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 3
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
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %4 = load %Type*, %Type** %3

;stmt2:
  %5 = load %Unit*, %Unit** %ctx
  %6 = bitcast %Unit* %5 to %FieldHandleContext*

;stmt3:
  %7 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 2
  %8 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 0
  %9 = load %Nat16, %Nat16* %8
  store %Nat16 %9, %Nat16* %7

;stmt4:
  %10 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 0
  %11 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 0
  %12 = load %Nat16, %Nat16* %11
  %13 = add %Nat16 %12, 1
  store %Nat16 %13, %Nat16* %10

;stmt5:
  %14 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 2
  %15 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 2
  %16 = load %Nat32, %Nat32* %15
  %17 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 2
  %18 = load %Nat32, %Nat32* %17
  %19 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %6, i32 0, i32 1
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
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 5)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %2, i32 0, i32 1
  %4 = call %Nat32 () @get_uid ()
  store %Nat32 %4, %Nat32* %3

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8
  %6 = getelementptr inbounds %TypeRecord, %TypeRecord* %5, i32 0, i32 0
  %7 = load %List*, %List** %fields
  store %List* %7, %List** %6

;stmt3:
  %fhc = alloca %FieldHandleContext

;stmt4:
  %8 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 2
  store %Nat32 0, %Nat32* %8

;stmt5:
  %9 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 0
  store %Nat16 0, %Nat16* %9

;stmt6:
  %10 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 1
  %11 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 3
  %12 = load %Nat8, %Nat8* %11
  store %Nat8 %12, %Nat8* %10

;stmt7:
  %13 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8
  %14 = getelementptr inbounds %TypeRecord, %TypeRecord* %13, i32 0, i32 0
  %15 = load %List*, %List** %14
  %16 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0
  %17 = bitcast %FieldHandleContext* %16 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %15, %ListForeachHandler @fpost, %Unit* %17)

;stmt8:
  %18 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2
  %19 = getelementptr inbounds %FieldHandleContext, %FieldHandleContext* %fhc, i32 0, i32 2
  %20 = load %Nat32, %Nat32* %19
  store %Nat32 %20, %Nat32* %18

;stmt9:
  ret %Type* %1
}

define %Unit* @fsearch (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
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
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
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
  %11 = inttoptr i64 0 to %Unit*
  ret %Unit* %11
}

define %Field* @type_record_get_field (%Type* %_t, %Str %_field_id) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %field_id = alloca %Str
  store %Str %_field_id, %Str* %field_id

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 8
  %3 = getelementptr inbounds %TypeRecord, %TypeRecord* %2, i32 0, i32 0
  %4 = load %List*, %List** %3
  %5 = load %Str, %Str* %field_id
  %6 = bitcast %Str %5 to %Unit*
  %7 = call %Unit* (%List*, %ListSearchHandler, %Unit*) @list_search (%List* %4, %ListSearchHandler @fsearch, %Unit* %6)
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
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0
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
  %12 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %13 = load %Type*, %Type** %12
  %14 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
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
  %2 = getelementptr inbounds %TypeRecord, %TypeRecord* %1, i32 0, i32 0
  %3 = load %List*, %List** %2
  %4 = load %TypeRecord*, %TypeRecord** %b
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %4, i32 0, i32 0
  %6 = load %List*, %List** %5
  %7 = inttoptr i64 0 to %Unit*
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
  %5 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %2, i32 0, i32 1
  %6 = load %Int64, %Int64* %5
  %7 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %2, i32 0, i32 2
  %8 = load %TokenInfo*, %TokenInfo** %7
  %9 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %4, %Int64 %6, %TokenInfo* %8)

;stmt3:
  %10 = getelementptr inbounds %EnumConstructor, %EnumConstructor* %2, i32 0, i32 0
  %11 = load %Str, %Str* %10
  call void (%Str, %Value*) @bind_value (%Str %11, %Value* %9)
  ret void
}

define %Type* @type_enum_new (%List* %_constructors) {
  %constructors = alloca %List*
  store %List* %_constructors, %List** %constructors

;stmt0:
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 4)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 9
  %3 = getelementptr inbounds %TypeEnum, %TypeEnum* %2, i32 0, i32 1
  %4 = call %Nat32 () @get_uid ()
  store %Nat32 %4, %Nat32* %3

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2
  %6 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 3
  %7 = load %Nat32, %Nat32* %6
  store %Nat32 %7, %Nat32* %5

;stmt3:
  %8 = load %List*, %List** %constructors
  %9 = bitcast %Type* %1 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %8, %ListForeachHandler @create_constructor, %Unit* %9)

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
  %2 = getelementptr inbounds %TypeEnum, %TypeEnum* %1, i32 0, i32 1
  %3 = load %Nat32, %Nat32* %2
  %4 = load %TypeEnum*, %TypeEnum** %b
  %5 = getelementptr inbounds %TypeEnum, %TypeEnum* %4, i32 0, i32 1
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
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 7)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 7
  %3 = getelementptr inbounds %TypeArray, %TypeArray* %2, i32 0, i32 0
  %4 = load %Type*, %Type** %of
  store %Type* %4, %Type** %3

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 7
  %6 = getelementptr inbounds %TypeArray, %TypeArray* %5, i32 0, i32 1
  %7 = load %Nat32, %Nat32* %volume
  store %Nat32 %7, %Nat32* %6

;stmt3:
  %8 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 7
  %9 = getelementptr inbounds %TypeArray, %TypeArray* %8, i32 0, i32 2
  %10 = load %Bool, %Bool* %undefined
  store %Bool %10, %Bool* %9

;stmt4:
  %11 = load %Bool, %Bool* %undefined
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %12 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2
  %13 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  %14 = load %Nat32, %Nat32* %13
  store %Nat32 %14, %Nat32* %12
  br label %endif_0
else_0:

;stmt7:

;stmt8:
  %15 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2
  %16 = load %Nat32, %Nat32* %volume
  %17 = load %Type*, %Type** %of
  %18 = getelementptr inbounds %Type, %Type* %17, i32 0, i32 2
  %19 = load %Nat32, %Nat32* %18
  %20 = mul %Nat32 %16, %19
  store %Nat32 %20, %Nat32* %15
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
  %2 = getelementptr inbounds %TypeArray, %TypeArray* %1, i32 0, i32 0
  %3 = load %Type*, %Type** %2
  %4 = load %TypeArray*, %TypeArray** %b
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %4, i32 0, i32 0
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
  %11 = getelementptr inbounds %TypeArray, %TypeArray* %10, i32 0, i32 2
  %12 = load %Bool, %Bool* %11
  %13 = load %TypeArray*, %TypeArray** %b
  %14 = getelementptr inbounds %TypeArray, %TypeArray* %13, i32 0, i32 2
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
  %19 = getelementptr inbounds %TypeArray, %TypeArray* %18, i32 0, i32 2
  %20 = load %Bool, %Bool* %19
  %21 = load %TypeArray*, %TypeArray** %b
  %22 = getelementptr inbounds %TypeArray, %TypeArray* %21, i32 0, i32 2
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
  %27 = getelementptr inbounds %TypeArray, %TypeArray* %26, i32 0, i32 1
  %28 = load %Nat32, %Nat32* %27
  %29 = load %TypeArray*, %TypeArray** %b
  %30 = getelementptr inbounds %TypeArray, %TypeArray* %29, i32 0, i32 1
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
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 6)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 6
  %3 = getelementptr inbounds %TypePointer, %TypePointer* %2, i32 0, i32 0
  %4 = load %Type*, %Type** %to
  store %Type* %4, %Type** %3

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2
  %6 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  %7 = load %Nat32, %Nat32* %6
  store %Nat32 %7, %Nat32* %5

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
  %2 = getelementptr inbounds %TypePointer, %TypePointer* %1, i32 0, i32 0
  %3 = load %Type*, %Type** %2
  %4 = load %TypePointer*, %TypePointer** %b
  %5 = getelementptr inbounds %TypePointer, %TypePointer* %4, i32 0, i32 0
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
  %1 = call %Type* (%TypeKind) @type_new (%TypeKind 3)

;stmt1:
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 2
  %3 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 5
  %4 = load %Nat32, %Nat32* %3
  store %Nat32 %4, %Nat32* %2

;stmt2:
  %5 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5
  %6 = getelementptr inbounds %TypeFunc, %TypeFunc* %5, i32 0, i32 0
  %7 = load %List*, %List** %params
  store %List* %7, %List** %6

;stmt3:
  %8 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5
  %9 = getelementptr inbounds %TypeFunc, %TypeFunc* %8, i32 0, i32 1
  %10 = load %Type*, %Type** %rettype
  store %Type* %10, %Type** %9

;stmt4:
  %11 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 5
  %12 = getelementptr inbounds %TypeFunc, %TypeFunc* %11, i32 0, i32 2
  %13 = load %Bool, %Bool* %arghack
  store %Bool %13, %Bool* %12

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
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = bitcast %Str %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  %10 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0
  %11 = load %Str, %Str* %10
  %12 = bitcast %Str %11 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  %15 = and %Bool %9, %14
  br i1 %15, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %16 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %17 = load %Str, %Str* %16
  %18 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 0
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
  %23 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = getelementptr inbounds %Field, %Field* %4, i32 0, i32 1
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
  %2 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i32 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = load %TypeFunc*, %TypeFunc** %b
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %4, i32 0, i32 1
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
  %11 = getelementptr inbounds %TypeFunc, %TypeFunc* %10, i32 0, i32 0
  %12 = load %List*, %List** %11
  %13 = load %TypeFunc*, %TypeFunc** %b
  %14 = getelementptr inbounds %TypeFunc, %TypeFunc* %13, i32 0, i32 0
  %15 = load %List*, %List** %14
  %16 = inttoptr i64 0 to %Unit*
  %17 = call %Bool (%List*, %List*, %ListCompareHandler, %Unit*) @list_compare (%List* %12, %List* %15, %ListCompareHandler @check_param, %Unit* %16)
  ret %Bool %17
}

define %Bool @type_eq (%Type* %_a, %Type* %_b) {
  %a = alloca %Type*
  store %Type* %_a, %Type** %a
  %b = alloca %Type*
  store %Type* %_b, %Type** %b

;stmt0:
  %1 = load %Type*, %Type** %a
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = load %Type*, %Type** %b
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
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
  %10 = getelementptr inbounds %Type, %Type* %9, i32 0, i32 1
  %11 = load %Str, %Str* %10
  %12 = bitcast %Str %11 to %Unit*
  %13 = inttoptr i64 0 to %Unit*
  %14 = icmp ne %Unit* %12, %13
  %15 = load %Type*, %Type** %b
  %16 = getelementptr inbounds %Type, %Type* %15, i32 0, i32 1
  %17 = load %Str, %Str* %16
  %18 = bitcast %Str %17 to %Unit*
  %19 = inttoptr i64 0 to %Unit*
  %20 = icmp ne %Unit* %18, %19
  %21 = and %Bool %14, %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %22 = load %Type*, %Type** %a
  %23 = getelementptr inbounds %Type, %Type* %22, i32 0, i32 1
  %24 = load %Str, %Str* %23
  %25 = load %Type*, %Type** %b
  %26 = getelementptr inbounds %Type, %Type* %25, i32 0, i32 1
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
  %32 = getelementptr inbounds %Type, %Type* %31, i32 0, i32 0
  %33 = load %TypeKind, %TypeKind* %32

;stmt9:
  %34 = icmp eq %TypeKind %33, 2
  br i1 %34, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %35 = load %Type*, %Type** %a
  %36 = getelementptr inbounds %Type, %Type* %35, i32 0, i32 4
  %37 = load %Type*, %Type** %b
  %38 = getelementptr inbounds %Type, %Type* %37, i32 0, i32 4
  %39 = call %Bool (%TypeBasic*, %TypeBasic*) @type_basic_eq (%TypeBasic* %36, %TypeBasic* %38)
  ret %Bool %39
  br label %endif_3
else_3:

;stmt12:
  %41 = icmp eq %TypeKind %33, 6
  br i1 %41, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %42 = load %Type*, %Type** %a
  %43 = getelementptr inbounds %Type, %Type* %42, i32 0, i32 6
  %44 = load %Type*, %Type** %b
  %45 = getelementptr inbounds %Type, %Type* %44, i32 0, i32 6
  %46 = call %Bool (%TypePointer*, %TypePointer*) @type_pointer_eq (%TypePointer* %43, %TypePointer* %45)
  ret %Bool %46
  br label %endif_4
else_4:

;stmt15:
  %48 = icmp eq %TypeKind %33, 7
  br i1 %48, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %49 = load %Type*, %Type** %a
  %50 = getelementptr inbounds %Type, %Type* %49, i32 0, i32 7
  %51 = load %Type*, %Type** %b
  %52 = getelementptr inbounds %Type, %Type* %51, i32 0, i32 7
  %53 = call %Bool (%TypeArray*, %TypeArray*) @type_array_eq (%TypeArray* %50, %TypeArray* %52)
  ret %Bool %53
  br label %endif_5
else_5:

;stmt18:
  %55 = icmp eq %TypeKind %33, 3
  br i1 %55, label %then_6, label %else_6
then_6:

;stmt19:

;stmt20:
  %56 = load %Type*, %Type** %a
  %57 = getelementptr inbounds %Type, %Type* %56, i32 0, i32 5
  %58 = load %Type*, %Type** %b
  %59 = getelementptr inbounds %Type, %Type* %58, i32 0, i32 5
  %60 = call %Bool (%TypeFunc*, %TypeFunc*) @type_function_eq (%TypeFunc* %57, %TypeFunc* %59)
  ret %Bool %60
  br label %endif_6
else_6:

;stmt21:
  %62 = icmp eq %TypeKind %33, 5
  br i1 %62, label %then_7, label %else_7
then_7:

;stmt22:

;stmt23:
  %63 = load %Type*, %Type** %a
  %64 = getelementptr inbounds %Type, %Type* %63, i32 0, i32 8
  %65 = load %Type*, %Type** %b
  %66 = getelementptr inbounds %Type, %Type* %65, i32 0, i32 8
  %67 = call %Bool (%TypeRecord*, %TypeRecord*) @type_record_eq (%TypeRecord* %64, %TypeRecord* %66)
  ret %Bool %67
  br label %endif_7
else_7:

;stmt24:
  %69 = icmp eq %TypeKind %33, 4
  br i1 %69, label %then_8, label %else_8
then_8:

;stmt25:

;stmt26:
  %70 = load %Type*, %Type** %a
  %71 = getelementptr inbounds %Type, %Type* %70, i32 0, i32 9
  %72 = load %Type*, %Type** %b
  %73 = getelementptr inbounds %Type, %Type* %72, i32 0, i32 9
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
  %78 = getelementptr inbounds %Type, %Type* %77, i32 0, i32 0
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
  %82 = load %Str, %Str* @func106_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %82)

;stmt31:
  ret %Bool 0
}

define void @type_init () {

;stmt0:
  %1 = load %Str, %Str* @func107_str1
  %2 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %1, %Nat32 1, %Nat32 0, %Bool 0, %Bool 0)
  store %Type* %2, %Type** @typeUnit

;stmt1:
  %3 = load %Str, %Str* @func107_str2
  %4 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %3, %Nat32 1, %Nat32 1, %Bool 0, %Bool 0)
  store %Type* %4, %Type** @typeBool

;stmt2:
  %5 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %6 = load %Str, %Str* @func107_str3
  %7 = load %Type*, %Type** @typeUnit
  %8 = bitcast %Type* %7 to %Unit*
  %9 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %5, %Str %6, %Unit* %8)

;stmt3:
  %10 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %11 = load %Str, %Str* @func107_str4
  %12 = load %Type*, %Type** @typeBool
  %13 = bitcast %Type* %12 to %Unit*
  %14 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %10, %Str %11, %Unit* %13)

;stmt4:
  %15 = load %Str, %Str* @func107_str5
  %16 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %15, %Nat32 1, %Nat32 8, %Bool 1, %Bool 1)

;stmt5:
  %17 = load %Str, %Str* @func107_str6
  %18 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %17, %Nat32 2, %Nat32 16, %Bool 1, %Bool 1)

;stmt6:
  %19 = load %Str, %Str* @func107_str7
  %20 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %19, %Nat32 4, %Nat32 32, %Bool 1, %Bool 1)

;stmt7:
  %21 = load %Str, %Str* @func107_str8
  %22 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %21, %Nat32 8, %Nat32 64, %Bool 1, %Bool 1)

;stmt8:
  %23 = load %Str, %Str* @func107_str9
  %24 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %23, %Nat32 16, %Nat32 128, %Bool 1, %Bool 1)

;stmt9:
  %25 = load %Str, %Str* @func107_str10
  %26 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %25, %Nat32 32, %Nat32 256, %Bool 1, %Bool 1)

;stmt10:
  %27 = load %Str, %Str* @func107_str11
  %28 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %27, %Nat32 64, %Nat32 512, %Bool 1, %Bool 1)

;stmt11:
  %29 = load %Str, %Str* @func107_str12
  %30 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %29, %Nat32 128, %Nat32 1024, %Bool 1, %Bool 1)

;stmt12:
  %31 = load %Str, %Str* @func107_str13
  %32 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %31, %Nat32 1, %Nat32 8, %Bool 1, %Bool 0)

;stmt13:
  %33 = load %Str, %Str* @func107_str14
  %34 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %33, %Nat32 2, %Nat32 16, %Bool 1, %Bool 0)

;stmt14:
  %35 = load %Str, %Str* @func107_str15
  %36 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %35, %Nat32 4, %Nat32 32, %Bool 1, %Bool 0)

;stmt15:
  %37 = load %Str, %Str* @func107_str16
  %38 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %37, %Nat32 8, %Nat32 64, %Bool 1, %Bool 0)

;stmt16:
  %39 = load %Str, %Str* @func107_str17
  %40 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %39, %Nat32 16, %Nat32 128, %Bool 1, %Bool 0)

;stmt17:
  %41 = load %Str, %Str* @func107_str18
  %42 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %41, %Nat32 32, %Nat32 256, %Bool 1, %Bool 0)

;stmt18:
  %43 = load %Str, %Str* @func107_str19
  %44 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %43, %Nat32 64, %Nat32 512, %Bool 1, %Bool 0)

;stmt19:
  %45 = load %Str, %Str* @func107_str20
  %46 = call %Type* (%Str, %Nat32, %Nat32, %Bool, %Bool) @type_basic_new (%Str %45, %Nat32 128, %Nat32 1024, %Bool 1, %Bool 0)

;stmt20:
  %47 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %48 = load %Str, %Str* @func107_str21
  %49 = bitcast %Type* %22 to %Unit*
  %50 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %47, %Str %48, %Unit* %49)

;stmt21:
  %51 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %52 = load %Str, %Str* @func107_str22
  %53 = bitcast %Type* %38 to %Unit*
  %54 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %51, %Str %52, %Unit* %53)

;stmt22:
  %55 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %56 = load %Str, %Str* @func107_str23
  %57 = bitcast %Type* %20 to %Unit*
  %58 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %55, %Str %56, %Unit* %57)

;stmt23:
  %59 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %60 = load %Str, %Str* @func107_str24
  %61 = bitcast %Type* %36 to %Unit*
  %62 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %59, %Str %60, %Unit* %61)

;stmt24:
  %63 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %64 = load %Str, %Str* @func107_str25
  %65 = bitcast %Type* %16 to %Unit*
  %66 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %63, %Str %64, %Unit* %65)

;stmt25:
  %67 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %68 = load %Str, %Str* @func107_str26
  %69 = bitcast %Type* %32 to %Unit*
  %70 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %67, %Str %68, %Unit* %69)

;stmt26:
  %71 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %72 = load %Str, %Str* @func107_str27
  %73 = bitcast %Type* %18 to %Unit*
  %74 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %71, %Str %72, %Unit* %73)

;stmt27:
  %75 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %76 = load %Str, %Str* @func107_str28
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
  %83 = load %Str, %Str* @func107_str29
  store %Str %83, %Str* %82

;stmt31:
  %84 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %85 = load %Str, %Str* @func107_str30
  %86 = load %Type*, %Type** @typeStr
  %87 = bitcast %Type* %86 to %Unit*
  %88 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %84, %Str %85, %Unit* %87)

;stmt32:
  %89 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %90 = load %Str, %Str* @func107_str31
  %91 = bitcast %Type* %24 to %Unit*
  %92 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %89, %Str %90, %Unit* %91)

;stmt33:
  %93 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %94 = load %Str, %Str* @func107_str32
  %95 = bitcast %Type* %26 to %Unit*
  %96 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %93, %Str %94, %Unit* %95)

;stmt34:
  %97 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %98 = load %Str, %Str* @func107_str33
  %99 = bitcast %Type* %28 to %Unit*
  %100 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %97, %Str %98, %Unit* %99)

;stmt35:
  %101 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %102 = load %Str, %Str* @func107_str34
  %103 = bitcast %Type* %30 to %Unit*
  %104 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %101, %Str %102, %Unit* %103)

;stmt36:
  %105 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %106 = load %Str, %Str* @func107_str35
  %107 = bitcast %Type* %40 to %Unit*
  %108 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %105, %Str %106, %Unit* %107)

;stmt37:
  %109 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %110 = load %Str, %Str* @func107_str36
  %111 = bitcast %Type* %42 to %Unit*
  %112 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %109, %Str %110, %Unit* %111)

;stmt38:
  %113 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %114 = load %Str, %Str* @func107_str37
  %115 = bitcast %Type* %44 to %Unit*
  %116 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %113, %Str %114, %Unit* %115)

;stmt39:
  %117 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %118 = load %Str, %Str* @func107_str38
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

define %Type* @type_new (%TypeKind %_k) {
  %k = alloca %TypeKind
  store %TypeKind %_k, %TypeKind* %k

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 176)
  %2 = bitcast %Unit* %1 to %Type*

;stmt1:
  %3 = bitcast %Type* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func108_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Type* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 176)

;stmt3:
  %9 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 0
  %10 = load %TypeKind, %TypeKind* %k
  store %TypeKind %10, %TypeKind* %9

;stmt4:
  %11 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 3
  %12 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 1
  %13 = load %Nat32, %Nat32* %12
  %14 = trunc %Nat32 %13 to %Nat8
  store %Nat8 %14, %Nat8* %11

;stmt5:
  ret %Type* %2
}

define %Bool @typeIsReference (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
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
  %7 = load %Type*, %Type** %t
  %8 = getelementptr inbounds %Type, %Type* %7, i32 0, i32 7
  %9 = getelementptr inbounds %TypeArray, %TypeArray* %8, i32 0, i32 2
  %10 = load %Bool, %Bool* %9
  ret %Bool %10
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  ret %Bool 0
}

define %Bool @type_is_basic (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 2
  ret %Bool %4
}

define %Bool @type_is_function (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 3
  ret %Bool %4
}

define %Bool @type_is_record (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 5
  ret %Bool %4
}

define %Bool @type_is_enum (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 4
  ret %Bool %4
}

define %Bool @type_is_pointer (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 6
  ret %Bool %4
}

define %Bool @type_is_array (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 7
  ret %Bool %4
}

define %Bool @type_is_basic_integer (%Type* %_t) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Type*, %Type** %t
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2
  %4 = icmp eq %TypeKind %3, 2
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = load %Type*, %Type** %t
  %6 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 4
  %7 = getelementptr inbounds %TypeBasic, %TypeBasic* %6, i32 0, i32 2
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

define void @add_type (%List* %_index, %Str %_id, %Type* %_t) {
  %index = alloca %List*
  store %List* %_index, %List** %index
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Str, %Str* %id
  %2 = call %Type* (%Str) @get_type (%Str %1)

;stmt1:
  %3 = bitcast %Type* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = getelementptr inbounds %Type, %Type* %2, i32 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp ne %TypeKind %7, 0
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %9 = load %Str, %Str* @func119_str1
  %10 = load %Type*, %Type** %t
  %11 = getelementptr inbounds %Type, %Type* %10, i32 0, i32 12
  %12 = load %TokenInfo*, %TokenInfo** %11
  call void (%Str, %TokenInfo*) @error (%Str %9, %TokenInfo* %12)

;stmt6:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  %14 = bitcast %Type* %2 to %Unit*
  %15 = load %Type*, %Type** %t
  %16 = bitcast %Type* %15 to %Unit*
  %17 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %14, %Unit* %16, %Nat32 176)

;stmt8:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  %19 = load %List*, %List** %index
  %20 = load %Str, %Str* %id
  %21 = load %Type*, %Type** %t
  %22 = bitcast %Type* %21 to %Unit*
  %23 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %19, %Str %20, %Unit* %22)
  ret void
}

define %Type* @get_type (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %2 = load %Str, %Str* %id
  %3 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %2)

;stmt1:
  %4 = inttoptr i64 0 to %Unit*
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
  %8 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %9 = load %Block*, %Block** %8
  store %Block* %9, %Block** %b

;stmt6:
  br label %continue_0
continue_0:
  %10 = load %Block*, %Block** %b
  %11 = bitcast %Block* %10 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp ne %Unit* %11, %12
  br i1 %13, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %14 = load %Block*, %Block** %b
  %15 = getelementptr inbounds %Block, %Block* %14, i32 0, i32 2
  %16 = load %Str, %Str* %id
  %17 = call %Unit* (%List*, %Str) @map_get (%List* %15, %Str %16)
  %18 = bitcast %Unit* %17 to %Type*

;stmt9:
  %19 = bitcast %Type* %18 to %Unit*
  %20 = inttoptr i64 0 to %Unit*
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
  %24 = getelementptr inbounds %Block, %Block* %23, i32 0, i32 0
  %25 = load %Block*, %Block** %24
  store %Block* %25, %Block** %b
  br label %continue_0
break_0:

;stmt13:
  %26 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1
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
  %8 = load %Str, %Str* %id
  %9 = load %Value*, %Value** %v
  call void (%Block*, %Str, %Value*) @bind_value_in_block (%Block* %7, %Str %8, %Value* %9)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %10 = load %Str, %Str* %id
  %11 = load %Value*, %Value** %v
  call void (%Str, %Value*) @bind_value_global (%Str %10, %Value* %11)
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
  %2 = getelementptr inbounds %Block, %Block* %1, i32 0, i32 3
  %3 = load %Str, %Str* %id
  %4 = load %Value*, %Value** %v
  call void (%List*, %Str, %Value*) @add_value (%List* %2, %Str %3, %Value* %4)
  ret void
}

define void @bind_value_local (%Str %_id, %Value* %_v) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %2 = load %Block*, %Block** %1
  %3 = getelementptr inbounds %Block, %Block* %2, i32 0, i32 3
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
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2
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
  %4 = bitcast %Unit* %3 to %Value*

;stmt1:
  %5 = bitcast %Value* %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 2
  %9 = getelementptr inbounds %Storage, %Storage* %8, i32 0, i32 0
  %10 = load %StorageClass, %StorageClass* %9
  %11 = icmp ne %StorageClass %10, 0
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %12 = load %Str, %Str* @func125_str1
  %13 = load %Value*, %Value** %v
  %14 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 13
  %15 = load %TokenInfo*, %TokenInfo** %14
  call void (%Str, %TokenInfo*) @error (%Str %12, %TokenInfo* %15)

;stmt6:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt7:
  %17 = bitcast %Value* %4 to %Unit*
  %18 = load %Value*, %Value** %v
  %19 = bitcast %Value* %18 to %Unit*
  %20 = call %Unit* (%Unit*, %Unit*, %Nat32) @memcpy (%Unit* %17, %Unit* %19, %Nat32 176)

;stmt8:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt9:
  %22 = load %List*, %List** %index
  %23 = load %Str, %Str* %id
  %24 = load %Value*, %Value** %v
  %25 = bitcast %Value* %24 to %Unit*
  %26 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %22, %Str %23, %Unit* %25)
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
  %7 = load %Str, %Str* %id
  %8 = call %Value* (%Str) @get_value_global (%Str %7)

;stmt5:
  %9 = bitcast %Value* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  ret %Value* %8
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt8:
  %13 = load %Str, %Str* %id
  %14 = call %Value* (%Str) @get_value_builtin (%Str %13)
  ret %Value* %14
}

define %Value* @get_value_local (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

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
  %9 = load %Str, %Str* %id
  %10 = call %Unit* (%List*, %Str) @map_get (%List* %8, %Str %9)
  %11 = bitcast %Unit* %10 to %Value*

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
  %16 = load %Block*, %Block** %b
  %17 = getelementptr inbounds %Block, %Block* %16, i32 0, i32 0
  %18 = load %Block*, %Block** %17
  store %Block* %18, %Block** %b

;stmt9:
  %19 = load %Block*, %Block** %b
  %20 = bitcast %Block* %19 to %Unit*
  %21 = inttoptr i64 0 to %Unit*
  %22 = icmp eq %Unit* %20, %21
  br i1 %22, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %23 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %24 = load %Value*, %Value** %23
  %25 = getelementptr inbounds %Value, %Value* %24, i32 0, i32 1
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Type, %Type* %26, i32 0, i32 5
  %28 = getelementptr inbounds %TypeFunc, %TypeFunc* %27, i32 0, i32 0
  %29 = load %List*, %List** %28
  %30 = load %Str, %Str* %id
  %31 = call %Value* (%List*, %Str) @get_value_from_params (%List* %29, %Str %30)
  ret %Value* %31
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt12:
  %33 = inttoptr i64 0 to %Value*
  ret %Value* %33
}

define %Value* @get_value_global (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2
  %2 = load %Str, %Str* %id
  %3 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %2)
  %4 = bitcast %Unit* %3 to %Value*
  ret %Value* %4
}

define %Value* @get_value_builtin (%Str %_id) {
  %id = alloca %Str
  store %Str %_id, %Str* %id

;stmt0:
  %1 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  %2 = load %Str, %Str* %id
  %3 = call %Unit* (%List*, %Str) @map_get (%List* %1, %Str %2)

;stmt1:
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp eq %Unit* %3, %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Str, %Str* %id
  %7 = load %Str, %Str* @func129_str1
  %8 = call %Int32 (%Str, %Str) @strcmp (%Str %6, %Str %7)
  %9 = icmp eq %Int32 %8, 0
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %10 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
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
  %13 = bitcast %Unit* %3 to %Value*
  ret %Value* %13
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
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
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
  %11 = inttoptr i64 0 to %Unit*
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
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %9 = inttoptr i64 0 to %Value*
  ret %Value* %9
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %11 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 3
  %12 = load %TokenInfo*, %TokenInfo** %11
  %13 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 1, %StorageClass 3, %TokenInfo* %12)

;stmt5:
  %14 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 1
  %15 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 1
  %16 = load %Type*, %Type** %15
  store %Type* %16, %Type** %14

;stmt6:
  %17 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 2
  %18 = getelementptr inbounds %Storage, %Storage* %17, i32 0, i32 3
  %19 = getelementptr inbounds %Field, %Field* %5, i32 0, i32 0
  %20 = load %Str, %Str* %19
  store %Str %20, %Str* %18

;stmt7:
  ret %Value* %13
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Type*, %Type** %type
  %6 = bitcast %Type* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
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
  %14 = inttoptr i64 0 to %Unit*
  %15 = icmp ne %Unit* %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %16 = load %Str, %Str* @func132_str1
  %17 = load %TokenInfo*, %TokenInfo** %ti
  call void (%Str, %TokenInfo*) @error (%Str %16, %TokenInfo* %17)

;stmt7:
  %18 = load %Str, %Str* @func132_str2
  %19 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 11
  %20 = load %TokenInfo*, %TokenInfo** %19
  call void (%Str, %TokenInfo*) @rem (%Str %18, %TokenInfo* %20)

;stmt8:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt9:
  %22 = load %TokenInfo*, %TokenInfo** %ti
  %23 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 1, %StorageClass 0, %TokenInfo* %22)

;stmt10:
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 1
  %25 = load %Type*, %Type** %type
  store %Type* %25, %Type** %24

;stmt11:
  %26 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 2
  %27 = getelementptr inbounds %Storage, %Storage* %26, i32 0, i32 3
  %28 = load %Str, %Str* %id
  store %Str %28, %Str* %27

;stmt12:
  %29 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 1
  %30 = load %Type*, %Type** %type
  store %Type* %30, %Type** %29

;stmt13:
  %31 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 11
  %32 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %32, %TokenInfo** %31

;stmt14:
  %33 = load %Type*, %Type** %type
  %34 = getelementptr inbounds %Type, %Type* %33, i32 0, i32 0
  %35 = load %TypeKind, %TypeKind* %34
  %36 = icmp eq %TypeKind %35, 3
  br i1 %36, label %then_2, label %else_2
then_2:

;stmt15:

;stmt16:
  %37 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 2
  %38 = getelementptr inbounds %Storage, %Storage* %37, i32 0, i32 0
  store %StorageClass 2, %StorageClass* %38

;stmt17:
  %39 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %40 = load %Str, %Str* %id
  %41 = load %Type*, %Type** %type
  %42 = inttoptr i64 0 to %Block*
  call void (%Assembly*, %Str, %Type*, %Block*) @asmFuncAdd (%Assembly* %39, %Str %40, %Type* %41, %Block* %42)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt18:
  %43 = load %Str, %Str* %id
  call void (%Str, %Value*) @bind_value_global (%Str %43, %Value* %23)
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  %5 = load %Str, %Str* @func133_str1
  call void (%Bool, %Str) @assert (%Bool %4, %Str %5)

;stmt1:
  %6 = load %Value*, %Value** %v
  %7 = bitcast %Value* %6 to %Unit*
  %8 = inttoptr i64 0 to %Unit*
  %9 = icmp ne %Unit* %7, %8
  %10 = load %Str, %Str* @func133_str2
  call void (%Bool, %Str) @assert (%Bool %9, %Str %10)

;stmt2:
  %11 = load %Value*, %Value** %v
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 12
  %13 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %13, %TokenInfo** %12

;stmt3:
  %14 = load %Str, %Str* %id
  %15 = call %Value* (%Str) @get_value_global (%Str %14)

;stmt4:
  %16 = bitcast %Value* %15 to %Unit*
  %17 = inttoptr i64 0 to %Unit*
  %18 = icmp ne %Unit* %16, %17
  br i1 %18, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %19 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 0
  %20 = load %Value*, %Value** %v
  %21 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 0
  %22 = load %ValueKind, %ValueKind* %21
  store %ValueKind %22, %ValueKind* %19

;stmt7:
  %23 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 1
  %24 = load %Value*, %Value** %v
  %25 = getelementptr inbounds %Value, %Value* %24, i32 0, i32 1
  %26 = load %Type*, %Type** %25
  store %Type* %26, %Type** %23

;stmt8:
  %27 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 2
  %28 = load %Value*, %Value** %v
  %29 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 2
  %30 = load %Storage, %Storage* %29
  store %Storage %30, %Storage* %27

;stmt9:
  %31 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 3
  %32 = load %Value*, %Value** %v
  %33 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 3
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
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 3
  %4 = load %Str, %Str* %3

;stmt1:
  %5 = bitcast %Str %4 to %Unit*
  %6 = inttoptr i64 0 to %Unit*
  %7 = icmp ne %Unit* %5, %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %8 = load %Value*, %Value** %v
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 2
  %10 = getelementptr inbounds %Storage, %Storage* %9, i32 0, i32 3
  %11 = load %Str, %Str* %id
  store %Str %11, %Str* %10

;stmt4:
  %12 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %13 = load %Str, %Str* %id
  call void (%Assembly*, %Str, %Str) @asmRename (%Assembly* %12, %Str %4, %Str %13)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
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
  %8 = load %Str, %Str* @func135_str1
  %9 = load %Str, %Str* %prefix
  %10 = load %Nat32, %Nat32* %uid
  %11 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %7, %Str %8, %Str %9, %Nat32 %10)

;stmt2:
  ret %Str %6
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
  %8 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 2
  %9 = getelementptr inbounds %Storage, %Storage* %8, i32 0, i32 3
  %10 = load %Str, %Str* %9
  %11 = call %Nat32 (%Str) @strlen (%Str %10)
  %12 = add %Nat32 %11, 2
  %13 = call %Unit* (%Nat32) @malloc (%Nat32 %12)

;stmt3:
  %14 = load %Str, %Str* @func136_str1
  %15 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %16 = load %Value*, %Value** %15
  %17 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 2
  %18 = getelementptr inbounds %Storage, %Storage* %17, i32 0, i32 3
  %19 = load %Str, %Str* %18
  %20 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %13, %Str %14, %Str %19)

;stmt4:
  %21 = bitcast %Unit* %13 to %Str
  ret %Str %21
  br label %endif_0
else_0:

;stmt5:
  br label %endif_0
endif_0:

;stmt6:
  %23 = load %Str, %Str* @func136_str2
  ret %Str %23
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
  %18 = load %Str, %Str* @func137_str1
  %19 = load %Str, %Str* %id
  %20 = call %Int32 (%Unit*, %Str, ...) @sprintf (%Unit* %17, %Str %18, %Str %1, %Str %19)

;stmt6:
  ret %Str %16
}

define %Str @get_name_func () {

;stmt0:
  %1 = load %Str, %Str* @func138_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @func_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_str () {

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
  %6 = load %Str, %Str* @func139_str1
  %7 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 4
  %8 = call %Str (%Str, %Nat32*) @get_name (%Str %6, %Nat32* %7)
  ret %Str %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %10 = load %Str, %Str* @func139_str2
  %11 = getelementptr inbounds %Nat32, %Nat32* @str_uid, i32 0
  %12 = call %Str (%Str, %Nat32*) @get_name (%Str %10, %Nat32* %11)
  ret %Str %12
}

define %Str @get_name_arr () {

;stmt0:
  %1 = load %Str, %Str* @func140_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @arr_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_var () {

;stmt0:
  %1 = load %Str, %Str* @func141_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @var_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Str @get_name_type () {

;stmt0:
  %1 = load %Str, %Str* @func142_str1
  %2 = getelementptr inbounds %Nat32, %Nat32* @type_uid, i32 0
  %3 = call %Str (%Str, %Nat32*) @get_name (%Str %1, %Nat32* %2)
  ret %Str %3
}

define %Value* @create_local_var (%Str %_id, %Type* %_t, %Value* %_init_value, %TokenInfo* %_ti) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %init_value = alloca %Value*
  store %Value* %_init_value, %Value** %init_value
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 1, %StorageClass 3, %TokenInfo* %1)

;stmt1:
  %3 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 1
  %4 = load %Type*, %Type** %t
  store %Type* %4, %Type** %3

;stmt2:
  %5 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2
  %6 = getelementptr inbounds %Storage, %Storage* %5, i32 0, i32 3
  %7 = load %Str, %Str* %id
  store %Str %7, %Str* %6

;stmt3:
  %8 = load %Str, %Str* %id
  call void (%Str, %Value*) @bind_value_local (%Str %8, %Value* %2)

;stmt4:
  %9 = load %Str, %Str* %id
  %10 = load %Type*, %Type** %t
  %11 = load %Value*, %Value** %init_value
  %12 = inttoptr i64 0 to %TokenInfo*
  %13 = call %Stmt* (%Str, %Type*, %Value*, %TokenInfo*) @stmt_new_vardef (%Str %9, %Type* %10, %Value* %11, %TokenInfo* %12)
  call void (%Stmt*) @stmtAdd (%Stmt* %13)

;stmt5:
  %14 = load %Value*, %Value** %init_value
  %15 = bitcast %Value* %14 to %Unit*
  %16 = inttoptr i64 0 to %Unit*
  %17 = icmp ne %Unit* %15, %16
  br i1 %17, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %18 = load %Value*, %Value** %init_value
  %19 = inttoptr i64 0 to %TokenInfo*
  %20 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @stmt_new_assign (%Value* %2, %Value* %18, %TokenInfo* %19)
  call void (%Stmt*) @stmtAdd (%Stmt* %20)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  ret %Value* %2
}

define void @create_global_var (%Str %_id, %Type* %_t, %Value* %_init_value, %TokenInfo* %_ti) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %init_value = alloca %Value*
  store %Value* %_init_value, %Value** %init_value
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %2 = load %Str, %Str* %id
  %3 = load %Type*, %Type** %t
  %4 = load %Value*, %Value** %init_value
  call void (%Assembly*, %Str, %Type*, %Value*) @asmVarAdd (%Assembly* %1, %Str %2, %Type* %3, %Value* %4)

;stmt1:
  %5 = load %TokenInfo*, %TokenInfo** %ti
  %6 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 1, %StorageClass 4, %TokenInfo* %5)

;stmt2:
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %8 = load %Type*, %Type** %t
  store %Type* %8, %Type** %7

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 2
  %10 = getelementptr inbounds %Storage, %Storage* %9, i32 0, i32 3
  %11 = load %Str, %Str* %id
  store %Str %11, %Str* %10

;stmt4:
  %12 = load %Str, %Str* %id
  call void (%Str, %Value*) @bind_value_global (%Str %12, %Value* %6)
  ret void
}

define void @stmtAdd (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = bitcast %Stmt* %1 to %Unit*
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %6 = load %Block*, %Block** %5
  %7 = getelementptr inbounds %Block, %Block* %6, i32 0, i32 1
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
  %8 = load %Str, %Str* @func146_str1
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
  %11 = load %Str, %Str* @func146_str2
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
  %14 = call %Type* () @parse_type_base ()
  store %Type* %14, %Type** %t
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:

;stmt14:

;stmt15:
  %15 = load %Str, %Str* @func146_str3
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
  %24 = load %Str, %Str* @func146_str4
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
  %27 = load %Str, %Str* @func146_str5
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
  %34 = load %Str, %Str* @func146_str6
  call void (%Str, %TokenInfo*) @error (%Str %34, %TokenInfo* %3)

;stmt31:
  %35 = load %Str, %Str* @func146_str7
  %36 = call %Token* () @ctok ()
  %37 = getelementptr inbounds %Token, %Token* %36, i32 0, i32 2
  %38 = load [0 x %Nat8], [0 x %Nat8]* %37
  %39 = call %Int32 (%Str, ...) @printf (%Str %35, [0 x %Nat8] %38)
  br label %endif_7
else_7:

;stmt32:

;stmt33:
  %40 = load %Type*, %Type** %t
  %41 = getelementptr inbounds %Type, %Type* %40, i32 0, i32 2
  %42 = load %Type*, %Type** %t
  %43 = getelementptr inbounds %Type, %Type* %42, i32 0, i32 2
  %44 = load %Nat32, %Nat32* %43
  %45 = getelementptr inbounds %Settings, %Settings* @cfg, i32 0, i32 1
  %46 = load %Nat32, %Nat32* %45
  %47 = trunc %Nat32 %46 to %Nat8
  %48 = call %Nat32 (%Nat32, %Nat8) @alignment (%Nat32 %44, %Nat8 %47)
  store %Nat32 %48, %Nat32* %41

;stmt34:
  %49 = load %Type*, %Type** %t
  %50 = getelementptr inbounds %Type, %Type* %49, i32 0, i32 11
  store %TokenInfo* %3, %TokenInfo** %50

;stmt35:
  %51 = load %Type*, %Type** %t
  %52 = getelementptr inbounds %Type, %Type* %51, i32 0, i32 12
  store %TokenInfo* %3, %TokenInfo** %52
  br label %endif_7
endif_7:

;stmt36:
  %53 = load %Type*, %Type** %t
  ret %Type* %53
}

define %Type* @parse_type_base () {

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
  %7 = load %Str, %Str* @func147_str1
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
  %16 = getelementptr inbounds %Type, %Type* %15, i32 0, i32 12
  store %TokenInfo* %2, %TokenInfo** %16

;stmt12:
  %17 = getelementptr inbounds %Type, %Type* %15, i32 0, i32 10
  store %TokenInfo* %2, %TokenInfo** %17

;stmt13:
  %18 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1
  call void (%List*, %Str, %Type*) @add_type (%List* %18, %Str %3, %Type* %15)

;stmt14:
  ret %Type* %15
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
  %11 = load %Str, %Str* @func148_str1
  call void (%Str, %TokenInfo*) @error (%Str %11, %TokenInfo* %6)

;stmt10:
  br label %fail
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt11:
  %13 = load %Str, %Str* @func148_str2
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
  %17 = inttoptr i64 0 to %List*
  ret %List* %17
}

define %Type* @parse_type_record () {

;stmt0:
  %1 = load %Str, %Str* @func149_str1
  %2 = call %Bool (%Str) @need (%Str %1)

;stmt1:
  %3 = load %Str, %Str* @func149_str2
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
  %2 = load %Str, %Str* @func150_str1
  %3 = call %Bool (%Str) @need (%Str %2)

;stmt4:
  call void () @skip_nl ()

;stmt5:
  br label %continue_0
continue_0:
  %4 = load %Str, %Str* @func150_str2
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
  %20 = load %Str, %Str* @func150_str3
  %21 = call %Bool (%Str) @match (%Str %20)
  %22 = xor %Bool %21, 1
  br i1 %22, label %then_0, label %else_0
then_0:

;stmt16:

;stmt17:
  call void () @skip_nl ()

;stmt18:
  %23 = load %Str, %Str* @func150_str4
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
  %1 = load %Str, %Str* @func151_str1
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
  %15 = load %Str, %Str* @func151_str2
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
  %23 = getelementptr inbounds %Storage, %Storage* %22, i32 0, i32 1
  %24 = load %Int64, %Int64* %23
  %25 = trunc %Int64 %24 to %Nat32
  %26 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %17, %Nat32 %25, %Bool 0)
  ret %Type* %26

;stmt17:
  br label %fail
fail:

;stmt18:
  %28 = inttoptr i64 0 to %Type*
  ret %Type* %28
}

define %Type* @parse_type_func () {

;stmt0:
  %1 = load %Str, %Str* @func152_str1
  %2 = call %List* (%Str) @parse_fields (%Str %1)

;stmt1:
  %3 = load %Str, %Str* @func152_str2
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
  %15 = load %Str, %Str* @func152_str3
  %16 = call %Nat64 (%Str) @get (%Str %15)
  %17 = icmp eq %Nat64 %16, 1

;stmt7:
  %18 = call %Type* (%List*, %Type*, %Bool) @type_func_new (%List* %2, %Type* %5, %Bool %17)
  ret %Type* %18
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
  %8 = icmp eq %ValueKind %7, 2
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %9 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 4
  %10 = getelementptr inbounds %ValueUn, %ValueUn* %9, i32 0, i32 0
  %11 = load %Value*, %Value** %10
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 2
  %13 = getelementptr inbounds %Storage, %Storage* %12, i32 0, i32 0
  %14 = load %StorageClass, %StorageClass* %13

;stmt7:
  %15 = icmp eq %StorageClass %14, 4
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
  %17 = call %Bool (%Value*) @valueIsConst (%Value* %1)
  %18 = xor %Bool %17, 1
  br i1 %18, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %19 = load %Str, %Str* @func154_str1
  %20 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 13
  %21 = load %TokenInfo*, %TokenInfo** %20
  call void (%Str, %TokenInfo*) @error (%Str %19, %TokenInfo* %21)

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
  %24 = inttoptr i64 0 to %Value*
  ret %Value* %24
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
  %10 = load %Str, %Str* @func155_str1
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
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 11, %Value* %12, %Value* %13, %TokenInfo* %9)
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
  %10 = load %Str, %Str* @func156_str1
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
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 12, %Value* %12, %Value* %13, %TokenInfo* %9)
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
  %10 = load %Str, %Str* @func157_str1
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
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 13, %Value* %12, %Value* %13, %TokenInfo* %9)
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
  %10 = load %Str, %Str* @func158_str1
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
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 14, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %15 = load %Str, %Str* @func158_str2
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
  %19 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 15, %Value* %17, %Value* %18, %TokenInfo* %9)
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
  %10 = load %Str, %Str* @func159_str1
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
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 16, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %15 = load %Str, %Str* @func159_str2
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
  %19 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 17, %Value* %17, %Value* %18, %TokenInfo* %9)
  store %Value* %19, %Value** %v
  br label %endif_2
else_2:

;stmt20:
  %20 = load %Str, %Str* @func159_str3
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
  %24 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 18, %Value* %22, %Value* %23, %TokenInfo* %9)
  store %Value* %24, %Value** %v
  br label %endif_3
else_3:

;stmt26:
  %25 = load %Str, %Str* @func159_str4
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
  %29 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 19, %Value* %27, %Value* %28, %TokenInfo* %9)
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
  %10 = load %Str, %Str* @func160_str1
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
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @shift (%ValueKind 20, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %15 = load %Str, %Str* @func160_str2
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
  %19 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @shift (%ValueKind 21, %Value* %17, %Value* %18, %TokenInfo* %9)
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
  %10 = load %Str, %Str* @func161_str1
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
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 6, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %15 = load %Str, %Str* @func161_str2
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
  %19 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 7, %Value* %17, %Value* %18, %TokenInfo* %9)
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
  %10 = load %Str, %Str* @func162_str1
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
  %14 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 8, %Value* %12, %Value* %13, %TokenInfo* %9)
  store %Value* %14, %Value** %v
  br label %endif_1
else_1:

;stmt14:
  %15 = load %Str, %Str* @func162_str2
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
  %19 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 9, %Value* %17, %Value* %18, %TokenInfo* %9)
  store %Value* %19, %Value** %v
  br label %endif_2
else_2:

;stmt20:
  %20 = load %Str, %Str* @func162_str3
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
  %24 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @bin (%ValueKind 10, %Value* %22, %Value* %23, %TokenInfo* %9)
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
  %10 = load %Str, %Str* @func163_str1
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
  %3 = load %Str, %Str* @func164_str1
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
  %7 = load %Str, %Str* @func164_str2
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
  %11 = load %Str, %Str* @func164_str3
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
  %15 = load %Str, %Str* @func164_str4
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
  %19 = load %Str, %Str* @func164_str5
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
  %27 = load %Str, %Str* @func164_str6
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
  %31 = load %Str, %Str* @func164_str7
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
  %39 = load %Str, %Str* @func164_str8
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
  %10 = load %Str, %Str* @func165_str1
  %11 = call %Bool (%Str) @match (%Str %10)
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %12 = call %List* () @map_new ()

;stmt11:
  br label %continue_1
continue_1:
  %13 = load %Str, %Str* @func165_str2
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
  %20 = load %Str, %Str* @func165_str3
  call void (%Str) @skipto (%Str %20)

;stmt17:
  %21 = load %Str, %Str* @func165_str4
  %22 = call %Bool (%Str) @match (%Str %21)
  br i1 %22, label %then_3, label %else_3
then_3:

;stmt18:

;stmt19:
  br label %continue_1
  br label %endif_3
else_3:

;stmt20:
  %24 = load %Str, %Str* @func165_str5
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
  %31 = load %Str, %Str* @func165_str6
  %32 = call %Bool (%Str) @match (%Str %31)
  %33 = xor %Bool %32, 1
  br i1 %33, label %then_5, label %else_5
then_5:

;stmt27:

;stmt28:
  %34 = load %Str, %Str* @func165_str7
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
  %39 = load %Str, %Str* @func165_str8
  %40 = call %Bool (%Str) @match (%Str %39)
  br i1 %40, label %then_6, label %else_6
then_6:

;stmt33:

;stmt34:
  %41 = call %Value* () @expr ()

;stmt35:
  %42 = load %Str, %Str* @func165_str9
  %43 = call %Bool (%Str) @match (%Str %42)

;stmt36:
  %44 = load %Value*, %Value** %v
  %45 = call %Value* (%Value*, %Value*, %TokenInfo*) @indx (%Value* %44, %Value* %41, %TokenInfo* %9)
  store %Value* %45, %Value** %v
  br label %endif_6
else_6:

;stmt37:
  %46 = load %Str, %Str* @func165_str10
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
  %3 = load %Str, %Str* @func166_str1
  %4 = call %Bool (%Str) @match (%Str %3)
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %5 = call %Value* () @expr ()
  store %Value* %5, %Value** %v

;stmt5:
  %6 = load %Str, %Str* @func166_str2
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
  %6 = load %Str, %Str* @func167_str1
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
  %9 = load %Str, %Str* @func167_str2
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
  %19 = load %Str, %Str* @func167_str3
  %20 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %19, %TokenInfo* %20)

;stmt25:
  %21 = load %Str, %Str* @func167_str4
  %22 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %23 = load %TokenType, %TokenType* %22
  %24 = call %Int32 (%Str, ...) @printf (%Str %21, %TokenType %23)

;stmt26:
  %25 = load %Str, %Str* @func167_str5
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
  %34 = getelementptr inbounds %Value, %Value* %33, i32 0, i32 13
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
  %10 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  call void (%Assembly*, %Str, %Str, %Nat32) @asmStringAdd (%Assembly* %10, %Str %9, %Str %8, %Nat32 %7)

;stmt7:
  %11 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 1, %StorageClass 4, %TokenInfo* %2)

;stmt8:
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 1
  %13 = load %Type*, %Type** @typeStr
  store %Type* %13, %Type** %12

;stmt9:
  %14 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 2
  %15 = getelementptr inbounds %Storage, %Storage* %14, i32 0, i32 3
  store %Str %9, %Str* %15

;stmt10:
  ret %Value* %11
}

define %Value* @term_arr () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Type* () @parse_type ()

;stmt2:
  %4 = load %Str, %Str* @func169_str1
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
  %7 = load %Str, %Str* @func169_str2
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
  %14 = load %Str, %Str* @func169_str3
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
  %23 = load %Str, %Str* @func169_str4
  %24 = call %Bool (%Str) @match (%Str %23)
  br label %continue_0
break_0:

;stmt17:
  %25 = call %Str () @get_name_arr ()

;stmt18:
  %26 = load %Nat32, %Nat32* %len
  %27 = call %Type* (%Type*, %Nat32, %Bool) @type_array_new (%Type* %3, %Nat32 %26, %Bool 0)

;stmt19:
  %28 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  call void (%Assembly*, %Str, %Type*, %List*) @asmArrayAdd (%Assembly* %28, %Str %25, %Type* %27, %List* %6)

;stmt20:
  %29 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 1, %StorageClass 2, %TokenInfo* %2)

;stmt21:
  %30 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 1
  store %Type* %27, %Type** %30

;stmt22:
  %31 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 2
  %32 = getelementptr inbounds %Storage, %Storage* %31, i32 0, i32 3
  store %Str %25, %Str* %32

;stmt23:
  %33 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 12
  store %TokenInfo* %2, %TokenInfo** %33

;stmt24:
  ret %Value* %29
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
  %19 = load %Str, %Str* @func170_str1
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
  %26 = load %Str, %Str* @func170_str2
  %27 = call %Int32 (%Str, ...) @printf (%Str %26)

;stmt19:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt20:
  %29 = getelementptr inbounds %Type, %Type* %22, i32 0, i32 0
  %30 = load %TypeKind, %TypeKind* %29
  %31 = icmp ne %TypeKind %30, 3
  br i1 %31, label %then_2, label %else_2
then_2:

;stmt21:

;stmt22:
  %32 = load %Str, %Str* @func170_str3
  %33 = getelementptr inbounds %Type, %Type* %22, i32 0, i32 12
  %34 = load %TokenInfo*, %TokenInfo** %33
  call void (%Str, %TokenInfo*) @error (%Str %32, %TokenInfo* %34)

;stmt23:
  br label %fail
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt24:
  %36 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 1, %StorageClass 2, %TokenInfo* %14)

;stmt25:
  %37 = getelementptr inbounds %Value, %Value* %36, i32 0, i32 1
  store %Type* %22, %Type** %37

;stmt26:
  %38 = bitcast %Block* %3 to %Unit*
  %39 = inttoptr i64 0 to %Unit*
  %40 = icmp ne %Unit* %38, %39
  br i1 %40, label %then_3, label %else_3
then_3:

;stmt27:

;stmt28:
  %41 = getelementptr inbounds %Block, %Block* %3, i32 0, i32 4
  %42 = load %List*, %List** %41
  %43 = bitcast %Value* %36 to %Unit*
  %44 = call %Bool (%List*, %Unit*) @list_append (%List* %42, %Unit* %43)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt29:
  %45 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  store %Value* %36, %Value** %45

;stmt30:
  %46 = getelementptr inbounds %Value, %Value* %36, i32 0, i32 2
  %47 = getelementptr inbounds %Storage, %Storage* %46, i32 0, i32 3
  store %Str %15, %Str* %47

;stmt31:
  %48 = getelementptr inbounds %Value, %Value* %36, i32 0, i32 12
  store %TokenInfo* %14, %TokenInfo** %48

;stmt32:
  %49 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  store %Value* %36, %Value** %49

;stmt33:
  %50 = load %Str, %Str* @func170_str4
  %51 = call %Bool (%Str) @need (%Str %50)

;stmt34:
  %52 = call %Block* () @doblock ()

;stmt35:
  %53 = getelementptr inbounds %Value, %Value* %36, i32 0, i32 3
  store %Block* %52, %Block** %53

;stmt36:
  %54 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  call void (%Assembly*, %Str, %Type*, %Block*) @asmFuncAdd (%Assembly* %54, %Str %15, %Type* %22, %Block* %52)

;stmt37:
  store %FuncContext %1, %FuncContext* @fctx

;stmt38:
  ret %Value* %36

;stmt39:
  br label %fail
fail:

;stmt40:
  store %FuncContext %1, %FuncContext* @fctx

;stmt41:
  %56 = inttoptr i64 0 to %Value*
  ret %Value* %56
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
  %13 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 1, %StorageClass 0, %TokenInfo* %2)

;stmt9:
  %14 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 2
  %15 = getelementptr inbounds %Storage, %Storage* %14, i32 0, i32 3
  store %Str %3, %Str* %15

;stmt10:
  %16 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 11
  store %TokenInfo* %2, %TokenInfo** %16

;stmt11:
  call void (%Str, %Value*) @bind_value_global (%Str %3, %Value* %13)

;stmt12:
  ret %Value* %13
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt13:
  %18 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 2
  %19 = getelementptr inbounds %Storage, %Storage* %18, i32 0, i32 3
  store %Str %3, %Str* %19

;stmt14:
  ret %Value* %9

;stmt15:
  br label %fail
fail:

;stmt16:
  %21 = inttoptr i64 0 to %Value*
  ret %Value* %21
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
  %7 = load %Str, %Str* @func172_str1
  %8 = getelementptr inbounds %Nat8, %Str %7, %Int32 0
  %9 = load %Nat8, %Nat8* %8
  %10 = icmp eq %Nat8 %6, %9
  %11 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2
  %12 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %11, i32 0, %Int32 1
  %13 = load %Nat8, %Nat8* %12
  %14 = load %Str, %Str* @func172_str2
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
  %22 = load %Str, %Str* @func172_str3
  %23 = getelementptr inbounds %Int64, %Int64* %d, i32 0
  %24 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %21, %Str %22, %Int64* %23)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %25 = getelementptr inbounds %Token, %Token* %3, i32 0, i32 2
  %26 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %25, i32 0, %Int32 0
  %27 = bitcast %Nat8* %26 to %Unit*
  %28 = load %Str, %Str* @func172_str4
  %29 = getelementptr inbounds %Int64, %Int64* %d, i32 0
  %30 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %27, %Str %28, %Int64* %29)
  br label %endif_0
endif_0:

;stmt8:
  call void () @skip ()

;stmt9:
  %31 = call %Type* (%TypeKind) @type_new (%TypeKind 1)

;stmt10:
  %32 = getelementptr inbounds %Type, %Type* %31, i32 0, i32 10
  store %TokenInfo* %2, %TokenInfo** %32

;stmt11:
  %33 = load %Int64, %Int64* %d
  %34 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %31, %Int64 %33, %TokenInfo* %2)

;stmt12:
  %35 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 12
  store %TokenInfo* %2, %TokenInfo** %35

;stmt13:
  ret %Value* %34
}

define %Value* @term_hash () {

;stmt0:
  %1 = inttoptr i64 0 to %Value*
  ret %Value* %1
}

define void @stmtLetCheck (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = load %Stmt*, %Stmt** %s
  %6 = getelementptr inbounds %Stmt, %Stmt* %5, i32 0, i32 1
  %7 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %6, i32 0, %Int32 1
  %8 = load %Value*, %Value** %7

;stmt2:
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 2
  %10 = getelementptr inbounds %Storage, %Storage* %9, i32 0, i32 3
  %11 = load %Str, %Str* %10

;stmt3:
  %12 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 1
  store %Type* %12, %Type** %13
  ret void
}

define %Stmt* @stmtBlock (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

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
  %7 = load %TokenInfo*, %TokenInfo** %ti
  %8 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 2, %TokenInfo* %7)

;stmt5:
  %9 = getelementptr inbounds %Stmt, %Stmt* %8, i32 0, i32 2
  store %Block* %1, %Block** %9

;stmt6:
  ret %Stmt* %8
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
  %14 = load %Str, %Str* @func176_str1
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
  %18 = load %Str, %Str* @func176_str2
  call void (%Str) @fatal (%Str %18)

;stmt14:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt15:
  %20 = load %Str, %Str* @func176_str3
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
  call void (%Stmt*) @stmtCheck (%Stmt* %2)
  ret void
}

define void @stmtBlockCheck (%Block* %_b) {
  %b = alloca %Block*
  store %Block* %_b, %Block** %b

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %2 = load %Block*, %Block** %1

;stmt1:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %4 = load %Block*, %Block** %b
  store %Block* %4, %Block** %3

;stmt2:
  %5 = load %Block*, %Block** %b
  %6 = getelementptr inbounds %Block, %Block* %5, i32 0, i32 4
  %7 = load %List*, %List** %6
  %8 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %7, %ListForeachHandler @chkf, %Unit* %8)

;stmt3:
  %9 = load %Block*, %Block** %b
  %10 = getelementptr inbounds %Block, %Block* %9, i32 0, i32 1
  %11 = load %List*, %List** %10
  %12 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %11, %ListForeachHandler @chkb, %Unit* %12)

;stmt4:
  %13 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  store %Block* %2, %Block** %13
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
  %10 = load %Str, %Str* @func180_str1
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
  %17 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 13
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
  %23 = load %Str, %Str* @func180_str2
  %24 = call %Int32 (%Str, ...) @printf (%Str %23)

;stmt16:
  %25 = load %Str, %Str* @func180_str3
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Value*, %Value** %r
  %6 = bitcast %Value* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp eq %Unit* %6, %7
  %9 = or %Bool %4, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %10 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %12 = load %Value*, %Value** %l
  %13 = load %Value*, %Value** %r
  %14 = load %TokenInfo*, %TokenInfo** %ti
  %15 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @stmt_new_assign (%Value* %12, %Value* %13, %TokenInfo* %14)
  ret %Stmt* %15
}

define void @stmtAssignCheck (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1
  %3 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %2, i32 0, %Int32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = load %Stmt*, %Stmt** %s
  %6 = getelementptr inbounds %Stmt, %Stmt* %5, i32 0, i32 1
  %7 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %6, i32 0, %Int32 1
  %8 = load %Value*, %Value** %7

;stmt2:
  %9 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt3:
  %10 = call %Type* (%Value*) @checkValue (%Value* %8)

;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 2
  %12 = call %Bool (%Storage*) @storageIsMutable (%Storage* %11)
  %13 = xor %Bool %12, 1
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %14 = load %Str, %Str* @func182_str1
  %15 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 13
  %16 = load %TokenInfo*, %TokenInfo** %15
  call void (%Str, %TokenInfo*) @error (%Str %14, %TokenInfo* %16)

;stmt7:
ret void
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %18 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %19 = load %Type*, %Type** %18
  %20 = call %Value* (%Value*, %Type*) @nat (%Value* %8, %Type* %19)

;stmt9:
  %21 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 1
  %22 = load %Type*, %Type** %21
  %23 = call %Bool (%Type*, %Type*) @type_eq (%Type* %9, %Type* %22)
  %24 = xor %Bool %23, 1
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %25 = load %Str, %Str* @func182_str2
  %26 = load %Stmt*, %Stmt** %s
  %27 = getelementptr inbounds %Stmt, %Stmt* %26, i32 0, i32 7
  %28 = load %TokenInfo*, %TokenInfo** %27
  call void (%Str, %TokenInfo*) @error (%Str %25, %TokenInfo* %28)

;stmt12:
  %29 = load %Str, %Str* @func182_str3
  %30 = call %Int32 (%Str, ...) @printf (%Str %29)

;stmt13:
  call void (%Type*) @prttype (%Type* %9)

;stmt14:
  %31 = load %Str, %Str* @func182_str4
  %32 = call %Int32 (%Str, ...) @printf (%Str %31)

;stmt15:
  %33 = load %Str, %Str* @func182_str5
  %34 = call %Int32 (%Str, ...) @printf (%Str %33)

;stmt16:
  %35 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 1
  %36 = load %Type*, %Type** %35
  call void (%Type*) @prttype (%Type* %36)

;stmt17:
  %37 = load %Str, %Str* @func182_str6
  %38 = call %Int32 (%Str, ...) @printf (%Str %37)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt18:
  %39 = load %Stmt*, %Stmt** %s
  %40 = getelementptr inbounds %Stmt, %Stmt* %39, i32 0, i32 1
  %41 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %40, i32 0, %Int32 1
  store %Value* %20, %Value** %41
  ret void
}

define %Stmt* @stmtIf (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %If*

;stmt1:
  %3 = getelementptr inbounds %If, %If* %2, i32 0, i32 0
  %4 = call %Value* () @expr ()
  store %Value* %4, %Value** %3

;stmt2:
  %5 = load %Str, %Str* @func183_str1
  %6 = call %Bool (%Str) @match (%Str %5)

;stmt3:
  %7 = call %Token* () @ctok ()
  %8 = getelementptr inbounds %Token, %Token* %7, i32 0, i32 1

;stmt4:
  %9 = load %Str, %Str* @func183_str2
  %10 = call %Bool (%Str) @need (%Str %9)

;stmt5:
  %11 = getelementptr inbounds %If, %If* %2, i32 0, i32 1
  %12 = call %Stmt* (%TokenInfo*) @stmtBlock (%TokenInfo* %8)
  store %Stmt* %12, %Stmt** %11

;stmt6:
  %13 = load %Str, %Str* @func183_str3
  %14 = call %Bool (%Str) @match (%Str %13)
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %15 = load %Str, %Str* @func183_str4
  %16 = call %Bool (%Str) @match (%Str %15)

;stmt9:
  %17 = call %Token* () @ctok ()
  %18 = getelementptr inbounds %Token, %Token* %17, i32 0, i32 1

;stmt10:
  %19 = load %Str, %Str* @func183_str5
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
  %23 = load %Str, %Str* @func183_str6
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
  %41 = load %TokenInfo*, %TokenInfo** %ti
  %42 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 5, %TokenInfo* %41)

;stmt22:
  %43 = getelementptr inbounds %Stmt, %Stmt* %42, i32 0, i32 5
  store %If* %2, %If** %43

;stmt23:
  %44 = getelementptr inbounds %Stmt, %Stmt* %42, i32 0, i32 7
  %45 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %45, %TokenInfo** %44

;stmt24:
  ret %Stmt* %42

;stmt25:
  br label %fail
fail:

;stmt26:
  %47 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %47
}

define void @stmtIfCheck (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 5
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
  %13 = load %Str, %Str* @func184_str1
  %14 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 12
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

define %Stmt* @stmtWhile (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

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
  %9 = load %Str, %Str* @func185_str1
  %10 = call %Bool (%Str) @match (%Str %9)

;stmt4:
  %11 = call %Token* () @ctok ()
  %12 = getelementptr inbounds %Token, %Token* %11, i32 0, i32 1

;stmt5:
  %13 = load %Str, %Str* @func185_str2
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
  %33 = load %TokenInfo*, %TokenInfo** %ti
  %34 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 6, %TokenInfo* %33)

;stmt12:
  %35 = getelementptr inbounds %Stmt, %Stmt* %34, i32 0, i32 4
  store %While* %6, %While** %35

;stmt13:
  %36 = getelementptr inbounds %Stmt, %Stmt* %34, i32 0, i32 7
  %37 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %37, %TokenInfo** %36

;stmt14:
  ret %Stmt* %34

;stmt15:
  br label %fail
fail:

;stmt16:
  %39 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %40 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 2
  %41 = load %Nat32, %Nat32* %40
  %42 = sub %Nat32 %41, 1
  store %Nat32 %42, %Nat32* %39

;stmt17:
  %43 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %43
}

define void @stmtWhileCheck (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 4
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
  %13 = load %Str, %Str* @func186_str1
  %14 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 12
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

define %Stmt* @stmtReturn (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 7, %TokenInfo* %1)

;stmt1:
  %3 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 7
  %4 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %4, %TokenInfo** %3

;stmt2:
  %5 = call %Bool () @separator ()
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  ret %Stmt* %2
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %7 = call %Token* () @ctok ()
  %8 = getelementptr inbounds %Token, %Token* %7, i32 0, i32 1

;stmt6:
  %9 = call %Value* () @expr ()

;stmt7:
  %10 = bitcast %Value* %9 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp eq %Unit* %10, %11
  br i1 %12, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %13 = load %Str, %Str* @func187_str1
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %8)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %14 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 1
  %15 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %14, i32 0, %Int32 0
  store %Value* %9, %Value** %15

;stmt11:
  ret %Stmt* %2

;stmt12:
  br label %fail
fail:

;stmt13:
  %17 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %17
}

define void @stmtReturnCheck (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = getelementptr inbounds %Stmt, %Stmt* %1, i32 0, i32 1
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
  %9 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %10 = load %Value*, %Value** %9
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = getelementptr inbounds %Type, %Type* %12, i32 0, i32 5
  %14 = getelementptr inbounds %TypeFunc, %TypeFunc* %13, i32 0, i32 1
  %15 = load %Type*, %Type** %14

;stmt5:
  %16 = load %Stmt*, %Stmt** %s
  %17 = getelementptr inbounds %Stmt, %Stmt* %16, i32 0, i32 1
  %18 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %17, i32 0, %Int32 0
  %19 = call %Value* (%Value*, %Type*) @nat (%Value* %4, %Type* %15)
  store %Value* %19, %Value** %18
  br label %endif_0
else_0:
  br label %endif_0
endif_0:
  ret void
}

define %Stmt* @stmtBreak (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

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
  %5 = load %Str, %Str* @func189_str1
  %6 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = load %TokenInfo*, %TokenInfo** %ti
  %8 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 8, %TokenInfo* %7)
  ret %Stmt* %8
}

define %Stmt* @stmtContinue (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

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
  %5 = load %Str, %Str* @func190_str1
  %6 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = load %TokenInfo*, %TokenInfo** %ti
  %8 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 9, %TokenInfo* %7)
  ret %Stmt* %8
}

define %Stmt* @stmtGoto (%TokenInfo* %_ti) {
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

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
  %5 = load %Str, %Str* @func191_str1
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
  %9 = load %TokenInfo*, %TokenInfo** %ti
  %10 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 10, %TokenInfo* %9)

;stmt6:
  %11 = getelementptr inbounds %Stmt, %Stmt* %10, i32 0, i32 6
  store %Str %1, %Str* %11

;stmt7:
  %12 = getelementptr inbounds %Stmt, %Stmt* %10, i32 0, i32 7
  %13 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %13, %TokenInfo** %12

;stmt8:
  ret %Stmt* %10
}

define void @stmtCheck (%Stmt* %_s) {
  %s = alloca %Stmt*
  store %Stmt* %_s, %Stmt** %s

;stmt0:
  %1 = load %Stmt*, %Stmt** %s
  %2 = bitcast %Stmt* %1 to %Unit*
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
  %6 = load %Stmt*, %Stmt** %s
  %7 = getelementptr inbounds %Stmt, %Stmt* %6, i32 0, i32 0
  %8 = load %StmtKind, %StmtKind* %7

;stmt4:
  %9 = icmp eq %StmtKind %8, 0
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %10 = load %Stmt*, %Stmt** %s
  call void (%Stmt*) @stmtLetCheck (%Stmt* %10)
  br label %endif_1
else_1:

;stmt7:
  %11 = icmp eq %StmtKind %8, 3
  br i1 %11, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %12 = load %Stmt*, %Stmt** %s
  %13 = getelementptr inbounds %Stmt, %Stmt* %12, i32 0, i32 1
  %14 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %13, i32 0, %Int32 0
  %15 = load %Value*, %Value** %14
  %16 = call %Type* (%Value*) @checkValue (%Value* %15)
  br label %endif_2
else_2:

;stmt10:
  %17 = icmp eq %StmtKind %8, 4
  br i1 %17, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %18 = load %Stmt*, %Stmt** %s
  call void (%Stmt*) @stmtAssignCheck (%Stmt* %18)
  br label %endif_3
else_3:

;stmt13:
  %19 = icmp eq %StmtKind %8, 2
  br i1 %19, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  %20 = load %Stmt*, %Stmt** %s
  %21 = getelementptr inbounds %Stmt, %Stmt* %20, i32 0, i32 2
  %22 = load %Block*, %Block** %21
  call void (%Block*) @stmtBlockCheck (%Block* %22)
  br label %endif_4
else_4:

;stmt16:
  %23 = icmp eq %StmtKind %8, 5
  br i1 %23, label %then_5, label %else_5
then_5:

;stmt17:

;stmt18:
  %24 = load %Stmt*, %Stmt** %s
  call void (%Stmt*) @stmtIfCheck (%Stmt* %24)
  br label %endif_5
else_5:

;stmt19:
  %25 = icmp eq %StmtKind %8, 6
  br i1 %25, label %then_6, label %else_6
then_6:

;stmt20:

;stmt21:
  %26 = load %Stmt*, %Stmt** %s
  call void (%Stmt*) @stmtWhileCheck (%Stmt* %26)
  br label %endif_6
else_6:

;stmt22:
  %27 = icmp eq %StmtKind %8, 7
  br i1 %27, label %then_7, label %else_7
then_7:

;stmt23:

;stmt24:
  %28 = load %Stmt*, %Stmt** %s
  call void (%Stmt*) @stmtReturnCheck (%Stmt* %28)
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

define %Stmt* @stmt () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = load %Str, %Str* @func193_str1
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
  %8 = load %Str, %Str* @func193_str2
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
  %12 = load %Str, %Str* @func193_str3
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
  %16 = load %Str, %Str* @func193_str4
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
  %20 = load %Str, %Str* @func193_str5
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
  %24 = load %Str, %Str* @func193_str6
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
  %28 = load %Str, %Str* @func193_str7
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
  %32 = load %Str, %Str* @func193_str8
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
  %37 = load %Str, %Str* @func193_str9
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
  %42 = load %Str, %Str* @func193_str10
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
  %54 = load %Str, %Str* @func193_str11
  %55 = call %Bool (%Str) @match (%Str %54)
  br i1 %55, label %then_11, label %else_11
then_11:

;stmt42:

;stmt43:
  call void (%Str, %TokenInfo*) @setlab (%Str %51, %TokenInfo* %53)

;stmt44:
  %56 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %56
  br label %endif_11
else_11:

;stmt45:

;stmt46:
  call void (%Node*) @sett (%Node* %46)
  br label %endif_11
endif_11:
  br label %endif_10
else_10:
  br label %endif_10
endif_10:

;stmt47:
  %58 = call %Stmt* () @stmtExpr ()

;stmt48:
  %59 = bitcast %Stmt* %58 to %Unit*
  %60 = inttoptr i64 0 to %Unit*
  %61 = icmp eq %Unit* %59, %60
  br i1 %61, label %then_12, label %else_12
then_12:

;stmt49:

;stmt50:
  call void () @stmt_restore ()
  br label %endif_12
else_12:
  br label %endif_12
endif_12:

;stmt51:
  ret %Stmt* %58
}

define void @stmt_restore () {

;stmt0:
  call void () @skip ()
  ret void
}

define void @setlab (%Str %_lab, %TokenInfo* %_ti) {
  %lab = alloca %Str
  store %Str %_lab, %Str* %lab
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 11, %TokenInfo* %1)

;stmt1:
  %3 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 6
  %4 = load %Str, %Str* %lab
  store %Str %4, %Str* %3

;stmt2:
  call void (%Stmt*) @stmtAdd (%Stmt* %2)
  ret void
}

define %Stmt* @stmtNew (%StmtKind %_kind, %TokenInfo* %_ti) {
  %kind = alloca %StmtKind
  store %StmtKind %_kind, %StmtKind* %kind
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 72)
  %2 = bitcast %Unit* %1 to %Stmt*

;stmt1:
  %3 = bitcast %Stmt* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func196_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Stmt* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 72)

;stmt3:
  %9 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 0
  %10 = load %StmtKind, %StmtKind* %kind
  store %StmtKind %10, %StmtKind* %9

;stmt4:
  %11 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 7
  %12 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %12, %TokenInfo** %11

;stmt5:
  ret %Stmt* %2
}

define %Stmt* @stmt_new_vardef (%Str %_id, %Type* %_t, %Value* %_init_value, %TokenInfo* %_ti) {
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %init_value = alloca %Value*
  store %Value* %_init_value, %Value** %init_value
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %VarDef*

;stmt1:
  %3 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 0
  %4 = load %Str, %Str* %id
  store %Str %4, %Str* %3

;stmt2:
  %5 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 2
  %6 = load %Value*, %Value** %init_value
  store %Value* %6, %Value** %5

;stmt3:
  %7 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 1
  %8 = load %Type*, %Type** %t
  store %Type* %8, %Type** %7

;stmt4:
  %9 = load %TokenInfo*, %TokenInfo** %ti
  %10 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 1, %TokenInfo* %9)

;stmt5:
  %11 = getelementptr inbounds %Stmt, %Stmt* %10, i32 0, i32 3
  store %VarDef* %2, %VarDef** %11

;stmt6:
  %12 = getelementptr inbounds %Stmt, %Stmt* %10, i32 0, i32 7
  %13 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %13, %TokenInfo** %12

;stmt7:
  ret %Stmt* %10
}

define %Stmt* @stmt_new_let (%Value* %_v, %Value* %_xv, %TokenInfo* %_ti) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %xv = alloca %Value*
  store %Value* %_xv, %Value** %xv
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 0, %TokenInfo* %1)

;stmt1:
  %3 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 1
  %4 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %3, i32 0, %Int32 0
  %5 = load %Value*, %Value** %v
  store %Value* %5, %Value** %4

;stmt2:
  %6 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 1
  %7 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %6, i32 0, %Int32 1
  %8 = load %Value*, %Value** %xv
  store %Value* %8, %Value** %7

;stmt3:
  ret %Stmt* %2
}

define %Stmt* @stmt_new_assign (%Value* %_l, %Value* %_r, %TokenInfo* %_ti) {
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = call %Stmt* (%StmtKind, %TokenInfo*) @stmtNew (%StmtKind 4, %TokenInfo* %1)

;stmt1:
  %3 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 1
  %4 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %3, i32 0, %Int32 0
  %5 = load %Value*, %Value** %l
  store %Value* %5, %Value** %4

;stmt2:
  %6 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 1
  %7 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %6, i32 0, %Int32 1
  %8 = load %Value*, %Value** %r
  store %Value* %8, %Value** %7

;stmt3:
  %9 = getelementptr inbounds %Stmt, %Stmt* %2, i32 0, i32 7
  %10 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %10, %TokenInfo** %9

;stmt4:
  ret %Stmt* %2
}

define void @asmInit (%Assembly* %_a, %Str %_name) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %name = alloca %Str
  store %Str %_name, %Str* %name

;stmt0:
  %1 = load %Assembly*, %Assembly** %a
  %2 = getelementptr inbounds %Assembly, %Assembly* %1, i32 0, i32 0
  %3 = load %Str, %Str* %name
  store %Str %3, %Str* %2

;stmt1:
  %4 = load %Assembly*, %Assembly** %a
  %5 = getelementptr inbounds %Assembly, %Assembly* %4, i32 0, i32 1
  %6 = call %List* () @map_new ()
  store %List* %6, %List** %5

;stmt2:
  %7 = load %Assembly*, %Assembly** %a
  %8 = getelementptr inbounds %Assembly, %Assembly* %7, i32 0, i32 2
  %9 = call %List* () @map_new ()
  store %List* %9, %List** %8

;stmt3:
  %10 = load %Assembly*, %Assembly** %a
  %11 = getelementptr inbounds %Assembly, %Assembly* %10, i32 0, i32 3
  %12 = call %List* () @map_new ()
  store %List* %12, %List** %11

;stmt4:
  %13 = load %Assembly*, %Assembly** %a
  %14 = getelementptr inbounds %Assembly, %Assembly* %13, i32 0, i32 5
  %15 = call %List* () @map_new ()
  store %List* %15, %List** %14

;stmt5:
  %16 = load %Assembly*, %Assembly** %a
  %17 = getelementptr inbounds %Assembly, %Assembly* %16, i32 0, i32 4
  %18 = call %List* () @map_new ()
  store %List* %18, %List** %17
  ret void
}

define void @asmTypedefAdd (%Assembly* %_a, %Str %_id, %Type* %_t) {
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func201_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %TypeDef, %TypeDef* %2, i32 0, i32 0
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %TypeDef, %TypeDef* %2, i32 0, i32 1
  %10 = load %Type*, %Type** %t
  store %Type* %10, %Type** %9

;stmt4:
  %11 = load %Assembly*, %Assembly** %a
  %12 = getelementptr inbounds %Assembly, %Assembly* %11, i32 0, i32 1
  %13 = load %List*, %List** %12
  %14 = bitcast %TypeDef* %2 to %Unit*
  %15 = call %Bool (%List*, %Unit*) @list_append (%List* %13, %Unit* %14)
  ret void
}

define void @asmStringAdd (%Assembly* %_a, %Str %_id, %Str %_s, %Nat32 %_len) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %s = alloca %Str
  store %Str %_s, %Str* %s
  %len = alloca %Nat32
  store %Nat32 %_len, %Nat32* %len

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 24)
  %2 = bitcast %Unit* %1 to %StringDef*

;stmt1:
  %3 = bitcast %StringDef* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func202_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %StringDef, %StringDef* %2, i32 0, i32 0
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %StringDef, %StringDef* %2, i32 0, i32 1
  %10 = load %Str, %Str* %s
  store %Str %10, %Str* %9

;stmt4:
  %11 = getelementptr inbounds %StringDef, %StringDef* %2, i32 0, i32 2
  %12 = load %Nat32, %Nat32* %len
  store %Nat32 %12, %Nat32* %11

;stmt5:
  %13 = load %Assembly*, %Assembly** %a
  %14 = getelementptr inbounds %Assembly, %Assembly* %13, i32 0, i32 3
  %15 = load %List*, %List** %14
  %16 = bitcast %StringDef* %2 to %Unit*
  %17 = call %Bool (%List*, %Unit*) @list_append (%List* %15, %Unit* %16)
  ret void
}

define void @asmArrayAdd (%Assembly* %_a, %Str %_id, %Type* %_t, %List* %_values) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %id = alloca %Str
  store %Str %_id, %Str* %id
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %values = alloca %List*
  store %List* %_values, %List** %values

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 32)
  %2 = bitcast %Unit* %1 to %ArrayDef*

;stmt1:
  %3 = bitcast %ArrayDef* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func203_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %ArrayDef, %ArrayDef* %2, i32 0, i32 0
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %ArrayDef, %ArrayDef* %2, i32 0, i32 1
  %10 = load %Type*, %Type** %t
  store %Type* %10, %Type** %9

;stmt4:
  %11 = getelementptr inbounds %ArrayDef, %ArrayDef* %2, i32 0, i32 3
  %12 = load %List*, %List** %values
  store %List* %12, %List** %11

;stmt5:
  %13 = load %Assembly*, %Assembly** %a
  %14 = getelementptr inbounds %Assembly, %Assembly* %13, i32 0, i32 2
  %15 = load %List*, %List** %14
  %16 = bitcast %ArrayDef* %2 to %Unit*
  %17 = call %Bool (%List*, %Unit*) @list_append (%List* %15, %Unit* %16)
  ret void
}

define void @asmFuncAdd (%Assembly* %_a, %Str %_id, %Type* %_t, %Block* %_b) {
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func204_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 0
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 1
  %10 = load %Type*, %Type** %t
  store %Type* %10, %Type** %9

;stmt4:
  %11 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 2
  %12 = load %Block*, %Block** %b
  store %Block* %12, %Block** %11

;stmt5:
  %13 = load %Assembly*, %Assembly** %a
  %14 = getelementptr inbounds %Assembly, %Assembly* %13, i32 0, i32 5
  %15 = load %List*, %List** %14
  %16 = bitcast %FuncDef* %2 to %Unit*
  %17 = call %Bool (%List*, %Unit*) @list_append (%List* %15, %Unit* %16)
  ret void
}

define void @asmVarAdd (%Assembly* %_a, %Str %_id, %Type* %_t, %Value* %_init_value) {
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func205_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 0
  %8 = load %Str, %Str* %id
  store %Str %8, %Str* %7

;stmt3:
  %9 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 2
  %10 = load %Value*, %Value** %init_value
  store %Value* %10, %Value** %9

;stmt4:
  %11 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 1
  %12 = load %Type*, %Type** %t
  store %Type* %12, %Type** %11

;stmt5:
  %13 = load %Assembly*, %Assembly** %a
  %14 = getelementptr inbounds %Assembly, %Assembly* %13, i32 0, i32 4
  %15 = load %List*, %List** %14
  %16 = bitcast %VarDef* %2 to %Unit*
  %17 = call %Bool (%List*, %Unit*) @list_append (%List* %15, %Unit* %16)
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
  %3 = load %Unit*, %Unit** %ctx
  %4 = bitcast %Unit* %3 to %Str

;stmt2:
  %5 = load %Str, %Str* %2
  %6 = call %Int32 (%Str, %Str) @strcmp (%Str %5, %Str %4)
  %7 = icmp eq %Int32 %6, 0
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = load %Unit*, %Unit** %data
  ret %Unit* %8
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %10 = inttoptr i64 0 to %Unit*
  ret %Unit* %10
}

define %Bool @ren (%List* %_list, %Str %_id_from, %Str %_id_to) {
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
  %7 = inttoptr i64 0 to %Unit*
  %8 = icmp ne %Unit* %6, %7
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %9 = getelementptr inbounds %ConstDef, %ConstDef* %5, i32 0, i32 0
  %10 = load %Str, %Str* %id_to
  store %Str %10, %Str* %9

;stmt4:
  ret %Bool 1
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  ret %Bool 0
}

define void @asmRename (%Assembly* %_a, %Str %_id_from, %Str %_id_to) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a
  %id_from = alloca %Str
  store %Str %_id_from, %Str* %id_from
  %id_to = alloca %Str
  store %Str %_id_to, %Str* %id_to

;stmt0:
  %1 = load %Assembly*, %Assembly** %a
  %2 = getelementptr inbounds %Assembly, %Assembly* %1, i32 0, i32 5
  %3 = load %List*, %List** %2
  %4 = load %Str, %Str* %id_from
  %5 = load %Str, %Str* %id_to
  %6 = call %Bool (%List*, %Str, %Str) @ren (%List* %3, %Str %4, %Str %5)
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
  %8 = load %Assembly*, %Assembly** %a
  %9 = getelementptr inbounds %Assembly, %Assembly* %8, i32 0, i32 3
  %10 = load %List*, %List** %9
  %11 = load %Str, %Str* %id_from
  %12 = load %Str, %Str* %id_to
  %13 = call %Bool (%List*, %Str, %Str) @ren (%List* %10, %Str %11, %Str %12)
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
ret void
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %15 = load %Assembly*, %Assembly** %a
  %16 = getelementptr inbounds %Assembly, %Assembly* %15, i32 0, i32 2
  %17 = load %List*, %List** %16
  %18 = load %Str, %Str* %id_from
  %19 = load %Str, %Str* %id_to
  %20 = call %Bool (%List*, %Str, %Str) @ren (%List* %17, %Str %18, %Str %19)
  br i1 %20, label %then_2, label %else_2
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
  %3 = load %Str, %Str* @func209_str1
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
  %7 = load %Str, %Str* @func209_str2
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
  %11 = load %Str, %Str* @func209_str3
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
  %15 = load %Str, %Str* @func209_str4
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
  %19 = load %Str, %Str* @func209_str5
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
  %23 = load %Str, %Str* @func209_str6
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
  %27 = load %Str, %Str* @func209_str7
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
  %31 = load %Str, %Str* @func209_str8
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
  %35 = load %Str, %Str* @func209_str9
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
  %39 = load %Str, %Str* @func209_str10
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
  %43 = load %Str, %Str* @func209_str11
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
  %47 = load %Str, %Str* @func209_str12
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
  %51 = load %Str, %Str* @func209_str13
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
  %55 = load %Str, %Str* @func209_str14
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
  %59 = load %Str, %Str* @func209_str15
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
  %63 = load %Str, %Str* @func209_str16
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
  %67 = load %Str, %Str* @func209_str17
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
  %71 = load %Str, %Str* @func209_str18
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
  %75 = load %Str, %Str* @func209_str19
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
  %79 = load %Str, %Str* @func209_str20
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
  %83 = load %Str, %Str* @func209_str21
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
  %87 = load %Str, %Str* @func209_str22
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
  %91 = load %Str, %Str* @func209_str23
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
  %95 = load %Str, %Str* @func209_str24
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
  %99 = load %Str, %Str* @func209_str25
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
  %103 = load %Str, %Str* @func209_str26
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
  %105 = load %Str, %Str* @func209_str27
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
  %3 = load %Str, %Str* @func210_str1
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
  %7 = load %Str, %Str* @func210_str2
  ret %Str %7
  br label %endif_1
else_1:

;stmt6:
  %9 = load %StorageClass, %StorageClass* %c
  %10 = icmp eq %StorageClass %9, 2
  br i1 %10, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %11 = load %Str, %Str* @func210_str3
  ret %Str %11
  br label %endif_2
else_2:

;stmt9:
  %13 = load %StorageClass, %StorageClass* %c
  %14 = icmp eq %StorageClass %13, 6
  br i1 %14, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %15 = load %Str, %Str* @func210_str4
  ret %Str %15
  br label %endif_3
else_3:

;stmt12:
  %17 = load %StorageClass, %StorageClass* %c
  %18 = icmp eq %StorageClass %17, 5
  br i1 %18, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %19 = load %Str, %Str* @func210_str5
  ret %Str %19
  br label %endif_4
else_4:

;stmt15:
  %21 = load %StorageClass, %StorageClass* %c
  %22 = icmp eq %StorageClass %21, 3
  br i1 %22, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %23 = load %Str, %Str* @func210_str6
  ret %Str %23
  br label %endif_5
else_5:

;stmt18:
  %25 = load %StorageClass, %StorageClass* %c
  %26 = icmp eq %StorageClass %25, 4
  br i1 %26, label %then_6, label %else_6
then_6:

;stmt19:

;stmt20:
  %27 = load %Str, %Str* @func210_str7
  ret %Str %27
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
  br label %endif_0
endif_0:

;stmt21:
  %29 = load %Str, %Str* @func210_str8
  ret %Str %29
}

define void @value_show (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Str, %Str* @func211_str1
  %2 = load %Value*, %Value** %v
  %3 = call %Int32 (%Str, ...) @printf (%Str %1, %Value* %2)

;stmt1:
  %4 = load %Str, %Str* @func211_str2
  %5 = load %Value*, %Value** %v
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 0
  %7 = load %ValueKind, %ValueKind* %6
  %8 = call %Str (%ValueKind) @print_value_kind (%ValueKind %7)
  %9 = call %Int32 (%Str, ...) @printf (%Str %4, %Str %8)

;stmt2:
  %10 = load %Str, %Str* @func211_str3
  %11 = call %Int32 (%Str, ...) @printf (%Str %10)

;stmt3:
  %12 = load %Value*, %Value** %v
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  call void (%Type*) @prttype (%Type* %14)

;stmt4:
  %15 = load %Str, %Str* @func211_str4
  %16 = call %Int32 (%Str, ...) @printf (%Str %15)

;stmt5:
  %17 = load %Str, %Str* @func211_str5
  %18 = load %Value*, %Value** %v
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 2
  %20 = getelementptr inbounds %Storage, %Storage* %19, i32 0, i32 0
  %21 = load %StorageClass, %StorageClass* %20
  %22 = call %Str (%StorageClass) @print_storage_class (%StorageClass %21)
  %23 = call %Int32 (%Str, ...) @printf (%Str %17, %Str %22)

;stmt6:
  %24 = load %Str, %Str* @func211_str6
  %25 = load %Value*, %Value** %v
  %26 = getelementptr inbounds %Value, %Value* %25, i32 0, i32 2
  %27 = getelementptr inbounds %Storage, %Storage* %26, i32 0, i32 3
  %28 = load %Str, %Str* %27
  %29 = call %Int32 (%Str, ...) @printf (%Str %24, %Str %28)

;stmt7:
  %30 = load %Str, %Str* @func211_str7
  %31 = load %Value*, %Value** %v
  %32 = getelementptr inbounds %Value, %Value* %31, i32 0, i32 2
  %33 = getelementptr inbounds %Storage, %Storage* %32, i32 0, i32 2
  %34 = load %Nat32, %Nat32* %33
  %35 = call %Int32 (%Str, ...) @printf (%Str %30, %Nat32 %34)

;stmt8:
  %36 = load %Str, %Str* @func211_str8
  %37 = load %Value*, %Value** %v
  %38 = getelementptr inbounds %Value, %Value* %37, i32 0, i32 2
  %39 = getelementptr inbounds %Storage, %Storage* %38, i32 0, i32 1
  %40 = load %Int64, %Int64* %39
  %41 = call %Int32 (%Str, ...) @printf (%Str %36, %Int64 %40)

;stmt9:
  %42 = load %Str, %Str* @func211_str9
  %43 = call %Int32 (%Str, ...) @printf (%Str %42)
  ret void
}

define %Value* @castIfNumericTo (%Value* %_v, %Type* %_t) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 1
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %7 = load %Value*, %Value** %v
  %8 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 1
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
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = bitcast %Type* %3 to %Unit*
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp ne %Unit* %4, %5
  %7 = load %Str, %Str* @func213_str1
  call void (%Bool, %Str) @assert (%Bool %6, %Str %7)

;stmt2:
  %8 = load %Type*, %Type** %t
  %9 = bitcast %Type* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  %12 = load %Str, %Str* @func213_str2
  call void (%Bool, %Str) @assert (%Bool %11, %Str %12)

;stmt3:
  %13 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
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
  %20 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 2
  %21 = getelementptr inbounds %Storage, %Storage* %20, i32 0, i32 1
  %22 = load %Int64, %Int64* %21
  %23 = load %Value*, %Value** %v
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 13
  %25 = load %TokenInfo*, %TokenInfo** %24
  %26 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %18, %Int64 %22, %TokenInfo* %25)
  ret %Value* %26
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  %28 = load %Value*, %Value** %v
  %29 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 1
  %30 = load %Type*, %Type** %29
  %31 = load %Type*, %Type** %t
  %32 = call %Bool (%Type*, %Type*) @naturalConversionIsPossible (%Type* %30, %Type* %31)
  br i1 %32, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %33 = load %Value*, %Value** %v
  %34 = load %Type*, %Type** %t
  %35 = load %Value*, %Value** %v
  %36 = getelementptr inbounds %Value, %Value* %35, i32 0, i32 13
  %37 = load %TokenInfo*, %TokenInfo** %36
  %38 = call %Value* (%Value*, %Type*, %TokenInfo*) @cast (%Value* %33, %Type* %34, %TokenInfo* %37)

;stmt11:
  %39 = call %Type* (%Value*) @checkValue (%Value* %38)

;stmt12:
  ret %Value* %38
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt13:
  %41 = load %Value*, %Value** %v
  ret %Value* %41
}

define %Bool @naturalConversionIsPossible (%Type* %_a, %Type* %_b) {
  %a = alloca %Type*
  store %Type* %_a, %Type** %a
  %b = alloca %Type*
  store %Type* %_b, %Type** %b

;stmt0:
  %1 = load %Type*, %Type** %b
  %2 = getelementptr inbounds %Type, %Type* %1, i32 0, i32 0
  %3 = load %TypeKind, %TypeKind* %2

;stmt1:
  %4 = load %Type*, %Type** %a
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %6 = load %TypeKind, %TypeKind* %5

;stmt2:
  %7 = icmp eq %TypeKind %3, 7
  %8 = icmp eq %TypeKind %6, 7
  %9 = and %Bool %7, %8
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %10 = load %Type*, %Type** %b
  %11 = getelementptr inbounds %Type, %Type* %10, i32 0, i32 7
  %12 = getelementptr inbounds %TypeArray, %TypeArray* %11, i32 0, i32 2
  %13 = load %Bool, %Bool* %12
  %14 = load %Type*, %Type** %a
  %15 = getelementptr inbounds %Type, %Type* %14, i32 0, i32 7
  %16 = getelementptr inbounds %TypeArray, %TypeArray* %15, i32 0, i32 2
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
  %21 = icmp eq %TypeKind %3, 6
  %22 = icmp eq %TypeKind %6, 6
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
  %32 = icmp eq %TypeKind %3, 7
  %33 = icmp eq %TypeKind %6, 6
  %34 = and %Bool %32, %33
  br i1 %34, label %then_5, label %else_5
then_5:

;stmt16:

;stmt17:
  %35 = load %Type*, %Type** %b
  %36 = getelementptr inbounds %Type, %Type* %35, i32 0, i32 7
  %37 = getelementptr inbounds %TypeArray, %TypeArray* %36, i32 0, i32 2
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
  %44 = icmp eq %TypeKind %6, 7
  %45 = icmp eq %TypeKind %3, 6
  %46 = and %Bool %44, %45
  br i1 %46, label %then_7, label %else_7
then_7:

;stmt21:

;stmt22:
  %47 = load %Type*, %Type** %a
  %48 = getelementptr inbounds %Type, %Type* %47, i32 0, i32 7
  %49 = getelementptr inbounds %TypeArray, %TypeArray* %48, i32 0, i32 2
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = inttoptr i64 0 to %Value*
  ret %Value* %5
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %7 = load %ValueKind, %ValueKind* %k
  %8 = icmp eq %ValueKind %7, 2
  br i1 %8, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %9 = load %Value*, %Value** %v
  %10 = load %TokenInfo*, %TokenInfo** %ti
  %11 = call %Value* (%Value*, %TokenInfo*) @un_ref (%Value* %9, %TokenInfo* %10)
  ret %Value* %11
  br label %endif_1
else_1:

;stmt6:
  %13 = load %ValueKind, %ValueKind* %k
  %14 = icmp eq %ValueKind %13, 3
  br i1 %14, label %then_2, label %else_2
then_2:

;stmt7:

;stmt8:
  %15 = load %Value*, %Value** %v
  %16 = load %TokenInfo*, %TokenInfo** %ti
  %17 = call %Value* (%Value*, %TokenInfo*) @un_deref (%Value* %15, %TokenInfo* %16)
  ret %Value* %17
  br label %endif_2
else_2:

;stmt9:
  %19 = load %ValueKind, %ValueKind* %k
  %20 = icmp eq %ValueKind %19, 5
  br i1 %20, label %then_3, label %else_3
then_3:

;stmt10:

;stmt11:
  %21 = load %Value*, %Value** %v
  %22 = load %TokenInfo*, %TokenInfo** %ti
  %23 = call %Value* (%Value*, %TokenInfo*) @un_minus (%Value* %21, %TokenInfo* %22)
  ret %Value* %23
  br label %endif_3
else_3:

;stmt12:
  %25 = load %ValueKind, %ValueKind* %k
  %26 = icmp eq %ValueKind %25, 4
  br i1 %26, label %then_4, label %else_4
then_4:

;stmt13:

;stmt14:
  %27 = load %Value*, %Value** %v
  %28 = load %TokenInfo*, %TokenInfo** %ti
  %29 = call %Value* (%Value*, %TokenInfo*) @un_not (%Value* %27, %TokenInfo* %28)
  ret %Value* %29
  br label %endif_4
else_4:

;stmt15:

;stmt16:
  %31 = load %Str, %Str* @func215_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %31)
  br label %endif_4
endif_4:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:

;stmt17:
  %32 = inttoptr i64 0 to %Value*
  ret %Value* %32
}

define %Value* @un_minus (%Value* %_v, %TokenInfo* %_ti) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 0
  %4 = load %StorageClass, %StorageClass* %3
  %5 = icmp eq %StorageClass %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = load %Value*, %Value** %v
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 2
  %11 = getelementptr inbounds %Storage, %Storage* %10, i32 0, i32 1
  %12 = load %Int64, %Int64* %11
  %13 = sub nsw %Int64 0, %12
  %14 = load %TokenInfo*, %TokenInfo** %ti
  %15 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %8, %Int64 %13, %TokenInfo* %14)
  ret %Value* %15
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %17 = load %TokenInfo*, %TokenInfo** %ti
  %18 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 5, %StorageClass 6, %TokenInfo* %17)

;stmt4:
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 4
  %20 = getelementptr inbounds %ValueUn, %ValueUn* %19, i32 0, i32 0
  %21 = load %Value*, %Value** %v
  store %Value* %21, %Value** %20

;stmt5:
  ret %Value* %18
}

define %Value* @un_not (%Value* %_v, %TokenInfo* %_ti) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 0
  %4 = load %StorageClass, %StorageClass* %3
  %5 = icmp eq %StorageClass %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = load %Value*, %Value** %v
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 2
  %11 = getelementptr inbounds %Storage, %Storage* %10, i32 0, i32 1
  %12 = load %Int64, %Int64* %11
  %13 = xor %Int64 %12, -1
  %14 = load %TokenInfo*, %TokenInfo** %ti
  %15 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %8, %Int64 %13, %TokenInfo* %14)
  ret %Value* %15
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %17 = load %TokenInfo*, %TokenInfo** %ti
  %18 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 4, %StorageClass 6, %TokenInfo* %17)

;stmt4:
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 4
  %20 = getelementptr inbounds %ValueUn, %ValueUn* %19, i32 0, i32 0
  %21 = load %Value*, %Value** %v
  store %Value* %21, %Value** %20

;stmt5:
  ret %Value* %18
}

define %Value* @un_ref (%Value* %_v, %TokenInfo* %_ti) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = call %Bool (%Value*) @valueIsReadonly (%Value* %1)
  br i1 %2, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %3 = load %Str, %Str* @func218_str1
  %4 = load %Value*, %Value** %v
  %5 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 13
  %6 = load %TokenInfo*, %TokenInfo** %5
  call void (%Str, %TokenInfo*) @error (%Str %3, %TokenInfo* %6)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt3:
  %7 = load %TokenInfo*, %TokenInfo** %ti
  %8 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 2, %StorageClass 6, %TokenInfo* %7)

;stmt4:
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 4
  %10 = getelementptr inbounds %ValueUn, %ValueUn* %9, i32 0, i32 0
  %11 = load %Value*, %Value** %v
  store %Value* %11, %Value** %10

;stmt5:
  ret %Value* %8
}

define %Value* @un_deref (%Value* %_v, %TokenInfo* %_ti) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 3, %StorageClass 5, %TokenInfo* %1)

;stmt1:
  %3 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 4
  %4 = getelementptr inbounds %ValueUn, %ValueUn* %3, i32 0, i32 0
  %5 = load %Value*, %Value** %v
  store %Value* %5, %Value** %4

;stmt2:
  ret %Value* %2
}

define %Type* @checkValueUnary (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 4
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt2:
  %t = alloca %Type*

;stmt3:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 0
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
  %12 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 0
  %13 = load %TypeKind, %TypeKind* %12
  %14 = icmp ne %TypeKind %13, 6
  br i1 %14, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %15 = load %Str, %Str* @func220_str1
  %16 = load %Value*, %Value** %v
  %17 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 13
  %18 = load %TokenInfo*, %TokenInfo** %17
  call void (%Str, %TokenInfo*) @error (%Str %15, %TokenInfo* %18)

;stmt12:
  %19 = inttoptr i64 0 to %Type*
  ret %Type* %19
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt13:
  %21 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 6
  %22 = getelementptr inbounds %TypePointer, %TypePointer* %21, i32 0, i32 0
  %23 = load %Type*, %Type** %22
  store %Type* %23, %Type** %t
  br label %endif_1
else_1:

;stmt14:
  %24 = icmp eq %ValueKind %8, 5
  br i1 %24, label %then_3, label %else_3
then_3:

;stmt15:

;stmt16:
  store %Type* %5, %Type** %t
  br label %endif_3
else_3:

;stmt17:
  %25 = icmp eq %ValueKind %8, 4
  br i1 %25, label %then_4, label %else_4
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
  %26 = load %Type*, %Type** %t
  ret %Type* %26
}

define %Bool @binTypeValid (%ValueKind %_k, %Type* %_t) {
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
  %10 = getelementptr inbounds %Type, %Type* %9, i32 0, i32 0
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Value*, %Value** %r
  %6 = bitcast %Value* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
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
  %v = alloca %Value*

;stmt4:
  %11 = load %Value*, %Value** %l
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 2
  %13 = getelementptr inbounds %Storage, %Storage* %12, i32 0, i32 0
  %14 = load %StorageClass, %StorageClass* %13
  %15 = icmp eq %StorageClass %14, 1
  %16 = load %Value*, %Value** %r
  %17 = getelementptr inbounds %Value, %Value* %16, i32 0, i32 2
  %18 = getelementptr inbounds %Storage, %Storage* %17, i32 0, i32 0
  %19 = load %StorageClass, %StorageClass* %18
  %20 = icmp eq %StorageClass %19, 1
  %21 = and %Bool %15, %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %22 = load %ValueKind, %ValueKind* %k
  %23 = load %Value*, %Value** %l
  %24 = load %Value*, %Value** %r
  %25 = load %TokenInfo*, %TokenInfo** %ti
  %26 = call %Value* (%ValueKind, %Value*, %Value*, %TokenInfo*) @binImm (%ValueKind %22, %Value* %23, %Value* %24, %TokenInfo* %25)
  store %Value* %26, %Value** %v
  br label %endif_1
else_1:

;stmt7:

;stmt8:
  %27 = load %ValueKind, %ValueKind* %k
  %28 = load %TokenInfo*, %TokenInfo** %ti
  %29 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind %27, %StorageClass 6, %TokenInfo* %28)
  store %Value* %29, %Value** %v

;stmt9:
  %30 = load %Value*, %Value** %v
  %31 = getelementptr inbounds %Value, %Value* %30, i32 0, i32 5
  %32 = getelementptr inbounds %ValueBin, %ValueBin* %31, i32 0, i32 0
  %33 = load %Value*, %Value** %l
  store %Value* %33, %Value** %32

;stmt10:
  %34 = load %Value*, %Value** %v
  %35 = getelementptr inbounds %Value, %Value* %34, i32 0, i32 5
  %36 = getelementptr inbounds %ValueBin, %ValueBin* %35, i32 0, i32 1
  %37 = load %Value*, %Value** %r
  store %Value* %37, %Value** %36
  br label %endif_1
endif_1:

;stmt11:
  %38 = load %Value*, %Value** %v
  %39 = getelementptr inbounds %Value, %Value* %38, i32 0, i32 13
  %40 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %40, %TokenInfo** %39

;stmt12:
  %41 = load %Value*, %Value** %v
  ret %Value* %41

;stmt13:
  br label %fail
fail:

;stmt14:
  %43 = inttoptr i64 0 to %Value*
  ret %Value* %43
}

define %Value* @binImm (%ValueKind %_k, %Value* %_l, %Value* %_r, %TokenInfo* %_ti) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k
  %l = alloca %Value*
  store %Value* %_l, %Value** %l
  %r = alloca %Value*
  store %Value* %_r, %Value** %r
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %v = alloca %Int64

;stmt1:
  %t = alloca %Type*

;stmt2:
  %1 = load %Value*, %Value** %l
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 1
  %4 = load %Int64, %Int64* %3

;stmt3:
  %5 = load %Value*, %Value** %r
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 2
  %7 = getelementptr inbounds %Storage, %Storage* %6, i32 0, i32 1
  %8 = load %Int64, %Int64* %7

;stmt4:
  %9 = load %Value*, %Value** %l
  %10 = getelementptr inbounds %Value, %Value* %9, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  store %Type* %11, %Type** %t

;stmt5:
  %12 = load %ValueKind, %ValueKind* %k
  %13 = icmp eq %ValueKind %12, 6
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %14 = add %Int64 %4, %8
  store %Int64 %14, %Int64* %v
  br label %endif_0
else_0:

;stmt8:
  %15 = load %ValueKind, %ValueKind* %k
  %16 = icmp eq %ValueKind %15, 7
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %17 = sub %Int64 %4, %8
  store %Int64 %17, %Int64* %v
  br label %endif_1
else_1:

;stmt11:
  %18 = load %ValueKind, %ValueKind* %k
  %19 = icmp eq %ValueKind %18, 8
  br i1 %19, label %then_2, label %else_2
then_2:

;stmt12:

;stmt13:
  %20 = mul %Int64 %4, %8
  store %Int64 %20, %Int64* %v
  br label %endif_2
else_2:

;stmt14:
  %21 = load %ValueKind, %ValueKind* %k
  %22 = icmp eq %ValueKind %21, 9
  br i1 %22, label %then_3, label %else_3
then_3:

;stmt15:

;stmt16:
  %23 = sdiv %Int64 %4, %8
  store %Int64 %23, %Int64* %v
  br label %endif_3
else_3:

;stmt17:
  %24 = load %ValueKind, %ValueKind* %k
  %25 = icmp eq %ValueKind %24, 10
  br i1 %25, label %then_4, label %else_4
then_4:

;stmt18:

;stmt19:
  %26 = srem %Int64 %4, %8
  store %Int64 %26, %Int64* %v
  br label %endif_4
else_4:

;stmt20:
  %27 = load %ValueKind, %ValueKind* %k
  %28 = icmp eq %ValueKind %27, 11
  br i1 %28, label %then_5, label %else_5
then_5:

;stmt21:

;stmt22:
  %29 = or %Int64 %4, %8
  store %Int64 %29, %Int64* %v
  br label %endif_5
else_5:

;stmt23:
  %30 = load %ValueKind, %ValueKind* %k
  %31 = icmp eq %ValueKind %30, 12
  br i1 %31, label %then_6, label %else_6
then_6:

;stmt24:

;stmt25:
  %32 = xor %Int64 %4, %8
  store %Int64 %32, %Int64* %v
  br label %endif_6
else_6:

;stmt26:
  %33 = load %ValueKind, %ValueKind* %k
  %34 = icmp eq %ValueKind %33, 13
  br i1 %34, label %then_7, label %else_7
then_7:

;stmt27:

;stmt28:
  %35 = and %Int64 %4, %8
  store %Int64 %35, %Int64* %v
  br label %endif_7
else_7:

;stmt29:

;stmt30:
  %36 = load %Type*, %Type** @typeBool
  store %Type* %36, %Type** %t

;stmt31:
  %37 = load %ValueKind, %ValueKind* %k
  %38 = icmp eq %ValueKind %37, 14
  br i1 %38, label %then_8, label %else_8
then_8:

;stmt32:

;stmt33:
  %39 = icmp eq %Int64 %4, %8
  %40 = sext %Bool %39 to %Int64
  store %Int64 %40, %Int64* %v
  br label %endif_8
else_8:

;stmt34:
  %41 = load %ValueKind, %ValueKind* %k
  %42 = icmp eq %ValueKind %41, 15
  br i1 %42, label %then_9, label %else_9
then_9:

;stmt35:

;stmt36:
  %43 = icmp ne %Int64 %4, %8
  %44 = sext %Bool %43 to %Int64
  store %Int64 %44, %Int64* %v
  br label %endif_9
else_9:

;stmt37:
  %45 = load %ValueKind, %ValueKind* %k
  %46 = icmp eq %ValueKind %45, 16
  br i1 %46, label %then_10, label %else_10
then_10:

;stmt38:

;stmt39:
  %47 = icmp slt %Int64 %4, %8
  %48 = sext %Bool %47 to %Int64
  store %Int64 %48, %Int64* %v
  br label %endif_10
else_10:

;stmt40:
  %49 = load %ValueKind, %ValueKind* %k
  %50 = icmp eq %ValueKind %49, 17
  br i1 %50, label %then_11, label %else_11
then_11:

;stmt41:

;stmt42:
  %51 = icmp sgt %Int64 %4, %8
  %52 = sext %Bool %51 to %Int64
  store %Int64 %52, %Int64* %v
  br label %endif_11
else_11:

;stmt43:
  %53 = load %ValueKind, %ValueKind* %k
  %54 = icmp eq %ValueKind %53, 18
  br i1 %54, label %then_12, label %else_12
then_12:

;stmt44:

;stmt45:
  %55 = icmp sle %Int64 %4, %8
  %56 = sext %Bool %55 to %Int64
  store %Int64 %56, %Int64* %v
  br label %endif_12
else_12:

;stmt46:
  %57 = load %ValueKind, %ValueKind* %k
  %58 = icmp eq %ValueKind %57, 19
  br i1 %58, label %then_13, label %else_13
then_13:

;stmt47:

;stmt48:
  %59 = icmp sge %Int64 %4, %8
  %60 = sext %Bool %59 to %Int64
  store %Int64 %60, %Int64* %v
  br label %endif_13
else_13:

;stmt49:

;stmt50:
  %61 = load %Str, %Str* @func225_str1
  call void (%Bool, %Str) @assert (%Bool 0, %Str %61)
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
  %62 = load %Type*, %Type** %t
  %63 = load %Int64, %Int64* %v
  %64 = load %TokenInfo*, %TokenInfo** %ti
  %65 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %62, %Int64 %63, %TokenInfo* %64)
  ret %Value* %65
}

define %Type* @checkValueBinary (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 5
  %3 = getelementptr inbounds %ValueBin, %ValueBin* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = load %Value*, %Value** %v
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 5
  %7 = getelementptr inbounds %ValueBin, %ValueBin* %6, i32 0, i32 1
  %8 = load %Value*, %Value** %7

;stmt2:
  %9 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt3:
  %10 = call %Type* (%Value*) @checkValue (%Value* %8)

;stmt4:
  %11 = bitcast %Type* %9 to %Unit*
  %12 = inttoptr i64 0 to %Unit*
  %13 = icmp eq %Unit* %11, %12
  %14 = bitcast %Type* %10 to %Unit*
  %15 = inttoptr i64 0 to %Unit*
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
  %19 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = call %Value* (%Value*, %Type*) @nat (%Value* %4, %Type* %20)

;stmt8:
  %22 = getelementptr inbounds %Value, %Value* %21, i32 0, i32 1
  %23 = load %Type*, %Type** %22
  %24 = call %Value* (%Value*, %Type*) @nat (%Value* %8, %Type* %23)

;stmt9:
  %25 = getelementptr inbounds %Value, %Value* %21, i32 0, i32 1
  %26 = load %Type*, %Type** %25

;stmt10:
  %27 = getelementptr inbounds %Value, %Value* %24, i32 0, i32 1
  %28 = load %Type*, %Type** %27

;stmt11:
  %29 = call %Bool (%Type*, %Type*) @type_eq (%Type* %26, %Type* %28)
  %30 = xor %Bool %29, 1
  br i1 %30, label %then_1, label %else_1
then_1:

;stmt12:

;stmt13:
  %31 = load %Str, %Str* @func226_str1
  %32 = load %Value*, %Value** %v
  %33 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 13
  %34 = load %TokenInfo*, %TokenInfo** %33
  call void (%Str, %TokenInfo*) @error (%Str %31, %TokenInfo* %34)

;stmt14:
  %35 = load %Str, %Str* @func226_str2
  %36 = call %Int32 (%Str, ...) @printf (%Str %35)

;stmt15:
  call void (%Type*) @prttype (%Type* %26)

;stmt16:
  %37 = load %Str, %Str* @func226_str3
  %38 = call %Int32 (%Str, ...) @printf (%Str %37)

;stmt17:
  %39 = load %Str, %Str* @func226_str4
  %40 = call %Int32 (%Str, ...) @printf (%Str %39)

;stmt18:
  call void (%Type*) @prttype (%Type* %28)

;stmt19:
  %41 = load %Str, %Str* @func226_str5
  %42 = call %Int32 (%Str, ...) @printf (%Str %41)

;stmt20:
  br label %fail
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt21:
  %44 = load %Value*, %Value** %v
  %45 = getelementptr inbounds %Value, %Value* %44, i32 0, i32 0
  %46 = load %ValueKind, %ValueKind* %45

;stmt22:
  %47 = call %Bool (%ValueKind, %Type*) @binTypeValid (%ValueKind %46, %Type* %26)
  %48 = xor %Bool %47, 1
  br i1 %48, label %then_2, label %else_2
then_2:

;stmt23:

;stmt24:
  %49 = load %Str, %Str* @func226_str6
  %50 = load %Value*, %Value** %v
  %51 = getelementptr inbounds %Value, %Value* %50, i32 0, i32 13
  %52 = load %TokenInfo*, %TokenInfo** %51
  call void (%Str, %TokenInfo*) @error (%Str %49, %TokenInfo* %52)

;stmt25:
  %53 = inttoptr i64 0 to %Type*
  ret %Type* %53
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt26:
  %55 = load %Value*, %Value** %v
  %56 = getelementptr inbounds %Value, %Value* %55, i32 0, i32 5
  %57 = getelementptr inbounds %ValueBin, %ValueBin* %56, i32 0, i32 0
  store %Value* %21, %Value** %57

;stmt27:
  %58 = load %Value*, %Value** %v
  %59 = getelementptr inbounds %Value, %Value* %58, i32 0, i32 5
  %60 = getelementptr inbounds %ValueBin, %ValueBin* %59, i32 0, i32 1
  store %Value* %24, %Value** %60

;stmt28:
  %61 = call %Bool (%ValueKind) @isReletionOpKind (%ValueKind %46)
  br i1 %61, label %then_3, label %else_3
then_3:

;stmt29:

;stmt30:
  %62 = load %Type*, %Type** @typeBool
  ret %Type* %62
  br label %endif_3
else_3:

;stmt31:

;stmt32:
  %64 = getelementptr inbounds %Value, %Value* %21, i32 0, i32 1
  %65 = load %Type*, %Type** %64
  ret %Type* %65
  br label %endif_3
endif_3:

;stmt33:
  br label %fail
fail:

;stmt34:
  %67 = inttoptr i64 0 to %Type*
  ret %Type* %67
}

define %Value* @shift (%ValueKind %_k, %Value* %_l, %Value* %_r, %TokenInfo* %_ti) {
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Value*, %Value** %r
  %6 = bitcast %Value* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
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
  %retv = alloca %Value*

;stmt4:
  %11 = inttoptr i64 0 to %Value*
  store %Value* %11, %Value** %retv

;stmt5:
  %12 = load %Value*, %Value** %l
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 2
  %14 = getelementptr inbounds %Storage, %Storage* %13, i32 0, i32 0
  %15 = load %StorageClass, %StorageClass* %14
  %16 = icmp eq %StorageClass %15, 1
  %17 = load %Value*, %Value** %r
  %18 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 2
  %19 = getelementptr inbounds %Storage, %Storage* %18, i32 0, i32 0
  %20 = load %StorageClass, %StorageClass* %19
  %21 = icmp eq %StorageClass %20, 1
  %22 = and %Bool %16, %21
  br i1 %22, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %v = alloca %Int64

;stmt8:
  %23 = load %ValueKind, %ValueKind* %k
  %24 = icmp eq %ValueKind %23, 20
  br i1 %24, label %then_2, label %else_2
then_2:

;stmt9:

;stmt10:
  %25 = load %Value*, %Value** %l
  %26 = getelementptr inbounds %Value, %Value* %25, i32 0, i32 2
  %27 = getelementptr inbounds %Storage, %Storage* %26, i32 0, i32 1
  %28 = load %Int64, %Int64* %27
  %29 = load %Value*, %Value** %r
  %30 = getelementptr inbounds %Value, %Value* %29, i32 0, i32 2
  %31 = getelementptr inbounds %Storage, %Storage* %30, i32 0, i32 1
  %32 = load %Int64, %Int64* %31
  %33 = shl %Int64 %28, %32
  store %Int64 %33, %Int64* %v
  br label %endif_2
else_2:

;stmt11:
  %34 = load %ValueKind, %ValueKind* %k
  %35 = icmp eq %ValueKind %34, 21
  br i1 %35, label %then_3, label %else_3
then_3:

;stmt12:

;stmt13:
  %36 = load %Value*, %Value** %l
  %37 = getelementptr inbounds %Value, %Value* %36, i32 0, i32 2
  %38 = getelementptr inbounds %Storage, %Storage* %37, i32 0, i32 1
  %39 = load %Int64, %Int64* %38
  %40 = load %Value*, %Value** %r
  %41 = getelementptr inbounds %Value, %Value* %40, i32 0, i32 2
  %42 = getelementptr inbounds %Storage, %Storage* %41, i32 0, i32 1
  %43 = load %Int64, %Int64* %42
  %44 = ashr %Int64 %39, %43
  store %Int64 %44, %Int64* %v
  br label %endif_3
else_3:
  br label %endif_3
endif_3:
  br label %endif_2
endif_2:

;stmt14:
  %45 = load %Value*, %Value** %l
  %46 = getelementptr inbounds %Value, %Value* %45, i32 0, i32 1
  %47 = load %Type*, %Type** %46
  %48 = load %Int64, %Int64* %v
  %49 = load %TokenInfo*, %TokenInfo** %ti
  %50 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %47, %Int64 %48, %TokenInfo* %49)
  store %Value* %50, %Value** %retv
  br label %endif_1
else_1:

;stmt15:

;stmt16:
  %51 = load %ValueKind, %ValueKind* %k
  %52 = load %TokenInfo*, %TokenInfo** %ti
  %53 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind %51, %StorageClass 6, %TokenInfo* %52)
  store %Value* %53, %Value** %retv

;stmt17:
  %54 = load %Value*, %Value** %retv
  %55 = getelementptr inbounds %Value, %Value* %54, i32 0, i32 5
  %56 = getelementptr inbounds %ValueBin, %ValueBin* %55, i32 0, i32 0
  %57 = load %Value*, %Value** %l
  store %Value* %57, %Value** %56

;stmt18:
  %58 = load %Value*, %Value** %retv
  %59 = getelementptr inbounds %Value, %Value* %58, i32 0, i32 5
  %60 = getelementptr inbounds %ValueBin, %ValueBin* %59, i32 0, i32 1
  %61 = load %Value*, %Value** %r
  store %Value* %61, %Value** %60
  br label %endif_1
endif_1:

;stmt19:
  %62 = load %Value*, %Value** %retv
  ret %Value* %62

;stmt20:
  br label %fail
fail:

;stmt21:
  %64 = inttoptr i64 0 to %Value*
  ret %Value* %64
}

define %Type* @checkValueShift (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 5
  %3 = getelementptr inbounds %ValueBin, %ValueBin* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = load %Value*, %Value** %v
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 5
  %7 = getelementptr inbounds %ValueBin, %ValueBin* %6, i32 0, i32 1
  %8 = load %Value*, %Value** %7

;stmt2:
  %9 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt3:
  %10 = call %Type* (%Value*) @checkValue (%Value* %8)

;stmt4:
  %11 = load %Value*, %Value** %v
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 5
  %13 = getelementptr inbounds %ValueBin, %ValueBin* %12, i32 0, i32 1
  %14 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %15 = load %Type*, %Type** %14
  %16 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 13
  %17 = load %TokenInfo*, %TokenInfo** %16
  %18 = call %Value* (%Value*, %Type*, %TokenInfo*) @cast (%Value* %8, %Type* %15, %TokenInfo* %17)
  store %Value* %18, %Value** %13

;stmt5:
  %19 = load %Value*, %Value** %v
  %20 = getelementptr inbounds %Value, %Value* %19, i32 0, i32 5
  %21 = getelementptr inbounds %ValueBin, %ValueBin* %20, i32 0, i32 1
  %22 = load %Value*, %Value** %21

;stmt6:
  %23 = call %Type* (%Value*) @checkValue (%Value* %22)

;stmt7:
  %24 = load %Type*, %Type** @typeBaseInt
  %25 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %4, %Type* %24)

;stmt8:
  %26 = load %Type*, %Type** @typeBaseInt
  %27 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %22, %Type* %26)

;stmt9:
  %28 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %29 = load %Type*, %Type** %28
  ret %Type* %29
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Value*, %Value** %i
  %6 = bitcast %Value* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
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
  %11 = load %TokenInfo*, %TokenInfo** %ti
  %12 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 23, %StorageClass 5, %TokenInfo* %11)

;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 6
  %14 = getelementptr inbounds %ValueIndex, %ValueIndex* %13, i32 0, i32 0
  %15 = load %Value*, %Value** %a
  store %Value* %15, %Value** %14

;stmt5:
  %16 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 6
  %17 = getelementptr inbounds %ValueIndex, %ValueIndex* %16, i32 0, i32 1
  %18 = load %Value*, %Value** %i
  store %Value* %18, %Value** %17

;stmt6:
  ret %Value* %12

;stmt7:
  br label %fail
fail:

;stmt8:
  %20 = inttoptr i64 0 to %Value*
  ret %Value* %20
}

define %Type* @checkValueIndex (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 6
  %3 = getelementptr inbounds %ValueIndex, %ValueIndex* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = load %Value*, %Value** %v
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 6
  %7 = getelementptr inbounds %ValueIndex, %ValueIndex* %6, i32 0, i32 1
  %8 = load %Value*, %Value** %7

;stmt2:
  %9 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt3:
  %10 = call %Type* (%Value*) @checkValue (%Value* %8)

;stmt4:
  %11 = load %Type*, %Type** @typeBaseInt
  %12 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %4, %Type* %11)

;stmt5:
  %13 = load %Type*, %Type** @typeBaseInt
  %14 = call %Value* (%Value*, %Type*) @castIfNumericTo (%Value* %8, %Type* %13)

;stmt6:
  %15 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %16 = load %Type*, %Type** %15
  %17 = getelementptr inbounds %Type, %Type* %16, i32 0, i32 7
  %18 = getelementptr inbounds %TypeArray, %TypeArray* %17, i32 0, i32 0
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Str, %Str* %fid
  %6 = bitcast %Str %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
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
  %11 = load %TokenInfo*, %TokenInfo** %ti
  %12 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 24, %StorageClass 5, %TokenInfo* %11)

;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 7
  %14 = getelementptr inbounds %ValueAccess, %ValueAccess* %13, i32 0, i32 0
  %15 = load %Value*, %Value** %r
  store %Value* %15, %Value** %14

;stmt5:
  %16 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 7
  %17 = getelementptr inbounds %ValueAccess, %ValueAccess* %16, i32 0, i32 1
  %18 = load %Str, %Str* %fid
  store %Str %18, %Str* %17

;stmt6:
  ret %Value* %12

;stmt7:
  br label %fail
fail:

;stmt8:
  %20 = inttoptr i64 0 to %Value*
  ret %Value* %20
}

define %Type* @checkValueAccess (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 7
  %3 = getelementptr inbounds %ValueAccess, %ValueAccess* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3

;stmt1:
  %5 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt2:
  %record_type = alloca %Type*

;stmt3:
  %6 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 6
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %9 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 6
  %10 = getelementptr inbounds %TypePointer, %TypePointer* %9, i32 0, i32 0
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
  %13 = getelementptr inbounds %Type, %Type* %12, i32 0, i32 0
  %14 = load %TypeKind, %TypeKind* %13
  %15 = icmp ne %TypeKind %14, 5
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %16 = load %Str, %Str* @func232_str1
  %17 = load %Value*, %Value** %v
  %18 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 13
  %19 = load %TokenInfo*, %TokenInfo** %18
  call void (%Str, %TokenInfo*) @error (%Str %16, %TokenInfo* %19)

;stmt11:
  %20 = inttoptr i64 0 to %Type*
  ret %Type* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %22 = load %Type*, %Type** %record_type
  %23 = load %Value*, %Value** %v
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 7
  %25 = getelementptr inbounds %ValueAccess, %ValueAccess* %24, i32 0, i32 1
  %26 = load %Str, %Str* %25
  %27 = call %Field* (%Type*, %Str) @type_record_get_field (%Type* %22, %Str %26)

;stmt13:
  %28 = bitcast %Field* %27 to %Unit*
  %29 = inttoptr i64 0 to %Unit*
  %30 = icmp eq %Unit* %28, %29
  br i1 %30, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %31 = load %Str, %Str* @func232_str2
  %32 = load %Value*, %Value** %v
  %33 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 13
  %34 = load %TokenInfo*, %TokenInfo** %33
  call void (%Str, %TokenInfo*) @error (%Str %31, %TokenInfo* %34)

;stmt16:
  %35 = inttoptr i64 0 to %Type*
  ret %Type* %35
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt17:
  %37 = getelementptr inbounds %Field, %Field* %27, i32 0, i32 1
  %38 = load %Type*, %Type** %37
  ret %Type* %38
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %List*, %List** %a
  %6 = bitcast %List* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
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
  %11 = load %TokenInfo*, %TokenInfo** %ti
  %12 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 22, %StorageClass 6, %TokenInfo* %11)

;stmt4:
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 9
  %14 = getelementptr inbounds %ValueCall, %ValueCall* %13, i32 0, i32 0
  %15 = load %Value*, %Value** %f
  store %Value* %15, %Value** %14

;stmt5:
  %16 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 9
  %17 = getelementptr inbounds %ValueCall, %ValueCall* %16, i32 0, i32 1
  %18 = load %List*, %List** %a
  store %List* %18, %List** %17

;stmt6:
  ret %Value* %12

;stmt7:
  br label %fail
fail:

;stmt8:
  %20 = inttoptr i64 0 to %Value*
  ret %Value* %20
}

define %Type* @checkValueCall (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 9
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
  %9 = load %Str, %Str* @func234_str1
  %10 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 13
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
  %17 = load %Str, %Str* @func234_str2
  %18 = load %Value*, %Value** %v
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 13
  %20 = load %TokenInfo*, %TokenInfo** %19
  call void (%Str, %TokenInfo*) @error (%Str %17, %TokenInfo* %20)

;stmt9:
  %21 = inttoptr i64 0 to %Type*
  ret %Type* %21
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt10:
  %23 = load %Value*, %Value** %v
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 9
  %25 = getelementptr inbounds %ValueCall, %ValueCall* %24, i32 0, i32 1
  %26 = load %List*, %List** %25
  %27 = load %Value*, %Value** %v
  %28 = getelementptr inbounds %Value, %Value* %27, i32 0, i32 13
  %29 = load %TokenInfo*, %TokenInfo** %28
  %30 = call %Bool (%Value*, %List*, %TokenInfo*) @checkParams (%Value* %4, %List* %26, %TokenInfo* %29)

;stmt11:
  %31 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 5
  %32 = getelementptr inbounds %TypeFunc, %TypeFunc* %31, i32 0, i32 1
  %33 = load %Type*, %Type** %32

;stmt12:
  ret %Type* %33
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
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 5
  %5 = getelementptr inbounds %TypeFunc, %TypeFunc* %4, i32 0, i32 0
  %6 = load %List*, %List** %5

;stmt1:
  %7 = load %List*, %List** %a
  %8 = getelementptr inbounds %List, %List* %7, i32 0, i32 2
  %9 = load %Nat64, %Nat64* %8
  %10 = getelementptr inbounds %List, %List* %6, i32 0, i32 2
  %11 = load %Nat64, %Nat64* %10
  %12 = icmp ult %Nat64 %9, %11
  br i1 %12, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %13 = load %Str, %Str* @func235_str1
  %14 = load %TokenInfo*, %TokenInfo** %ti
  call void (%Str, %TokenInfo*) @error (%Str %13, %TokenInfo* %14)

;stmt4:
  ret %Bool 0
  br label %endif_0
else_0:

;stmt5:
  %16 = getelementptr inbounds %List, %List* %6, i32 0, i32 2
  %17 = load %Nat64, %Nat64* %16
  %18 = load %List*, %List** %a
  %19 = getelementptr inbounds %List, %List* %18, i32 0, i32 2
  %20 = load %Nat64, %Nat64* %19
  %21 = icmp ult %Nat64 %17, %20
  br i1 %21, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %22 = load %Value*, %Value** %f
  %23 = getelementptr inbounds %Value, %Value* %22, i32 0, i32 1
  %24 = load %Type*, %Type** %23
  %25 = getelementptr inbounds %Type, %Type* %24, i32 0, i32 5
  %26 = getelementptr inbounds %TypeFunc, %TypeFunc* %25, i32 0, i32 2
  %27 = load %Bool, %Bool* %26
  %28 = xor %Bool %27, 1
  br i1 %28, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %29 = load %Str, %Str* @func235_str2
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
  %31 = getelementptr inbounds %List, %List* %6, i32 0, i32 0
  %32 = load %Node*, %Node** %31
  store %Node* %32, %Node** %pln

;stmt13:
  %33 = load %List*, %List** %a
  %34 = getelementptr inbounds %List, %List* %33, i32 0, i32 0
  %35 = load %Node*, %Node** %34
  store %Node* %35, %Node** %aln

;stmt14:
  br label %continue_0
continue_0:
  %36 = load %Node*, %Node** %pln
  %37 = bitcast %Node* %36 to %Unit*
  %38 = inttoptr i64 0 to %Unit*
  %39 = icmp ne %Unit* %37, %38
  br i1 %39, label %body_0, label %break_0
body_0:

;stmt15:

;stmt16:
  %40 = load %Node*, %Node** %pln
  %41 = getelementptr inbounds %Node, %Node* %40, i32 0, i32 3
  %42 = load %Unit*, %Unit** %41
  %43 = bitcast %Unit* %42 to %Field*

;stmt17:
  %44 = load %Node*, %Node** %aln
  %45 = getelementptr inbounds %Node, %Node* %44, i32 0, i32 3
  %46 = load %Unit*, %Unit** %45
  %47 = bitcast %Unit* %46 to %Value*

;stmt18:
  %48 = call %Type* (%Value*) @checkValue (%Value* %47)

;stmt19:
  %49 = getelementptr inbounds %Field, %Field* %43, i32 0, i32 1
  %50 = load %Type*, %Type** %49
  %51 = call %Value* (%Value*, %Type*) @nat (%Value* %47, %Type* %50)

;stmt20:
  %52 = getelementptr inbounds %Field, %Field* %43, i32 0, i32 1
  %53 = load %Type*, %Type** %52
  %54 = getelementptr inbounds %Value, %Value* %51, i32 0, i32 1
  %55 = load %Type*, %Type** %54
  %56 = call %Bool (%Type*, %Type*) @type_eq (%Type* %53, %Type* %55)
  %57 = xor %Bool %56, 1
  br i1 %57, label %then_3, label %else_3
then_3:

;stmt21:

;stmt22:
  %58 = load %Str, %Str* @func235_str3
  %59 = load %TokenInfo*, %TokenInfo** %ti
  call void (%Str, %TokenInfo*) @error (%Str %58, %TokenInfo* %59)

;stmt23:
  %60 = load %Str, %Str* @func235_str4
  %61 = call %Int32 (%Str, ...) @printf (%Str %60)

;stmt24:
  %62 = getelementptr inbounds %Value, %Value* %51, i32 0, i32 1
  %63 = load %Type*, %Type** %62
  call void (%Type*) @prttype (%Type* %63)

;stmt25:
  %64 = load %Str, %Str* @func235_str5
  %65 = call %Int32 (%Str, ...) @printf (%Str %64)

;stmt26:
  %66 = load %Str, %Str* @func235_str6
  %67 = call %Int32 (%Str, ...) @printf (%Str %66)

;stmt27:
  %68 = getelementptr inbounds %Field, %Field* %43, i32 0, i32 1
  %69 = load %Type*, %Type** %68
  call void (%Type*) @prttype (%Type* %69)

;stmt28:
  %70 = load %Str, %Str* @func235_str7
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
  %78 = getelementptr inbounds %Node, %Node* %77, i32 0, i32 1
  %79 = load %Node*, %Node** %78
  store %Node* %79, %Node** %aln

;stmt33:
  %80 = load %Node*, %Node** %pln
  %81 = getelementptr inbounds %Node, %Node* %80, i32 0, i32 1
  %82 = load %Node*, %Node** %81
  store %Node* %82, %Node** %pln
  br label %continue_0
break_0:

;stmt34:
  br label %continue_1
continue_1:
  %83 = load %Node*, %Node** %aln
  %84 = bitcast %Node* %83 to %Unit*
  %85 = inttoptr i64 0 to %Unit*
  %86 = icmp ne %Unit* %84, %85
  br i1 %86, label %body_1, label %break_1
body_1:

;stmt35:

;stmt36:
  %87 = load %Node*, %Node** %aln
  %88 = getelementptr inbounds %Node, %Node* %87, i32 0, i32 3
  %89 = load %Unit*, %Unit** %88
  %90 = bitcast %Unit* %89 to %Value*

;stmt37:
  %91 = call %Type* (%Value*) @checkValue (%Value* %90)

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
  %99 = getelementptr inbounds %Node, %Node* %98, i32 0, i32 1
  %100 = load %Node*, %Node** %99
  store %Node* %100, %Node** %aln
  br label %continue_1
break_1:

;stmt41:
  ret %Bool 1
}

define %Bool @immCastIsPossible (%Value* %_v, %Type* %_t) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v
  %t = alloca %Type*
  store %Type* %_t, %Type** %t

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 0
  %4 = load %StorageClass, %StorageClass* %3
  %5 = icmp eq %StorageClass %4, 1
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  %5 = load %Type*, %Type** %t
  %6 = bitcast %Type* %5 to %Unit*
  %7 = inttoptr i64 0 to %Unit*
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
  %13 = call %Bool (%Value*, %Type*) @immCastIsPossible (%Value* %11, %Type* %12)
  br i1 %13, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %14 = load %Type*, %Type** %t
  %15 = load %Value*, %Value** %v
  %16 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 2
  %17 = getelementptr inbounds %Storage, %Storage* %16, i32 0, i32 1
  %18 = load %Int64, %Int64* %17
  %19 = load %TokenInfo*, %TokenInfo** %ti
  %20 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %14, %Int64 %18, %TokenInfo* %19)
  ret %Value* %20
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %22 = load %TokenInfo*, %TokenInfo** %ti
  %23 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 25, %StorageClass 6, %TokenInfo* %22)

;stmt7:
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 8
  %25 = getelementptr inbounds %ValueCast, %ValueCast* %24, i32 0, i32 0
  %26 = load %Value*, %Value** %v
  store %Value* %26, %Value** %25

;stmt8:
  %27 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 8
  %28 = getelementptr inbounds %ValueCast, %ValueCast* %27, i32 0, i32 1
  %29 = load %Type*, %Type** %t
  store %Type* %29, %Type** %28

;stmt9:
  ret %Value* %23

;stmt10:
  br label %fail
fail:

;stmt11:
  %31 = inttoptr i64 0 to %Value*
  ret %Value* %31
}

define %Type* @checkValueCast (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 8
  %3 = getelementptr inbounds %ValueCast, %ValueCast* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Type* (%Value*) @checkValue (%Value* %4)

;stmt1:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 8
  %8 = getelementptr inbounds %ValueCast, %ValueCast* %7, i32 0, i32 1
  %9 = load %Type*, %Type** %8

;stmt2:
  ret %Type* %9
}

define %Value* @size_of (%Type* %_t, %TokenInfo* %_ti) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 26, %StorageClass 0, %TokenInfo* %1)

;stmt1:
  %3 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 10
  %4 = load %Type*, %Type** %t
  store %Type* %4, %Type** %3

;stmt2:
  ret %Value* %2
}

define %Type* @checkValueSizeof (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 10
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = load %Str, %Str* @func240_str1
  %8 = load %Value*, %Value** %v
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 13
  %10 = load %TokenInfo*, %TokenInfo** %9
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %11 = load %Value*, %Value** %v
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 1
  %13 = call %Type* (%TypeKind) @type_new (%TypeKind 1)
  store %Type* %13, %Type** %12

;stmt5:
  %14 = load %Value*, %Value** %v
  %15 = getelementptr inbounds %Value, %Value* %14, i32 0, i32 2
  %16 = getelementptr inbounds %Storage, %Storage* %15, i32 0, i32 0
  store %StorageClass 1, %StorageClass* %16

;stmt6:
  %17 = load %Value*, %Value** %v
  %18 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 2
  %19 = getelementptr inbounds %Storage, %Storage* %18, i32 0, i32 1
  %20 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 2
  %21 = load %Nat32, %Nat32* %20
  %22 = sext %Nat32 %21 to %Int64
  store %Int64 %22, %Int64* %19

;stmt7:
  %23 = load %Value*, %Value** %v
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 1
  %25 = load %Type*, %Type** %24
  ret %Type* %25
}

define %Value* @align_of (%Type* %_t, %TokenInfo* %_ti) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 27, %StorageClass 0, %TokenInfo* %1)

;stmt1:
  %3 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 10
  %4 = load %Type*, %Type** %t
  store %Type* %4, %Type** %3

;stmt2:
  ret %Value* %2
}

define %Type* @checkValueAlignof (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 10
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 0
  %5 = load %TypeKind, %TypeKind* %4
  %6 = icmp eq %TypeKind %5, 0
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = load %Str, %Str* @func242_str1
  %8 = load %Value*, %Value** %v
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 13
  %10 = load %TokenInfo*, %TokenInfo** %9
  call void (%Str, %TokenInfo*) @error (%Str %7, %TokenInfo* %10)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %11 = load %Value*, %Value** %v
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 1
  %13 = call %Type* (%TypeKind) @type_new (%TypeKind 1)
  store %Type* %13, %Type** %12

;stmt5:
  %14 = load %Value*, %Value** %v
  %15 = getelementptr inbounds %Value, %Value* %14, i32 0, i32 2
  %16 = getelementptr inbounds %Storage, %Storage* %15, i32 0, i32 0
  store %StorageClass 1, %StorageClass* %16

;stmt6:
  %17 = load %Value*, %Value** %v
  %18 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 2
  %19 = getelementptr inbounds %Storage, %Storage* %18, i32 0, i32 1
  %20 = getelementptr inbounds %Type, %Type* %3, i32 0, i32 2
  %21 = load %Nat32, %Nat32* %20
  %22 = sext %Nat32 %21 to %Int64
  store %Int64 %22, %Int64* %19

;stmt7:
  %23 = load %Value*, %Value** %v
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 1
  %25 = load %Type*, %Type** %24
  ret %Type* %25
}

define %Bool @storageIsConst (%Storage* %_s) {
  %s = alloca %Storage*
  store %Storage* %_s, %Storage** %s

;stmt0:
  %1 = load %Storage*, %Storage** %s
  %2 = getelementptr inbounds %Storage, %Storage* %1, i32 0, i32 0
  %3 = load %StorageClass, %StorageClass* %2

;stmt1:
  %4 = icmp eq %StorageClass %3, 1
  %5 = icmp eq %StorageClass %3, 2
  %6 = icmp eq %StorageClass %3, 0
  %7 = or %Bool %5, %6
  %8 = or %Bool %4, %7
  ret %Bool %8
}

define %Bool @storageIsMutable (%Storage* %_s) {
  %s = alloca %Storage*
  store %Storage* %_s, %Storage** %s

;stmt0:
  %1 = load %Storage*, %Storage** %s
  %2 = getelementptr inbounds %Storage, %Storage* %1, i32 0, i32 0
  %3 = load %StorageClass, %StorageClass* %2

;stmt1:
  %4 = icmp eq %StorageClass %3, 3
  %5 = icmp eq %StorageClass %3, 4
  %6 = icmp eq %StorageClass %3, 5
  %7 = icmp eq %StorageClass %3, 0
  %8 = or %Bool %6, %7
  %9 = or %Bool %5, %8
  %10 = or %Bool %4, %9
  ret %Bool %10
}

define %Bool @storageIsRegister (%Storage* %_s) {
  %s = alloca %Storage*
  store %Storage* %_s, %Storage** %s

;stmt0:
  %1 = load %Storage*, %Storage** %s
  %2 = getelementptr inbounds %Storage, %Storage* %1, i32 0, i32 0
  %3 = load %StorageClass, %StorageClass* %2
  %4 = icmp eq %StorageClass %3, 6
  ret %Bool %4
}

define void @value_init () {

;stmt0:
  %1 = load %Type*, %Type** @typeBool
  %2 = inttoptr i64 0 to %TokenInfo*
  %3 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %1, %Int64 0, %TokenInfo* %2)

;stmt1:
  %4 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  %5 = load %Str, %Str* @func246_str1
  %6 = bitcast %Value* %3 to %Unit*
  %7 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %4, %Str %5, %Unit* %6)

;stmt2:
  %8 = load %Type*, %Type** @typeBool
  %9 = inttoptr i64 0 to %TokenInfo*
  %10 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %8, %Int64 1, %TokenInfo* %9)

;stmt3:
  %11 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  %12 = load %Str, %Str* @func246_str2
  %13 = bitcast %Value* %10 to %Unit*
  %14 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %11, %Str %12, %Unit* %13)

;stmt4:
  %15 = load %Type*, %Type** @typeUnit
  %16 = inttoptr i64 0 to %TokenInfo*
  %17 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %15, %Int64 1, %TokenInfo* %16)

;stmt5:
  %18 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  %19 = load %Str, %Str* @func246_str3
  %20 = bitcast %Value* %17 to %Unit*
  %21 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %18, %Str %19, %Unit* %20)

;stmt6:
  %22 = load %Type*, %Type** @typeFreePtr
  %23 = inttoptr i64 0 to %TokenInfo*
  %24 = call %Value* (%Type*, %Int64, %TokenInfo*) @valueNewImm (%Type* %22, %Int64 0, %TokenInfo* %23)

;stmt7:
  %25 = getelementptr inbounds %List, %List* @globalValueIndex, i32 0
  %26 = load %Str, %Str* @func246_str4
  %27 = bitcast %Value* %24 to %Unit*
  %28 = call %Bool (%List*, %Str, %Unit*) @map_append (%List* %25, %Str %26, %Unit* %27)
  ret void
}

define %Value* @valueNew (%ValueKind %_k, %StorageClass %_sc, %TokenInfo* %_ti) {
  %k = alloca %ValueKind
  store %ValueKind %_k, %ValueKind* %k
  %sc = alloca %StorageClass
  store %StorageClass %_sc, %StorageClass* %sc
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 176)
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func247_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Value* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 176)

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 0
  %10 = load %ValueKind, %ValueKind* %k
  store %ValueKind %10, %ValueKind* %9

;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2
  %12 = getelementptr inbounds %Storage, %Storage* %11, i32 0, i32 0
  %13 = load %StorageClass, %StorageClass* %sc
  store %StorageClass %13, %StorageClass* %12

;stmt5:
  %14 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 13
  %15 = load %TokenInfo*, %TokenInfo** %ti
  store %TokenInfo* %15, %TokenInfo** %14

;stmt6:
  ret %Value* %2
}

define %Value* @valueNewImm (%Type* %_t, %Int64 %_dx, %TokenInfo* %_ti) {
  %t = alloca %Type*
  store %Type* %_t, %Type** %t
  %dx = alloca %Int64
  store %Int64 %_dx, %Int64* %dx
  %ti = alloca %TokenInfo*
  store %TokenInfo* %_ti, %TokenInfo** %ti

;stmt0:
  %1 = load %TokenInfo*, %TokenInfo** %ti
  %2 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 1, %StorageClass 1, %TokenInfo* %1)

;stmt1:
  %3 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 1
  %4 = load %Type*, %Type** %t
  store %Type* %4, %Type** %3

;stmt2:
  %5 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2
  %6 = getelementptr inbounds %Storage, %Storage* %5, i32 0, i32 1
  %7 = load %Int64, %Int64* %dx
  store %Int64 %7, %Int64* %6

;stmt3:
  ret %Value* %2
}

define %Bool @valueIsConst (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2
  %3 = call %Bool (%Storage*) @storageIsConst (%Storage* %2)
  ret %Bool %3
}

define %Bool @valueIsReadonly (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2
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

define void @comment (%Str %_c) {
  %c = alloca %Str
  store %Str %_c, %Str* %c
  ret void
}

define void @parse (%Source* %_src) {
  %src = alloca %Source*
  store %Source* %_src, %Source** %src

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %2 = load %Source*, %Source** %1

;stmt1:
  %3 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %4 = load %Source*, %Source** %src
  store %Source* %4, %Source** %3

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
  %5 = call %Token* () @ctok ()

;stmt7:
  %6 = getelementptr inbounds %Token, %Token* %5, i32 0, i32 0
  %7 = load %TokenType, %TokenType* %6
  %8 = icmp eq %TokenType %7, 6
  br i1 %8, label %then_0, label %else_0
then_0:

;stmt8:

;stmt9:
  %9 = getelementptr inbounds %Token, %Token* %5, i32 0, i32 2
  %10 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %9, i32 0, %Int32 0
  %11 = bitcast %Nat8* %10 to %Str
  call void (%Str) @comment (%Str %11)

;stmt10:
  call void () @skip ()
  br label %endif_0
else_0:

;stmt11:
  %12 = load %Str, %Str* @func255_str1
  %13 = call %Bool (%Str) @match (%Str %12)
  br i1 %13, label %then_1, label %else_1
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
  %15 = load %Str, %Str* @func255_str2
  call void (%Str, %Nat64) @set (%Str %15, %Nat64 0)

;stmt18:
  br label %continue_1
continue_1:
  br i1 1, label %body_1, label %break_1
body_1:

;stmt19:

;stmt20:
  call void () @skip_nl ()

;stmt21:
  %16 = call %Token* () @ctok ()

;stmt22:
  %17 = load %Str, %Str* @func255_str3
  %18 = call %Bool (%Str) @match (%Str %17)
  br i1 %18, label %then_2, label %else_2
then_2:

;stmt23:

;stmt24:
  %19 = call %Stmt* () @parseLet ()
  br label %endif_2
else_2:

;stmt25:
  %20 = load %Str, %Str* @func255_str4
  %21 = call %Bool (%Str) @match (%Str %20)
  br i1 %21, label %then_3, label %else_3
then_3:

;stmt26:

;stmt27:
  call void () @parseTypedef ()
  br label %endif_3
else_3:

;stmt28:
  %22 = load %Str, %Str* @func255_str5
  %23 = call %Bool (%Str) @match (%Str %22)
  br i1 %23, label %then_4, label %else_4
then_4:

;stmt29:

;stmt30:
  call void () @parseExtern ()
  br label %endif_4
else_4:

;stmt31:
  %24 = load %Str, %Str* @func255_str6
  %25 = call %Bool (%Str) @match (%Str %24)
  br i1 %25, label %then_5, label %else_5
then_5:

;stmt32:

;stmt33:
  call void () @parseVardef ()
  br label %endif_5
else_5:

;stmt34:

;stmt35:
  %26 = load %Str, %Str* @func255_str7
  %27 = call %Bool (%Str) @match (%Str %26)
  br i1 %27, label %then_6, label %else_6
then_6:

;stmt36:

;stmt37:
  %28 = load %Str, %Str* @func255_str8
  call void (%Str, %Nat64) @set (%Str %28, %Nat64 1)

;stmt38:
  br label %continue_1
  br label %endif_6
else_6:
  br label %endif_6
endif_6:

;stmt39:
  %30 = load %Str, %Str* @func255_str9
  %31 = call %Bool (%Str) @match (%Str %30)
  br i1 %31, label %then_7, label %else_7
then_7:

;stmt40:

;stmt41:
  br label %continue_1
  br label %endif_7
else_7:
  br label %endif_7
endif_7:

;stmt42:
  %33 = call %Bool () @eof ()
  br i1 %33, label %then_8, label %else_8
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
  %35 = call %Token* () @ctok ()

;stmt48:
  %36 = getelementptr inbounds %Token, %Token* %35, i32 0, i32 0
  %37 = load %TokenType, %TokenType* %36
  %38 = icmp eq %TokenType %37, 1
  br i1 %38, label %then_9, label %else_9
then_9:

;stmt49:

;stmt50:
  %39 = load %Str, %Str* @func255_str10
  %40 = getelementptr inbounds %Token, %Token* %35, i32 0, i32 2
  %41 = bitcast [0 x %Nat8]* %40 to %Str
  %42 = call %Int32 (%Str, %Str) @strcmp (%Str %39, %Str %41)
  %43 = icmp eq %Int32 %42, 0
  %44 = load %Str, %Str* @func255_str11
  %45 = getelementptr inbounds %Token, %Token* %35, i32 0, i32 2
  %46 = bitcast [0 x %Nat8]* %45 to %Str
  %47 = call %Int32 (%Str, %Str) @strcmp (%Str %44, %Str %46)
  %48 = icmp eq %Int32 %47, 0
  %49 = load %Str, %Str* @func255_str12
  %50 = getelementptr inbounds %Token, %Token* %35, i32 0, i32 2
  %51 = bitcast [0 x %Nat8]* %50 to %Str
  %52 = call %Int32 (%Str, %Str) @strcmp (%Str %49, %Str %51)
  %53 = icmp eq %Int32 %52, 0
  %54 = or %Bool %48, %53
  %55 = or %Bool %43, %54
  br i1 %55, label %then_10, label %else_10
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
  %57 = getelementptr inbounds %Token, %Token* %35, i32 0, i32 0
  %58 = load %TokenType, %TokenType* %57
  %59 = icmp eq %TokenType %58, 0
  br i1 %59, label %then_11, label %else_11
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
  %61 = load %Str, %Str* @func255_str13
  call void (%Str, %Nat64) @set (%Str %61, %Nat64 0)
  br label %continue_1
break_1:

;stmt58:
  %62 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  store %Source* %2, %Source** %62
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
  %5 = load %Str, %Str* @func256_str1
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
  %20 = load %Str, %Str* @func256_str2
  %21 = call %Int32 (%Str, ...) @printf (%Str %20, %Str %13)

;stmt13:
  %22 = load %Str, %Str* @func256_str3
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
  %6 = load %Str, %Str* @func257_str1
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
  call void (%Assembly*, %Str, %Type*) @asmTypedefAdd (%Assembly* %23, %Str %1, %Type* %8)
  ret void
}

define %Stmt* @parseLet () {

;stmt0:
  %1 = call %Token* () @ctok ()
  %2 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1

;stmt1:
  %3 = call %Str () @parseId ()

;stmt2:
  %4 = load %Str, %Str* @func258_str1
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
  %16 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 12
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
  %24 = call %Bool (%Value*) @valueIsConst (%Value* %6)
  %25 = xor %Bool %24, 1
  %26 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 2
  %27 = getelementptr inbounds %Storage, %Storage* %26, i32 0, i32 0
  %28 = load %StorageClass, %StorageClass* %27
  %29 = icmp eq %StorageClass %28, 0
  %30 = or %Bool %25, %29
  br i1 %30, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %31 = call %Value* (%ValueKind, %StorageClass, %TokenInfo*) @valueNew (%ValueKind 1, %StorageClass 6, %TokenInfo* %2)

;stmt16:
  %32 = getelementptr inbounds %Value, %Value* %31, i32 0, i32 2
  %33 = getelementptr inbounds %Storage, %Storage* %32, i32 0, i32 3
  store %Str %3, %Str* %33

;stmt17:
  call void (%Str, %Value*) @bind_value_local (%Str %3, %Value* %31)

;stmt18:
  %34 = call %Stmt* (%Value*, %Value*, %TokenInfo*) @stmt_new_let (%Value* %6, %Value* %31, %TokenInfo* %2)

;stmt19:
  ret %Stmt* %34
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt20:
  %36 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 1
  %37 = load %Block*, %Block** %36
  call void (%Block*, %Str, %Value*) @bind_value_in_block (%Block* %37, %Str %3, %Value* %6)

;stmt21:
  %38 = inttoptr i64 0 to %Stmt*
  ret %Stmt* %38
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
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %4 = load %Str, %Str* %3

;stmt2:
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %6 = load %Type*, %Type** %5

;stmt3:
  %7 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %8 = load %Value*, %Value** %7
  %9 = bitcast %Value* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %12 = inttoptr i64 0 to %Value*
  %13 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 3
  %14 = load %TokenInfo*, %TokenInfo** %13
  %15 = call %Value* (%Str, %Type*, %Value*, %TokenInfo*) @create_local_var (%Str %4, %Type* %6, %Value* %12, %TokenInfo* %14)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %16 = inttoptr i64 0 to %Value*
  %17 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 3
  %18 = load %TokenInfo*, %TokenInfo** %17
  call void (%Str, %Type*, %Value*, %TokenInfo*) @create_global_var (%Str %4, %Type* %6, %Value* %16, %TokenInfo* %18)
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
  %3 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 3
  %8 = load %TokenInfo*, %TokenInfo** %7
  call void (%Str, %Type*, %TokenInfo*) @declare (%Str %4, %Type* %6, %TokenInfo* %8)
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
  %5 = load %Str, %Str* @func263_str1
  %6 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)

;stmt4:
  %7 = load %Str, %Str* @func263_str2
  %8 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 0
  %9 = load %TokenType, %TokenType* %8
  %10 = call %Int32 (%Str, ...) @printf (%Str %7, %TokenType %9)

;stmt5:
  %11 = load %Str, %Str* @func263_str3
  %12 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2
  %13 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %12, i32 0, %Int32 0
  %14 = load %Nat8, %Nat8* %13
  %15 = call %Int32 (%Str, ...) @printf (%Str %11, %Nat8 %14)

;stmt6:
  %16 = load %Str, %Str* @func263_str4
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
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  store %Type* %4, %Type** %5
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
  %9 = load %Str, %Str* @func264_str1
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
  %13 = load %Str, %Str* @func264_str2
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

define %Node* @gett () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %2 = load %Source*, %Source** %1
  %3 = getelementptr inbounds %Source, %Source* %2, i32 0, i32 4
  %4 = load %Node*, %Node** %3
  ret %Node* %4
}

define void @sett (%Node* %_tn) {
  %tn = alloca %Node*
  store %Node* %_tn, %Node** %tn

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %2 = load %Source*, %Source** %1
  %3 = getelementptr inbounds %Source, %Source* %2, i32 0, i32 4
  %4 = load %Node*, %Node** %tn
  store %Node* %4, %Node** %3
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
  %1 = load %Str, %Str* @func269_str1
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
  %4 = load %Str, %Str* @func273_str1
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
  %5 = load %Str, %Str* @func274_str1
  %6 = getelementptr inbounds %Nat8, %Str %5, %Int32 0
  %7 = load %Nat8, %Nat8* %6
  %8 = icmp eq %Nat8 %4, %7
  %9 = load %Str, %Str* @func274_str2
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
  %15 = load %Str, %Str* @func274_str3
  %16 = getelementptr inbounds %Nat8, %Str %15, %Int32 0
  %17 = load %Nat8, %Nat8* %16
  %18 = icmp eq %Nat8 %4, %17
  %19 = load %Str, %Str* @func274_str4
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

define void @skipto (%Str %_s) {
  %s = alloca %Str
  store %Str %_s, %Str* %s

;stmt0:
  %1 = load %Str, %Str* @func275_str1
  %2 = inttoptr i64 0 to %TokenInfo*
  call void (%Str, %TokenInfo*) @error (%Str %1, %TokenInfo* %2)

;stmt1:
  %3 = load %Str, %Str* @func275_str2
  %4 = call %Token* () @ctok ()
  %5 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 2
  %6 = call %Int32 (%Str, ...) @printf (%Str %3, [0 x %Nat8]* %5)

;stmt2:
  %7 = load %Str, %Str* @func275_str3
  %8 = load %Str, %Str* %s
  %9 = call %Int32 (%Str, ...) @printf (%Str %7, %Str %8)

;stmt3:
  call void (%Int32) @exit (%Int32 1)
  ret void
}

define %Bool @match (%Str %_s) {
  %s = alloca %Str
  store %Str %_s, %Str* %s

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
  %8 = load %Str, %Str* %s
  %9 = getelementptr inbounds %Token, %Token* %1, i32 0, i32 2
  %10 = bitcast [0 x %Nat8]* %9 to %Str
  %11 = call %Int32 (%Str, %Str) @strcmp (%Str %8, %Str %10)
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
  %4 = call %Token* () @ctok ()

;stmt4:
  %5 = load %Str, %Str* @func277_str1
  %6 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 1
  call void (%Str, %TokenInfo*) @error (%Str %5, %TokenInfo* %6)

;stmt5:
  %7 = load %Str, %Str* @func277_str2
  %8 = load %Str, %Str* %s
  %9 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 2
  %10 = getelementptr inbounds [0 x %Nat8], [0 x %Nat8]* %9, i32 0, %Int32 0
  %11 = call %Int32 (%Str, ...) @printf (%Str %7, %Str %8, %Nat8* %10)

;stmt6:
  %12 = load %Str, %Str* @func277_str3
  %13 = getelementptr inbounds %Token, %Token* %4, i32 0, i32 0
  %14 = load %TokenType, %TokenType* %13
  %15 = call %Int32 (%Str, ...) @printf (%Str %12, %TokenType %14)

;stmt7:
  call void (%Int32) @exit (%Int32 0)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt8:
  ret %Bool %2
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
  %2 = load %Str, %Str* @func280_str1
  %3 = load %Str, %Str* %s
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %3)
  ret void
}

define void @nl () {

;stmt0:
  %1 = load %Str, %Str* @func281_str1
  call void (%Str) @o (%Str %1)
  ret void
}

define void @space () {

;stmt0:
  %1 = load %Str, %Str* @func282_str1
  call void (%Str) @o (%Str %1)
  ret void
}

define void @comma () {

;stmt0:
  %1 = load %Str, %Str* @func283_str1
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

define void @dbg (%Nat32 %_md) {
  %md = alloca %Nat32
  store %Nat32 %_md, %Nat32* %md

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @func285_str1
  %3 = load %Nat32, %Nat32* %md
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Nat32 %3)
  ret void
}

define void @print_md (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Metadata*

;stmt1:
  call void (%Metadata*) @print_metadata (%Metadata* %2)
  ret void
}

define void @print_metadata_list (%List* %_md_list) {
  %md_list = alloca %List*
  store %List* %_md_list, %List** %md_list

;stmt0:
  %1 = load %List*, %List** %md_list
  %2 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %1, %ListForeachHandler @print_md, %Unit* %2)
  ret void
}

define void @print_metadata (%Metadata* %_md) {
  %md = alloca %Metadata*
  store %Metadata* %_md, %Metadata** %md
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp ne %Unit* %2, %3
  %5 = load %Str, %Str* @func289_str1
  call void (%Bool, %Str) @assert (%Bool %4, %Str %5)

;stmt1:
  %6 = load %Bool, %Bool* %print_alias
  %7 = load %Type*, %Type** %t
  %8 = getelementptr inbounds %Type, %Type* %7, i32 0, i32 1
  %9 = load %Str, %Str* %8
  %10 = bitcast %Str %9 to %Unit*
  %11 = inttoptr i64 0 to %Unit*
  %12 = icmp ne %Unit* %10, %11
  %13 = and %Bool %6, %12
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %14 = load %Unit*, %Unit** @fout
  %15 = load %Str, %Str* @func289_str2
  %16 = load %Type*, %Type** %t
  %17 = getelementptr inbounds %Type, %Type* %16, i32 0, i32 1
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
  %22 = getelementptr inbounds %Type, %Type* %21, i32 0, i32 0
  %23 = load %TypeKind, %TypeKind* %22

;stmt6:
  %24 = icmp eq %TypeKind %23, 2
  br i1 %24, label %then_1, label %else_1
then_1:

;stmt7:

;stmt8:
  %25 = load %Unit*, %Unit** @fout
  %26 = load %Str, %Str* @func289_str3
  %27 = load %Type*, %Type** %t
  %28 = getelementptr inbounds %Type, %Type* %27, i32 0, i32 4
  %29 = getelementptr inbounds %TypeBasic, %TypeBasic* %28, i32 0, i32 0
  %30 = load %Str, %Str* %29
  %31 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %25, %Str %26, %Str %30)
  br label %endif_1
else_1:

;stmt9:
  %32 = icmp eq %TypeKind %23, 4
  br i1 %32, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %33 = load %Type*, %Type** @typeEnum
  call void (%Type*, %Bool, %Bool) @printType (%Type* %33, %Bool 1, %Bool 1)
  br label %endif_2
else_2:

;stmt12:
  %34 = icmp eq %TypeKind %23, 5
  br i1 %34, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %35 = load %Type*, %Type** %t
  %36 = getelementptr inbounds %Type, %Type* %35, i32 0, i32 8
  call void (%TypeRecord*) @printTypeRecord (%TypeRecord* %36)
  br label %endif_3
else_3:

;stmt15:
  %37 = icmp eq %TypeKind %23, 7
  br i1 %37, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %38 = load %Type*, %Type** %t
  %39 = getelementptr inbounds %Type, %Type* %38, i32 0, i32 7
  call void (%TypeArray*) @printTypeArray (%TypeArray* %39)
  br label %endif_4
else_4:

;stmt18:
  %40 = icmp eq %TypeKind %23, 6
  br i1 %40, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %41 = load %Type*, %Type** %t
  %42 = getelementptr inbounds %Type, %Type* %41, i32 0, i32 6
  call void (%TypePointer*) @printTypePointer (%TypePointer* %42)
  br label %endif_5
else_5:

;stmt21:
  %43 = icmp eq %TypeKind %23, 3
  br i1 %43, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %44 = load %Type*, %Type** %t
  %45 = getelementptr inbounds %Type, %Type* %44, i32 0, i32 5
  %46 = load %Bool, %Bool* %func_as_ptr
  call void (%TypeFunc*, %Bool) @printTypeFunc (%TypeFunc* %45, %Bool %46)
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

define void @print_struct_field (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
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
  %4 = bitcast %Unit* %3 to %Bool*

;stmt2:
  %5 = load %Bool, %Bool* %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @func291_str1
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %10 = load %Type*, %Type** %9
  call void (%Type*, %Bool, %Bool) @printType (%Type* %10, %Bool 1, %Bool 1)

;stmt6:
  store %Bool 1, %Bool* %4
  ret void
}

define void @printTypeRecord (%TypeRecord* %_r) {
  %r = alloca %TypeRecord*
  store %TypeRecord* %_r, %TypeRecord** %r

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @func290_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  %need_comma = alloca %Bool

;stmt2:
  store %Bool 0, %Bool* %need_comma

;stmt3:
  %4 = load %TypeRecord*, %TypeRecord** %r
  %5 = getelementptr inbounds %TypeRecord, %TypeRecord* %4, i32 0, i32 0
  %6 = load %List*, %List** %5
  %7 = getelementptr inbounds %Bool, %Bool* %need_comma, i32 0
  %8 = bitcast %Bool* %7 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %6, %ListForeachHandler @print_struct_field, %Unit* %8)

;stmt4:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @func290_str2
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10)
  ret void
}

define void @printTypeArray (%TypeArray* %_a) {
  %a = alloca %TypeArray*
  store %TypeArray* %_a, %TypeArray** %a

;stmt0:
  %1 = load %TypeArray*, %TypeArray** %a
  %2 = getelementptr inbounds %TypeArray, %TypeArray* %1, i32 0, i32 0
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = load %TypeArray*, %TypeArray** %a
  %5 = getelementptr inbounds %TypeArray, %TypeArray* %4, i32 0, i32 2
  %6 = load %Bool, %Bool* %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt4:
  %7 = load %Str, %Str* @func292_str1
  call void (%Str) @o (%Str %7)
  br label %endif_0
else_0:

;stmt5:

;stmt6:
  %8 = load %Unit*, %Unit** @fout
  %9 = load %Str, %Str* @func292_str2
  %10 = load %TypeArray*, %TypeArray** %a
  %11 = getelementptr inbounds %TypeArray, %TypeArray* %10, i32 0, i32 1
  %12 = load %Nat32, %Nat32* %11
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Nat32 %12)

;stmt7:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt8:
  %14 = load %Unit*, %Unit** @fout
  %15 = load %Str, %Str* @func292_str3
  %16 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15)
  br label %endif_0
endif_0:
  ret void
}

define void @printTypePointer (%TypePointer* %_p) {
  %p = alloca %TypePointer*
  store %TypePointer* %_p, %TypePointer** %p

;stmt0:
  %1 = load %TypePointer*, %TypePointer** %p
  %2 = getelementptr inbounds %TypePointer, %TypePointer* %1, i32 0, i32 0
  %3 = load %Type*, %Type** %2
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt1:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @func293_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5)
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
  %1 = load %Unit*, %Unit** %ctx
  %2 = bitcast %Unit* %1 to %Bool*

;stmt1:
  %3 = load %Bool, %Bool* %2
  br i1 %3, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %4 = load %Unit*, %Unit** @fout
  %5 = load %Str, %Str* @func295_str1
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %4, %Str %5)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %7 = load %Unit*, %Unit** %data
  %8 = bitcast %Unit* %7 to %Field*
  %9 = getelementptr inbounds %Field, %Field* %8, i32 0, i32 1
  %10 = load %Type*, %Type** %9
  call void (%Type*, %Bool, %Bool) @printType (%Type* %10, %Bool 1, %Bool 1)

;stmt5:
  store %Bool 1, %Bool* %2
  ret void
}

define void @printTypeFunc (%TypeFunc* %_f, %Bool %_func_as_ptr) {
  %f = alloca %TypeFunc*
  store %TypeFunc* %_f, %TypeFunc** %f
  %func_as_ptr = alloca %Bool
  store %Bool %_func_as_ptr, %Bool* %func_as_ptr

;stmt0:
  %1 = load %TypeFunc*, %TypeFunc** %f
  %2 = getelementptr inbounds %TypeFunc, %TypeFunc* %1, i32 0, i32 1
  %3 = load %Type*, %Type** %2
  %4 = load %Type*, %Type** @typeUnit
  %5 = call %Bool (%Type*, %Type*) @type_eq (%Type* %3, %Type* %4)
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @func294_str1
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)
  br label %endif_0
else_0:

;stmt3:

;stmt4:
  %9 = load %TypeFunc*, %TypeFunc** %f
  %10 = getelementptr inbounds %TypeFunc, %TypeFunc* %9, i32 0, i32 1
  %11 = load %Type*, %Type** %10
  call void (%Type*, %Bool, %Bool) @printType (%Type* %11, %Bool 1, %Bool 1)
  br label %endif_0
endif_0:

;stmt5:
  %12 = load %Unit*, %Unit** @fout
  %13 = load %Str, %Str* @func294_str2
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13)

;stmt6:
  %need_comma = alloca %Bool

;stmt7:
  store %Bool 0, %Bool* %need_comma

;stmt8:
  %15 = load %TypeFunc*, %TypeFunc** %f
  %16 = getelementptr inbounds %TypeFunc, %TypeFunc* %15, i32 0, i32 0
  %17 = load %List*, %List** %16
  %18 = getelementptr inbounds %Bool, %Bool* %need_comma, i32 0
  %19 = bitcast %Bool* %18 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %17, %ListForeachHandler @pt_print_param, %Unit* %19)

;stmt9:
  %20 = load %TypeFunc*, %TypeFunc** %f
  %21 = getelementptr inbounds %TypeFunc, %TypeFunc* %20, i32 0, i32 2
  %22 = load %Bool, %Bool* %21
  br i1 %22, label %then_1, label %else_1
then_1:

;stmt10:

;stmt11:
  %23 = load %Str, %Str* @func294_str3
  call void (%Str) @o (%Str %23)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt12:
  %24 = load %Unit*, %Unit** @fout
  %25 = load %Str, %Str* @func294_str4
  %26 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25)

;stmt13:
  %27 = load %Bool, %Bool* %func_as_ptr
  br i1 %27, label %then_2, label %else_2
then_2:

;stmt14:

;stmt15:
  %28 = load %Unit*, %Unit** @fout
  %29 = load %Str, %Str* @func294_str5
  %30 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %28, %Str %29)
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
  %2 = load %Str, %Str* @func297_str1
  %3 = load %Nat32, %Nat32* @stmtno
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Nat32 %3)

;stmt1:
  %5 = load %Nat32, %Nat32* @stmtno
  %6 = add %Nat32 %5, 1
  store %Nat32 %6, %Nat32* @stmtno

;stmt2:
  %7 = load %Stmt*, %Stmt** %s
  %8 = getelementptr inbounds %Stmt, %Stmt* %7, i32 0, i32 0
  %9 = load %StmtKind, %StmtKind* %8

;stmt3:
  %10 = icmp eq %StmtKind %9, 2
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %11 = load %Stmt*, %Stmt** %s
  %12 = getelementptr inbounds %Stmt, %Stmt* %11, i32 0, i32 2
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
  %16 = getelementptr inbounds %Stmt, %Stmt* %15, i32 0, i32 1
  %17 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %16, i32 0, %Int32 0
  %18 = load %Value*, %Value** %17
  %19 = load %Stmt*, %Stmt** %s
  %20 = getelementptr inbounds %Stmt, %Stmt* %19, i32 0, i32 1
  %21 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %20, i32 0, %Int32 1
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
  %25 = getelementptr inbounds %Stmt, %Stmt* %24, i32 0, i32 1
  %26 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %25, i32 0, %Int32 0
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
  %30 = getelementptr inbounds %Stmt, %Stmt* %29, i32 0, i32 3
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
  %34 = getelementptr inbounds %Stmt, %Stmt* %33, i32 0, i32 1
  %35 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %34, i32 0, %Int32 0
  %36 = load %Value*, %Value** %35
  %37 = load %Stmt*, %Stmt** %s
  %38 = getelementptr inbounds %Stmt, %Stmt* %37, i32 0, i32 1
  %39 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %38, i32 0, %Int32 1
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
  %43 = getelementptr inbounds %Stmt, %Stmt* %42, i32 0, i32 5
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
  %47 = getelementptr inbounds %Stmt, %Stmt* %46, i32 0, i32 4
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
  %51 = getelementptr inbounds %Stmt, %Stmt* %50, i32 0, i32 1
  %52 = getelementptr inbounds [2 x %Value*], [2 x %Value*]* %51, i32 0, %Int32 0
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
  %58 = getelementptr inbounds %Stmt, %Stmt* %57, i32 0, i32 6
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
  %62 = getelementptr inbounds %Stmt, %Stmt* %61, i32 0, i32 6
  %63 = load %Str, %Str* %62
  call void (%Str) @print_stmt_label (%Str %63)
  br label %endif_11
else_11:

;stmt39:

;stmt40:
  %64 = load %Unit*, %Unit** @fout
  %65 = load %Str, %Str* @func297_str2
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
  %2 = load %Str, %Str* @func298_str1
  %3 = load %VarDef*, %VarDef** %v
  %4 = getelementptr inbounds %VarDef, %VarDef* %3, i32 0, i32 0
  %5 = load %Str, %Str* %4
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %5)

;stmt1:
  %7 = load %VarDef*, %VarDef** %v
  %8 = getelementptr inbounds %VarDef, %VarDef* %7, i32 0, i32 1
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
  %5 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 2
  %6 = getelementptr inbounds %Storage, %Storage* %5, i32 0, i32 2
  %7 = getelementptr inbounds %Value, %Value* %3, i32 0, i32 2
  %8 = getelementptr inbounds %Storage, %Storage* %7, i32 0, i32 2
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
  %5 = getelementptr inbounds %If, %If* %4, i32 0, i32 0
  %6 = load %Value*, %Value** %5
  %7 = call %Value* (%Value*) @eval (%Value* %6)
  %8 = call %Value* (%Value*) @load (%Value* %7)

;stmt3:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @func301_str1
  %11 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10)

;stmt4:
  call void (%Value*) @print_value (%Value* %8)

;stmt5:
  %12 = load %Unit*, %Unit** @fout
  %13 = load %Str, %Str* @func301_str2
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %12, %Str %13, %Nat32 %1, %Nat32 %1)

;stmt6:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @func301_str3
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16, %Nat32 %1)

;stmt7:
  %18 = load %If*, %If** %i
  %19 = getelementptr inbounds %If, %If* %18, i32 0, i32 1
  %20 = load %Stmt*, %Stmt** %19
  call void (%Stmt*) @print_stmt (%Stmt* %20)

;stmt8:
  %21 = load %Unit*, %Unit** @fout
  %22 = load %Str, %Str* @func301_str4
  %23 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22, %Nat32 %1)

;stmt9:
  %24 = load %Unit*, %Unit** @fout
  %25 = load %Str, %Str* @func301_str5
  %26 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25, %Nat32 %1)

;stmt10:
  %27 = load %If*, %If** %i
  %28 = getelementptr inbounds %If, %If* %27, i32 0, i32 2
  %29 = load %Stmt*, %Stmt** %28
  %30 = bitcast %Stmt* %29 to %Unit*
  %31 = inttoptr i64 0 to %Unit*
  %32 = icmp ne %Unit* %30, %31
  br i1 %32, label %then_0, label %else_0
then_0:

;stmt11:

;stmt12:
  %33 = load %If*, %If** %i
  %34 = getelementptr inbounds %If, %If* %33, i32 0, i32 2
  %35 = load %Stmt*, %Stmt** %34
  call void (%Stmt*) @print_stmt (%Stmt* %35)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt13:
  %36 = load %Unit*, %Unit** @fout
  %37 = load %Str, %Str* @func301_str6
  %38 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %36, %Str %37, %Nat32 %1)

;stmt14:
  %39 = load %Unit*, %Unit** @fout
  %40 = load %Str, %Str* @func301_str7
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
  %6 = load %Str, %Str* @func302_str1
  %7 = load %Nat32, %Nat32* @while_id
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %5, %Str %6, %Nat32 %7)

;stmt4:
  %9 = load %Unit*, %Unit** @fout
  %10 = load %Str, %Str* @func302_str2
  %11 = load %Nat32, %Nat32* @while_id
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %9, %Str %10, %Nat32 %11)

;stmt5:
  %13 = load %While*, %While** %w
  %14 = getelementptr inbounds %While, %While* %13, i32 0, i32 0
  %15 = load %Value*, %Value** %14
  %16 = call %Value* (%Value*) @eval (%Value* %15)
  %17 = call %Value* (%Value*) @load (%Value* %16)

;stmt6:
  %18 = load %Unit*, %Unit** @fout
  %19 = load %Str, %Str* @func302_str3
  %20 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %18, %Str %19)

;stmt7:
  call void (%Value*) @print_value (%Value* %17)

;stmt8:
  %21 = load %Unit*, %Unit** @fout
  %22 = load %Str, %Str* @func302_str4
  %23 = load %Nat32, %Nat32* @while_id
  %24 = load %Nat32, %Nat32* @while_id
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22, %Nat32 %23, %Nat32 %24)

;stmt9:
  %26 = load %Unit*, %Unit** @fout
  %27 = load %Str, %Str* @func302_str5
  %28 = load %Nat32, %Nat32* @while_id
  %29 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %26, %Str %27, %Nat32 %28)

;stmt10:
  %30 = load %While*, %While** %w
  %31 = getelementptr inbounds %While, %While* %30, i32 0, i32 1
  %32 = load %Stmt*, %Stmt** %31
  call void (%Stmt*) @print_stmt (%Stmt* %32)

;stmt11:
  %33 = load %Unit*, %Unit** @fout
  %34 = load %Str, %Str* @func302_str6
  %35 = load %Nat32, %Nat32* @while_id
  %36 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %33, %Str %34, %Nat32 %35)

;stmt12:
  %37 = load %Unit*, %Unit** @fout
  %38 = load %Str, %Str* @func302_str7
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
  %3 = inttoptr i64 0 to %Unit*
  %4 = icmp eq %Unit* %2, %3
  br i1 %4, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %5 = call %Nat32 () @lab_get ()

;stmt3:
  %6 = load %Str, %Str* @func303_str1
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
  %12 = load %Str, %Str* @func303_str2
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12)

;stmt7:
  %14 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
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
  %3 = load %Str, %Str* @func304_str1
  %4 = load %Nat32, %Nat32* @while_id
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Nat32 %4)
  ret void
}

define void @print_stmt_continue () {

;stmt0:
  %1 = call %Nat32 () @lab_get ()

;stmt1:
  %2 = load %Unit*, %Unit** @fout
  %3 = load %Str, %Str* @func305_str1
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
  %3 = load %Str, %Str* @func306_str1
  %4 = load %Str, %Str* %l
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %2, %Str %3, %Str %4)
  ret void
}

define void @print_stmt_label (%Str %_l) {
  %l = alloca %Str
  store %Str %_l, %Str* %l

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @func307_str1
  %3 = load %Str, %Str* %l
  %4 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2, %Str %3)

;stmt1:
  %5 = load %Unit*, %Unit** @fout
  %6 = load %Str, %Str* @func307_str2
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
  %2 = getelementptr inbounds %Block, %Block* %1, i32 0, i32 1
  %3 = load %List*, %List** %2
  %4 = inttoptr i64 0 to %Unit*
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
  %2 = load %Str, %Str* @func310_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  %4 = load %Value*, %Value** %v
  %5 = getelementptr inbounds %Value, %Value* %4, i32 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %Type, %Type* %6, i32 0, i32 6
  %8 = getelementptr inbounds %TypePointer, %TypePointer* %7, i32 0, i32 0
  %9 = load %Type*, %Type** %8
  call void (%Type*, %Bool, %Bool) @printType (%Type* %9, %Bool 1, %Bool 1)

;stmt2:
  call void () @comma ()

;stmt3:
  %10 = load %Value*, %Value** %v
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  call void (%Type*, %Bool, %Bool) @printType (%Type* %12, %Bool 1, %Bool 1)

;stmt4:
  call void () @space ()

;stmt5:
  %13 = load %Value*, %Value** %v
  call void (%Value*) @print_value (%Value* %13)

;stmt6:
  %14 = load %Unit*, %Unit** @fout
  %15 = load %Str, %Str* @func310_str2
  %16 = load %Nat32, %Nat32* %ino
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15, %Nat32 %16)
  ret void
}

define void @print_value (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 0
  %4 = load %StorageClass, %StorageClass* %3

;stmt1:
  %5 = icmp eq %StorageClass %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @func311_str1
  %8 = load %Value*, %Value** %v
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 2
  %10 = getelementptr inbounds %Storage, %Storage* %9, i32 0, i32 1
  %11 = load %Int64, %Int64* %10
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7, %Int64 %11)
  br label %endif_0
else_0:

;stmt4:
  %13 = icmp eq %StorageClass %4, 6
  %14 = icmp eq %StorageClass %4, 5
  %15 = or %Bool %13, %14
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt5:

;stmt6:
  %16 = load %Unit*, %Unit** @fout
  %17 = load %Str, %Str* @func311_str2
  %18 = load %Value*, %Value** %v
  %19 = getelementptr inbounds %Value, %Value* %18, i32 0, i32 2
  %20 = getelementptr inbounds %Storage, %Storage* %19, i32 0, i32 2
  %21 = load %Nat32, %Nat32* %20
  %22 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %16, %Str %17, %Nat32 %21)
  br label %endif_1
else_1:

;stmt7:
  %23 = icmp eq %StorageClass %4, 4
  %24 = icmp eq %StorageClass %4, 2
  %25 = or %Bool %23, %24
  br i1 %25, label %then_2, label %else_2
then_2:

;stmt8:

;stmt9:
  %26 = load %Unit*, %Unit** @fout
  %27 = load %Str, %Str* @func311_str3
  %28 = load %Value*, %Value** %v
  %29 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 2
  %30 = getelementptr inbounds %Storage, %Storage* %29, i32 0, i32 3
  %31 = load %Str, %Str* %30
  %32 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %26, %Str %27, %Str %31)
  br label %endif_2
else_2:

;stmt10:
  %33 = icmp eq %StorageClass %4, 3
  br i1 %33, label %then_3, label %else_3
then_3:

;stmt11:

;stmt12:
  %34 = load %Unit*, %Unit** @fout
  %35 = load %Str, %Str* @func311_str4
  %36 = load %Value*, %Value** %v
  %37 = getelementptr inbounds %Value, %Value* %36, i32 0, i32 2
  %38 = getelementptr inbounds %Storage, %Storage* %37, i32 0, i32 3
  %39 = load %Str, %Str* %38
  %40 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %34, %Str %35, %Str %39)
  br label %endif_3
else_3:

;stmt13:
  %41 = icmp eq %StorageClass %4, 0
  br i1 %41, label %then_4, label %else_4
then_4:

;stmt14:

;stmt15:
  %42 = load %Unit*, %Unit** @fout
  %43 = load %Str, %Str* @func311_str5
  %44 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %42, %Str %43)
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

define %Value* @eval (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 0
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

define %Value* @loadImmPtr (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 1
  %3 = load %Type*, %Type** %2

;stmt1:
  %4 = call %Nat32 () @lab_get ()

;stmt2:
  %5 = load %Unit*, %Unit** @fout
  %6 = load %Str, %Str* @func313_str1
  %7 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %5, %Str %6, %Nat32 %4)

;stmt3:
  %8 = load %Value*, %Value** %v
  call void (%Value*) @print_value (%Value* %8)

;stmt4:
  %9 = load %Str, %Str* @func313_str2
  call void (%Str) @o (%Str %9)

;stmt5:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %3, %Bool 1, %Bool 1)

;stmt6:
  %10 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %3, %StorageClass 6, %Nat32 %4)
  ret %Value* %10
}

define %Value* @load (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 2
  %3 = getelementptr inbounds %Storage, %Storage* %2, i32 0, i32 0
  %4 = load %StorageClass, %StorageClass* %3
  %5 = icmp eq %StorageClass %4, 1
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt1:

;stmt2:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = call %Bool (%Type*) @typeIsReference (%Type* %8)
  br i1 %9, label %then_1, label %else_1
then_1:

;stmt3:

;stmt4:
  %10 = load %Value*, %Value** %v
  %11 = call %Value* (%Value*) @loadImmPtr (%Value* %10)
  ret %Value* %11
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %13 = load %Value*, %Value** %v
  %14 = getelementptr inbounds %Value, %Value* %13, i32 0, i32 2
  %15 = call %Bool (%Storage*) @storageIsMutable (%Storage* %14)
  %16 = xor %Bool %15, 1
  br i1 %16, label %then_2, label %else_2
then_2:

;stmt6:

;stmt7:
  %17 = load %Value*, %Value** %v
  ret %Value* %17
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt8:
  %19 = call %Nat32 () @lab_get ()

;stmt9:
  %20 = load %Unit*, %Unit** @fout
  %21 = load %Str, %Str* @func314_str1
  %22 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %20, %Str %21, %Nat32 %19)

;stmt10:
  %23 = load %Value*, %Value** %v
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 1
  %25 = load %Type*, %Type** %24
  call void (%Type*, %Bool, %Bool) @printType (%Type* %25, %Bool 1, %Bool 1)

;stmt11:
  call void () @comma ()

;stmt12:
  %26 = load %Value*, %Value** %v
  %27 = getelementptr inbounds %Value, %Value* %26, i32 0, i32 1
  %28 = load %Type*, %Type** %27
  call void (%Type*, %Bool, %Bool) @printType (%Type* %28, %Bool 1, %Bool 1)

;stmt13:
  %29 = load %Str, %Str* @func314_str2
  call void (%Str) @o (%Str %29)

;stmt14:
  %30 = load %Value*, %Value** %v
  call void (%Value*) @print_value (%Value* %30)

;stmt15:
  %31 = load %Value*, %Value** %v
  %32 = getelementptr inbounds %Value, %Value* %31, i32 0, i32 1
  %33 = load %Type*, %Type** %32
  %34 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %33, %StorageClass 6, %Nat32 %19)
  ret %Value* %34
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
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = load %Unit*, %Unit** %ctx
  %4 = bitcast %Unit* %3 to %PrintArgsCtx*

;stmt2:
  %5 = getelementptr inbounds %PrintArgsCtx, %PrintArgsCtx* %4, i32 0, i32 0
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
  %7 = getelementptr inbounds %PrintArgsCtx, %PrintArgsCtx* %4, i32 0, i32 1
  %8 = load %Node*, %Node** %7
  %9 = bitcast %Node* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt6:

;stmt7:
  %12 = getelementptr inbounds %PrintArgsCtx, %PrintArgsCtx* %4, i32 0, i32 1
  %13 = load %Node*, %Node** %12
  %14 = getelementptr inbounds %Node, %Node* %13, i32 0, i32 3
  %15 = load %Unit*, %Unit** %14
  %16 = bitcast %Unit* %15 to %Field*
  %17 = getelementptr inbounds %Field, %Field* %16, i32 0, i32 1
  %18 = load %Type*, %Type** %17
  call void (%Type*, %Bool, %Bool) @printType (%Type* %18, %Bool 1, %Bool 1)

;stmt8:
  %19 = getelementptr inbounds %PrintArgsCtx, %PrintArgsCtx* %4, i32 0, i32 1
  %20 = getelementptr inbounds %PrintArgsCtx, %PrintArgsCtx* %4, i32 0, i32 1
  %21 = load %Node*, %Node** %20
  %22 = getelementptr inbounds %Node, %Node* %21, i32 0, i32 1
  %23 = load %Node*, %Node** %22
  store %Node* %23, %Node** %19
  br label %endif_1
else_1:

;stmt9:

;stmt10:
  %24 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 1
  %25 = load %Type*, %Type** %24
  call void (%Type*, %Bool, %Bool) @printType (%Type* %25, %Bool 1, %Bool 1)
  br label %endif_1
endif_1:

;stmt11:
  call void () @space ()

;stmt12:
  call void (%Value*) @print_value (%Value* %2)

;stmt13:
  %26 = getelementptr inbounds %PrintArgsCtx, %PrintArgsCtx* %4, i32 0, i32 0
  store %Bool 1, %Bool* %26
  ret void
}

define %Value* @eval_call (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 9
  %3 = getelementptr inbounds %ValueCall, %ValueCall* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)

;stmt1:
  %6 = call %Value* (%Value*) @load (%Value* %5)

;stmt2:
  %7 = call %List* () @map_new ()

;stmt3:
  %8 = load %Value*, %Value** %v
  %9 = getelementptr inbounds %Value, %Value* %8, i32 0, i32 9
  %10 = getelementptr inbounds %ValueCall, %ValueCall* %9, i32 0, i32 1
  %11 = load %List*, %List** %10
  %12 = bitcast %List* %7 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %11, %ListForeachHandler @eval_args, %Unit* %12)

;stmt4:
  %retval_reg = alloca %Nat32

;stmt5:
  %13 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i32 0, i32 5
  %16 = getelementptr inbounds %TypeFunc, %TypeFunc* %15, i32 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = load %Type*, %Type** @typeUnit
  %19 = call %Bool (%Type*, %Type*) @type_eq (%Type* %17, %Type* %18)
  br i1 %19, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %20 = load %Unit*, %Unit** @fout
  %21 = load %Str, %Str* @func315_str1
  %22 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %20, %Str %21)
  br label %endif_0
else_0:

;stmt8:

;stmt9:
  %23 = call %Nat32 () @lab_get ()
  store %Nat32 %23, %Nat32* %retval_reg

;stmt10:
  %24 = load %Unit*, %Unit** @fout
  %25 = load %Str, %Str* @func315_str2
  %26 = load %Nat32, %Nat32* %retval_reg
  %27 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25, %Nat32 %26)
  br label %endif_0
endif_0:

;stmt11:
  %28 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %29 = load %Type*, %Type** %28
  call void (%Type*, %Bool, %Bool) @printType (%Type* %29, %Bool 0, %Bool 0)

;stmt12:
  call void () @space ()

;stmt13:
  call void (%Value*) @print_value (%Value* %6)

;stmt14:
  %30 = load %Str, %Str* @func315_str3
  call void (%Str) @o (%Str %30)

;stmt15:
  %pac = alloca %PrintArgsCtx

;stmt16:
  %31 = getelementptr inbounds %PrintArgsCtx, %PrintArgsCtx* %pac, i32 0, i32 0
  store %Bool 0, %Bool* %31

;stmt17:
  %32 = getelementptr inbounds %PrintArgsCtx, %PrintArgsCtx* %pac, i32 0, i32 1
  %33 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %34 = load %Type*, %Type** %33
  %35 = getelementptr inbounds %Type, %Type* %34, i32 0, i32 5
  %36 = getelementptr inbounds %TypeFunc, %TypeFunc* %35, i32 0, i32 0
  %37 = load %List*, %List** %36
  %38 = getelementptr inbounds %List, %List* %37, i32 0, i32 0
  %39 = load %Node*, %Node** %38
  store %Node* %39, %Node** %32

;stmt18:
  %40 = getelementptr inbounds %PrintArgsCtx, %PrintArgsCtx* %pac, i32 0
  %41 = bitcast %PrintArgsCtx* %40 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %7, %ListForeachHandler @print_args, %Unit* %41)

;stmt19:
  %42 = load %Str, %Str* @func315_str4
  call void (%Str) @o (%Str %42)

;stmt20:
  %43 = load %Value*, %Value** %v
  %44 = getelementptr inbounds %Value, %Value* %43, i32 0, i32 1
  %45 = load %Type*, %Type** %44
  %46 = load %Nat32, %Nat32* %retval_reg
  %47 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %45, %StorageClass 6, %Nat32 %46)
  ret %Value* %47
}

define %Value* @eval_index (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %a = alloca %Value*

;stmt1:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 6
  %3 = getelementptr inbounds %ValueIndex, %ValueIndex* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)
  store %Value* %5, %Value** %a

;stmt2:
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 6
  %8 = getelementptr inbounds %ValueIndex, %ValueIndex* %7, i32 0, i32 1
  %9 = load %Value*, %Value** %8
  %10 = call %Value* (%Value*) @eval (%Value* %9)
  %11 = call %Value* (%Value*) @load (%Value* %10)

;stmt3:
  %12 = load %Value*, %Value** %a
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i32 0, i32 7
  %16 = getelementptr inbounds %TypeArray, %TypeArray* %15, i32 0, i32 2
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
  %22 = load %Str, %Str* @func318_str1
  %23 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22, %Nat32 %20)

;stmt8:
  %24 = load %Value*, %Value** %a
  %25 = getelementptr inbounds %Value, %Value* %24, i32 0, i32 1
  %26 = load %Type*, %Type** %25
  %27 = getelementptr inbounds %Type, %Type* %26, i32 0, i32 7
  %28 = getelementptr inbounds %TypeArray, %TypeArray* %27, i32 0, i32 2
  %29 = load %Bool, %Bool* %28
  br i1 %29, label %then_1, label %else_1
then_1:

;stmt9:

;stmt10:
  %30 = load %Value*, %Value** %v
  %31 = getelementptr inbounds %Value, %Value* %30, i32 0, i32 1
  %32 = load %Type*, %Type** %31
  call void (%Type*, %Bool, %Bool) @printType (%Type* %32, %Bool 1, %Bool 1)
  br label %endif_1
else_1:

;stmt11:

;stmt12:
  %33 = load %Value*, %Value** %a
  %34 = getelementptr inbounds %Value, %Value* %33, i32 0, i32 1
  %35 = load %Type*, %Type** %34
  call void (%Type*, %Bool, %Bool) @printType (%Type* %35, %Bool 1, %Bool 1)
  br label %endif_1
endif_1:

;stmt13:
  call void () @comma ()

;stmt14:
  %36 = load %Value*, %Value** %a
  %37 = getelementptr inbounds %Value, %Value* %36, i32 0, i32 1
  %38 = load %Type*, %Type** %37
  call void (%Type*, %Bool, %Bool) @printType (%Type* %38, %Bool 1, %Bool 1)

;stmt15:
  %39 = load %Value*, %Value** %a
  %40 = getelementptr inbounds %Value, %Value* %39, i32 0, i32 1
  %41 = load %Type*, %Type** %40
  %42 = getelementptr inbounds %Type, %Type* %41, i32 0, i32 7
  %43 = getelementptr inbounds %TypeArray, %TypeArray* %42, i32 0, i32 2
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
  %45 = load %Str, %Str* @func318_str2
  call void (%Str) @o (%Str %45)
  br label %endif_2
endif_2:

;stmt20:
  %46 = load %Value*, %Value** %a
  call void (%Value*) @print_value (%Value* %46)

;stmt21:
  %47 = load %Value*, %Value** %a
  %48 = getelementptr inbounds %Value, %Value* %47, i32 0, i32 1
  %49 = load %Type*, %Type** %48
  %50 = getelementptr inbounds %Type, %Type* %49, i32 0, i32 7
  %51 = getelementptr inbounds %TypeArray, %TypeArray* %50, i32 0, i32 2
  %52 = load %Bool, %Bool* %51
  %53 = xor %Bool %52, 1
  br i1 %53, label %then_3, label %else_3
then_3:

;stmt22:

;stmt23:
  %54 = load %Str, %Str* @func318_str3
  call void (%Str) @o (%Str %54)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt24:
  call void () @comma ()

;stmt25:
  %55 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 1
  %56 = load %Type*, %Type** %55
  call void (%Type*, %Bool, %Bool) @printType (%Type* %56, %Bool 1, %Bool 1)

;stmt26:
  call void () @space ()

;stmt27:
  call void (%Value*) @print_value (%Value* %11)

;stmt28:
  %57 = load %Value*, %Value** %v
  %58 = getelementptr inbounds %Value, %Value* %57, i32 0, i32 1
  %59 = load %Type*, %Type** %58
  %60 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %59, %StorageClass 5, %Nat32 %20)
  ret %Value* %60
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
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 7
  %3 = getelementptr inbounds %ValueAccess, %ValueAccess* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)
  store %Value* %5, %Value** %s

;stmt3:
  %6 = load %Value*, %Value** %s
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = getelementptr inbounds %Type, %Type* %8, i32 0, i32 0
  %10 = load %TypeKind, %TypeKind* %9
  %11 = icmp eq %TypeKind %10, 6
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %12 = load %Value*, %Value** %s
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = getelementptr inbounds %Type, %Type* %14, i32 0, i32 6
  %16 = getelementptr inbounds %TypePointer, %TypePointer* %15, i32 0, i32 0
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
  %21 = getelementptr inbounds %Value, %Value* %20, i32 0, i32 1
  %22 = load %Type*, %Type** %21
  store %Type* %22, %Type** %record_type
  br label %endif_0
endif_0:

;stmt9:
  %23 = load %Value*, %Value** %v
  %24 = getelementptr inbounds %Value, %Value* %23, i32 0, i32 7
  %25 = getelementptr inbounds %ValueAccess, %ValueAccess* %24, i32 0, i32 1
  %26 = load %Str, %Str* %25
  %27 = bitcast %Str %26 to %Unit*
  %28 = inttoptr i64 0 to %Unit*
  %29 = icmp ne %Unit* %27, %28
  %30 = load %Str, %Str* @func319_str1
  call void (%Bool, %Str) @assert (%Bool %29, %Str %30)

;stmt10:
  %31 = load %Type*, %Type** %record_type
  %32 = load %Value*, %Value** %v
  %33 = getelementptr inbounds %Value, %Value* %32, i32 0, i32 7
  %34 = getelementptr inbounds %ValueAccess, %ValueAccess* %33, i32 0, i32 1
  %35 = load %Str, %Str* %34
  %36 = call %Field* (%Type*, %Str) @type_record_get_field (%Type* %31, %Str %35)
  %37 = getelementptr inbounds %Field, %Field* %36, i32 0, i32 2
  %38 = load %Nat16, %Nat16* %37

;stmt11:
  %39 = call %Nat32 () @lab_get ()

;stmt12:
  %40 = load %Unit*, %Unit** @fout
  %41 = load %Str, %Str* @func319_str2
  %42 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %40, %Str %41, %Nat32 %39)

;stmt13:
  %43 = load %Type*, %Type** %record_type
  call void (%Type*, %Bool, %Bool) @printType (%Type* %43, %Bool 1, %Bool 1)

;stmt14:
  call void () @comma ()

;stmt15:
  %44 = load %Type*, %Type** %record_type
  call void (%Type*, %Bool, %Bool) @printType (%Type* %44, %Bool 1, %Bool 1)

;stmt16:
  %45 = load %Str, %Str* @func319_str3
  call void (%Str) @o (%Str %45)

;stmt17:
  %46 = load %Value*, %Value** %s
  call void (%Value*) @print_value (%Value* %46)

;stmt18:
  %47 = load %Unit*, %Unit** @fout
  %48 = load %Str, %Str* @func319_str4
  %49 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %47, %Str %48, %Nat16 %38)

;stmt19:
  %50 = load %Value*, %Value** %v
  %51 = getelementptr inbounds %Value, %Value* %50, i32 0, i32 1
  %52 = load %Type*, %Type** %51
  %53 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %52, %StorageClass 5, %Nat32 %39)
  ret %Value* %53
}

define %Value* @eval_ref (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 4
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)

;stmt1:
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 2
  %7 = getelementptr inbounds %Storage, %Storage* %6, i32 0, i32 0
  %8 = load %StorageClass, %StorageClass* %7
  %9 = icmp eq %StorageClass %8, 5
  br i1 %9, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %10 = load %Value*, %Value** %v
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 2
  %14 = getelementptr inbounds %Storage, %Storage* %13, i32 0, i32 2
  %15 = load %Nat32, %Nat32* %14
  %16 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %12, %StorageClass 6, %Nat32 %15)
  ret %Value* %16
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %18 = call %Nat32 () @lab_get ()

;stmt5:
  %19 = load %Unit*, %Unit** @fout
  %20 = load %Str, %Str* @func320_str1
  %21 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %19, %Str %20, %Nat32 %18)

;stmt6:
  %22 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1
  %23 = load %Type*, %Type** %22
  call void (%Type*, %Bool, %Bool) @printType (%Type* %23, %Bool 1, %Bool 1)

;stmt7:
  call void () @comma ()

;stmt8:
  %24 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1
  %25 = load %Type*, %Type** %24
  call void (%Type*, %Bool, %Bool) @printType (%Type* %25, %Bool 1, %Bool 1)

;stmt9:
  %26 = load %Str, %Str* @func320_str2
  call void (%Str) @o (%Str %26)

;stmt10:
  call void (%Value*) @print_value (%Value* %5)

;stmt11:
  call void () @comma ()

;stmt12:
  %27 = load %Str, %Str* @func320_str3
  call void (%Str) @o (%Str %27)

;stmt13:
  %28 = load %Value*, %Value** %v
  %29 = getelementptr inbounds %Value, %Value* %28, i32 0, i32 1
  %30 = load %Type*, %Type** %29
  %31 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %30, %StorageClass 6, %Nat32 %18)
  ret %Value* %31
}

define %Value* @eval_deref (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 4
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)
  %6 = call %Value* (%Value*) @load (%Value* %5)

;stmt1:
  %7 = load %Value*, %Value** %v
  %8 = getelementptr inbounds %Value, %Value* %7, i32 0, i32 1
  %9 = load %Type*, %Type** %8
  %10 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 2
  %11 = getelementptr inbounds %Storage, %Storage* %10, i32 0, i32 2
  %12 = load %Nat32, %Nat32* %11
  %13 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %9, %StorageClass 5, %Nat32 %12)
  ret %Value* %13
}

define %Value* @eval_not (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 4
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)
  %6 = call %Value* (%Value*) @load (%Value* %5)

;stmt1:
  %7 = call %Nat32 () @lab_get ()

;stmt2:
  %8 = load %Unit*, %Unit** @fout
  %9 = load %Str, %Str* @func322_str1
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Nat32 %7)

;stmt3:
  %11 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  call void (%Type*, %Bool, %Bool) @printType (%Type* %12, %Bool 1, %Bool 1)

;stmt4:
  call void () @space ()

;stmt5:
  call void (%Value*) @print_value (%Value* %6)

;stmt6:
  %13 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  %15 = load %Type*, %Type** @typeBool
  %16 = call %Bool (%Type*, %Type*) @type_eq (%Type* %14, %Type* %15)
  br i1 %16, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %17 = load %Str, %Str* @func322_str2
  call void (%Str) @o (%Str %17)
  br label %endif_0
else_0:

;stmt9:

;stmt10:
  %18 = load %Str, %Str* @func322_str3
  call void (%Str) @o (%Str %18)
  br label %endif_0
endif_0:

;stmt11:
  %19 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %20, %StorageClass 6, %Nat32 %7)
  ret %Value* %21
}

define %Value* @eval_minus (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 4
  %3 = getelementptr inbounds %ValueUn, %ValueUn* %2, i32 0, i32 0
  %4 = load %Value*, %Value** %3
  %5 = call %Value* (%Value*) @eval (%Value* %4)
  %6 = call %Value* (%Value*) @load (%Value* %5)

;stmt1:
  %7 = call %Nat32 () @lab_get ()

;stmt2:
  %8 = load %Unit*, %Unit** @fout
  %9 = load %Str, %Str* @func323_str1
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9, %Nat32 %7)

;stmt3:
  %11 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  call void (%Type*, %Bool, %Bool) @printType (%Type* %12, %Bool 1, %Bool 1)

;stmt4:
  %13 = load %Unit*, %Unit** @fout
  %14 = load %Str, %Str* @func323_str2
  %15 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %13, %Str %14)

;stmt5:
  call void () @comma ()

;stmt6:
  call void (%Value*) @print_value (%Value* %6)

;stmt7:
  %16 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %17 = load %Type*, %Type** %16
  %18 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %17, %StorageClass 6, %Nat32 %7)
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
  %2 = getelementptr inbounds %Value, %Value* %1, i32 0, i32 8
  %3 = getelementptr inbounds %ValueCast, %ValueCast* %2, i32 0, i32 1
  %4 = load %Type*, %Type** %3

;stmt3:
  %5 = load %Value*, %Value** %v
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 8
  %7 = getelementptr inbounds %ValueCast, %ValueCast* %6, i32 0, i32 0
  %8 = load %Value*, %Value** %7
  %9 = call %Value* (%Value*) @eval (%Value* %8)
  %10 = call %Value* (%Value*) @load (%Value* %9)

;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  %13 = call %Bool (%Type*, %Type*) @type_eq (%Type* %12, %Type* %4)
  br i1 %13, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  ret %Value* %10
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  %15 = call %Nat32 () @lab_get ()

;stmt8:
  %16 = load %Unit*, %Unit** @fout
  %17 = load %Str, %Str* @func324_str1
  %18 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %16, %Str %17, %Nat32 %15)

;stmt9:
  %19 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %20 = load %Type*, %Type** %19
  %21 = getelementptr inbounds %Type, %Type* %20, i32 0, i32 0
  %22 = load %TypeKind, %TypeKind* %21

;stmt10:
  %23 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %24 = load %TypeKind, %TypeKind* %23
  %25 = icmp eq %TypeKind %24, 7
  br i1 %25, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %26 = icmp eq %TypeKind %22, 2
  br i1 %26, label %then_2, label %else_2
then_2:

;stmt13:

;stmt14:
  %27 = load %Unit*, %Unit** @fout
  %28 = load %Str, %Str* @func324_str2
  %29 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %27, %Str %28)
  br label %endif_2
else_2:

;stmt15:

;stmt16:
  %30 = load %Unit*, %Unit** @fout
  %31 = load %Str, %Str* @func324_str3
  %32 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %30, %Str %31)
  br label %endif_2
endif_2:
  br label %endif_1
else_1:

;stmt17:
  %33 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %34 = load %TypeKind, %TypeKind* %33
  %35 = icmp eq %TypeKind %34, 6
  %36 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %37 = load %TypeKind, %TypeKind* %36
  %38 = icmp eq %TypeKind %37, 3
  %39 = or %Bool %35, %38
  br i1 %39, label %then_3, label %else_3
then_3:

;stmt18:

;stmt19:
  %40 = icmp eq %TypeKind %22, 6
  %41 = icmp eq %TypeKind %22, 7
  %42 = icmp eq %TypeKind %22, 3
  %43 = or %Bool %41, %42
  %44 = or %Bool %40, %43
  br i1 %44, label %then_4, label %else_4
then_4:

;stmt20:

;stmt21:
  %45 = load %Unit*, %Unit** @fout
  %46 = load %Str, %Str* @func324_str4
  %47 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %45, %Str %46)
  br label %endif_4
else_4:

;stmt22:

;stmt23:
  %48 = load %Unit*, %Unit** @fout
  %49 = load %Str, %Str* @func324_str5
  %50 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %48, %Str %49)
  br label %endif_4
endif_4:
  br label %endif_3
else_3:

;stmt24:
  %51 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 0
  %52 = load %TypeKind, %TypeKind* %51
  %53 = icmp eq %TypeKind %52, 2
  br i1 %53, label %then_5, label %else_5
then_5:

;stmt25:

;stmt26:
  %54 = icmp eq %TypeKind %22, 2
  br i1 %54, label %then_6, label %else_6
then_6:

;stmt27:

;stmt28:
  %55 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %56 = load %Type*, %Type** %55
  %57 = getelementptr inbounds %Type, %Type* %56, i32 0, i32 4
  %58 = getelementptr inbounds %TypeBasic, %TypeBasic* %57, i32 0, i32 1
  %59 = load %Nat32, %Nat32* %58
  %60 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 4
  %61 = getelementptr inbounds %TypeBasic, %TypeBasic* %60, i32 0, i32 1
  %62 = load %Nat32, %Nat32* %61
  %63 = icmp ugt %Nat32 %59, %62
  br i1 %63, label %then_7, label %else_7
then_7:

;stmt29:

;stmt30:
  %64 = load %Unit*, %Unit** @fout
  %65 = load %Str, %Str* @func324_str6
  %66 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %64, %Str %65)
  br label %endif_7
else_7:

;stmt31:
  %67 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %68 = load %Type*, %Type** %67
  %69 = getelementptr inbounds %Type, %Type* %68, i32 0, i32 4
  %70 = getelementptr inbounds %TypeBasic, %TypeBasic* %69, i32 0, i32 1
  %71 = load %Nat32, %Nat32* %70
  %72 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 4
  %73 = getelementptr inbounds %TypeBasic, %TypeBasic* %72, i32 0, i32 1
  %74 = load %Nat32, %Nat32* %73
  %75 = icmp ult %Nat32 %71, %74
  br i1 %75, label %then_8, label %else_8
then_8:

;stmt32:

;stmt33:
  %76 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 4
  %77 = getelementptr inbounds %TypeBasic, %TypeBasic* %76, i32 0, i32 3
  %78 = load %Bool, %Bool* %77
  br i1 %78, label %then_9, label %else_9
then_9:

;stmt34:

;stmt35:
  %79 = load %Unit*, %Unit** @fout
  %80 = load %Str, %Str* @func324_str7
  %81 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %79, %Str %80)
  br label %endif_9
else_9:

;stmt36:

;stmt37:
  %82 = load %Unit*, %Unit** @fout
  %83 = load %Str, %Str* @func324_str8
  %84 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %82, %Str %83)
  br label %endif_9
endif_9:

;stmt38:
  %85 = load %Unit*, %Unit** @fout
  %86 = load %Str, %Str* @func324_str9
  %87 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %85, %Str %86)
  br label %endif_8
else_8:

;stmt39:

;stmt40:
  %88 = load %Unit*, %Unit** @fout
  %89 = load %Str, %Str* @func324_str10
  %90 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %88, %Str %89)
  br label %endif_8
endif_8:
  br label %endif_7
endif_7:
  br label %endif_6
else_6:

;stmt41:
  %91 = icmp eq %TypeKind %22, 6
  br i1 %91, label %then_10, label %else_10
then_10:

;stmt42:

;stmt43:
  %92 = load %Unit*, %Unit** @fout
  %93 = load %Str, %Str* @func324_str11
  %94 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %92, %Str %93)
  br label %endif_10
else_10:

;stmt44:
  %95 = icmp eq %TypeKind %22, 4
  br i1 %95, label %then_11, label %else_11
then_11:

;stmt45:

;stmt46:
  %96 = load %Str, %Str* @func324_str12
  %97 = call %Nat64 (%Str) @get (%Str %96)
  %98 = trunc %Nat64 %97 to %Nat32
  %99 = mul %Nat32 %98, 8

;stmt47:
  %100 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 4
  %101 = getelementptr inbounds %TypeBasic, %TypeBasic* %100, i32 0, i32 1
  %102 = load %Nat32, %Nat32* %101
  %103 = icmp ugt %Nat32 %99, %102
  br i1 %103, label %then_12, label %else_12
then_12:

;stmt48:

;stmt49:
  %104 = load %Unit*, %Unit** @fout
  %105 = load %Str, %Str* @func324_str13
  %106 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %104, %Str %105)
  br label %endif_12
else_12:

;stmt50:
  %107 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 4
  %108 = getelementptr inbounds %TypeBasic, %TypeBasic* %107, i32 0, i32 1
  %109 = load %Nat32, %Nat32* %108
  %110 = icmp ult %Nat32 %99, %109
  br i1 %110, label %then_13, label %else_13
then_13:

;stmt51:

;stmt52:
  %111 = load %Unit*, %Unit** @fout
  %112 = load %Str, %Str* @func324_str14
  %113 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %111, %Str %112)
  br label %endif_13
else_13:

;stmt53:

;stmt54:
  %114 = load %Unit*, %Unit** @fout
  %115 = load %Str, %Str* @func324_str15
  %116 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %114, %Str %115)
  br label %endif_13
endif_13:
  br label %endif_12
endif_12:
  br label %endif_11
else_11:

;stmt55:
  %117 = icmp eq %TypeKind %22, 7
  br i1 %117, label %then_14, label %else_14
then_14:

;stmt56:
  br label %endif_14
else_14:

;stmt57:

;stmt58:
  %118 = load %Str, %Str* @func324_str16
  %119 = call %Int32 (%Str, ...) @printf (%Str %118, %TypeKind %22)

;stmt59:
  %120 = load %Str, %Str* @func324_str17
  call void (%Str) @fatal (%Str %120)
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

;stmt60:
  %121 = getelementptr inbounds %Value, %Value* %10, i32 0, i32 1
  %122 = load %Type*, %Type** %121
  call void (%Type*, %Bool, %Bool) @printType (%Type* %122, %Bool 1, %Bool 1)

;stmt61:
  call void () @space ()

;stmt62:
  call void (%Value*) @print_value (%Value* %10)

;stmt63:
  %123 = load %Str, %Str* @func324_str18
  call void (%Str) @o (%Str %123)

;stmt64:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %4, %Bool 1, %Bool 1)

;stmt65:
  %124 = load %Value*, %Value** %v
  %125 = getelementptr inbounds %Value, %Value* %124, i32 0, i32 1
  %126 = load %Type*, %Type** %125
  %127 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %126, %StorageClass 6, %Nat32 %15)
  ret %Value* %127
}

define %Value* @eval_bin (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %o = alloca %Str

;stmt1:
  %1 = load %Str, %Str* @func325_str1
  store %Str %1, %Str* %o

;stmt2:
  %2 = load %Value*, %Value** %v
  %3 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 5
  %4 = getelementptr inbounds %ValueBin, %ValueBin* %3, i32 0, i32 0
  %5 = load %Value*, %Value** %4
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1
  %7 = load %Type*, %Type** %6
  %8 = getelementptr inbounds %Type, %Type* %7, i32 0, i32 4
  %9 = getelementptr inbounds %TypeBasic, %TypeBasic* %8, i32 0, i32 3
  %10 = load %Bool, %Bool* %9

;stmt3:
  %11 = load %Value*, %Value** %v
  %12 = getelementptr inbounds %Value, %Value* %11, i32 0, i32 0
  %13 = load %ValueKind, %ValueKind* %12

;stmt4:
  %14 = icmp eq %ValueKind %13, 6
  br i1 %14, label %then_0, label %else_0
then_0:

;stmt5:

;stmt6:
  %15 = load %Str, %Str* @func325_str2
  store %Str %15, %Str* %o
  br label %endif_0
else_0:

;stmt7:
  %16 = icmp eq %ValueKind %13, 7
  br i1 %16, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  %17 = load %Str, %Str* @func325_str3
  store %Str %17, %Str* %o
  br label %endif_1
else_1:

;stmt10:
  %18 = icmp eq %ValueKind %13, 8
  br i1 %18, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  %19 = load %Str, %Str* @func325_str4
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
  %21 = load %Str, %Str* @func325_str5
  store %Str %21, %Str* %o
  br label %endif_4
else_4:

;stmt18:

;stmt19:
  %22 = load %Str, %Str* @func325_str6
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
  %24 = load %Str, %Str* @func325_str7
  store %Str %24, %Str* %o
  br label %endif_6
else_6:

;stmt25:

;stmt26:
  %25 = load %Str, %Str* @func325_str8
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
  %27 = load %Str, %Str* @func325_str9
  store %Str %27, %Str* %o
  br label %endif_7
else_7:

;stmt30:
  %28 = icmp eq %ValueKind %13, 12
  br i1 %28, label %then_8, label %else_8
then_8:

;stmt31:

;stmt32:
  %29 = load %Str, %Str* @func325_str10
  store %Str %29, %Str* %o
  br label %endif_8
else_8:

;stmt33:
  %30 = icmp eq %ValueKind %13, 13
  br i1 %30, label %then_9, label %else_9
then_9:

;stmt34:

;stmt35:
  %31 = load %Str, %Str* @func325_str11
  store %Str %31, %Str* %o
  br label %endif_9
else_9:

;stmt36:
  %32 = icmp eq %ValueKind %13, 14
  br i1 %32, label %then_10, label %else_10
then_10:

;stmt37:

;stmt38:
  %33 = load %Str, %Str* @func325_str12
  store %Str %33, %Str* %o
  br label %endif_10
else_10:

;stmt39:
  %34 = icmp eq %ValueKind %13, 15
  br i1 %34, label %then_11, label %else_11
then_11:

;stmt40:

;stmt41:
  %35 = load %Str, %Str* @func325_str13
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
  %37 = load %Str, %Str* @func325_str14
  store %Str %37, %Str* %o
  br label %endif_13
else_13:

;stmt47:

;stmt48:
  %38 = load %Str, %Str* @func325_str15
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
  %40 = load %Str, %Str* @func325_str16
  store %Str %40, %Str* %o
  br label %endif_15
else_15:

;stmt54:

;stmt55:
  %41 = load %Str, %Str* @func325_str17
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
  %43 = load %Str, %Str* @func325_str18
  store %Str %43, %Str* %o
  br label %endif_17
else_17:

;stmt61:

;stmt62:
  %44 = load %Str, %Str* @func325_str19
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
  %46 = load %Str, %Str* @func325_str20
  store %Str %46, %Str* %o
  br label %endif_19
else_19:

;stmt68:

;stmt69:
  %47 = load %Str, %Str* @func325_str21
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
  %49 = load %Str, %Str* @func325_str22
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
  %51 = load %Str, %Str* @func325_str23
  store %Str %51, %Str* %o
  br label %endif_22
else_22:

;stmt78:

;stmt79:
  %52 = load %Str, %Str* @func325_str24
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
  %54 = getelementptr inbounds %Value, %Value* %53, i32 0, i32 5
  %55 = getelementptr inbounds %ValueBin, %ValueBin* %54, i32 0, i32 0
  %56 = load %Value*, %Value** %55
  %57 = call %Value* (%Value*) @eval (%Value* %56)
  %58 = call %Value* (%Value*) @load (%Value* %57)

;stmt81:
  %59 = load %Value*, %Value** %v
  %60 = getelementptr inbounds %Value, %Value* %59, i32 0, i32 5
  %61 = getelementptr inbounds %ValueBin, %ValueBin* %60, i32 0, i32 1
  %62 = load %Value*, %Value** %61
  %63 = call %Value* (%Value*) @eval (%Value* %62)
  %64 = call %Value* (%Value*) @load (%Value* %63)

;stmt82:
  %65 = call %Nat32 () @lab_get ()

;stmt83:
  %66 = load %Unit*, %Unit** @fout
  %67 = load %Str, %Str* @func325_str25
  %68 = load %Str, %Str* %o
  %69 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %66, %Str %67, %Nat32 %65, %Str %68)

;stmt84:
  %70 = getelementptr inbounds %Value, %Value* %58, i32 0, i32 1
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
  %73 = getelementptr inbounds %Value, %Value* %72, i32 0, i32 1
  %74 = load %Type*, %Type** %73
  %75 = call %Value* (%Type*, %StorageClass, %Nat32) @nv (%Type* %74, %StorageClass 6, %Nat32 %65)
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
  %7 = load %Str, %Str* @func326_str1
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1
  %10 = load %Type*, %Type** %9
  call void (%Type*, %Bool, %Bool) @printType (%Type* %10, %Bool 1, %Bool 1)

;stmt4:
  call void () @space ()

;stmt5:
  call void (%Value*) @print_value (%Value* %5)

;stmt6:
  call void () @comma ()

;stmt7:
  %11 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 1
  %12 = load %Type*, %Type** %11
  call void (%Type*, %Bool, %Bool) @printType (%Type* %12, %Bool 1, %Bool 1)

;stmt8:
  %13 = load %Str, %Str* @func326_str2
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
  %1 = call %Unit* (%Nat32) @malloc (%Nat32 176)
  %2 = bitcast %Unit* %1 to %Value*

;stmt1:
  %3 = bitcast %Value* %2 to %Unit*
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func327_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt2:
  %7 = bitcast %Value* %2 to %Unit*
  %8 = call %Unit* (%Unit*, %Nat8, %Nat32) @memset (%Unit* %7, %Nat8 0, %Nat32 176)

;stmt3:
  %9 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 1
  %10 = load %Type*, %Type** %t
  store %Type* %10, %Type** %9

;stmt4:
  %11 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2
  %12 = getelementptr inbounds %Storage, %Storage* %11, i32 0, i32 0
  %13 = load %StorageClass, %StorageClass* %c
  store %StorageClass %13, %StorageClass* %12

;stmt5:
  %14 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2
  %15 = getelementptr inbounds %Storage, %Storage* %14, i32 0, i32 2
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
  %2 = load %Str, %Str* @func328_str1
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
  %3 = load %Unit*, %Unit** %ctx
  %4 = bitcast %Unit* %3 to %Bool*

;stmt2:
  %5 = load %Bool, %Bool* %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  call void () @comma ()
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %6 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 1
  %7 = load %Type*, %Type** %6
  call void (%Type*, %Bool, %Bool) @printType (%Type* %7, %Bool 1, %Bool 1)

;stmt6:
  call void () @space ()

;stmt7:
  call void (%Value*) @print_value (%Value* %2)

;stmt8:
  store %Bool 1, %Bool* %4
  ret void
}

define void @arraydef (%ArrayDef* %_ad) {
  %ad = alloca %ArrayDef*
  store %ArrayDef* %_ad, %ArrayDef** %ad

;stmt0:
  %1 = load %ArrayDef*, %ArrayDef** %ad
  %2 = getelementptr inbounds %ArrayDef, %ArrayDef* %1, i32 0, i32 0
  %3 = load %Str, %Str* %2

;stmt1:
  %4 = load %ArrayDef*, %ArrayDef** %ad
  %5 = getelementptr inbounds %ArrayDef, %ArrayDef* %4, i32 0, i32 1
  %6 = load %Type*, %Type** %5

;stmt2:
  %7 = load %ArrayDef*, %ArrayDef** %ad
  %8 = getelementptr inbounds %ArrayDef, %ArrayDef* %7, i32 0, i32 3
  %9 = load %List*, %List** %8

;stmt3:
  %10 = load %Unit*, %Unit** @fout
  %11 = load %Str, %Str* @func329_str1
  %12 = getelementptr inbounds %List, %List* %9, i32 0, i32 2
  %13 = load %Nat64, %Nat64* %12
  %14 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11, %Str %3, %Nat64 %13)

;stmt4:
  call void (%Type*, %Bool, %Bool) @printType (%Type* %6, %Bool 1, %Bool 1)

;stmt5:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @func329_str2
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16)

;stmt6:
  %need_comma = alloca %Bool

;stmt7:
  store %Bool 0, %Bool* %need_comma

;stmt8:
  %18 = getelementptr inbounds %Bool, %Bool* %need_comma, i32 0
  %19 = bitcast %Bool* %18 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %9, %ListForeachHandler @print_array_item, %Unit* %19)

;stmt9:
  %20 = load %Unit*, %Unit** @fout
  %21 = load %Str, %Str* @func329_str3
  %22 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %20, %Str %21)
  ret void
}

define void @stringdef (%StringDef* %_sd) {
  %sd = alloca %StringDef*
  store %StringDef* %_sd, %StringDef** %sd

;stmt0:
  %1 = load %StringDef*, %StringDef** %sd
  %2 = getelementptr inbounds %StringDef, %StringDef* %1, i32 0, i32 0
  %3 = load %Str, %Str* %2

;stmt1:
  %4 = load %StringDef*, %StringDef** %sd
  %5 = getelementptr inbounds %StringDef, %StringDef* %4, i32 0, i32 2
  %6 = load %Nat32, %Nat32* %5

;stmt2:
  %7 = load %StringDef*, %StringDef** %sd
  %8 = getelementptr inbounds %StringDef, %StringDef* %7, i32 0, i32 1
  %9 = load %Str, %Str* %8

;stmt3:
  %10 = load %Unit*, %Unit** @fout
  %11 = load %Str, %Str* @func331_str1
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11, %Str %3, %Nat32 %6)

;stmt4:
  %i = alloca %Nat32

;stmt5:
  store %Nat32 0, %Nat32* %i

;stmt6:
  br label %continue_0
continue_0:
  br i1 1, label %body_0, label %break_0
body_0:

;stmt7:

;stmt8:
  %13 = load %Nat32, %Nat32* %i
  %14 = getelementptr inbounds %Nat8, %Str %9, %Nat32 %13
  %15 = load %Nat8, %Nat8* %14

;stmt9:
  %16 = load %Nat32, %Nat32* %i
  %17 = add %Nat32 %16, 1
  store %Nat32 %17, %Nat32* %i

;stmt10:
  %18 = icmp eq %Nat8 %15, 0
  br i1 %18, label %then_0, label %else_0
then_0:

;stmt11:

;stmt12:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt13:
  %20 = load %Str, %Str* @func331_str2
  %21 = getelementptr inbounds %Nat8, %Str %20, %Int32 0
  %22 = load %Nat8, %Nat8* %21
  %23 = icmp eq %Nat8 %15, %22
  %24 = load %Str, %Str* @func331_str3
  %25 = getelementptr inbounds %Nat8, %Str %24, %Int32 0
  %26 = load %Nat8, %Nat8* %25
  %27 = icmp eq %Nat8 %15, %26
  %28 = load %Str, %Str* @func331_str4
  %29 = getelementptr inbounds %Nat8, %Str %28, %Int32 0
  %30 = load %Nat8, %Nat8* %29
  %31 = icmp eq %Nat8 %15, %30
  %32 = load %Str, %Str* @func331_str5
  %33 = getelementptr inbounds %Nat8, %Str %32, %Int32 0
  %34 = load %Nat8, %Nat8* %33
  %35 = icmp eq %Nat8 %15, %34
  %36 = load %Str, %Str* @func331_str6
  %37 = getelementptr inbounds %Nat8, %Str %36, %Int32 0
  %38 = load %Nat8, %Nat8* %37
  %39 = icmp eq %Nat8 %15, %38
  %40 = load %Str, %Str* @func331_str7
  %41 = getelementptr inbounds %Nat8, %Str %40, %Int32 0
  %42 = load %Nat8, %Nat8* %41
  %43 = icmp eq %Nat8 %15, %42
  %44 = load %Str, %Str* @func331_str8
  %45 = getelementptr inbounds %Nat8, %Str %44, %Int32 0
  %46 = load %Nat8, %Nat8* %45
  %47 = icmp eq %Nat8 %15, %46
  %48 = load %Str, %Str* @func331_str9
  %49 = getelementptr inbounds %Nat8, %Str %48, %Int32 0
  %50 = load %Nat8, %Nat8* %49
  %51 = icmp eq %Nat8 %15, %50
  %52 = or %Bool %47, %51
  %53 = or %Bool %43, %52
  %54 = or %Bool %39, %53
  %55 = or %Bool %35, %54
  %56 = or %Bool %31, %55
  %57 = or %Bool %27, %56
  %58 = or %Bool %23, %57
  br i1 %58, label %then_1, label %else_1
then_1:

;stmt14:

;stmt15:
  %59 = load %Unit*, %Unit** @fout
  %60 = load %Str, %Str* @func331_str10
  %61 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %59, %Str %60, %Nat8 %15)
  br label %endif_1
else_1:

;stmt16:

;stmt17:
  %62 = load %Unit*, %Unit** @fout
  %63 = load %Str, %Str* @func331_str11
  %64 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %62, %Str %63, %Nat8 %15)
  br label %endif_1
endif_1:
  br label %continue_0
break_0:

;stmt18:
  %65 = load %Unit*, %Unit** @fout
  %66 = load %Str, %Str* @func331_str12
  %67 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %65, %Str %66, %Int32 0)

;stmt19:
  %68 = load %Unit*, %Unit** @fout
  %69 = load %Str, %Str* @func331_str13
  %70 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %68, %Str %69, %Str %3, %Nat32 %6, %Nat32 %6, %Str %3)
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
  %2 = load %Str, %Str* @func332_str1
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
  %8 = inttoptr i64 0 to %Unit*
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
  %11 = load %Str, %Str* @func332_str2
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
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %Field*

;stmt1:
  %3 = load %Unit*, %Unit** %ctx
  %4 = bitcast %Unit* %3 to %Bool*

;stmt2:
  %5 = load %Bool, %Bool* %4
  br i1 %5, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @func334_str1
  %8 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %6, %Str %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt5:
  %9 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %10 = load %Type*, %Type** %9
  call void (%Type*, %Bool, %Bool) @printType (%Type* %10, %Bool 1, %Bool 1)

;stmt6:
  %11 = load %Unit*, %Unit** @fout
  %12 = load %Str, %Str* @func334_str2
  %13 = load %Unit*, %Unit** %data
  %14 = bitcast %Unit* %13 to %Field*
  %15 = getelementptr inbounds %Field, %Field* %14, i32 0, i32 0
  %16 = load %Str, %Str* %15
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12, %Str %16)

;stmt7:
  store %Bool 1, %Bool* %4
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
  %4 = load %Str, %Str* @func335_str1
  %5 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %6 = load %Str, %Str* %5
  %7 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4, %Str %6)

;stmt2:
  %8 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %9 = load %Type*, %Type** %8
  call void (%Type*, %Bool, %Bool) @printType (%Type* %9, %Bool 1, %Bool 1)

;stmt3:
  %10 = load %Unit*, %Unit** @fout
  %11 = load %Str, %Str* @func335_str2
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %10, %Str %11)

;stmt4:
  %13 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  call void (%Type*, %Bool, %Bool) @printType (%Type* %14, %Bool 1, %Bool 1)

;stmt5:
  call void () @space ()

;stmt6:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @func335_str3
  %17 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
  %18 = load %Str, %Str* %17
  %19 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16, %Str %18)

;stmt7:
  %20 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 1
  %21 = load %Type*, %Type** %20
  call void (%Type*, %Bool, %Bool) @printType (%Type* %21, %Bool 1, %Bool 1)

;stmt8:
  %22 = load %Str, %Str* @func335_str4
  call void (%Str) @o (%Str %22)

;stmt9:
  %23 = load %Unit*, %Unit** @fout
  %24 = load %Str, %Str* @func335_str5
  %25 = getelementptr inbounds %Field, %Field* %2, i32 0, i32 0
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
  %4 = inttoptr i64 0 to %Unit*
  %5 = icmp ne %Unit* %3, %4
  %6 = load %Str, %Str* @func333_str1
  call void (%Bool, %Str) @assert (%Bool %5, %Str %6)

;stmt3:
  %7 = load %Block*, %Block** %b
  %8 = bitcast %Block* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp eq %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  %11 = load %Str, %Str* @func333_str2
  call void (%Str) @o (%Str %11)
  br label %endif_0
else_0:

;stmt6:

;stmt7:
  %12 = load %Str, %Str* @func333_str3
  call void (%Str) @o (%Str %12)
  br label %endif_0
endif_0:

;stmt8:
  call void () @space ()

;stmt9:
  %13 = load %Type*, %Type** %t
  %14 = getelementptr inbounds %Type, %Type* %13, i32 0, i32 5
  %15 = getelementptr inbounds %TypeFunc, %TypeFunc* %14, i32 0, i32 1
  %16 = load %Type*, %Type** %15
  %17 = load %Type*, %Type** @typeUnit
  %18 = call %Bool (%Type*, %Type*) @type_eq (%Type* %16, %Type* %17)

;stmt10:
  br i1 %18, label %then_1, label %else_1
then_1:

;stmt11:

;stmt12:
  %19 = load %Str, %Str* @func333_str4
  call void (%Str) @o (%Str %19)
  br label %endif_1
else_1:

;stmt13:

;stmt14:
  %20 = load %Type*, %Type** %t
  %21 = getelementptr inbounds %Type, %Type* %20, i32 0, i32 5
  %22 = getelementptr inbounds %TypeFunc, %TypeFunc* %21, i32 0, i32 1
  %23 = load %Type*, %Type** %22
  call void (%Type*, %Bool, %Bool) @printType (%Type* %23, %Bool 1, %Bool 1)
  br label %endif_1
endif_1:

;stmt15:
  %24 = load %Unit*, %Unit** @fout
  %25 = load %Str, %Str* @func333_str5
  %26 = load %Str, %Str* %id
  %27 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25, %Str %26)

;stmt16:
  %need_comma = alloca %Bool

;stmt17:
  store %Bool 0, %Bool* %need_comma

;stmt18:
  %28 = load %Type*, %Type** %t
  %29 = getelementptr inbounds %Type, %Type* %28, i32 0, i32 5
  %30 = getelementptr inbounds %TypeFunc, %TypeFunc* %29, i32 0, i32 0
  %31 = load %List*, %List** %30
  %32 = getelementptr inbounds %Bool, %Bool* %need_comma, i32 0
  %33 = bitcast %Bool* %32 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %31, %ListForeachHandler @vf_print_param, %Unit* %33)

;stmt19:
  %34 = load %Type*, %Type** %t
  %35 = getelementptr inbounds %Type, %Type* %34, i32 0, i32 5
  %36 = getelementptr inbounds %TypeFunc, %TypeFunc* %35, i32 0, i32 2
  %37 = load %Bool, %Bool* %36
  br i1 %37, label %then_2, label %else_2
then_2:

;stmt20:

;stmt21:
  %38 = load %Str, %Str* @func333_str6
  call void (%Str) @o (%Str %38)
  br label %endif_2
else_2:
  br label %endif_2
endif_2:

;stmt22:
  %39 = load %Str, %Str* @func333_str7
  call void (%Str) @o (%Str %39)

;stmt23:
  %40 = load %Block*, %Block** %b
  %41 = bitcast %Block* %40 to %Unit*
  %42 = inttoptr i64 0 to %Unit*
  %43 = icmp ne %Unit* %41, %42
  br i1 %43, label %then_3, label %else_3
then_3:

;stmt24:
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt25:
  %44 = load %Block*, %Block** %b
  %45 = bitcast %Block* %44 to %Unit*
  %46 = inttoptr i64 0 to %Unit*
  %47 = icmp ne %Unit* %45, %46
  br i1 %47, label %then_4, label %else_4
then_4:

;stmt26:

;stmt27:
  %48 = load %Str, %Str* @func333_str8
  call void (%Str) @o (%Str %48)

;stmt28:
  %49 = load %Type*, %Type** %t
  %50 = getelementptr inbounds %Type, %Type* %49, i32 0, i32 5
  %51 = getelementptr inbounds %TypeFunc, %TypeFunc* %50, i32 0, i32 0
  %52 = load %List*, %List** %51
  %53 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %52, %ListForeachHandler @print_param_loc, %Unit* %53)

;stmt29:
  call void () @reset_local_labels ()

;stmt30:
  %54 = load %Block*, %Block** %b
  call void (%Block*) @print_block (%Block* %54)

;stmt31:
  br i1 %18, label %then_5, label %else_5
then_5:

;stmt32:

;stmt33:
  %55 = load %Str, %Str* @func333_str9
  call void (%Str) @o (%Str %55)
  br label %endif_5
else_5:
  br label %endif_5
endif_5:

;stmt34:
  %56 = load %Str, %Str* @func333_str10
  call void (%Str) @o (%Str %56)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:
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
  %5 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 4
  %6 = getelementptr inbounds %TypeBasic, %TypeBasic* %5, i32 0, i32 2
  %7 = load %Bool, %Bool* %6
  br i1 %7, label %then_0, label %else_0
then_0:

;stmt3:

;stmt4:
  %8 = load %Unit*, %Unit** @fout
  %9 = load %Str, %Str* @func337_str1
  %10 = getelementptr inbounds %Type, %Type* %4, i32 0, i32 4
  %11 = getelementptr inbounds %TypeBasic, %TypeBasic* %10, i32 0, i32 1
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
  %2 = load %Str, %Str* @func336_str1
  %3 = call %Unit* (%Str, %Str) @fopen (%Str %1, %Str %2)
  store %Unit* %3, %Unit** @fout

;stmt1:
  %4 = load %Unit*, %Unit** @fout
  %5 = inttoptr i64 0 to %Unit*
  %6 = icmp eq %Unit* %4, %5
  br i1 %6, label %then_0, label %else_0
then_0:

;stmt2:

;stmt3:
  %7 = load %Str, %Str* @func336_str2
  call void (%Str) @fatal (%Str %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt4:
  %8 = load %Unit*, %Unit** @fout
  %9 = load %Str, %Str* @func336_str3
  %10 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %8, %Str %9)

;stmt5:
  %11 = load %Unit*, %Unit** @fout
  %12 = load %Str, %Str* @func336_str4
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12)

;stmt6:
  %14 = load %Arch, %Arch* %a
  call void (%Arch) @print_head (%Arch %14)

;stmt7:
  %15 = load %Unit*, %Unit** @fout
  %16 = load %Str, %Str* @func336_str5
  %17 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %15, %Str %16)

;stmt8:
  %18 = load %Unit*, %Unit** @fout
  %19 = load %Str, %Str* @func336_str6
  %20 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %18, %Str %19)

;stmt9:
  %21 = load %Unit*, %Unit** @fout
  %22 = load %Str, %Str* @func336_str7
  %23 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %21, %Str %22)

;stmt10:
  %24 = load %Unit*, %Unit** @fout
  %25 = load %Str, %Str* @func336_str8
  %26 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %24, %Str %25)

;stmt11:
  %27 = getelementptr inbounds %List, %List* @globalTypeIndex, i32 0
  %28 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %27, %MapForeachHandler @prt_itype, %Unit* %28)

;stmt12:
  %29 = load %Unit*, %Unit** @fout
  %30 = load %Str, %Str* @func336_str9
  %31 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %29, %Str %30)
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
  %3 = getelementptr inbounds %TypeDef, %TypeDef* %2, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %TypeDef, %TypeDef* %2, i32 0, i32 1
  %6 = load %Type*, %Type** %5
  call void (%Str, %Type*) @typedef (%Str %4, %Type* %6)
  ret void
}

define void @foreach_stringdef (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %StringDef*

;stmt1:
  call void (%StringDef*) @stringdef (%StringDef* %2)
  ret void
}

define void @foreach_arraydef (%Unit* %_data, %Unit* %_ctx, %Nat32 %_index) {
  %data = alloca %Unit*
  store %Unit* %_data, %Unit** %data
  %ctx = alloca %Unit*
  store %Unit* %_ctx, %Unit** %ctx
  %index = alloca %Nat32
  store %Nat32 %_index, %Nat32* %index

;stmt0:
  %1 = load %Unit*, %Unit** %data
  %2 = bitcast %Unit* %1 to %ArrayDef*

;stmt1:
  call void (%ArrayDef*) @arraydef (%ArrayDef* %2)
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
  %3 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %VarDef, %VarDef* %2, i32 0, i32 2
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
  %3 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 1
  %6 = load %Type*, %Type** %5
  %7 = getelementptr inbounds %FuncDef, %FuncDef* %2, i32 0, i32 2
  %8 = load %Block*, %Block** %7
  call void (%Str, %Type*, %Block*) @funcdef (%Str %4, %Type* %6, %Block* %8)
  ret void
}

define void @print_assembly (%Assembly* %_a) {
  %a = alloca %Assembly*
  store %Assembly* %_a, %Assembly** %a

;stmt0:
  %1 = load %Str, %Str* @func338_str1
  %2 = load %Assembly*, %Assembly** %a
  %3 = getelementptr inbounds %Assembly, %Assembly* %2, i32 0, i32 0
  %4 = load %Str, %Str* %3
  %5 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %4)

;stmt1:
  %6 = getelementptr inbounds %List, %List* @md_list, i32 0
  call void (%List*) @map_init (%List* %6)

;stmt2:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @func338_str2
  %9 = load %Assembly*, %Assembly** %a
  %10 = getelementptr inbounds %Assembly, %Assembly* %9, i32 0, i32 0
  %11 = load %Str, %Str* %10
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8, %Str %11)

;stmt3:
  %13 = load %Str, %Str* @func338_str3
  call void (%Str) @o (%Str %13)

;stmt4:
  %14 = load %Assembly*, %Assembly** %a
  %15 = getelementptr inbounds %Assembly, %Assembly* %14, i32 0, i32 1
  %16 = load %List*, %List** %15
  %17 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %16, %ListForeachHandler @foreach_typedef, %Unit* %17)

;stmt5:
  %18 = load %Str, %Str* @func338_str4
  call void (%Str) @o (%Str %18)

;stmt6:
  %19 = load %Assembly*, %Assembly** %a
  %20 = getelementptr inbounds %Assembly, %Assembly* %19, i32 0, i32 3
  %21 = load %List*, %List** %20
  %22 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %21, %ListForeachHandler @foreach_stringdef, %Unit* %22)

;stmt7:
  %23 = load %Str, %Str* @func338_str5
  call void (%Str) @o (%Str %23)

;stmt8:
  %24 = load %Assembly*, %Assembly** %a
  %25 = getelementptr inbounds %Assembly, %Assembly* %24, i32 0, i32 2
  %26 = load %List*, %List** %25
  %27 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %26, %ListForeachHandler @foreach_arraydef, %Unit* %27)

;stmt9:
  %28 = load %Str, %Str* @func338_str6
  call void (%Str) @o (%Str %28)

;stmt10:
  %29 = load %Assembly*, %Assembly** %a
  %30 = getelementptr inbounds %Assembly, %Assembly* %29, i32 0, i32 4
  %31 = load %List*, %List** %30
  %32 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %31, %ListForeachHandler @foreach_vardef, %Unit* %32)

;stmt11:
  %33 = load %Str, %Str* @func338_str7
  call void (%Str) @o (%Str %33)

;stmt12:
  %34 = load %Assembly*, %Assembly** %a
  %35 = getelementptr inbounds %Assembly, %Assembly* %34, i32 0, i32 5
  %36 = load %List*, %List** %35
  %37 = inttoptr i64 0 to %Unit*
  call void (%List*, %ListForeachHandler, %Unit*) @list_foreach (%List* %36, %ListForeachHandler @foreach_funcdef, %Unit* %37)

;stmt13:
  %38 = load %Str, %Str* @func338_str8
  call void (%Str) @o (%Str %38)

;stmt14:
  %39 = getelementptr inbounds %List, %List* @md_list, i32 0
  call void (%List*) @print_metadata_list (%List* %39)
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
  %4 = load %Str, %Str* @func344_str1
  %5 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4)

;stmt3:
  %6 = load %Unit*, %Unit** @fout
  %7 = load %Str, %Str* @func344_str2
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
  %12 = load %Str, %Str* @func344_str3
  %13 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %11, %Str %12)

;stmt7:
  %14 = load %Unit*, %Unit** @fout
  %15 = load %Str, %Str* @func344_str4
  %16 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %14, %Str %15)
  br label %endif_1
else_1:
  br label %endif_1
endif_1:
  br label %endif_0
endif_0:

;stmt8:
  %17 = load %Unit*, %Unit** @fout
  %18 = load %Str, %Str* @func344_str5
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
  %2 = load %Str, %Str* @func346_str1
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
  %2 = load %Str, %Str* @func345_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  %4 = load %List*, %List** %index
  %5 = inttoptr i64 0 to %Unit*
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
  %4 = load %Str, %Str* @func348_str1
  %5 = load %Unit*, %Unit** %k
  %6 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %3, %Str %4, %Unit* %5, %Value* %2)

;stmt2:
  %7 = load %Unit*, %Unit** @fout
  %8 = load %Str, %Str* @func348_str2
  %9 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 0
  %10 = load %ValueKind, %ValueKind* %9
  %11 = call %Str (%ValueKind) @print_value_kind (%ValueKind %10)
  %12 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %7, %Str %8, %Str %11)

;stmt3:
  %13 = load %Unit*, %Unit** @fout
  %14 = load %Str, %Str* @func348_str3
  %15 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2
  %16 = getelementptr inbounds %Storage, %Storage* %15, i32 0, i32 0
  %17 = load %StorageClass, %StorageClass* %16
  %18 = call %Str (%StorageClass) @print_storage_class (%StorageClass %17)
  %19 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %13, %Str %14, %Str %18)

;stmt4:
  %20 = load %Unit*, %Unit** @fout
  %21 = load %Str, %Str* @func348_str4
  %22 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 2
  %23 = getelementptr inbounds %Storage, %Storage* %22, i32 0, i32 2
  %24 = load %Nat32, %Nat32* %23
  %25 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %20, %Str %21, %Nat32 %24)

;stmt5:
  %26 = load %Unit*, %Unit** @fout
  %27 = load %Str, %Str* @func348_str5
  %28 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %26, %Str %27)
  ret void
}

define void @print_value_index (%List* %_index) {
  %index = alloca %List*
  store %List* %_index, %List** %index

;stmt0:
  %1 = load %Unit*, %Unit** @fout
  %2 = load %Str, %Str* @func347_str1
  %3 = call %Int32 (%Unit*, %Str, ...) @fprintf (%Unit* %1, %Str %2)

;stmt1:
  %4 = load %List*, %List** %index
  %5 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %4, %MapForeachHandler @vshow, %Unit* %5)
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
  %11 = load %Str, %Str* @func349_str1
  call void (%Str) @fatal (%Str %11)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt7:
  call void (%Str) @liblist_add (%Str %7)

;stmt8:
  %12 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  %13 = load %Str, %Str* @func349_str2
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

define void @readConfig (%Str %_fname) {
  %fname = alloca %Str
  store %Str %_fname, %Str* %fname

;stmt0:
  %1 = load %Str, %Str* @func350_str1
  %2 = load %Str, %Str* %fname
  %3 = call %Int32 (%Str, ...) @printf (%Str %1, %Str %2)

;stmt1:
  %4 = load %Str, %Str* %fname
  %5 = call %List* (%Str) @tokenize (%Str %4)

;stmt2:
  %6 = load %Str, %Str* @func350_str2
  %7 = call %Source* (%Str, %List*) @src_new (%Str %6, %List* %5)

;stmt3:
  %8 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  %9 = load %Source*, %Source** %8

;stmt4:
  %10 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  store %Source* %7, %Source** %10

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
  %11 = call %Bool () @eof ()
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt10:

;stmt11:
  br label %break_0
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt12:
  %13 = call %Str () @parseId ()

;stmt13:
  %14 = load %Str, %Str* @func350_str3
  %15 = call %Bool (%Str) @need (%Str %14)

;stmt14:
  %16 = call %Token* () @ctok ()

;stmt15:
  %17 = getelementptr inbounds %Token, %Token* %16, i32 0, i32 0
  %18 = load %TokenType, %TokenType* %17
  %19 = icmp eq %TokenType %18, 2
  br i1 %19, label %then_1, label %else_1
then_1:

;stmt16:

;stmt17:
  %20 = getelementptr inbounds %Token, %Token* %16, i32 0, i32 2
  %21 = bitcast [0 x %Nat8]* %20 to %Unit*
  %22 = load %Str, %Str* @func350_str4
  %23 = getelementptr inbounds %Nat64, %Nat64* %d, i32 0
  %24 = call %Int32 (%Unit*, %Str, ...) @sscanf (%Unit* %21, %Str %22, %Nat64* %23)

;stmt18:
  call void () @skip ()
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt19:
  %25 = load %Str, %Str* @func350_str5
  %26 = load %Nat64, %Nat64* %d
  %27 = call %Int32 (%Str, ...) @printf (%Str %25, %Str %13, %Nat64 %26)

;stmt20:
  %28 = load %Nat64, %Nat64* %d
  call void (%Str, %Nat64) @set (%Str %13, %Nat64 %28)
  br label %continue_0
break_0:

;stmt21:
  %29 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 0
  store %Source* %9, %Source** %29
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
  %3 = call %Type* (%Value*) @checkValue (%Value* %2)

;stmt2:
  %4 = getelementptr inbounds %Value, %Value* %2, i32 0, i32 1
  %5 = load %Type*, %Type** %4
  %6 = getelementptr inbounds %Type, %Type* %5, i32 0, i32 0
  %7 = load %TypeKind, %TypeKind* %6
  %8 = icmp eq %TypeKind %7, 3
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
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 2
  %2 = inttoptr i64 0 to %Unit*
  call void (%List*, %MapForeachHandler, %Unit*) @map_foreach (%List* %1, %MapForeachHandler @chk, %Unit* %2)
  ret void
}

define void @checkFunc (%Value* %_f) {
  %f = alloca %Value*
  store %Value* %_f, %Value** %f

;stmt0:
  %1 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %2 = load %Value*, %Value** %1

;stmt1:
  %3 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  %4 = load %Value*, %Value** %f
  store %Value* %4, %Value** %3

;stmt2:
  %5 = load %Value*, %Value** %f
  %6 = getelementptr inbounds %Value, %Value* %5, i32 0, i32 3
  %7 = load %Block*, %Block** %6

;stmt3:
  %8 = bitcast %Block* %7 to %Unit*
  %9 = inttoptr i64 0 to %Unit*
  %10 = icmp ne %Unit* %8, %9
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt4:

;stmt5:
  call void (%Block*) @stmtBlockCheck (%Block* %7)
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt6:
  %11 = getelementptr inbounds %FuncContext, %FuncContext* @fctx, i32 0, i32 0
  store %Value* %2, %Value** %11
  ret void
}

define %Type* @checkValue (%Value* %_v) {
  %v = alloca %Value*
  store %Value* %_v, %Value** %v

;stmt0:
  %1 = load %Value*, %Value** %v
  %2 = bitcast %Value* %1 to %Unit*
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
  %6 = load %Value*, %Value** %v
  %7 = getelementptr inbounds %Value, %Value* %6, i32 0, i32 1
  %8 = load %Type*, %Type** %7
  %9 = bitcast %Type* %8 to %Unit*
  %10 = inttoptr i64 0 to %Unit*
  %11 = icmp ne %Unit* %9, %10
  br i1 %11, label %then_1, label %else_1
then_1:

;stmt4:

;stmt5:
  %12 = load %Value*, %Value** %v
  %13 = getelementptr inbounds %Value, %Value* %12, i32 0, i32 1
  %14 = load %Type*, %Type** %13
  ret %Type* %14
  br label %endif_1
else_1:
  br label %endif_1
endif_1:

;stmt6:
  %t = alloca %Type*

;stmt7:
  %16 = inttoptr i64 0 to %Type*
  store %Type* %16, %Type** %t

;stmt8:
  %17 = load %Value*, %Value** %v
  %18 = getelementptr inbounds %Value, %Value* %17, i32 0, i32 0
  %19 = load %ValueKind, %ValueKind* %18

;stmt9:
  %20 = icmp eq %ValueKind %19, 1
  br i1 %20, label %then_2, label %else_2
then_2:

;stmt10:

;stmt11:
  %21 = load %Str, %Str* @func354_str1
  %22 = load %Value*, %Value** %v
  %23 = getelementptr inbounds %Value, %Value* %22, i32 0, i32 13
  %24 = load %TokenInfo*, %TokenInfo** %23
  call void (%Str, %TokenInfo*) @error (%Str %21, %TokenInfo* %24)
  br label %endif_2
else_2:

;stmt12:
  %25 = call %Bool (%ValueKind) @isBinaryOpKind (%ValueKind %19)
  br i1 %25, label %then_3, label %else_3
then_3:

;stmt13:

;stmt14:
  %26 = load %Value*, %Value** %v
  %27 = call %Type* (%Value*) @checkValueBinary (%Value* %26)
  store %Type* %27, %Type** %t
  br label %endif_3
else_3:

;stmt15:
  %28 = call %Bool (%ValueKind) @isUnaryOpKind (%ValueKind %19)
  br i1 %28, label %then_4, label %else_4
then_4:

;stmt16:

;stmt17:
  %29 = load %Value*, %Value** %v
  %30 = call %Type* (%Value*) @checkValueUnary (%Value* %29)
  store %Type* %30, %Type** %t
  br label %endif_4
else_4:

;stmt18:
  %31 = icmp eq %ValueKind %19, 22
  br i1 %31, label %then_5, label %else_5
then_5:

;stmt19:

;stmt20:
  %32 = load %Value*, %Value** %v
  %33 = call %Type* (%Value*) @checkValueCall (%Value* %32)
  store %Type* %33, %Type** %t
  br label %endif_5
else_5:

;stmt21:
  %34 = icmp eq %ValueKind %19, 23
  br i1 %34, label %then_6, label %else_6
then_6:

;stmt22:

;stmt23:
  %35 = load %Value*, %Value** %v
  %36 = call %Type* (%Value*) @checkValueIndex (%Value* %35)
  store %Type* %36, %Type** %t
  br label %endif_6
else_6:

;stmt24:
  %37 = icmp eq %ValueKind %19, 24
  br i1 %37, label %then_7, label %else_7
then_7:

;stmt25:

;stmt26:
  %38 = load %Value*, %Value** %v
  %39 = call %Type* (%Value*) @checkValueAccess (%Value* %38)
  store %Type* %39, %Type** %t
  br label %endif_7
else_7:

;stmt27:
  %40 = icmp eq %ValueKind %19, 25
  br i1 %40, label %then_8, label %else_8
then_8:

;stmt28:

;stmt29:
  %41 = load %Value*, %Value** %v
  %42 = call %Type* (%Value*) @checkValueCast (%Value* %41)
  store %Type* %42, %Type** %t
  br label %endif_8
else_8:

;stmt30:
  %43 = icmp eq %ValueKind %19, 20
  %44 = icmp eq %ValueKind %19, 21
  %45 = or %Bool %43, %44
  br i1 %45, label %then_9, label %else_9
then_9:

;stmt31:

;stmt32:
  %46 = load %Value*, %Value** %v
  %47 = call %Type* (%Value*) @checkValueShift (%Value* %46)
  store %Type* %47, %Type** %t
  br label %endif_9
else_9:

;stmt33:
  %48 = icmp eq %ValueKind %19, 26
  br i1 %48, label %then_10, label %else_10
then_10:

;stmt34:

;stmt35:
  %49 = load %Value*, %Value** %v
  %50 = call %Type* (%Value*) @checkValueSizeof (%Value* %49)
  store %Type* %50, %Type** %t
  br label %endif_10
else_10:

;stmt36:
  %51 = icmp eq %ValueKind %19, 27
  br i1 %51, label %then_11, label %else_11
then_11:

;stmt37:

;stmt38:
  %52 = load %Value*, %Value** %v
  %53 = call %Type* (%Value*) @checkValueAlignof (%Value* %52)
  store %Type* %53, %Type** %t
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
  %54 = load %Value*, %Value** %v
  %55 = getelementptr inbounds %Value, %Value* %54, i32 0, i32 1
  %56 = load %Type*, %Type** %t
  store %Type* %56, %Type** %55

;stmt40:
  %57 = load %Type*, %Type** %t
  ret %Type* %57

;stmt41:
  br label %fail
fail:

;stmt42:
  %59 = load %Str, %Str* @func354_str2
  call void (%Bool, %Str) @assert (%Bool 0, %Str %59)

;stmt43:
  %60 = inttoptr i64 0 to %Type*
  ret %Type* %60
}

define %Int32 @main (%Int32 %_argc, %Str* %_argv) {
  %argc = alloca %Int32
  store %Int32 %_argc, %Int32* %argc
  %argv = alloca %Str*
  store %Str* %_argv, %Str** %argv

;stmt0:
  %1 = load %Str, %Str* @func355_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1, %Int32 0, %Int32 5)

;stmt1:
  call void () @init ()

;stmt2:
  %3 = load %Int32, %Int32* %argc
  %4 = load %Str*, %Str** %argv
  call void (%Int32, %Str*) @parseArgs (%Int32 %3, %Str* %4)

;stmt3:
  %5 = load %Str, %Str* @func355_str2
  %6 = call %Source* (%Str) @source_open (%Str %5)
  call void (%Source*) @parse (%Source* %6)

;stmt4:
  %7 = load %Str, %Str* @func355_str3
  %8 = load %Nat32, %Nat32* @lines
  %9 = call %Int32 (%Str, ...) @printf (%Str %7, %Nat32 %8)

;stmt5:
  call void () @checkMain ()

;stmt6:
  %10 = load %Nat32, %Nat32* @errcnt
  %11 = icmp ugt %Nat32 %10, 0
  br i1 %11, label %then_0, label %else_0
then_0:

;stmt7:

;stmt8:
  %12 = load %Str, %Str* @func355_str4
  %13 = load %Nat32, %Nat32* @errcnt
  %14 = call %Int32 (%Str, ...) @printf (%Str %12, %Nat32 %13)

;stmt9:
  %15 = load %Nat32, %Nat32* @errcnt
  %16 = bitcast %Nat32 %15 to %Int32
  ret %Int32 %16
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt10:
  %18 = load %Arch, %Arch* @arch
  %19 = load %Str, %Str* @func355_str5
  call void (%Arch, %Str) @printer_init (%Arch %18, %Str %19)

;stmt11:
  %20 = getelementptr inbounds %Assembly, %Assembly* @asm0, i32 0
  call void (%Assembly*) @print_assembly (%Assembly* %20)

;stmt12:
  %21 = load %Nat32, %Nat32* @errcnt
  %22 = icmp ne %Nat32 %21, 0
  %23 = sext %Bool %22 to %Int32
  ret %Int32 %23
}

define void @parseArgs (%Int32 %_argc, %Str* %_argv) {
  %argc = alloca %Int32
  store %Int32 %_argc, %Int32* %argc
  %argv = alloca %Str*
  store %Str* %_argv, %Str** %argv

;stmt0:
  %argp = alloca %Int32

;stmt1:
  store %Int32 1, %Int32* %argp

;stmt2:
  br label %continue_0
continue_0:
  %1 = load %Int32, %Int32* %argp
  %2 = load %Int32, %Int32* %argc
  %3 = icmp slt %Int32 %1, %2
  br i1 %3, label %body_0, label %break_0
body_0:

;stmt3:

;stmt4:
  %4 = load %Int32, %Int32* %argp
  %5 = load %Str*, %Str** %argv
  %6 = getelementptr inbounds %Str, %Str* %5, %Int32 %4
  %7 = load %Str, %Str* %6

;stmt5:
  %8 = load %Str, %Str* @func356_str1
  %9 = call %Int32 (%Str, %Str, %Nat32) @strncmp (%Str %7, %Str %8, %Nat32 6)
  %10 = icmp eq %Int32 %9, 0
  br i1 %10, label %then_0, label %else_0
then_0:

;stmt6:

;stmt7:
  %11 = getelementptr inbounds %Nat8, %Str %7, %Int32 6
  %12 = bitcast %Nat8* %11 to %Str
  %13 = load %Str, %Str* @func356_str2
  %14 = call %Int32 (%Str, %Str) @strcmp (%Str %12, %Str %13)
  %15 = icmp eq %Int32 %14, 0
  br i1 %15, label %then_1, label %else_1
then_1:

;stmt8:

;stmt9:
  store %Arch 1, %Arch* @arch
  br label %endif_1
else_1:

;stmt10:
  %16 = getelementptr inbounds %Nat8, %Str %7, %Int32 6
  %17 = bitcast %Nat8* %16 to %Str
  %18 = load %Str, %Str* @func356_str3
  %19 = call %Int32 (%Str, %Str) @strcmp (%Str %17, %Str %18)
  %20 = icmp eq %Int32 %19, 0
  br i1 %20, label %then_2, label %else_2
then_2:

;stmt11:

;stmt12:
  store %Arch 0, %Arch* @arch
  br label %endif_2
else_2:

;stmt13:

;stmt14:
  %21 = load %Str, %Str* @func356_str4
  call void (%Str) @fatal (%Str %21)
  br label %endif_2
endif_2:
  br label %endif_1
endif_1:
  br label %endif_0
else_0:
  br label %endif_0
endif_0:

;stmt15:
  %22 = load %Str, %Str* @func356_str5
  %23 = call %Int32 (%Str, %Str, %Nat32) @strncmp (%Str %7, %Str %22, %Nat32 5)
  %24 = icmp eq %Int32 %23, 0
  br i1 %24, label %then_3, label %else_3
then_3:

;stmt16:

;stmt17:
  %25 = getelementptr inbounds %Nat8, %Str %7, %Int32 5
  %26 = bitcast %Nat8* %25 to %Str
  call void (%Str) @liblist_add (%Str %26)
  br label %endif_3
else_3:
  br label %endif_3
endif_3:

;stmt18:
  %27 = load %Str, %Str* @func356_str6
  %28 = call %Int32 (%Str, %Str, %Nat32) @strncmp (%Str %7, %Str %27, %Nat32 6)
  %29 = icmp eq %Int32 %28, 0
  br i1 %29, label %then_4, label %else_4
then_4:

;stmt19:

;stmt20:
  %30 = getelementptr inbounds %Nat8, %Str %7, %Int32 6
  %31 = bitcast %Nat8* %30 to %Str
  call void (%Str) @readConfig (%Str %31)
  br label %endif_4
else_4:
  br label %endif_4
endif_4:

;stmt21:
  %32 = load %Int32, %Int32* %argp
  %33 = add %Int32 %32, 1
  store %Int32 %33, %Int32* %argp
  br label %continue_0
break_0:
  ret void
}

define void @usage () {

;stmt0:
  %1 = load %Str, %Str* @func357_str1
  %2 = call %Int32 (%Str, ...) @printf (%Str %1)

;stmt1:
  %3 = load %Str, %Str* @func357_str2
  %4 = call %Int32 (%Str, ...) @printf (%Str %3)

;stmt2:
  %5 = load %Str, %Str* @func357_str3
  %6 = call %Int32 (%Str, ...) @printf (%Str %5)

;stmt3:
  %7 = load %Str, %Str* @func357_str4
  %8 = call %Int32 (%Str, ...) @printf (%Str %7)
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
  %4 = load %Str, %Str* @func359_str1
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
  %10 = load %Str, %Str* @func359_str2
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
  %16 = load %Str, %Str* @func359_str3
  %17 = call %Int32 (%Str, ...) @printf (%Str %16)
  ret void
}

define void @showTypes () {

;stmt0:
  %1 = getelementptr inbounds %ModuleContext, %ModuleContext* @mctx, i32 0, i32 1
  %2 = inttoptr i64 0 to %Unit*
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
  %4 = load %Str, %Str* @func361_str1
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
  %10 = load %Str, %Str* @func361_str2
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
  %16 = getelementptr inbounds %Value, %Value* %15, i32 0, i32 1
  %17 = load %Type*, %Type** %16
  call void (%Type*) @prttype (%Type* %17)

;stmt9:
  %18 = load %Str, %Str* @func361_str3
  %19 = call %Int32 (%Str, ...) @printf (%Str %18)
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
