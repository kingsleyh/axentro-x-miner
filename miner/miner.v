module miner

import crypto.rand
import math
import time

pub fn mine(block_difficulty BlockDifficulty) {
  nonce := rand.int_u64(math.max_u64) or { return }
  mut latest_nonce := nonce
  mut latest_time := time.now().unix_time_milli()
  condition := true

  for condition == true {
	  
  }

}