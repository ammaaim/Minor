// lib/sys/fs


// File (or directory) exists?
let exists = func (fname : Str) -> Bool {
  let fd = open(fname, O_RDONLY)
  if fd < 0 {return False}
  close(fd)
  return True
}


// It's a directory?
let isdir = func (name : Str) -> Bool {
  let d = opendir(name)
  if d == Nil {return False}
  closedir(d)
  return True
}


