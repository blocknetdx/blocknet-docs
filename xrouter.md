# XRouter Documentation

XRouter allows anyone to provide SPV and custom microservices both free and paid options in `BLOCK`.

* All XRouter fees are paid in `BLOCK`
* To run XRouter, the wallet must be unlocked or unencrypted and :
  + `xrouter=1` must be specified in `blocknetdx.conf`
  + `xrouter.conf` must be added to the `datadir`

## XRouter Node Sample list (xwallets)

* XRouter nodes report their supported commands in their `xwallets` field (run in wallet console).

```
servicenode list
{
    "rank" : 2,
    "txhash" : "3527f3e803195d77dfe6f9c5fffec1a93e7ba8a2f2c124a710cc29cf96072c89",
    "outidx" : 0,
    "status" : "ENABLED",
    "addr" : "yGyvu6uHJ9WLftPgwHeAU5HwmgGmpB3Juh",
    "version" : 70712,
    "lastseen" : 1553150037,
    "activetime" : 0,
    "lastpaid" : 0,
    "xwallets" : "BLOCK,BTC,LTC,SYS,xr,xr::BLOCK,xr::BTC,xr::LTC,xr::SYS,xrs::GetBlockHashBTC"
}
```

`xrs::GetBlockHashBTC` is a custom service that returns the hash for the specified bitcoin block. Here's an example of fetching the bitcoin genesis block (run in wallet console or use command line `blocknetdx-cli`):
```
xrService GetBlockHashBTC 0
{
    "reply" : "000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f",
    "uuid" : "371d76b7-554d-409a-bf62-1201610b1e07"
}
```

## XRouter Commands

The following client side commands are available via RPC and in `blocknetdx-cli` or wallet console:

```
xrGetBlockCount currency [servicenode_consensus_number]
```
^ Returns the current block count (blockchain height) for selected currency. Here and below currency is capitalized code (BTC, LTC, SYS etc). The message is send to [servicenode_consensus_number] (here and below servicenode_consensus_number default=1) service nodes and the final result determined by majority consensus from service nodes.
```
xrGetBlockHash currency number [servicenode_consensus_number]
```
^ Returns block hash by block number in a specified blockchain.
```
xrGetBlock currency hash [servicenode_consensus_number]
```
^ Returns block data by block hash in a specified blockchain.
```
xrGetTransaction currency txid [servicenode_consensus_number]
```
^ Returns transaction data by transaction id in a specified blockchain.
```
xrGetBlocks currency n [servicenode_consensus_number]
```
^ Returns a list of all blocks starting with n for selected currency. Currently no more than 50 last blocks are sent, otherwise error is returned.
```
xrGetTransactions currency address [number] [servicenode_consensus_number]
```
^ Returns all transactions to/from address starting from block [number] for selected currency. number=0 if it is not specified explicitly.
```
xrGetTxBloomFilter currency filter [number] [servicenode_consensus_number]
```
^ Returns transactions fitting Bloom filter starting with block number (default: 0) for selected currency.
```
xrGenerateBloomFilter addr1 [addr2 ... addrN pubkey1 pubkey2]
```
^ Returns hex representation of bloom filter for given addresses or public keys.
```
xrGetReply uuid
```
^ Returns the reply by query id.
```
xrSendTransaction currency transaction
```
^ Sends a raw encoded signed transaction to the specified blockchain.
```
xrService name param1 param2 ... paramN
```
^ Sends a request to a custom service (see below).
```
xrUpdateConfigs
```
^ Update service node configs
```
xrReloadConfigs
```
^ Reload `xrouter.conf` from disk (useful if you changed its contents while the client is running)
```
xrStatus
```
^ Prints XRouter status and various info

### Client config

* By default XRouter is turned off. If you want to turn it on, you must set `xrouter=1` in `blocknetdx.conf`
* To change XRouter settings put `xrouter.conf` in the blocknet wallet's datadir.
* Sample `xrouter.conf`:

```
[Main]
wallets=BLOCK
timeout=30
consensus=1
fee=0
maxfee=0.5
clientrequestlimit=50

[xrGetBlockCount]
maxfee=0.1
clientrequestlimit=10

[SYS::xrGetBlockCount]
fee=0.1
maxfee=0.2
```

* `wallets` wallets that are supported by your xrouter node. This is only required if you are running an xrouter node (service node).
* `timeout` in seconds defines how long your client waits for a reply from an xrouter node. Default is 30 seconds.
* `consensus` is the number of service nodes you wish to query for consensus. This can be overridden by specifying `servicenode_consensus_number` in various commands.
* `fee` this is only used if you're running an XRouter node, see the next section.
* `maxfee` is the maximum fee you are willing to pay an xrouter node for calls. You can set maximum per-command or per-chain `maxfee` in other sections e.g. `xrGetBlockCount`. Service nodes with fees higher than your specified `maxfee` will not be queried. The default value is 0 (i.e. free calls only).
* `clientrequestlimit` this is only used if you're running an XRouter node, see the next section.

*Note that all config parameters under subsections (i.e. `[xrGetBlockCount]`) will override top-level [Main] values.*

### XRouter fees

* All fees are paid in `BLOCK`.
* XRouter nodes set their own fees and you have the option to choose a maximum fee you're willing to pay for each call.
* It's possible to make free calls if XRouter nodes support free calls.
* When you make a paid XRouter call the wallet will create a transaction on your behalf and send it to the XRouter node as payment.
* The transaction is funded and signed on client side and sent as raw hex string in the packet along with the request. The server checks your transaction and sends it to the blockchain. The XRouter node will then reply to your request. If the fee payment transaction is incorrect, the command is not executed on the server.
* If you are submitting requests to multiple XRouter nodes you'll need multiple utxos available in your wallet. Otherwise you will need to split your funds.

### Consensus

* The client can specify the required number of `consensus` nodes in each command individually or in `xrouter.conf` [Main] section.
* If more than 1 reply is required, the client will send identical requests to multiple XRouter nodes, wait for replies, and select the most common result (result with majority consensus).
* When using the `consensus` (confirmations) parameter, you are paying each XRouter node their respective fee. The only exception is if the XRouter nodes are providing free calls.

## XRouter Node (service node operators)

An XRouter node is a service node on the Blocknet protocol with XRouter turned on. It's possible for XRouter nodes to provide custom blockchain services on Blocknet's p2p network. This allows you to monetize your server and custom services (even non-blockchain services). For example, if you have a fully synced Bitcoin node with txindex on, you can use XRouter to sell transaction information on Bitcoin's blockchain. So if a user doesn't want to download the full chain but they needed to know information about a transaction they could query your XRouter node and you can charge them a fee to do so.

To use XRouter, place a `xrouter.conf` in the blocknetdx config directory (This would sit next to `xbridge.conf`).

Sample `xrouter.conf`:

```
[Main]
wallets=BLOCK,SYS,BTC
plugins=plugin1,plugin2
timeout=30
consensus=1
fee=0
maxfee=0.5
clientrequestlimit=50

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
disabled=1
blocklimit=1
```

**Note* All fee payments are in BLOCK at this time**

In addition to the config descriptions above, these are specific to XRouter node operators (Service node operators w/ XRouter enabled):

* `wallets` Specify the wallets you'd like to support XRouter calls on. All commands are on by default for all supported wallets listed in `wallets=`. If you want to turn one of them off, set `disabled=1` in its subsection.
* `fee` Specify the fee you require across all XRouter calls, you may also specify fees for individual calls as you can see in the sample above. The `fee` in the subsection takes precedence over the value in [Main].
* `clientrequestlimit` is optional and defaults to `-1` (no request limit). This value should be specified in milliseconds (e.g. `clientrequestlimit=50` for 20 per second).
* `blocklimit` parameter sets the maximum number of blocks processed. The default value is 50 (the node will scan up to 50 blocks deep, if the `number` parameter is more than 50 blocks behind the current chain height, the command will return an error). `blocklimit=0` means the XRouter node supports returning any number of blocks.

## Plugins (custom services)
* Put `private::` in front of a parameter name that **you do not want client nodes to see**
* Plugin configs must be placed in a `plugins` subdirectory of blocknetdx config directory.
* Each plugin must have a separate config
* Plugin filename must end with `.conf`
* To turn a plugin on, include its name in `plugins=` parameter in `xrouter.conf`. For example, `plugins=p1,p2` will load two plugins (p1 and p2) with config files `plugins/p1.conf` and `plugins/p2.conf`
* Parameter `type` is mandatory. Supported plugin type: `rpc`

### Sample RPC plugin:
```
parameters=int
fee=0.1
clientrequestlimit=50

private::type=rpc
private::rpcport=41419
private::rpcuser=test
private::rpcpassword=testAbc
private::rpccommand=getblockhash
```
* Designate config entires as `private::` that you do not want to be shared with connecting nodes.
* This sample plugin runs getblockhash command via RPC (same as `xrGetBlockHash`)
* `parameters` is optional. If it's not specified, the call will default to 0 parameters. Currently supported types are `string`, `bool`, `double`, `int`. This parameter value must list all the types, e.g. for 4 parameters: `int,string,string,bool`
* `fee` is optional, defaults to `0`. This is the amount of `BLOCK` required to call your plugin.
* `clientrequestlimit` is optional and defaults to `-1` (no request limit). This value should be specified in milliseconds (e.g. `clientrequestlimit=50` for 20 per second).
* Config entries `private::rpcport`, `private::rpcuser`, `private::rpcpassword` and `private::rpccommand` are mandatory for `rpc` plugins.

### Syscoin sample RPC plugin:

This plugin will expose the custom Syscoin call `listassetallocationtransactions`, allowing you to monetize this Syscoin capability to XRouter users.
```
parameters=int,int,string
fee=0.1

private::type=rpc
private::rpcport=8370
private::rpcuser=user
private::rpcpassword=pass
private::rpccommand=listassetallocationtransactions
```

# Future features (these are unsupported at this time)

## Shell plugin
* This plugin as 0 parameters.
```
parameters=
private::type=shell
private::cmd="/home/snode/test.sh"
```
* Parameters `parameters` and `cmd` are mandatory
