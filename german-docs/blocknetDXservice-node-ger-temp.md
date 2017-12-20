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
   
   * Unter dem "Send"-Button, klicke auf "Choose..." neben der Transaction Fee Option. Wenn du die exakt 5000 Blocks sendest, gehe sicher, dass die Option "Send as zero-fee transaction if possible" an ist. 
   
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/send_5000.PNG "Logo Title Text 1")
   
* Warte nun, bis der Client die 5000 Block erhalten hat und mindestens 15 TX-Bestätigungen angezeigt werden

* Sobald der TX voll bestätigt ist navigiere zurück zu: `Tools > Debug console`
   * Schreibe `servicenode outputs` (Dies gibt die Service-Node-TX-Information aus, die in der `servicenode.conf` gebraucht wird)
   
   * Merke oder notiere dir diese Ausgabe, das sie später in der Konfigurationsdateie benötigt werden
   
* Jetzt brauchst du die öffentliche IP-Adresse des SNODE SERVER. Wenn du nur eine öffentliche Adresse benutzt, gehe zu Google und suche nach "was ist meine IP". Deine öffentliche IP wird damit angezeigt. Merke oder notiere diese Ausgaben, da sie später in den Konfigurationsdateien benötigt werden.
   * Wenn du einen VPN oder VPS für den SNODE SERVER Computer nutzt, musst du dessen öffentliche IP nun zur Hand nehmen.
   * Nutzer des Main-net nutzen YOUR_PUBLIC_IP:41412
   * Nutzer des Test-net nutzen YOUR_PUBLIC_IP:41474
   
* Navigiere zu dem Verzeichnis von Blocknet (Standardverzeichnis ist: `%appdata%/roaming/blocknetdx/`)
   * Erstelle/editiere nun die Datei `servicenode.conf` (`/blocknetdx/testnet4/` für Test-net-Users)
   
   * Es sollte sich in diesem Verzeichnis eine Beispieldatei zur Konfiguration befinden: (Diese kann anschliessend gelöscht werden)
   ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_conf_ex.PNG "Logo Title Text 1")
   
   * Gib alle erstellten Information aus den Schritten zuvor im angezeigten Format des nachfolgenden Beispiels ein:
   ```
   snode01 <DEINE_ÖFFENTLICHE_IP:41474> <DER_PRIVATE_SCHLÜSSEL_DER_SERVICENODE> <COLLATERAL_TX_OUTPUT> <TX_OUTPUT_INDEX>
   ```
   
   * Speichere die Datei `servicenode.conf` 
   
   * Erstelle/editiere nun die Datei `blocknetdx.conf`. Füge `staking=0` hinzu und speichere die Datei `blocknetdx.conf`
  
   * Starte die Core-UI neu und entsperre diese komplett.
   
### SNODE SERVER Computer Core-UI Setup

* Navigiere zum Blocknet verzeichnis (Standardverzeichnis ist: `%appdata%/roaming/blocknetdx/`)
   * Erstelle/editiere nun die Datei `blocknetdx.conf`
     * Wenn du das Test-net nutzt muss die Datei `blocknetdx.conf` im Verzeichnis `%appdata%/roaming/blocknetdx/` und NICHT im Verzeichnis `/testnet4/` bleiben
     
   * Schreibe nun die nachfolgenden Informationen in die Datei `blocknetdx.conf`: (Benutze staking=1 sofern du mit dem SNODE SERVER Client weiter staken möchtest)
   
   ```
   staking=1
   servicenode=1
   servicenodeaddr=DEINE_ÖFFENTLICHE_IP:41412
   servicenodeprivkey=DER_PRIVATE_SCHLÜSSEL_DER_SERVICENODE
   ```
   
   * Speichere die Datei `blocknetdx.conf` und starte die Core-UI neu. Entsperre nun die Wallet komplett.
   
### Der Start der Service Node(s)

* Auf dem CLIENT-Computer navigiere zu dem Button "Servicenodes". Sofern die Schritte vorher richtig gemacht wurden, sollte nun alle deine Node-"Aliases" zu sehen sein.

#### Aktivierung mit der Debug Console

* Navigiere zu `Tools > Debug console`

* Schreibe: `servicenode start-alias <name>` Beispiel: `servicenode start-alias snode1`

* Der Status deiner Node(s) sollte nun "ENABLED" sein und eine "Active time" anzeigen
   * Es kann unter Umständen einen Moment dauern bis "enabled" und "Active time" angezeigt werden.
   
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_alias.PNG "Logo Title Text 1")    
   
* Deine Service-Node(s) laufen nun erfolgreich. Du kannst nun, sofern gewünscht, die Core-UI des Client nun schließen.  
   
* Der Client wird nun die " Servicenode Rewards " erhalten.


### Status Überprüfungen

* Auf den SnODE SERVER Computer navigiere in der oberen Menüleiste zu: `Tools > Debug console`
   * Schreibe `servicenode debug` (Dies wird die Nachricht "Servicenode successfully started" ausgeben)
   
   * Schreibe `servicenode status` (Dies wird die Service-Node-Information und eine Nachricht zum Status ausgeben)
   
  ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_status.PNG "Logo Title Text 1")    
   
* Wenn du nicht die Ausgabe "Servicenode successfully started" erhälst, gehen weiter zum Abschnitt "Troubleshooting" hier im Text

* Wenn du die Ausgabe "Servicenode successfully started" erhälst, kannst du nun die .conf-Dateien der Wallets auf der Service-Node erstellen.
   
   
### Troubleshooting

* Versichere dich, dass deine Einträge in der Datei `servicenode.conf` übereinstimmen mit deinen Einstellungen.

* Versichere dich, dass du nicht die "< >" in einer der Konfigurationsdateien übernommen hast: (ex: `servicenodeaddr=<deine_öffentliche_IP:41474>` sollte `servicenodeaddr=127.0.0.1:41412` sein. "127.0.0.1 ist hier nur eine Beispiel-IP")
   * Versichere dich, dass du den korrekten P2P-Port nutzt #
     * Main-net=`41412` 
     * Test-net=`41474`

* Versichere dich, dass du auf dem CLIENT Computer nur die Datei `servicenode.conf` hast, die Datei `blocknetdx.conf` wird hier nicht benötigt
   * Für das Test-Net versichere dich, dass die Datei `servicenode.conf` im Ordner `/testnet4/` gespeichert ist

* Versichere dich, dass du auf dem Snode Server Computer nur die Datei `blocknetdx.conf` hast, die Datei `servicenode.conf` wird hier nicht benötigt
   *Im Testnet versichere dich, dass die Datei `blocknetdx.conf` im Ordner `/blocknetdx/` und nicht im Ordner `/testnet4/` ist
   * Für Tester gibt es einen Kommandozeilen Startup Guide, man muss die Konfiguration nicht editieren, wenn man zwischen Mainnet und Testnet wechselt.
   
* Versichere dich, dass deine Konfigurationsdatei nicht  `servicenode.conf.txt` genannt ist.

* Versichere dich, dass du genau 5000 Block transferiert hast, nicht mehr und nicht weniger, und daß der Transfer bestätigt ist.

* Versichere dich, dass du die aktuellste Version des Core-UI installiert hast, und dieser vollständig synchronisiert und vollständig gesperrt ist.   
   
---

## Setup  .conf Files für die Wallets in deiner Service-Node:
Jede Wallet von jedem Coin, den du unterstützen möchtest, muss mit einem Nutzernamen und Nutzerpasswort konfiguriert werden, und eine IP erlauben, im Falle, dass du auf deinem lokalen Computer installierst, nutze dafür die IP:127.0.0.1

 * Eine vollständige Liste der aktuell kompatiblen Wallet findest du hier: [Wallet Configurations](https://github.com/BlocknetDX/blocknet-docs/blob/master/walletsCONF.md)

 * Lade die aktuellste Core-UI, synchronisiere diese vollständig und schliesse die danach.
 
 * Drücke den START Button auf deinem Desktop und suche nach “%appdata%”. Nun sollte der “Roaming”-Ordner angeboten werden. Drücke auf “Roaming” oder drücke Enter.

 * Suche nach dem gewünschten Daten-Ordner, als Beispiel: Bitcoin

 * Wenn du keine Datei .conf dort hast, musst du diese mit zB. Notepad erstellen.

 * Navigiere zu [Wallet Configurations](https://github.com/BlocknetDX/blocknet-docs/blob/master/walletsCONF.md) und kopiere und füge ein die Information für die Wallet, die du unterstützen willst. (dies kann hinzugefügt werden zu eventuellen Informationen, die bereits in diesem File stehen, als Beispiel sind vielleicht schon “addnodes” oder andere Konfigurationen eingetragen):
   * Als Beispiel: bitcoin.conf
   
   ```
   server=1
   listen=1
   rpcuser=yourusername
   rpcpassword=yourpassword
   rpcallowip=127.0.0.1
   ```
   
   * versichere dich, dass alles korrekt eingetragen ist. Sei dir im Klaren darüber, dass diese Einträge nicht für alle Wallets gleich sind!

 * Wechsle `rpcuser` und `rpcpassword` zu Werten deiner Wahl. Aus Sicherheitsgründen solltest du für jede Wallet, die du unterstützen möchtest, unterschiedliche RPC Nutzernamen und Passwörter verwenden.

 * Wenn du nur ein Rechner für die Wallets verwendest, benutze die IP: `127.0.0.1`

 * Wenn du das erledigt hast, speichere die Datei unter: `bitcoin.conf`
    * Versichere dich, dass die Datei nicht versehentlich als `bitcoin.conf.txt` gespeichert wurde

 * Nach der Speicherung verschiebe gegebenenfalls die .conf-Datei noch in den entsprechenden Wallet-Ordner
    * In diesem Beispiel: %Appdata%/Roaming/Bitcoin 

 * Merke dir deine Einträge für Nutzername, Passwort und IP

 * Erstelle diese .conf-Dateien für jede Wallet, die du auf der DEX unterstützen möchtest.
    * Versichere dich, dass sicherheitshalber `rpcuser` und `rpcpassword` für jede Wallet unterschiedlich sind.
 
---

## Einstellungen der Coin-Adressen
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
