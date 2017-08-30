## Steps for migrating from old chain to new chain
- backup your wallet.dat before you doing anything (make 2 separate copies)
- unlock wallet from the UI (fully unlocked, not just for staking)
- Use the debug console and type ```dumpwallet filename.txt``` (replace "filename.txt" with a name of your choice). The file will be located in the directory you launched the wallet from

## Download New Wallet
- launch wallet
- in debug console ```importwallet filename.txt``` replace filename.txt with that you used with the dumpwallet command
- verify addresses
- via debug console type
``` listreceivedbyaddress 0 true```

## When to move your wallet.dat and start using the new wallet
- it is not important when you download the new wallet, sync up, and move your wallet.dat to its directory.
- however, your new wallet's balance will remain zero until the migration on 1 September.
- a snapshot will be taken on 1 September, after the final block on the old chain. The first block to be created after 08:00 PDT (15:00 UTC) shall be the final block.
- once the snapshot is applied to the new chain, your balance will reflect in the new wallet
- you can expect (centralized) exchanges to re-enable trading once they have confirmed that the new chain is functioning as expected.

## Funds will arrive on Sept 1
