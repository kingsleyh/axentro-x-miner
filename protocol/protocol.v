module protocol

import json

const (
	core_version = 1
)

struct Transport {
	pub:
	message_type int [json: 'type']
	content string
}

struct HandshakeRequest {
  version int
  mid string
  address string
}

struct BlockDifficulty {
	pub:
	block Block
	difficulty int
}

struct Block {
	pub:
    index i64
	transactions []Transaction
	nonce i64
	prev_hash string
	merkle_tree_root string
	timestamp i64
	difficulty int
	kind string
	address string
}

struct Transaction {
	pub:
	id string
	action string
	senders []Sender
	recipients []Recipient
	message string
	token string
	prev_hash string
	timestamp i64
	scaled int
	kind string
	version string
}

struct Sender {
  address string
  public_key string
  amount string
  fee string
  signature string
}

struct Recipient {
  address string
  amount i64
}

pub fn handshake(address string, mid string) string {
	message_type := 0x001
	content := HandshakeRequest{core_version, mid, address}
	data := Transport{message_type, json.encode(content)}
    return json.encode(data)
}

pub fn message_received(response string) ?Transport {
  transport := json.decode(Transport, response) or { 
	  eprintln('error decoding message received')
	  return none
	  }
	  return transport
} 

pub fn accepted(content string) ?BlockDifficulty {
	// println(content)
  block_difficulty := json.decode(BlockDifficulty, content) or {
	  eprintln('error decoding accepted')
	  return none
  }	  
//   println(block_difficulty)
  return block_difficulty
}