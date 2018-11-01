# XRouter description

## Client side

* The client needs to have at least 200 BLOCK on any account
* To run XRouter, the wallet must be unlocked 
* The following client side commands are available via RPC and in blocknetdx-cli:

  * ```xrGetBlockCount currency [confirmations]``` - returns the current block count (blockchain height) for selected currency. Here and below currency is capitalized code (BTC, LTC, SYS etc). The message is send to [confirmations] (here and below confirmations default=1) service nodes and the final result is selected by majority vote
  * ```xrGetBlockHash currency number [confirmations]``` - returns block hash by block number in a specified blockchain.
  * ```xrGetBlock currency hash [confirmations]``` - returns block data by block hash in a specified blockchain.
  * ```xrGetTransaction currency txid [confirmations]``` - returns transaction data by transaction id in a specified blockchain.
  * ```xrGetAllBlocks currency n [confirmations]``` - returns a list of all blocks starting with n for selected currency. Currently no more than 50 last blocks are sent, otherwise error is returned.
  * ```xrGetAllTransactions currency address[:time] [number] [confirmations]``` - returns all transactions to/from address starting from block [number] for selected currency. number=0 if it is not specified explicitly. If time is specified, only blocks created after <time> are searched.
  * ```xrGetBalance currency address[:time]``` - [confirmations] returns balance for selected address for selected currency. If time is specified, only blocks created after <time> are searched.
  * ```xrGetBalanceUpdate currency address[:time] [number] [confirmations]``` - returns balance update for address starting with block number (default: 0) for selected currency. If time is specified, only blocks created after <time> are searched.
  * ```xrGetTransactionsBloomFilter currency filter [number] [confirmations]``` - returns transactions fitting Bloom filter starting with block number (default: 0) for selected currency.
  * ```xrGenerateBloomFilter addr1 [addr2 ... addrN pubkey1 pubkey2]``` - returns hex representation of bloom filter for given addresses or public keys.
  * ```xrGetReply uuid``` - returns the reply by query UUID.
  * ```xrSendTransaction currency transaction``` - sends a raw encoded signed transaction to the specified blockchain.
  * ```xrCustomCall name param1 param2 ... paramN``` - sends a request to a custom service (see below).
  * ```xrUpdateConfigs``` - sends request to update service node configs
  * ```xrStatus``` - prints XRouter status and various info
  
### Client config
* By default XRouter is turned off. If you want to turn it on, you must set ```xrouter=1``` in your blocknetdx.conf
* To change XRouter settings, use file ```xrouter.conf``` in blocknetdx config directory.
* xrouter.conf example:
```
[Main]
wait=30000
confirmations=1
```
* 'wait' parameter defines how long the client waits for a reply from the server. Default value is 20000 milliseconds
* 'confirmations' parameter is the default number of confirmation

### XRouter fees
* The fees to run XRouter commands are specified by each service node individually (see below).
* If the fee to run the selected command is not zero, fee payment transaction is created on the client side and sent to the server
* The fee payment transaction transfers the required amount of BLOCK from the client's funds to the service node pubkey
* The transaction is funded and signed on client side and sent as raw hex string in the packet along with the request. The server verifes that the transaction is correct, sends it to blockchain, and replies with the command execution results. If the fee payment transaction is incorrect, the command is not executed on the server.

### Confirmations and consensus
* The client can specify the required number of confirmations in each command individually or in xrouter.conf
* If more than 1 confirmation is required, the client will send identical requests to multiple service nodes, wait for replies, and select the result with the majority vote
* Each service node is paid its respective fee
  
## Service node side
* To change XRouter settings, use file ```xrouter.conf``` in blocknetdx config directory.
* xrouter.conf example:
```
[Main]
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
blocklimit=20

[LTC::xrGetBalance]
fee=0.3
timeout=30
blocklimit=50

[xrGetAllBlocks]
run=0
blocklimit=1
```

* By default XRouter is turned off. If you want to turn it on, you must set ```xrouter=1``` in blocknetdx.conf
* On the client, you just need to turn on xrouter=1 in xrouter.conf
* On the server (service node), you must specify xrouter=1 and the list of wallets in [Main] section. All other parameters are optional
* Commands listed above are turned on by default. If you want to turn one of them off, set ```run=0``` in its subsection
* By default after each command with 0 fee, the timeout is 2 seconds (if the client requests the same command within 2 seconds, his ban score will increase). This setting can be overriden by parameter timeout, both at global level (in [Main]) and for each command/currency individually in the corresponding subsection.
* ```blocklimit``` parameter sets the maximum number of blocks processed by commands xrGetAllBlocks, xrGetAllTransaction, xrGetBalance, xrGetBalanceUpdate, xrGetTransactionsBloomFilter. The default value is 50 (the node will scan up to 50 blocks deep, if ```number``` parameter is more than 50 blocks behind current chain height, the command will return an error). ```blocklimit=0``` is used to remove this limit (scan up to the genesis block if necessary). Use it with caution.

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

# Future features

## Enhanced confirmations system
* If the number of confirmations required is more than 1, then instead of the whole reply, the service node sends a hash of the reply.
* The client gets hashes from all nodes, selects the reply by majority vote, and then requests the full reply from one of the service nodes that are in the majority
* To request the hash, the client has to pay ```fee/2``` to the respective service node. To get the full reply, the client pays the remaining part of the fee to the selected node only.
* To enable this feature, set ```usehash=1``` in your xrouter.conf

## Domain names system
* Domain names system will be introduced for custom services only at this stage
* The general syntax to use domains is as follows:
```xrCustomCall domain/name param1 param2 ... paramN```
* Without domain specification, the client will look for any node offering plugin called 'name', if there is more than one such node, the ambiguous call will not be handled
* There are two ways to create domain: verified with a special transaction in the chain and simple self-proclaimed

### Verified 
* To create a verified domain name, you need to temporarily lock 50 BLOCK on your account:
  * Create a transaction to yourself with amount = 50 BLOCK and the locking script ```OP_DROP OP_DROP <pubkey> OP_CHECKSIG```
  * Create a transaction that spends the output of the previous transaction with the following unlocking script: ```<sig> "xrouter-domain" <your_domain_name>```
  * If nobody else reserved your_domain_name in the same way earlier, your_domain_name is registered
  * If the domain name is already registered, the transaction has no effect, but you don't lose 50 BLOCK
  * As long as the outputs of the second transaction remain unspent, the domain name remains yours
* Command ```xrQueryDomain <domain_name>``` checks if the domain name is registered and returns the snode hash if it is found
* Command ```xrRegisterDomain <domain_name>``` creates the transactions described above needed to register the domain name

### Simplified domains
* Add a parameter ```domain=my_domain_name``` to xrouter.conf
* If there is no other service node with such domain name, the calls will be handled correctly
* If there is a service node with the same, but verified domain name, the verified name has priority
* If there are two nodes with the same unverified domains, the ambiguous call will not be processed
* The simplified method does not guarantee that your domain name will work for all users and someone could deliberately make your domain name unusable by creating the same, but this method is free and does not require locking the funds

## Payment channels for Fee payment system
* The fee payment will be introduced for ```xrCustomCall``` commands first
  * The client creates the transaction, signs it and sends in the packet to the service node
  * The service node verifies the transaction. If nLockTime is not specified in the transaction, it is send to the chain, and the reply is sent to the client
  * If nLockTime is specified in the transaction, it will be stored in snode's cache until that time. If new transaction arrive from the same client, they will be combined into a single transaction before writing it to blockchain

# XRouter packet contents
* Header has the same format as XBridge packet
* After that all parameters are variable-length strings (ending with '\0')
* * ID of your transaction with MIN_BLOCK (currently 200)
* * Vout number of your transaction with MIN_BLOCK
* * Query UUID - unique ID for each XRouter query. Replies are fetched by UUID
* * <currency> - either chain identifier (BTC, BLOCK etc), or plugin name if calling a plugin
* * <payment tx> - info about payment. See details below
* * Additional parameters (the number can be arbitrary for plugin calls)
* * Signature
* Payment transaction string format
* * It is one string separated by ';' signs
* * First part is 'hash' or 'nohash' depending on whether the reply should be hashed
* * Second part is 'single' or 'channel'. 'channel' means that the payment is done via CLTV channel
* * Third part is hex-encoded raw transaction if the second part is 'single' or if the channel already exists
* * If the channle is created, the following info is sent separated by ';': Raw transaction creating the channel; txid of the channel creation transaction; Redeem script; First payment over the channel