module argon2

#flag @VROOT/c/src/argon2.o
#flag @VROOT/c/src/core.o
#flag @VROOT/c/src/thread.o
#flag @VROOT/c/src/encoding.o
#flag @VROOT/c/src/blake2/blake2b.o
#flag @VROOT/c/src/ref.o

#flag -I @VROOT/c/include
#include "argon2.h"

fn C.argon2id_hash_raw(t_cost u32, m_cost u32, parallelism u32, pwd voidptr, pwdlen u32, salt voidptr, saltlen u32, hash voidptr, hashlen u32) int