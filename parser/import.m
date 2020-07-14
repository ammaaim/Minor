

var imports : List



let importAdd = func (s : Str) -> Unit {
  list_append(&imports, s)
}


let importExist = func (s : Str) -> Bool {
  let search_import = func ListSearchHandler {
    let imp_name = data to Str
    let target_name = ctx to Str
    if strcmp(imp_name, target_name) == 0 {
      return imp_name
    }
    return Nil
  }
  let i = list_search(&imports, search_import, s)
  return i != Nil
}


