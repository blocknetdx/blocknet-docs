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
  * ```xrGenerateBloomFilter addr1 [addr2 ... addrN pubkey1 pubkey2]``` - returns hex representation of bloom filter for given addresses or public keys.
  * ```xrGetReply uuid``` - returns the reply by query UUID.
  * ```xrSendTransaction currency transaction``` - sends a raw encoded signed transaction to the specified blockchain.
  * ```xrCustomService name param1 param2 ... paramN``` - sends a request to a custom service (see below).
  * ```xrUpdateConfigs``` - sends request to update service node configs
  * ```xrStatus``` - prints XRouter status and various info
  
  
## Service node side
* To change XRouter settings, use file ```xrouter.conf``` in blocknetdx config directory.
* xrouter.conf example:
```
[Main]
xrouter=1
wallets=BLOCK,SYS,BTC
plugins=plugin1,plugin2
timeout=2
wait=30000

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
```

* By default XRouter is turned off. If you want to turn it on, you must create xrouter.conf and set ```Main.xrouter=1```
* On the client, you just need to turn on xrouter=1 in xrouter.conf
* On the server (service node), you must specify xrouter=1 and the list of wallets in [Main] section. All other parameters are optional
* Commands listed above are turned on by default. If you want to turn one of them off, set ```run=0``` in its subsection
* By default after each command with 0 fee, the timeout is 2 seconds (if the client requests the same command within 2 seconds, his ban score will increase). This setting can be overriden by parameter timeout, both at global level (in [Main]) and for each command/currency individually in the corresponding subsection.
* 'wait' parameter defines how long the client waits for a reply from the server. Default value is 20000 milliseconds

## Plugins/custom services
* Plugin configs must be placed into 'plugins' subdirectory of blocknetdx config directory.
* Each plugin must have a separate config
* Plugin filename must end with .conf
* To turn plugin on, include its name in 'plugins' parameter in xrouter.conf. For example, 'plugins=p1,p2' will load plugins specified by plugins/p1.conf and plugins/p2.conf
* Parameter 'type' is mandatory. Valid values: 'rpc' and 'shell'
* RPC plugin config example:
```
type=rpc
paramsCount=1
paramsType=int
private::rpcPort=41419
private::rpcUser=blocknetdxrpc
private::rpcPassword=mypassword
rpcCommand=getblockhash
```
* This sample plugin runs getblockchash command via RPC (same as xrGetBlockHash)
* Parameter paramsCount is mandatory. Instead of paramsCount you can specify minParamsCount and maxParamsCount, making the last parameters optional
* Parameter paramsType is mandatory for RPC plugins. Currently supported types are 'string', 'bool' and 'int'. The string must match maxParamsCount, i.e. is there are two parameters, the string must list types for all of them such as: 'int,string'
* Parameters rpcPort, rpcUser, rpcPassword and rpcCommand are mandatory
* Put 'private::' in front of the parameter name in the config to avoid sharing it with client nodes
* Another sample (call to SYScoin):
```
type=rpc
minParamsCount=2
maxParamsCount=3
paramsType=int,int,string
private::rpcPort=8370
private::rpcUser=username
private::rpcPassword=password
rpcCommand=listassetallocationtransactions
```
* In this plugin parameter 3 is optional.
* Shell plugin config example:
```
type=shell
paramsCount=0
private::cmd="/home/snode/test.sh"
```
* Parameters paramsCount and cmd are mandatory
