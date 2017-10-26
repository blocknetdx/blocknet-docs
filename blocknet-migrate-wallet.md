## Steps for migrating from old chain to new chain
- Backup the wallet.dat file before doing anything (make 2 separate copies)
- For Windows, the wallet.dat file can be found in C:\Users\User\AppData\Roaming\blocknet (or \BlocknetDX in newer updates)
- For OSX, the wallet.dat file can be found in ~/Library/Application Support/blocknet (or /BlocknetDX in newer updates)
- Fully unlock wallet(not just for staking) from the UI (in main menu, "Settings" > "Unlock Wallet")
- Use the debug console(in main menu, "Tools" > "Debug Console") and type ```dumpwallet filename.txt``` (replace "filename.txt" with a name of your choice)
- The file will be located in the directory you launched the wallet from

## Download new wallet
- Launch wallet
- Use the debug console and type ```importwallet filename.txt``` replace filename.txt with the file name used in the dumpwallet command above
- Verify the old addresses were imported via debug console by typing ``` listreceivedbyaddress 0 true```

## When to move your wallet.dat and start using the new wallet
- Any time there is a chain fork you will need to move your wallet.dat file
- If a specific wallet version is needed for a fork, may download the new wallet, sync up, and move your wallet.dat to it's directory prior to the fork
- However, the new wallet's balance will remain zero until the migration(fork)
- A snapshot will be taken at the time of the final block on the old chain
- Once the snapshot is applied to the new chain, your balance will reflect in the new wallet
- It can be expected that (centralized) exchanges will re-enable trading once they have confirmed that the new chain is functioning as expected.

## Trouble syncing the new chain
- Close the wallet
- Backup the wallet.dat file before doing anything (make 2 separate copies)
- Backup the blocknetdx.conf file if running a service node (make 2 separate copies)
- Open the wallet and let the chain sync
- Replace the created wallet.dat anf blocknetdx.conf file with the backed-up copy
