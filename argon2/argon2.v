module argon2

#flag -I @VROOT/c
#flag @VROOT/c

#include "include/argon2.h"


fn C.argon2id_hash_raw(t_cost u32, m_cost u32, parallelism u32, pwd voidptr, pwdlen u32, salt voidptr, saltlen u32, hash voidptr, hashlen u32) int
