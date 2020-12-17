module client

import x.websocket
import protocol
import chalk

pub struct Config {
	pub:
	url string
	address string
	process int
}

pub fn connect(config Config) ? {
	mut ws := websocket.new_client(config.url + '/peer')?

	ws.on_open_ref(fn (mut ws websocket.Client, config &Config) ? {
		ws.write_str(protocol.handshake(config.address,'535061bddb0549f691c8b9c012a55ee2')) or {
			eprintln('could not handshake')
		}
	}, &config)

	ws.on_error(fn (mut ws websocket.Client, err string) ? {
		println('error: $err')
	})

	ws.on_close(fn (mut ws websocket.Client, code int, reason string) ? {
		println('closed')
	})

	ws.on_message_ref(fn (mut ws websocket.Client, msg &websocket.Message, config &Config) ? {
		if msg.payload.len > 0 {
			transport := protocol.message_received(msg.payload.bytestr()) or { return }
			message_type := transport.message_type
			content := transport.content

            match message_type {
				0x002 { 
				  accepted := protocol.accepted(content) or { return }
				  ws.logger.info(chalk.fg('Working on block: ${accepted.block.index}','light_blue'))  	
				}
				else { println('unknown message received')}
			}

		}
	}, &config)

    ws.connect() or {
		println('error on connect: $err')
	}

	ws.listen() or {
		println('error on listen $err')
	}
	unsafe {
		ws.free()
	}
}