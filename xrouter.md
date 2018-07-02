# XRouter description

## Client side

* The client needs to have at least 200 BLOCK on any account
* To run XRouter, the wallet must be unlocked 
* The following client side commands are available via RPC and in blocknetdx-cli:

  * ```xrGetBlockCount currency [confirmations]``` - returns the current block count (blockchain height) for selected currency. Here and below currency is capitalized code (BTC, LTC, SYS etc). The message is send to [confirmations] (here and below confirmations default=3) service nodes and the final result is selected by majority vote
  * ```xrGetBlockHash currency number [confirmations]``` - returns block hash by block number in a specified blockchain.
  * ```xrGetBlock currency hash [confirmations]``` - returns block data by block hash in a specified blockchain.
  * ```xrGetTransaction currency txid [confirmations]``` - returns transaction data by transaction id in a specified blockchain.
  * ```xrGetAllBlocks currency n [confirmations]``` - returns a list of all blocks starting with n for selected currency.
  * ```xrGetAllTransactions currency address [number] [confirmations]``` - returns all transactions to/from address starting from block [number] for selected currency. number=0 if it is not specified explicitly.
  * ```xrGetBalance currency address``` - [confirmations] returns balance for selected address for selected currency.
  * ```xrGetBalanceUpdate currency address [number] [confirmations]``` - returns balance update for address starting with block number (default: 0) for selected currency.
  * ```xrGetTransactionsBloomFilter currency filter [number] [confirmations]``` - returns transactions fitting Bloom filter starting with block number (default: 0) for selected currency.
  * ```xrGenerateBloomFilter addr1 [addr2 ... addrN] [confirmations]``` - returns hex representation of bloom filter for given addresses.
  * ```xrGetReply uuid``` - returns the reply by query UUID.
  * ```xrSendTransaction currency transaction``` - sends a raw encoded signed transaction to the specified blockchain.
  
## Service node side
* To change XRouter settings, use file ```xrouter.conf``` in blocknetdx config directory.
* xrouter.conf example:
```
[Main]
xrouter=1
services=myservice1,myservice2
timeout=2

[xrGetBlockCount]
fee=0.01

[xrGetBlockHash]
fee=0.01

[xrGetBalance]
fee=0.1
timeout=50

[BTC::xrGetBalance]
fee=0.5
timeout=50

[LTC::xrGetBalance]
fee=0.3
timeout=30

[xrGetAllBlocks]
run=0

[myservice1]
fee=0.1
type=rpc
paramsCount=3
rpcPort=9999
rpcUser=username
rpcPassword=password

[myservice2]
fee=0.01
type=shell
paramsCount=3
cmd="python /home/snode/myservice2.py --additional_param"
```

* By default XRouter is turned off. If you want to turn it on, you must create xrouter.conf and set ```Main.xrouter=1```
* Commands listed above are turned on by default. If you want to turn one of them off, set ```run=0``` in its subsection
* By default after each command with 0 fee, the timeout is 2 seconds (if the client requests the same command within 2 seconds, his ban score will increase). This setting can be overriden by parameter timeout, both at global level (in [Main]) and for each command/currency individually in the corresponding subsection.
* Custom services (see:myservice1, myservice2) are not implemented yet
