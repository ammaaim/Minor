// m2/prn/debug

/*
let DEBUG = False

var meta : Nat
let get_metadata = func () -> Nat {
  let md = meta
  meta = meta + 1
  return md
}

// список записей метаданных
var md_list : *List


type MetadataClass = enum {
  DIUnknown,
  DIFile,
  DIBasicType,
  DISubroutineType
}



// добавляет в код ссылку на отлдочную метадату
let dbg = func (md : Nat) -> Unit {fprintf(fout, " !dbg !%u", md)}



let debugPrintDICompileUnit = func () -> Unit {
"!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 7.0.0 (tags/RELEASE_700/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !33)"
}



let debugPrintDIFile = func () -> Unit {
  "!3 = !DIFile(filename: \"./src/main.c\", directory: \"/Users/alex/p/cortex-m-llvm\")"
  let md = 0
  let filename = ""
  let directory = ""
  fprintf(fout, "!u = !DIFile(filename: \"%s\", directory: \"%s\")", md, filename, directory)
}


let debugPrintDILocation = func () -> Unit {
  "!0 = !DILocation(line: 2900, column: 42, scope: !1, inlinedAt: !2)"
  "DILocation nodes represent source debug locations. The scope: field is mandatory, and points at an DILexicalBlockFile, an DILexicalBlock, or an DISubprogram."
  let md = 0
  let line = 0
  let column = 0
  let scope_id = 0
  let inlinedAt_id = 0
  fprintf(fout, "!u = !DILocation(line: %u, column: %u, scope: !%u, inlinedAt: !u)", md, line, column, scope_id, inlinedAt_id)
}


let debugPrintDISubprogram = func () -> Unit {

}

*/



