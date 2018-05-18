# XRouter description

## Client side

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

## Service node side

* By default XRouter is turned on. If you want to turn it off, create a file xrouter.conf in blocknetdx data directory with ```xrouter=0``` as contents
* TBD

