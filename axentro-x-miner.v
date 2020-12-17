module main
import chalk
import os
import flag
import client

fn main() {
   mut fp := flag.new_flag_parser(os.args)
   fp.application('axentro-x-miner')
   fp.version('v0.0.1')
   fp.description('Axentro cross platform miner')
    
   fp.skip_executable()

   url := fp.string('node', `n`, 'http://mainnet.axentro.io', 'Node url to mine against')

   process := fp.int('process', `p`, 1, 'Number of processes')

   address := fp.string_opt('address', `a`, 'Your wallet address') or { 
      println(fp.usage())
	  println(chalk.fg('Please supply a wallet address', 'red'))
	  return
   }

   println(address)
   println(url)
   println(process)

   client.connect(client.Config{url,address,process})
}