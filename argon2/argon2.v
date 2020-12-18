module argon2

import constants

#flag @VROOT/c/src/argon2.o
#flag @VROOT/c/src/core.o
#flag @VROOT/c/src/thread.o
#flag @VROOT/c/src/encoding.o
#flag @VROOT/c/src/blake2/blake2b.o
#flag @VROOT/c/src/ref.o

#flag -I @VROOT/c/include
#include "argon2.h"

fn C.argon2id_hash_raw(t_cost u32, m_cost u32, parallelism u32, pwd voidptr, pwdlen u32, salt voidptr, saltlen u32, hash voidptr, hashlen u32) constants.Response

pub fn argon2id_hash(t_cost int, m_cost int, pwd string, salt string, hashlen int) ?string {
  parallelism := u32(1)
  pwdlen := u32(pwd.len)
  saltlen := u32(salt.len)
  hash := []byte{len: hashlen}

  r := C.argon2id_hash_raw(u32(t_cost), u32(m_cost), parallelism, pwd.str, pwdlen, salt.str, saltlen, hash.data, u32(hashlen))
  if r == constants.Response.argon2_ok {
    return hash.hex()
  } else {
    return error('argon2 algorithm error: $r')
  }
}