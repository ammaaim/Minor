



// file (or directory) exists?
let exists = func (fname : Str) -> Bool {
  let fd = open(fname, O_RDONLY)
  if fd < 0 {return False}
  close(fd)
  return True
}


// it's a directory?
let isdir = func (name : Str) -> Bool {
  let d = opendir(name)
  if d == Nil {return False}
  closedir(d)
  return True
}


