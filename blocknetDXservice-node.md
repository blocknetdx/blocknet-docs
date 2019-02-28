# BLOCKNET
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/block.PNG "Logo Title Text 1")

The Internet Of Blockchains

## Blocknet Service Node Setup

**These instructions are to run as a Service Node for the Blocknet Protocol.** 

* Blocknet uses blockchain router technology to enable users to exchange tokens and assets, and to utilise smart contracts between blockchains.

## Summary

* Two computers with the latest Blocknet client installed, encrypted, fully synced.
  * Computer #1 will be the Service Node Server which will need to be running 24/7.
     * This guide will refer to this computer as the " SNODE SERVER "
      
  * Computer #2 will be the client computer where the 5000 Block is locked. This does not need to run 24/7.
     * This guide will refer to this computer as the " CLIENT "

* Download/install latest release of the Blocknet classic wallet (Blocknet x.xx.x (Classic)) on the CLIENT computer.
 https://github.com/BlocknetDX/blocknet/releases/
  * Sync and encrypt wallet.
  * Generate public address for the Service Node.
  * Generate the private key from the Service Node public address.
  * Send exactly 5000 Block to the Service Node public address and wait for 15 confirmations.
  * Generate the transaction output required for configuration files.
  * Create/edit `servicenode.conf` file.
  * Deploy Service Node.
 
* Download/install latest release of the Blocknet classic wallet (Blocknet x.xx.x (Classic)) on the SNODE SERVER.
  https://github.com/BlocknetDX/blocknet/releases/
  * Sync and encrypt wallet.
  * Create/edit the `blocknetdx.conf` file.
  * Setup xwallet's to host on the Service Node.

Integration is via the wallets’ RPC APIs. For security reasons we recommend that wallets all run on a single box and communicate over localhost (127.0.0.1), though wallets may also be run on multiple machines and connect via IP address. General documentation on JSON RPC features is available @ https://en.bitcoin.it/wiki/Running_Bitcoin.

## Requirements

* SNODE SERVER computer Public IP address or the Public IP address if using a VPS.

* 5000 BLOCK to be locked into a Service Node address on the CLIENT computer (the 5000 Block cannot stake while it is locked).

* The latest wallet of each currency you want to host on your Service Node (fully synced, encrypted).

* Properly configured .conf files for each wallet.


## Service Node Setup

* Download the latest Blocknet classic wallet (Blocknet x.xx.x (Classic)) on two computers or VPS. 
   * https://github.com/BlocknetDX/blocknet/releases/
   
* On each computer let the wallet fully sync and encrypt both wallets with a password.
     
### CLIENT Computer Wallet Setup   
   
* Navigate the top toolbar to: `Tools > Debug console`.
   * Type: `getaccountaddress <name>` (Generates a public address key for the Service Node. Create a unique Service Node name.)
      * Eg: `getaccountaddress snode01`
      
   * Type: `servicenode genkey` (Outputs the Service Node private key).
   
   * Take note of these generated outputs as they will be needed in the configuration files.
   
* Send exactly 5000 BLOCK to the Service Node public address.
   * The address needs to have EXACTLY 5000 BLOCK to work properly.
   
   * Under the "Send" option, click the "Choose..." button beside the Transaction Fee option. When you send the 5000 Block, ensure "Send as zero-fee transaction if possible" is checked off. 
   
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/send_5000.PNG "Logo Title Text 1")
   
* Wait for the CLIENT computer to receive the 5000 BLOCK and have at least 15 confirmations on the transaction (TX).

* Once the TX is fully confirmed, navigate back to: `Tools > Debug console`.
   * Type `servicenode outputs` (Outputs the service node TX information needed in the `servicenode.conf`).
   
   * Take note of these generated outputs as they will be needed in the configuration files.
   
* Retrieve your SNODE SERVER computer Public IP address. Go to Google and search "what's my ip". Take note of this address as it will be needed in the configuration files.
   * If using a VPS for the SNODE SERVER computer, retrieve that Public IP address.
   * Main-Net: YOUR_PUBLIC_IP:41412
    
* Navigate to the Blocknet data directory:

   * Windows data directory location: `C:\Users\[yourusername]\AppData\Roaming\BlocknetDX\`
 
   * Linux data directory location: `~/.blocknetdx/`
 
   * MacOS data directory location: `~/Library/Application Support/BlocknetDX/`
   
* Create/edit the `servicenode.conf` file.
   
   * There should be an example of how the configuration needs to be in this file: (You can delete this after yours is typed in)
   ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_conf_ex.PNG "Logo Title Text 1")
   
   * Enter your generated information from above in the format shown in this example:
   ```
   snode01 <YOUR_PUBLIC_IP:41412> <YOUR_SERVICENODE_PRIVATE_KEY> <COLLATERAL_TX_OUTPUT> <TX_OUTPUT_INDEX>
   ```
   
   * Save `servicenode.conf`.
   
   * Restart the wallet. Fully unlock the wallet.
   
### SNODE SERVER Computer Wallet Setup

* Navigate to your Blocknet data directory
   * Create/edit the `blocknetdx.conf` file.
        
   * Type the following information into the `blocknetdx.conf` file: (use `staking=1` if you want to stake on the SNODE SERVER computer)
   
   ```
   staking=1
   servicenode=1
   servicenodeaddr=YOUR_PUBLIC_IP:41412
   servicenodeprivkey=YOUR_SERVICENODE_PRIVATE_KEY
   ```
   
   * Save the `blocknetdx.conf`
   
### Starting Service Node(s)

On the CLIENT computer navigate to the "Servicenodes" button on the GUI. If the setup was done correctly you should see all of your "Aliases".

#### Deploy Service Node via Debug Console

* Navigate to `Tools > Debug console`.

* Type: `servicenode start-alias <name>` Ex: `servicenode start-alias snode01`

* The status of your node(s) should be "ENABLED" and show an "Active time".
   * It may take a moment to show enabled and/or an active time.
   
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_alias.PNG "Logo Title Text 1")    
   
* On the SNODE SERVER computer restart the Blocknet wallet with the Service Node credentials in the `blocknetdx.conf`.

* Your Service Node(s) are now running. Proceed to the next section to ensure the setup worked. You can close off the CLIENT computer Blocknet wallet if you want.  
   
* The CLIENT computer will receive the "Servicenode Rewards". If you are hosting wallets on your Service Node, you will also receive trading fees.


### Status Checks

* On the SNODE SERVER computer navigate the top toolbar to: `Tools > Debug console`.
   * Type `servicenode status` (This will output your Service Node information and a successful message at the end of it)
   
  ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_status.PNG "Logo Title Text 1")    
   
* If you did not receive "Servicenode successfully started" proceed to the "Troubleshooting" section.

* If you received a "Servicenode successfully started" proceed to setup your .conf files for the wallets on your Service Node.
   
   
### Troubleshooting

* Ensure your `servicenode.conf` information is correct to your settings.

* Ensure you don't have "< >" in any of the configuration files : (Eg: `servicenodeaddr=<your_public_IP:41474>` should be `servicenodeaddr=127.0.0.1:41412`).
   * Ensure you are using the correct P2P PORT # `41412`.
     
* Ensure on the CLIENT computer you only have a `servicenode.conf`, the `blocknetdx.conf` is not needed on the CLIENT computer.

* Ensure on the SNODE SERVER computer you only have a `blocknetdx.conf`, the `servicenode.conf` is not needed on the SNODE SERVER computer.
   
* Ensure your configuration files are not `servicenode.conf.txt`.

* Ensure the 5000 BLOCK is exactly 5000 BLOCK, no more or no less and ensure it's confirmed.

* Ensure you have the latest wallet and that it's fully sync'd and fully unlocked.
   

## Setup  .conf Files for the Wallets on Your Service Node:
The wallet of each coin you want to host with needs to be configured with a username/password and allowed from IP, if you’re using only a local machine use `IP:127.0.0.1`.

 * To see the full list of compatible wallet configurations go to: [Wallet Configurations](https://github.com/BlocknetDX/blocknet-docs/blob/master/walletsCONF.md)

   * Download a confirmed wallet release. The wallet release you should use is designated beside the wallet .conf name
 
   * Let the wallet sync up fully, then close the wallet.

 * Navigate to the wallets data directory, eg. Bitcoin
 
   * Windows data directory location: `C:\Users\[yourusername]\AppData\Roaming\bitcoin\`
 
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

 * Change `rpcuser=` and `rpcpassword=` to something unique to you. For security reasons you should have a different RPC username and password for each wallet.

 * If you’re using a single machine use IP: `127.0.0.1`.

 * When you are done, click -> ‘File’ -> ‘Save as’, then type in: `bitcoin.conf`, and change the ‘Save as’ type to "All Files"
    * Ensure the file is not bitcoin.conf.**txt**

 * Save it and then place the .conf into its corresponding data directory.
  
 * Remember what you wrote for the username, password, and IP.

 * Create .conf files for each wallet you are going to be using on the decentralised exchange.
    * Ensure `rpcuser=` and `rpcpassword=` are different on each wallet for security purposes.
    
 * Once the .conf is saved, restart the wallet and proceed to the next section.
 

## Setup xbridge.conf

 * To see the full list of coin .conf's see: [xbridge.conf](https://github.com/BlocknetDX/blocknet-docs/blob/master/xbridgeCONF.md)

 * Create/edit an `xbridge.conf` file and place the following configuration file in the Blocknet wallet data directory:
 
   * Windows data directory location: `C:\Users\[yourusername]\AppData\Roaming\blocknetdx\`
 
   * Linux data directory location: `~/.blocknetdx/`
 
   * MacOS data directory location: `~/Library/Application Support/blocknetdx/`

 * Note: to avoid crashes, please edit your `xbridge.conf` to only have the wallets you are hosting.

 * Type in the RPC usernames and passwords you created for each coin pair into the `Username=` and `Password=` fields.
 
 * You can leave the `Address=` field empty as this function is not being utilized right now.
   
 * Ensure the rest of the configuration matches [xbridge.conf](https://github.com/BlocknetDX/blocknet-docs/blob/master/xbridgeCONF.md) for each coin.

 * If you edited the existing file just save and close. If you made a new file then click -> ‘File’ -> ‘Save as’, then type in: `xbridge.conf`, and change the ‘Save as’ type to "All Files"
    * Ensure the file is not xbridge.conf.**txt**

 * Place this file into the Blocknet wallet data directory folder.

 * You will be coming back to this to edit it in the future to add future coins, as well as to change `Username=` `Password=` & `Ip=` if you're using more than one machine.
 
 * Do not change the other settings in the .conf file.
 

## Startup Sequence
 * Start the wallets you are hosting on your Service Node.
    * Ensure every wallet is fully sync'd and unlocked.
    

 * Start the Blocknet wallet on the SNODE SERVER computer with `-enableexchange`.
    * Eg: blocknetdx-qt.exe -enableexchange
 
 * When you click the "BlocknetDX" tab on the wallet it should say "Exchange mode started".
    * In the console type: `dxGetLocalTokens` to show your list of hosted wallets.
    * In the console type: `servicenode list`, search for your SNODE, under `xwallets` it will show the wallets you are hosting.
       
 * Ensure your Service Node is activated.
 
 
## Verify Communication Between Wallets
In order to ensure that the Blocknet client is communicating with your hosted wallets and the .conf files are setup properly, navigate to the Blocknet data directory.

   * Open the "log" folder. Open up the log file with the current date/time. Eg: `xbridgep2p_20170831T181856.log`

   * The log should contain no errors and at least the following:
   
```
[I] 2018-Mar-19 23:21:23 [0x134c] exchange enabled by passing argument
[I] 2018-Mar-19 23:21:23 [0x134c] Finished loading configC:\Users\...\AppData\Roaming\BlocknetDX/xbridge.conf
[I] 2018-Mar-19 23:21:23 [0x134c] read wallet BTC "Bitcoin" address <>
[I] 2018-Mar-19 23:21:23 [0x134c] exchange enabled
[I] 2018-Mar-19 23:21:35 [0xc4c] read wallet BTC [Bitcoin] 127.0.0.1:8332
``` 

## Problem Diagnosis
* To verify that each wallet is communicating with XBridge make sure the created receive addresses for each wallet is listed in the address book. If this part fails, close your wallets and review the configuration files.

* If you made changes to any .conf file you need to close and restart that wallet, including Blocknet.

* Verify the ports are actually open. Open a command line program and type: `netstat -an` and review the output. Check that the ports you specified in the .conf files (Eg. 8332 for Bitcoin) are open over localhost (127.0.0.1).

* Ensure all .conf files are configured properly. These configurations are very case-sensitive. Any wrong data entered in them could be causing the issues.

* Check that no OS-based firewall is blocking communication. You may do this through your firewall’s interface.

* Check the XBridge log for any errors. This is located in the Blocknet data directory in the `log` folder.

* Check on general wallet events. This log is located in the data directory of each wallet as `debug.log`. 
