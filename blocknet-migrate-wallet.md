## Steps for migrating from old chain to new chain
- backup your wallet.dat before you doing anything (make 2 separate copies)
- unlock wallet from the UI (fully unlocked, not just for staking)
- Use the debug console and type ```dumpwallet filename.txt``` (replace "filename.txt" with a name of your choice). The file will be located in the directory you launched the wallet from

## Download New Wallet
- launch wallet
- in debug console "importwallet filename.txt" replace filename.txt with that you used with the dumpwallet command
- verify addresses
- via debug console type
``` listreceivedbyaddress 0 true```

## Funds will arrive on Sept 1.
