# BLOCKNET DX
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/BlockDXlogo.png "Logo Title Text 1")

## Blocknet Decentralised Exchange Trader Setup Guide

Blocknet’s DX uses the xbridgep2p™ blockchain router technology to enable users to exchange tokens and assets, and to utilise smart contracts between blockchains.


## Summary

* Download BlocknetDX wallet v3.9.10+

  * Sync and encrypt wallet 
  * Create/edit `xbridge.conf` & `blocknetdx.conf` files
  
* Download a minimum of 2 trading wallets

  * Sync and encrypt wallets   
  * Create/edit `xwallet.conf` for each wallet   
  * Label receiving addresses for each wallet
  * Send funds to labelled addresses
  
* Initiate startup sequence

  * Open all trader wallets, sync up, unlock   
  * Open the BlocknetDX wallet, sync up, unlock   
  * Ensure communication between wallets by checking the built-in DX address book
  
* Download current release of the Block DX UI app

  * Open executable, configure settings to match `blocknetdx.conf`   
  * Restart Block DX app
   
* To make/take an order, copy/paste your labelled address for each coin under the "ORDER FORM" section
  * To cancel the open order, hit the "X" beside the order in the "OPEN ORDERS" section

Integration is via the wallets’ RPC APIs. For security reasons we recommend that wallets all run on a single box and communicate over localhost (127.0.0.1), though wallets may also be run on multiple machines and connect via IP address. General documentation on JSON RPC features is available at https://en.bitcoin.it/wiki/Running_Bitcoin.


## Blocknet DX Exchange Tutorial Video
 * [Built-in UI DX Exchange Tutorial](https://www.youtube.com/watch?v=DlYbDzG_l5w)
 * Block DX Beta Tutorial Video Coming soon


## Requirements

* BlocknetDX wallet v3.9.10+, encrypted, fully synced. [GitHub Releases](https://github.com/BlocknetDX/BlockDX/releases)

* Block DX Beta UI. [GitHub Releases](https://github.com/BlocknetDX/blockdx-ui/releases)

* Confirmed wallet release of each coin you want to trade with (fully synced, encrypted)

     * Coins you want to trade with need to be sent to a labelled receive address on each wallet 

* Properly configured .conf files for each wallet


## Setup .conf Files for the Trading Wallets
The wallet of each coin you want to trade with needs to be configured with a username/password and allowed from IP, if you’re using only a local machine use IP:127.0.0.1

 * To see the full list of compatible wallet configurations go to: [Wallet Configurations](https://github.com/BlocknetDX/blocknet-docs/blob/master/walletsCONF.md)

   * Download a confirmed wallet release. The wallet release you should use is designated beside the wallet .conf name
 
   * Let the wallet sync up fully, then close the wallet

 * Navigate to the trading wallets data directory, eg. Bitcoin
 
   * Windows data directroy location: `C:\Users\[yourusername]\AppData\Roaming\bitcoin\`
 
   * Linux data directory location: `~/.bitcoin/`
 
   * MacOS data directory location: `~/Library/Application Support/bitcoin/`

 * If you don’t have a .conf file started you will need to open up a text editor to create one.

 * Navigate to [Wallet Configurations](https://github.com/BlocknetDX/blocknet-docs/blob/master/walletsCONF.md) and copy/paste the configuration information for the wallet you are running. (this can be added to what is already present in the file if you have “addnodes” or other configurations already):
   * Eg. bitcoin.conf
   
   ```
   server=1
   listen=1
   rpcuser=yourusername
   rpcpassword=yourpassword
   rpcallowip=127.0.0.1
   ```
   
   * Ensure the configuration is correct. Do not assume the configurations are the same for each wallet.

 * Change `rpcuser` and `rpcpassword` to something unique to you. For security reasons you should have a different RPC username and password for each wallet

 * If you’re using a single machine use IP: `127.0.0.1`

 * When you are done, click -> ‘File’ -> ‘Save as’, then type in: `bitcoin.conf`, and change the ‘Save as’ type to "All Files"
    * Ensure the file is not bitcoin.conf.**txt**

 * Save it and then place the .conf into its corresponding data directory
  
 * Remember what you wrote for the username, password, and IP

 * Create .conf files for each wallet you are going to be using on the decentralised exchange.
    * Ensure `rpcuser` and `rpcpassword` are different on each wallet for security purposes
    
 * Once the .conf is saved, restart the wallet and proceed to the next section.


## Configure Coin Addresses
In each wallet, create a new address and label it something informative, like “DX address” (xbridge expects a labelled receive address)

 * To create a new address, go to your wallet’s “receive” tab and click “new address”

 * To label an address, you may either right-click on it or click the “label” field.
 
 ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/labelledaddress.PNG "Logo Title Text 1") 

 * Send the funds you want to trade with to the labelled address
 
 * This needs to be done for all the wallets you want to trade with
 

## Setup xbridge.conf

The Blocknet’s Xbridge technology is integrated into the latest wallet release. See [GitHub](https://github.com/BlocknetDX/BlockDX) for the source code.

 * To see the full list of coin .conf's see: [xbridge.conf](https://github.com/BlocknetDX/blocknet-docs/blob/master/xbridgeCONF.md)

 * Create/edit an `xbridge.conf` file and place the following configuration file in the BlocknetDX wallet data directory 
 
   * Windows data directroy location: `C:\Users\[yourusername]\AppData\Roaming\blocknetdx\`
 
   * Linux data directory location: `~/.blocknetdx/`
 
   * MacOS data directory location: `~/Library/Application Support/blocknetdx/`

 * Note: to avoid crashes or failed trades, please edit your `xbridge.conf` to only have the wallets you are trading with

 * Type in the RPC usernames and passwords you created for each currency pair into the “Username” and “Password” fields
 
 * You can leave the `Address=` line empty as this function is not being utilized right now
   
 * Ensure the rest of the configuration matches [xbridge.conf](https://github.com/BlocknetDX/blocknet-docs/blob/master/xbridgeCONF.md) for each coin

 * Save the File (if you just edited the existing file, just click save, if you made a new file then click file, save as, and in the file name type: `xbridge.conf`
    * Ensure the file is not xbridge.conf.**txt**

 * Place this file into the BlocknetDX wallet data directory folder

 * You will be coming back to this to edit it in the future to add future coins, as well as to change `rpcusername` `rpcpassword` 
 
 * Do not change the other settings in the .conf file as this will most likely result in a failed trade.
 
 
## Setup blocknetdx.conf

In order for the BlocknetDX wallet to be used alongside the Block DX UI you need to edit the `blocknetdx.conf`

* Navigate to the BlocknetDX wallet data directory folder

* Find the `blocknetdx.conf` and side click, edit

* Copy/Paste the following:

```
listen=1
server=1
rpcallowip=127.0.0.1
rpcuser=
rpcpassword=
port=41412
rpcport=41414
```

* Add a username/password beside the `rpcuser=` & `rpcpassword=` section, as this is how you'll gain access to the Block DX UI

* Save and close

## Wallet Start up Sequence
 * Start the coin pair(s) you are trading with
    * Ensure every wallet is fully sync'd and unlocked

 * Start the BlocknetDX wallet after starting the other wallets
   
   
## Verify communication between wallets
In order to ensure that the BlocknetDX wallet is communicating with your trader wallets and the .conf files are setup properly follow the steps below:

* Navigate to the "blocknet dx" tab in the BlocknetDX wallet

* Click the "New Transactions" button

* Click the address book button

* If you're configured properly, your trader wallets will start to populate with your labelled addresses
    * Note: It may take a minute to load all your wallets
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/address_book.PNG "Logo Title Text 1")
    
Now that your wallets are communicating with the BlocknetDX wallet you can proceed to starting the Block DX UI app.

If your wallets are not populating, head to the "Problem Diagnosis" section before proceeding to the next step. 


## Block DX Start up

When everything is configured and communicating you are now ready to open up the Block DX UI. Follow these last steps:

* Run BLOCK DX.exe

* A settings window will open up. This is where you will fill in your `rpcusername` & `rpcpassword` stated in your `blocknetdx.conf`. Main-net RPC port will be `41414`.

![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/blockdxSETTINGS.PNG "Logo Title Text 1")

* Click ‘SAVE CHANGES’, and the application will reset with these settings. After the reset the Block DX UI will re-open.

* Your trader wallet balances will show up under the "MY BALANCES" area.

![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/balancesUI.PNG "Logo Title Text 1")

* If you are going to make or take an order, you need to copy/paste both coins labelled addresses in the "ORDER FORM" area.

![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/orderformUI.PNG "Logo Title Text 1")

* To cancel an order, there will be a "X" beside your open order under the "OPEN ORDERS" area.

![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/cancelUI.PNG "Logo Title Text 1")

## Problem Diagnosis
* To verify that each wallet is communicating with xbridge make sure the created receive addresses for each wallet is listed in the address book. If this part fails, close your wallets and review the configuration files. Block DX UI will have issues starting if no labelled addresses are populated in the address book.

* Ensure you have sent the funds you wish to trade with to the labelled address. Ensure these are confirmed.

* If you made changes to any .conf file you need to close and restart that wallet, including Blocknet 

* Verify the ports are actually open. You may use Command Prompt to do so by typing in `netstat -an` and reviewing the print. Check that the ports you specified in the .conf files (ex: 8332 for Bitcoin) are open over localhost (127.0.0.1).

* Ensure all .conf files are configured properly. These configurations are very case-sensitive. Any wrong data entered in them could be causing the issues.

* Check that no OS-based firewall is blocking communication. You may do this through your firewall’s interface.

* Check the xbridge log for any errors in: C:\Users\yourusername\AppData\Roaming\blocknetdx\log

* Check on general wallet events in C:\Users\yourusername\AppData\Roaming\walletname\debug.log


## Security Tips
(With thanks to threepwood)

Since our technology essentially makes you your own exchange, here are some tips on how to keep your money safe.

   * The Blocknet’s team will never ask for your private keys or coins. Do not get fooled by impersonators.

   * Always move your coins from centralized exchanges to your private wallet.

   * Use a long and random password.

   * Set up 2FA on logins and any withdrawals.

   * Make sure your stored emails do not contain any extra information such as passwords or social security numbers.

   * Use different email addresses where possible. This limits the ability for hackers to run their automated "Forgot my password" links. 
   
   * Online Activity / Personal Information Disclosure. Do not promote your coin count etc online.

   * Limit your online public persona. This can attract unwanted attention which can make you a target.

   * Disable any online accounts you no longer use.

   * Assume hacking groups are building up social profiles on yourself. Your interests, time you are usually online, who you interact with.

   * Do not open random links and files provided in Slack, etc.

   * Do not fall for sob stories (Boohoo I lost all my coins) without proper due diligence.

   * Take multiple backups of your private keys regularly.

   * Verify backup by importing keys to the client.

   * Store your backups in paper format if possible.

   * Use dedicated wallet / staking PC and make it your safe haven. DO NOT USE IT FOR ANY OTHER ONLINE ACTIVITIES.

   * Encrypt your hard drives.

   * Use open source where possible.

   * Keep your software updated.

   * Do not install software from unknown 3rd party actors.

   * Use network level segmentation and mitigate attack surface against your wallet PC.
