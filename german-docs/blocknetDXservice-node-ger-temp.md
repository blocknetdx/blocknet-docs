# BLOCKNET
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/block.PNG "Logo Title Text 1")

Das Internet der Blockchains

## Blocknet dezentralisierte Börse Service-Node Setup

**Diese Anleitung erläutert die Konfiguration zur Betreibung einer Service-Node für die Blocknet DEX.** 

* Blocknets DX benutzt die xbridgep2p™ Blockchain-Router-Technologie, um es Nutzer zu ermöglichen, Tokens und andere Werte auszutauschen, sowie Smart Contracts zwischen Blockchains zu nutzen.

## Übersicht
Die Konfiguration benötigt eine Verknüpfung zwischen der Blocknet Wallet sowie der Wallet derjenigen Coins, die man als Währungspaar handeln möchte. Zu diesem Zeitpunkt ist dieser Vorgang noch nicht automatisiert und es wird die grafische Benutzeroberfläche von Blocknet hierzu eingesetzt bis die endgültige Oberfläche fertig ist. Die Konfiguration benötigt manuelles Erstellen (oder Editieren) der .conf-Dateien: 

 * blocknetdx.conf
 
 * servicenode.conf

 * xbridge.conf

 * Konfigurations-Datei für jede Währung, die unterstützt werden soll

Die Verknüpfung geschieht über die RPC-APIs der jeweiligen Wallets. Aus Sicherheitsgründen wird empfohlen, alle Wallets auf einem System laufen zu lassen, sowie über die IP-Adresse des localhost (127.0.0.1) zu verbinden, auch wenn es generell möglich ist, die Wallets auf unterschiedlichen Systemen zu hosten und über deren IP zu verbinden. Eine grundlegende Dokumentation rund uim die JSON-RPC-Schnittstelle kann man @ https://en.bitcoin.it/wiki/Running_Bitcoin nachlesen.

## Anforderungen
* 2 Computer mit der aktuellen Software des Blocknet Clients, voll verschlüsselt und synchronisiert
   * Computer #1stellt den Service-Node-Server da, der 24/7 laufen muss
      * Diese Anleitung nennt diesen Computer nachfolgend " SNODE SERVER "
      
   * Computer #2 ist der Client-Computer, in dem die 5000 Block gesichert sind. Dieser muss nicht 24/7 erreichbar sein.
      * Diese Anleitung nennt diesen Computer im folgenden " CLIENT "

* Die IP-Adresse des SNODE SERVER Computer. Oder die Public IP Adresse, sofern man den SNODE SERVER auf einem VPN/VPS-System laufen hat.

* 5000 Block, die in einer Service-Node-Adresse auf dem CLIENT gesperrt sind (diese 5000 Block können nicht mehr zum Staken genutzt werden)

* Die aktuellste Wallet-Version all jener Währungen, die man auf seiner Service-Node unterstützen will (voll synchronisiert und verschlüsselt)

* Passend konfigurierte .conf-Dateien für jede Wallet


## Service Node Setup

* Lade die aktuelleste Core-Version (nachfolgend Core-UI genannt) der Blocknet-Wallet auf 2 Computer oder VPN
   * [GitHub Releases](https://github.com/BlocknetDX/BlockDX/releases)
   
* Die Core-UI muss auf beiden Systemen volständig synchronisieren. Sobald dies geschehen ist müssen beide Core-UI mit einem Passwort nach Wahl komplett verschlüsselt werden
   * Für DX-Tests bitte `testnet=1` oder `-testnet` für `blocknetdx-qt.exe` nutzen
   
### CLIENT Computer Core-UI Setup   
   
* Navigier in der oberen Menüleiste zu: `Tools > Debug console`
   * Schreibe `getaccountaddress <name>` (Dies erstellt einen öffentlichen Schlüssel für die Service Node. Benutze dafür einen unverwechselbaren Service-Node-Namen.)
      * Beispiel: `getaccountaddress snode01`
      
   * Schreibe `servicenode genkey` (Dies generiert und gibt den privaten Schlüssel der Service-Node aus)
   
   * Merke oder notiere diese Ausgaben, da sie später in den Konfigurationsdateien benötigt werden
   
* Von dort, wo aktuell deine Coins sind, schicke exakt 5000 Blocks (oder im Testnet tBlocks) auf die soeben erstellte öffentliche Adresse
   * Diese Adresse benötigt exakt 5000 Blocks (oder tBlocks), um später zu funktionieren
   
   * Unter dem "Send"-Button, klicke auf "Choose..." neben der Transaction Fee Option. Wenn die die exakt 5000 Blocks sendest, gehe sicher, dass die Option "Send as zero-fee transaction if possible" an ist. 
   
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/send_5000.PNG "Logo Title Text 1")
   
* Warte nun, bis der Client die 5000 Block erhalten hat und mindestens 15 TX-Bestätigungen angezeigt werden

* Once the TX is fully confirmed navigate back to: `Tools > Debug console`
   * Type `servicenode outputs` (This outputs the servicenode TX information needed in the `servicenode.conf`)
   
   * Take note of these generated outputs as they will be needed in the configuration files
   
* Now you need to retrieve your SNODE SERVER computer Public IP address. If you only use one Public IP address, go to Google and search "what's my ip". Your Public IP address will be displayed. Take note of this address as it will be needed in the configuration files
   * If you're using a VPN or VPS for the SNODE SERVER computer, you need to retrieve that Public IP address.
   * Main-net users use YOUR_PUBLIC_IP:41412
   * Test-net users use YOUR_PUBLIC_IP:41474
   
* Navigate to your Blocknet data directory (default is: `%appdata%/roaming/blocknetdx/`)
   * Create/edit the `servicenode.conf` file (`/blocknetdx/testnet4/` for testnet users)
   
   * There should be an example of how the configuration needs to be in this file: (You can delete this after yours is typed in)
   ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_conf_ex.PNG "Logo Title Text 1")
   
   * Enter your generated information from above in the format shown in this example:
   ```
   snode01 <YOUR_PUBLIC_IP:41474> <YOUR_SERVICENODE_PRIVATE_KEY> <COLLATERAL_TX_OUTPUT> <TX_OUTPUT_INDEX>
   ```
   
   * Save `servicenode.conf` 
   
   * Create/edit `blocknetdx.conf`. Add `staking=0`. Save `blocknetdx.conf`
  
   * Restart the wallet. Fully unlock the wallet.
   
### SNODE SERVER Computer Wallet Setup

* Navigate to your Blocknet data directory (default is: `%appdata%/roaming/blocknetdx/`)
   * Create/edit the `blocknetdx.conf` file
     * If you are using testnet, `blocknetdx.conf` needs to stay in `%appdata%/roaming/blocknetdx/` and NOT in the `/testnet4/` folder
     
   * Type the following information into your `blocknetdx.conf` file: (use staking=1 if you want to stake on the SNODE SERVER client)
   
   ```
   staking=1
   servicenode=1
   servicenodeaddr=YOUR_PUBLIC_IP:41412
   servicenodeprivkey=YOUR_SERVICENODE_PRIVATE_KEY
   ```
   
   * Save the `blocknetdx.conf` and restart the wallet. Fully unlock the wallet.
   
### Starting Service Node(s)

* On the CLIENT computer navigate to the "Servicenodes" button on the GUI. If the setups were done correctly you should see all of your "Aliases"

#### Activate via Debug Console

* Navigate to `Tools > Debug console`

* Type: `servicenode start-alias <name>` Ex: `servicenode start-alias snode1`

* The status of your node(s) should be "ENABLED" and show an "Active time"
   * It may take a moment to show enabled and/or an active time.
   
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_alias.PNG "Logo Title Text 1")    
   
* Your Service Node(s) are running successfully. You can close off the CLIENT computer Blocknet wallet if you want.  
   
* The CLIENT computer will receive the " Servicenode Rewards "


### Status Checks

* On the SNODE SERVER computer navigate the top toolbar to: `Tools > Debug console`
   * Type `servicenode debug` (This will output a message "Servicenode successfully started")
   
   * Type `servicenode status` (This will output your service node information and a successful message at the end of it)
   
  ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_status.PNG "Logo Title Text 1")    
   
* If you did not receive "Servicenode successfully started" proceed to the next "Troubleshooting section"

* If you received a "Servicenode successfully started" proceed to setup your .conf files for the wallets on your service node
   
   
### Troubleshooting

* Ensure your `servicenode.conf` information is correct to your settings

* Ensure you don't have "< >" in any of the configuration files : (ex: `servicenodeaddr=<your_public_IP:41474>` should be `servicenodeaddr=127.0.0.1:41412`. "127.0.0.1 is an example IP address")
   * Ensure you are using the correct P2P PORT #
     * Main-net=`41412` 
     * Test-net=`41474`

* Ensure on the CLIENT computer you only have a `servicenode.conf`, the `blocknetdx.conf` is not needed on the CLIENT computer
   * For testnet ensure `servicenode.conf` is located in `/testnet4/`

* Ensure on the SNODE SERVER computer you only have a `blocknetdx.conf`, the `servicenode.conf` is not needed on the SNODE SERVER computer
   * For testnet ensure `blocknetdx.conf` is located in `/blocknetdx/` and not `/testnet4/`
   * If you are a tester, there will be a CMD line startup guide so you don't have to edit this configuration when you switch from main-net and test-net
   
* Ensure your configuration files are not `servicenode.conf.txt`

* Ensure the 5000 Block is exactly 5000 Block, no more or no less and ensure it's confirmed

* Ensure you have the latest wallet and that it's fully sync'd and fully unlocked   
   
---

## Setup  .conf Files for the Wallets on Your Service Node:
The wallet of each coin you want to host needs to be configured with a username/password and an allow from IP, if you’re using only a local machine use IP:127.0.0.1

 * To see the full list of compatible wallet configurations go to: [Wallet Configurations](https://github.com/BlocknetDX/blocknet-docs/blob/master/walletsCONF.md)

 * Download the latest wallet, let it sync up fully, then close the wallet

 * Click the START button on your desktop, where it says “Search program and files” then type “%appdata%” and the “Roaming” directory should pop up. Click on “Roaming” or hit enter

 * Find your wallet’s designated data directory folder, ex: Bitcoin

 * If you don’t have a .conf file started you will need to open up Notepad to create one.

 * Navigate to [Wallet Configurations](https://github.com/BlocknetDX/blocknet-docs/blob/master/walletsCONF.md) and copy/paste the configuration information for the wallet you are running. (this can be added to what is already present in file if you have “addnodes” or other configurations already):
   * Ex: bitcoin.conf
   
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

 * When you are done, click File, Save as, Type in: `bitcoin.conf`
    * Ensure the file is not `bitcoin.conf.txt`

 * Save it and then place the .conf into its corresponding wallet folder
    * For this example: %Appdata%/Roaming/Bitcoin 

 * Remember what you wrote for the username, password, and IP

 * Create .conf files for each wallet you are going to be using on the decentralised exchange.
    * Ensure `rpcuser` and `rpcpassword` are different on each wallet for security purposes
 
---

## Configure Coin Addresses
In each hosted coin wallet, create a new address and label it something informative, like “DX address” (xbridge expects a labelled receive address)

 * To create a new address, go to your wallet’s “receive” tab and click “new address”

 * To label an address, you may either right-click on it or click the “label” field.
 
 ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/labelledaddress.PNG "Logo Title Text 1") 

 * This needs to be done for all wallets being used

---

## Setup xbridge.conf

The Blocknet’s Xbridge technology is integrated into the latest client release. See [GitHub](https://github.com/BlocknetDX/BlockDX) for the source code.

 * To see the full list of coin .conf's see: [xbridge.conf](https://github.com/BlocknetDX/blocknet-docs/blob/master/xbridgeCONF.md)

 * Create/edit an `xbridge.conf` file and place the following configuration file in the blocknet wallet data directory (for Windows) C:\Users\[yourusername]\AppData\Roaming\blocknetdx\

 * Note: to avoid crashes or failed trades, please edit your `xbridge.conf` to feature only and all the coins you wish to have on your service node

 * Paste the RPC usernames and passwords you created for each currency pair into the “Username” and “Password” fields
 
 * Paste the address of the "labelled receive address" you created for each currency pair
 
 * Ensure the rest of the configuration matches [xbridge.conf](https://github.com/BlocknetDX/blocknet-docs/blob/master/xbridgeCONF.md) for each coin

 * Save the File (if you just edited the existing file, just click save, if you made a new file then click file, save as, and in the file name type: `xbridge.conf`
    * Ensure the file is not `xbridge.conf.txt`

 * Place this file into the Blocknet data directory folder: "C:\Users\[yourusername]\AppData\Roaming\blocknetdx\"

 * You will be coming back to this to edit it in the future to add future coins, and change `RPCusername` `RPCpassword` `Port` `Address` 
 
 * Do not change the other settings in the .conf file unless you are on testnet conducting tests.
 
---

## Startup Sequence
 * Start the currency pair(s) you are running on your service node
    * Ensure every wallet is fully sync'd and unlocked
    

 * Start the Blocknet wallet on the SNODE SERVER computer with `-enableexchange`
    * ex: blocknetdx-qt.exe -enableexchange

 * If you want to always start in exchange mode, right click on desktop/folder icon of your node blocknetdx-qt. Then choose properties. Then change "...blocknetdx-qt.exe" to "...blocknetdx-qt.exe -enableexchange". Save. Now it always start with these attributes.
 
     * When you click the "BlocknetDX" tab on the wallet it should say "Exchange node".
     * In the console type: `dxGetCurrencyList` to show your list of wallets running on your xbridge
     * In the console type: `servicenode list`, search for your SNODE, under `xwallets` it will show the wallets you are hosting
       
 * Ensure your servicenode is activated.
  
---

## Verify communication between wallets.
In order to ensure that the xbridge client is communicating with your wallets and the .conf files are setup properly, navigate to the Blocknet data dir: C:\Users\yourusername\AppData\Roaming\blocknetdx\

   * Open the "log" folder. Open up the log file with the current date/time. Ex: `xbridgep2p_20170831T181856.log`
   * Each log file will update until the client instance is close. If a new client instance is opened a new log file will be created.

As the wallet starts up, you’ll see the DX initialise using the values you entered into your `xbridge.conf` file:

![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/dxstart.PNG "Logo Title Text 1") 

 * Wait until you see “HTTP: resp 200” messages. This signifies that the wallets are communicating over RPC and setup has been successful. Ensure each wallet you are running displays a “HTTP: resp 200” and displays your labelled receive address name.
 
 ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/resp_200.PNG "Logo Title Text 1") 

 * Note: If, amidst the “HTTP: resp 200” messages, you see a message similar to `[I] 2017-Apr-19 17:48:31 [0x2],listaccounts exception couldn't connect to server`, then it is likely that at least one of your specified trading wallets have not been run.

 * Note: If you fail to get “HTTP: resp 200” messages, it’s possible that the ports assigned to wallets differ from those specified in your .conf file. To check this, open Command Prompt, type `netstat -an`, and take a look which ports are being used over localhost (127.0.0.1), or sometimes over 0.0.0.0.
 
---

## Problem Diagnosis
* To verify that each wallet is communicating with xbridge make sure the created receive addresses for each wallet is listed in the address book. If this part fails, close your wallets and review their configuration files.

* If you made changes to any .conf file you need to close and restart that wallet, including Blocknet 

* Verify the ports are actually open. You may use Command Prompt to do so by typing in `netstat -an` and reviewing the print. Check that the ports you specified in the .conf files (ex: 8332 for Bitcoin) are open over localhost (127.0.0.1).

* Ensure all .conf files are configured properly. These configurations are very case-sensitive. Any wrong data entered in them could be causing the issues.

* Check that no OS-based firewall is blocking communication. You may do this through your firewall’s interface.

* Check the xbridge log for any errors in: C:\Users\yourusername\AppData\Roaming\blocknetdx\log

* Check on general wallet events in C:\Users\yourusername\AppData\Roaming\walletname\debug.log
