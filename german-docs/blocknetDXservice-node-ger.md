# BLOCKNET
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/block.PNG "Logo Title Text 1")

Das Internet der Blockchains

## Blocknet dezentralisierte Börse Service-Node Setup

**Diese Anleitung erläutert die Konfiguration zur Betreibung einer Service-Node für die Blocknet DEX.** 

* Blocknets DX benutzt die xbridgep2p™ Blockchain-Router-Technologie, um es Nutzer zu ermöglichen, Tokens und andere Werte auszutauschen, sowie Smart-Contracts zwischen Blockchains zu nutzen.

## Übersicht
Die Konfiguration benötigt eine Verknüpfung zwischen der Blocknet-Wallet sowie der Wallet derjenigen Coins, die man als Währungspaar handeln möchte. Zu diesem Zeitpunkt ist dieser Vorgang noch nicht automatisiert und es wird die grafische Benutzeroberfläche von Blocknet hierzu eingesetzt bis die endgültige Oberfläche fertig ist. Die Konfiguration benötigt manuelles Erstellen (oder Editieren) der .conf-Dateien: 

 * blocknetdx.conf
 
 * servicenode.conf

 * xbridge.conf

 * Konfigurations-Datei für jede Währung, die unterstützt werden soll

Die Verknüpfung geschieht über die RPC-APIs der jeweiligen Wallets. Aus Sicherheitsgründen wird empfohlen, alle Wallets auf einem System laufen zu lassen, sowie über die IP-Adresse des localhost (127.0.0.1) zu verbinden, auch wenn es generell möglich ist, die Wallets auf unterschiedlichen Systemen zu hosten und über deren IP zu verbinden. Eine grundlegende Dokumentation rund um die JSON-RPC-Schnittstelle kann man @ https://en.bitcoin.it/wiki/Running_Bitcoin nachlesen.

## Anforderungen
* 2 Computer mit der aktuellen Software des Blocknet Clients, voll verschlüsselt und synchronisiert
   * Computer #1 stellt den Service-Node-Server da, der 24/7 laufen muss
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
   
* Die Core-UI muss auf beiden Systemen vollständig synchronisieren. Sobald dies geschehen ist müssen beide Core-UI mit einem Passwort nach Wahl komplett verschlüsselt werden
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
   
   * Merke oder notiere dir diese Ausgabe, da sie später in der Konfigurationsdatei benötigt werden
   
* Jetzt brauchst du die öffentliche IP-Adresse des SNODE SERVER. Wenn du nur eine öffentliche Adresse benutzt, gehe zu Google und suche nach "was ist meine IP". Deine öffentliche IP wird damit angezeigt. Merke oder notiere diese Ausgaben, da sie später in den Konfigurationsdateien benötigt werden.
   * Wenn du einen VPN oder VPS für den SNODE SERVER Computer nutzt, musst du dessen öffentliche IP nun zur Hand nehmen.
   * Nutzer des Mainnet nutzen YOUR_PUBLIC_IP:41412
   * Nutzer des Testnet nutzen YOUR_PUBLIC_IP:41474
   
* Navigiere zu dem Verzeichnis von Blocknet (Standardverzeichnis ist: `%appdata%/roaming/blocknetdx/`)
   * Erstelle/editiere nun die Datei `servicenode.conf` (`/blocknetdx/testnet4/` für Testnet-User)
   
   * Es sollte sich in diesem Verzeichnis eine Beispieldatei zur Konfiguration befinden: (Diese kann anschließend gelöscht werden)
   ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_conf_ex.PNG "Logo Title Text 1")
   
   * Gib alle erstellten Informationen aus den Schritten zuvor im angezeigten Format des nachfolgenden Beispiels ein:
   ```
   snode01 <DEINE_ÖFFENTLICHE_IP:41474> <DER_PRIVATE_SCHLÜSSEL_DER_SERVICENODE> <COLLATERAL_TX_OUTPUT> <TX_OUTPUT_INDEX>
   ```
   
   * Speichere die Datei `servicenode.conf` 
   
   * Erstelle/editiere nun die Datei `blocknetdx.conf`. Füge `staking=0` hinzu und speichere die Datei `blocknetdx.conf`
  
   * Starte die Core-UI neu und entsperre diese komplett.
   
### SNODE SERVER Computer Core-UI Setup

* Navigiere zum Blocknet verzeichnis (Standardverzeichnis ist: `%appdata%/roaming/blocknetdx/`)
   * Erstelle/editiere nun die Datei `blocknetdx.conf`
     * Wenn du das Testnet nutzt muss die Datei `blocknetdx.conf` im Verzeichnis `%appdata%/roaming/blocknetdx/` und NICHT im Verzeichnis `/testnet4/` bleiben
     
   * Schreibe nun die nachfolgenden Informationen in die Datei `blocknetdx.conf`: (Benutze staking=1 sofern du mit dem SNODE SERVER Client weiter staken möchtest)
   
   ```
   staking=1
   servicenode=1
   servicenodeaddr=DEINE_ÖFFENTLICHE_IP:41412
   servicenodeprivkey=DER_PRIVATE_SCHLÜSSEL_DER_SERVICENODE
   ```
   
   * Speichere die Datei `blocknetdx.conf` und starte die Core-UI neu. Entsperre nun die Wallet komplett.
   
### Der Start der Service Node(s)

* Auf dem CLIENT-Computer navigiere zu dem Button "Servicenodes". Sofern die Schritte vorher richtiggemacht wurden, sollte nun alle deine Node-"Aliases" zu sehen sein.

#### Aktivierung mit der Debug Console

* Navigiere zu `Tools > Debug console`

* Schreibe: `servicenode start-alias <name>` Beispiel: `servicenode start-alias snode1`

* Der Status deiner Node(s) sollte nun "ENABLED" sein und eine "Active time" anzeigen
   * Es kann unter Umständen einen Moment dauern bis "enabled" und "Active time" angezeigt werden.
   
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_alias.PNG "Logo Title Text 1")    
   
* Deine Service-Node(s) laufen nun erfolgreich. Du kannst nun, sofern gewünscht, die Core-UI des Clients nun schließen.  
   
* Der Client wird nun die " Servicenode Rewards " erhalten.


### Status Überprüfungen

* Auf den SNODE SERVER Computer navigiere in der oberen Menüleiste zu: `Tools > Debug console`
   * Schreibe `servicenode debug` (Dies wird die Nachricht "Servicenode successfully started" ausgeben)
   
   * Schreibe `servicenode status` (Dies wird die Service-Node-Information und eine Nachricht zum Status ausgeben)
   
  ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/snode_status.PNG "Logo Title Text 1")    
   
* Wenn du nicht die Ausgabe "Servicenode successfully started" erhältst, gehen weiter zum Abschnitt "Troubleshooting" hier im Text

* Wenn du die Ausgabe "Servicenode successfully started" erhälst, kannst du nun die .conf-Dateien der Wallets auf der Service-Node erstellen.
   
   
### Troubleshooting

* Versichere dich, dass deine Einträge in der Datei `servicenode.conf` übereinstimmen mit deinen Einstellungen.

* Versichere dich, dass du nicht die "< >" in einer der Konfigurationsdateien übernommen hast: (ex: `servicenodeaddr=<deine_öffentliche_IP:41474>` sollte `servicenodeaddr=127.0.0.1:41412` sein. "127.0.0.1 ist hier nur eine Beispiel-IP")
   * Versichere dich, dass du den korrekten P2P-Port nutzt #
     * Mainnet=`41412` 
     * Testnet=`41474`

* Versichere dich, dass du auf dem CLIENT Computer nur die Datei `servicenode.conf` hast, die Datei `blocknetdx.conf` wird hier nicht benötigt
   * Für das Testnet versichere dich, dass die Datei `servicenode.conf` im Ordner `/testnet4/` gespeichert ist

* Versichere dich, dass du auf dem Snode Server Computer nur die Datei `blocknetdx.conf` hast, die Datei `servicenode.conf` wird hier nicht benötigt
   *Im Testnet versichere dich, dass die Datei `blocknetdx.conf` im Ordner `/blocknetdx/` und nicht im Ordner `/testnet4/` ist
   * Für Tester gibt es einen Kommandozeilen Startup Guide, man muss die Konfiguration nicht editieren, wenn man zwischen Mainnet und Testnet wechselt.
   
* Versichere dich, dass deine Konfigurationsdatei nicht `servicenode.conf.txt` genannt ist.

* Versichere dich, dass du genau 5000 Block transferiert hast, nicht mehr und nicht weniger, und das der Transfer bestätigt ist.

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
Erstelle in jeder unterstützen Wallet eine neue Adresse und benenne sie mit einem eindeutigen Namen (label), als Beispiel "DX Adress" (xbrdige benötigt eine Adresse mit Label)

 * Um eine neue Adresse zu erstellen, gehe in deiner Wallet auf "receive" und klicke auf "new address"

 * Um eine Adresse mit einem spezifischen Namen (Label) zu versehen, klicke mit der rechten Maustaste auf diese Adresse oder klicke auf das Feld "label".
 
 ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/labelledaddress.PNG "Logo Title Text 1") 

 * Dies muss für alle Adressen aller Wallets gemacht werden

---

## Einstellungen xbridge.conf

DIe xbridge Technologie ist in der aktuellen Core-UI integriert. Der Source-Code kann hier [GitHub](https://github.com/BlocknetDX/BlockDX) eingesehen werden.

 * Um eine Liste aller aktuell unterstützen Coins zu sehen, gehe zu: [xbridge.conf](https://github.com/BlocknetDX/blocknet-docs/blob/master/xbridgeCONF.md)

 * Erstelle/editiere die Datei `xbridge.conf` und speichere diese in den Datenordner von Blocknet. Dieser befindet sich bei Windows hier: C:\Users\[yourusername]\AppData\Roaming\blocknetdx\

 * Anmerkung: um einen Absturz oder fehlgeschlagene Trades zu vermeiden, sollte die Datei `xbridge.conf` nur mit den Daten ergänz werden, die für die Coins benötigt werden, die mit der Service-Node unterstützt werden sollen.

 * Füge den RPC Nutzernamen und das entsprechende Passwort in die Felder “Username” und “Password”.
 
 * Füge die Adresse der entsprechenden benannten (labelled) Adresse für jede Währung ein.
 
 * Versichere dich, daß deine Einträge für jeden Coin mit den Vorgaben in der nachfolgenden Datei übereinstimmen: [xbridge.conf](https://github.com/BlocknetDX/blocknet-docs/blob/master/xbridgeCONF.md).

 * Sichere die Datei (wenn du die Datei nur editiert hast, klicke einfach speichern, wenn du sie neu erstellt hast, klicke auf speicher als und bennen sie mit: `xbridge.conf`
    * Versichere dich anschließend, dass die Datei nicht als `xbridge.conf.txt` gespeichert wurde.

 * Speichere dann diese Datei in dem Datenordner von Blocknet (Windows): "C:\Users\[yourusername]\AppData\Roaming\blocknetdx\"

 * Später wirst du diese Datei immer wieder benötigen und weitere zukünftig unterstütze Coins eintragen bzw. deren Einträge `RPCusername` `RPCpassword` `Port` `Address` ändern.
 
 * Ändere nichts an den anderen Einträgen in der .conf-Datei, außer dú möchtest im Testnet Tests machen.
 
---

## Ablauf Starten
 * Starte als erstes alle Wallets der Coins, die du auf deiner Service-Node unterstützt
    * Versichere dich, daß jede Wallet voll synchronisiert und ungesperrt ist.
    

 * Starte die Blocknet Core-UI deiner Service-Node mit `-enableexchange`
    * als Beispiel: blocknetdx-qt.exe -enableexchange

 * Wenn du jedes Mal automatisch im Exchange-Modus starten möchtest, klicke mit der rechten Maustaste auf das Icon der Blocknet Core-UI. Wähle dann Eigenschaften aus und wechsle den Eintrag "...blocknetdx-qt.exe" zu "...blocknetdx-qt.exe -enableexchange". Anschließend speichern. Jetzt startet es automatisch jedes Mal im Exchange-Modus.
 
     * Wenn du auf den Reiter "BlocknetDX" klickst, sollte nun der Eintrag "Exchange node" angezeigt werden.
     * Schreibe in der Konsole: `dxGetCurrencyList` um alle unterstützen Coins deiner xbridge anzuzeigen
     * Schreibe in der Konsole: `servicenode list`, suche dann nach SNODE, unter `xwallets` wird es dir alle Wallets anzeigen, die du unterstützt.
       
 * Versichere dich, dass deine Service-Node aktiviert ist.
  
---

## Überprüfe die Kommunikation zwischen den Wallets.
Um sicherzugehen, dass der XBridge Client mit den wallets und den -conf-Dateien richtig kommuniziert, navigiere in das Daten-Verzeichnis von Blocknet (Windows): C:\Users\yourusername\AppData\Roaming\blocknetdx\

   * Öffne den "log"-Ordner. Öffne nun die Log-Datei mit dem aktuellsten Datum/Zeitstempel. Als Beispiel: `xbridgep2p_20170831T181856.log`
   * Jede Log-Datei wird solange aktualisiert bis der Core-UI geschlossen wird. Wenn der Core-UI neu gestartet wird, wird ein neue Log-Datei angelegt.

Wenn du den Core-UI startest, wirst du die Initialisierung sehen mit den Werten aus der Datei `xbridge.conf`, die du erstellt hast:

![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/dxstart.PNG "Logo Title Text 1") 

 * Warte nun, bis du Einträge des Typs “HTTP: resp 200” erhälst. Dies zeigt an, daß die Wallets über RPC miteinander kommunizieren und die Einstellungen erfolgreich waren. Versichere dich, dass jede unterstützte Wallet einen Eintrag “HTTP: resp 200” und den passenden Adressnamen (Label) hat.
 
 ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/resp_200.PNG "Logo Title Text 1") 

 * Anmerkung: Wenn du inmitten der “HTTP: resp 200” Nachrichten  einen Eintrag ähnlich des nachfolgenden siehst, `[I] 2017-Apr-19 17:48:31 [0x2],listaccounts exception couldn't connect to server`, bedeutet dies, das zumindest einer der verknüpften Wallets nicht ordnungsgemäß läuft.

 * Anmerkung: Wenn du nicht den Eintrag “HTTP: resp 200” erhältst, ist zu überprüfen, ob der/die Ports, die in der conf.-Datei angegeben wurden, mit denen übereinstimmen, die für die jeweilige Wallet vorgegeben wurden. Um dies zu überprüfen, öffne die Windows-Kommandozeile und schreibe `netstat -an` hinein, und überprüfe dann, welche Ports über den localhost (127.0.0.1), oder manchmal über (0.0.0.0), genutzt werden.
 
---

## Diagnose von Problemen
* Um sicherzugehen, dass jede Wallet mit der xbridge korrekt kommuniziert, überprüfe ob jede erstellte und benannte Empfangsadresse im Adressbuch hinterlegt ist. Sollte dies nicht der Fall sein, schließe den Core-UI und überprüfe die Konfigurationsdateien.

* Wenn du Änderungen an den .conf-Dateien vornimmst musst du die jeweilige Wallet sowie anschließend auch die Blocknet Core-UI neu starten. 

* Gehe sicher, dass die benutzen Ports im System auch offen sind. Dazu kannst du in der Windows-Kommandozeile den Befehl `netstat -an` eingeben und die Ausgabe durchschauen. Überprüfe hierbei genau die Ports, die in den .conf-Dateien angegeben sind, darauf ob sie für den localhost (127.0.0.1) offen sind, (als Beispiel Port 8332 for Bitcoin).

* Gehe sicher, dass alle .conf-Dateien ordnungsgemäß konfiguriert wurden. Diese Konfigurationen sind sehr sensibel. Jede kleine falsche Eingabe wird einen Fehler verursachen.

* Gehe sicher, dass keine integrierte Firewall deines Betriebssystems die Kommunikation blockiert. Dies kannst du über das Interface deiner Firewall tun.

* Überprüfe die Log-Datei der Xbridge auf mögliche Fehlermeldungen. Diese befindet sich in Windows unter: C:\Users\yourusername\AppData\Roaming\blocknetdx\log

* Überprüfe allgemeine Core-UI-Abläufe unter (Windows): C:\Users\yourusername\AppData\Roaming\walletname\debug.log
