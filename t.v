import argon2

fn main() {
  pwd := 'password'
  salt := "saltsalt"
  hash := '4d445e11c05382adc85ca56242fd9166e521cfa793e73f0baec39ec8d4977e7c'	
  pwdlen := u32(pwd.len)
  saltlen := u32(salt.len)
  hashlen := u32(hash.len)
 

  r := C.argon2id_hash_raw(1, 65536, 1, pwd.str, pwdlen, salt.str, saltlen, hash.str, hashlen)
  println(r)
}

