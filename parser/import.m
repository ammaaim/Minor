

var imports : List

let importAdd = func (s : Str) -> Unit {
  list_append(&imports, s)
}

let importExist = func (s : Str) -> Unit {
  let search_import = func ListSearchHandler {
    let imp_name = data to Str
    let target_name = ctx to Str
    return strcmp(imp_name, target_name) == 0
  }
  let i = list_search(&imports, search_import, s)
  return i != Nil
}
