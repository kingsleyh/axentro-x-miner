module miner

import crypto.rand
import math
import time
import argon2

fn validate(block_hash string, block_nonce_hex string, difficulty int) bool {
  return argon2.argon2id_hash(1, 65536, block_hash, block_nonce_hex, 512) or { return false }
}

pub fn mine(block_difficulty BlockDifficulty) {
  nonce := rand.int_u64(math.max_u64) or { return }
  mut latest_nonce := nonce
  mut latest_time := time.now().unix_time_milli()
//   condition := true

//   for condition == true {

//   }

}