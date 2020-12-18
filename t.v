import argon2

fn main() {
  pwd := 'password2'
  salt := "saltsalt"
  hash := []byte{len: 512}
  pwdlen := u32(pwd.len)
  saltlen := u32(salt.len)
  hashlen := u32(hash.len)

  r := C.argon2id_hash_raw(1, 65536, 1, pwd.str, pwdlen, salt.str, saltlen, hash.data, hashlen)
  println(r)
  println(hash.hex())
}