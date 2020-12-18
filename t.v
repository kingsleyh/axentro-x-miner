import argon2
// import crypto.rand
// import math

fn main() {
  pwd := 'password2'
  salt := "saltsalt"

  r := argon2.argon2id_hash(1, 65536, pwd, salt, 512) or { return }
  println(r)

// nonce := rand.int_u64(math.max_u64) or { return }
// println(nonce.hex())
}