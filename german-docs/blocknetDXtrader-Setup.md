# BLOCKNET

Dieses Repo ist jetzt veraltet. Weitere Informationen finden Sie im Dokumentationsportal unter [https://docs.blocknet.co](https://docs.blocknet.co).

Block DX Installationsanleitung:
https://docs.blocknet.co/blockdx/setup/

---

![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/block.PNG "Logo Title Text 1")

Das Internet der Blockchains

## Blocknet Dezentralisierte Börse Setup-Anweisungen für Handelnde

**Diese Anweisungen erklären das Handeln auf der dezentralisierten Börse von Blocknet** 

* Blocknets DX nutzt die XBridgep2p™-Routertechnologie um es Nutzern zu ermöglichen, Tokens und Assets auszutauschen, und ebenso "smart-contracts" über verschiedenen Blockchains hinweg bereitzustellen.

## Übersicht
Das Setup erfordert eine Verknüpfung der Blocknet Wallet mit all jenen Coin-Wallets, die man handeln möchte. Zu diesem Zeitpunkt gibt es hierfür keine Automatisierung, man benutzt hierfür einfach die aktuellste Blocknet Wallet bis die GUI (grafisches User-Interface) finalisiert ist. Die Konfiguration bedarf der händischen Erstellung und/oder Editierung der .conf-Dateien: 

 * xbridge.conf

 * Konfigurationsdatei jeder Währung, die getraded werden soll

Die Verknüpfung geschieht über die RPC-APIs der jeweiligen Wallets. Aus Sicherheitsgründen wird empfohlen, alle Wallets auf einem System laufen zu lassen, sowie über die IP-Adresse des localhost (127.0.0.1) zu verbinden, auch wenn es generell möglich ist, die Wallets auf unterschiedlichen Systemen zu hosten und über deren IP zu verbinden. Eine grundlegende Dokumentation rund um die JSON-RPC-Schnittstelle kann man @ https://en.bitcoin.it/wiki/Running_Bitcoin.


## Blocknet DX Börse Tutorial Video
 * [DX Börse Tutorial](https://www.youtube.com/watch?v=DlYbDzG_l5w)


## Anforderungen

* Die aktuellste Version des Blocknet Clients muss installiert, verschlüsselt und voll synchronisiert sein. [GitHub Releases](https://github.com/BlocknetDX/BlockDX/releases)

* Die aktuellste Wallet jeder Währung, die getraded werden soll, ebenso voll synchronisiert und verschlüsselt

     * Die Währung, die gehandelt werden soll, sollte nun auf eine eindeutig benannte Adresse dieser Wallet gesendet werden 

* Richtig konfigurierte .conf-Dateien für jede Wallet

---

## Setup  .conf-Dateien der zu tradenden Wallets
Jede Wallet all jener Coins, die man traden möchte, muss mit einem Nutzernamen und Passwort versehen werden und "eine" IP erlauben, als Beispiel wenn man alles auf dem lokalen Rechner installiert hat, ist die IP:127.0.0.1

 * Eine vollständige Liste der Konfigurationen kompatibler Wallets findet man hier: [Wallet Konfigurationen](https://github.com/BlocknetDX/blocknet-docs/blob/master/walletsCONF.md)

 * Lade und installiere die aktuellste Wallet, lass sie voll synchronisieren, schließe dann die Wallet

 * Klicke den Start-Button (Windows-Icon) auf dem Desktop, und schreibe in das Feld “Search program and files” den Begriff “%appdata%”, der “Roaming”-Ordner sollte nun angeboten werden. Klicke auf “Roaming” oder drücke Return/Enter.

 * Lokalisiere den jeweilige Daten-Ordner der gewünschten Währung, als Beispiel: Bitcoin

 * Sollte in diesem Ordner keine .conf-Datei sein, musst du diese mit zB. Notepad erstellen.

 * Öffne [Wallet Konfigurationen](https://github.com/BlocknetDX/blocknet-docs/blob/master/walletsCONF.md) und kopiere die Konfigurationsinformationen der gewünschten Wallet in die erstellte oder bestehende conf-Datei. (dies kann in der conf-Datei einfach hinzugefügt werden zu den Informationen, die diese gegebenenfalls schon beinhaltet):
   * Beispiel: bitcoin.conf
   
   ```
   server=1
   listen=1
   rpcuser=yourusername
   rpcpassword=yourpassword
   rpcallowip=127.0.0.1
   ```
   
   * Gehe sicher, daß die Konfiguration korrekt ist. Sei dir im Klaren, dass nicht jede Währung/Wallet die gleiche Konfiguration hat.

 * Ändere `rpcuser` und `rpcpassword` nach deinen eigenen Wünschen. Aus Sicherheitsgründen solltest du für unterschiedliche einzigartige Nutzernamen und Passwörter für jede Wallet haben

 * Wenn du einen einzigen Rechner benutzt nutze die IP: `127.0.0.1`

 * Wenn alles fertig eingegeben ist, drücke Datei, speichern als, und schreibe `bitcoin.conf` hinein.
    * Versichere dich, dass die Datei nicht `bitcoin.conf.txt` ist

 * Speichere die Datei und sichere sie dann in dem entsprechenden Ordner der Wallet
    * In diesem Beispiel: %Appdata%/Roaming/Bitcoin 

 * Nicht vergessen, den Nutzername, das Passwort und die IP zu merken

 * Erstelle entsprechende .conf-Dateien für jede Wallet, deren Währung du auf der DEX handeln möchtest.
    * Versichere dich, dass `rpcuser` und `rpcpassword` aus Sicherheitsgründen für jede zu tradende Währung unterschiedlich sind
 
---

## Konfiguration für die Coin-Adressen
Erstelle in jeder Wallet eine neue Adresse und benenne sie (label) sie mit einem für dich eindeutigen spezifischen Namen, als Beispiel "DX address" (XBridge erwartet eine Adresse mit Label!!)

 * Um eine neue Adresse zu erstellen, gehe im Programm auf den “receive”-Tab und klicke auf “new address”

 * Um eine Adresse mit einem Namen/Label zu versehen, klicke mit der rechten Maustaste auf die Adresse und klicke auf das “label”-Feld.
 
 ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/labelledaddress.PNG "Logo Title Text 1") 

 * Sende anschließend die gewünschte Anzahl an Coins an diese Label-Adresse
 
 * Dies musst du in allen Wallets machen, die du für die DEX handelbar machen möchtest
 
---

## Konfiguration xbridge.conf

Die XBridge-Technologie von Blocknet ist in der aktuellen Version integriert. Siehe hier [GitHub](https://github.com/BlocknetDX/BlockDX) für den Programm-Code.

 * Um die komplette Liste der .conf-Dateien einzusehen, gehe zu: [xbridge.conf](https://github.com/BlocknetDX/blocknet-docs/blob/master/xbridgeCONF.md).

 * Erstelle/editiere die Datei `xbridge.conf` und speichere sie in das Datenverzeichnis von Blocknet, als Beispiel findest du dieses unter Windows hier: C:\Users\[yourusername]\AppData\Roaming\blocknetdx\

 * Anmerkung: um einen Crash oder Fehltrades zu vermeiden, editiere die Datei `xbridge.conf` nur mit den Werten, die du auch handeln möchtest.

 * Füge den RPC Nutzernamen und das entsprechende Passwort für jede gewünschte Währung in die Felder “Username” und “Password”.
 
 * Füge den Namen der entsprechenden Adresse und jeder gewünschten Währung, die du selbst benannt hast, in das Feld "labelled receive address"
 
 * Versichere dich, dass der Rest der Konfiguration den Einträgen für jeden Coin verglichen mit der Datei [xbridge.conf](https://github.com/BlocknetDX/blocknet-docs/blob/master/xbridgeCONF.md) entspricht

 * Speichere die Datei (solltest du sie nur editiert habe, drücke einfach auf speichern, wenn du sie neu erstellt hast, drücke "speichern als" und sichere sie unter den Namen: `xbridge.conf`
    * Versichere dich, dass die Datei nicht `xbridge.conf.txt` heisst danach.

 * Speichere diese Datein in das Datenverzeichnis von Blocknet, als Beispiel für Windows: "C:\Users\[yourusername]\AppData\Roaming\blocknetdx\"

 * Du wirst in Zukunft von Zeit zu Zeit diese Datei wieder editieren, wenn du neue Coins hinzufügen willst, oder Änderungen vornehmen möchtest an `RPCusername` `RPCpassword` `Port` `Address` 
 
 * Ändere keine anderen Einträge in diese Datei, außer du bist im Testnet und leitest Testprozeduren.
 
---

## Ablauf Starten
 * Starte als erstes alle Wallets der Coins, die du auf deiner Service-Node unterstützt
    * Versichere dich, daß jede Wallet voll synchronisiert und ungesperrt ist.

 * Starte die Blocknet Wallet nachdem du alle anderen gewünschten Wallets gestartet hast.
     
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
 
## Plaziere eine Order
Sobald sicher gestellt ist, dass die Wallets korrekt miteinander kommunizieren und die Konfigurationen erfolgreich waren, gehe folgendermaßen vor:

* Im Tab “BlocknetDX” der Blocknet Wallet, klicke auf den Button “New Transaction”. Ein neues Fenster wird aufgehen:
   
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/newTX.PNG "Logo Title Text 1")   

* Klicke auf das Icon für das “Address book”. Damit wird sich nun ein neues Fenster öffnen, in dem die ganzen Adressen aufgelistet sind, die die für in den Wallets deiner Währungen erstellt hast.
   
   ![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/address_book.PNG "Logo Title Text 1")   

  * Anmerkung: 
  
    * Wenn du die Adressen nicht siehst, bedeutet dies, dass die Wallets nicht miteinander über RPC kommunizieren
    
    * Es kann bis zu 30 Sekunden dauern, bis XBridge mit den Wallets verbunden ist, sobald aber die Startsequenz vorrüber ist, sollten alle Währungen angezeigt werden

    * Schreibe keine Adressen manuell in die Felder “from” und “to”. Wähle nur die Adressen aus, die dir XBridge aus den verknüpften Wallets deiner gewünschten Währungenzur Verfügung stellt.
      
* Auf den Seiten "from" und "to", klicks das "Address Book" und doppelklicke auf die Währung, die du handeln möchtest.
    
* Deine Adresse sowie der passende Kontostand wird für jede Währung angezeigt.
   
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/btc_dyn_newtx.PNG "Logo Title Text 1")
    
   * In diesem Beispiel handeln wir Bitcoin gegen Dynamic
   
* Wähle die Menge, die du handeln möchtest und klicke auf "New Transaction".
   
* Die neue TX-Nummer wird nun auf der Blocknet DX erscheinen und darauf warten, dass jemand dein Angebot annimmt.
   
![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/btc_dyn_posted.PNG "Logo Title Text 1")
    
   * In diesem Beispiel möchten wir 0.0006 BTC für 1 DYN handeln-
   
* Um als Gegenpartei den Handel zu akzeptieren, klicke mit rechts auf die entsprechende TX-Nummer undd drücke dann auf "accept"

* Um deinen TX-Handel abzubrechen, klicke mit rechts auf die entsprechende TX-Nummer und dann "cancel".

---

## Problemanalyse
* Um sicherzugehen, dass jede Wallet über XBridge kommuniziert, überprüfe, dass jede deiner erstellten Adressen im Adressbuch der Blocknet Wallet auftaucht. Wenn dies nicht so ist, schließe die Wallets und überprüfe erneut die entsprechenden Konfigurationen fehlender Adressen.

* Versichere Dich, dass du die Anzahl an Coins, die du handeln möchtest, auch an die entsprechenden benannte Adresse, die in den Konfigurationen erstellt wurden, gesendet hast. Versichere dich darüber hinaus, dass dieser Transfer auch bereits bestätigt wurde.

* In dem Augenblick, wenn du weitere Änderungen an den .conf-Dateien vornimmst, musst du die entsprechende Wallet schließen und neu starten, ebenso AUCH die Blocknet Wallet. 

* Versichere Dich, dass die nötigen Port auch offen sind. Dafür kannst du (als Beispiel) die Windows Kommandozeile verwenden und dort `netstat -an` eingeben und die Ausgabe durchschauen. Überprüfe, dass die Ports, die du in den .conf-Dateien (als Beispiel: 8332 für Bitcoin) angegeben hast, für den localhost (127.0.0.1) offen sind.

* Versichere Dich, dass alle .conf-Dateien 100% richtig konfiguriert wurden. Diese Konfigurationen sind sehr spezifisch und erlauben keinerlei Fehleingabe. Jede falsch eingegebene Information (selbst ein falscher Buchstabe oder Zahl) wird Probleme hervorrufen.

* Versichere Dich, dass keine Firewall deines Betriebssystem die Kommunikation stört. Dies kannst du gegebenfalls in dem Interface deiner Firewall überprüfen.

* Überprüfe gegebenfalls die Logdatei von XBridge auf Fehlermeldungen: C:\Users\yourusername\AppData\Roaming\blocknetdx\log

* Überprüfe gegebenfalls die Logdateien der einzelnen Wallets auf Fehlermeldungen: C:\Users\yourusername\AppData\Roaming\walletname\debug.log

---

## Tipps zur Sicherheit
(Danke an threepwood)

Da unsere Technologie eigentlich bedeutet, dass du deine eigene Börse/Exchange machst, sind hier noch ein paar Tipps, um deine Einlagen zu sichern.

   * Das team von Blocknet wird NIE nach deinen "Private Keys" fragen. Glaube diesbezüglich niemandem, der sich als ein Mitarbeiter von Blocknet ausgibt!
   
Börsen

   * Transferiere deine Coins von einer Börse zu deiner privaten Wallet.

   * Benutze lange und zufällige Passwörter.

   * Benutze für Logins und Abhebungen immer 2FA.

   * Schalte die Wiederherstellung von Passwörter über SMS/Telefondienste ab. Für maximale Sicherheit deaktiviere die Wiederherstellung von Passwörtern komplett.

   * Das Sichern von Passwörtern ist wichtig, aber mache dies nur offline und/oder als Ausdruck auf Papier.

   * Versichere dich, dass deine gespeicherten emails nicht zusätzliche Informationen wie Passwörter oder Sicherheitsnummern enthalten. Lösche diese gegebenfalls nach dem offline-Speichern dieser Daten.

   * Benutze immer verschiedene emails, sofern dies möglich ist. Dies behindert Hacker dabei, automatische "Forgot my password"-Links zu benutzen. 
   
   * Online-Aktivität/ Offenlegung persönlicher Daten. Sprich online niemals über die Menge deiner Coins oder dergleichen!

   * Halte deine persönlichen Daten zur Person online weitgehend limitiert. Dies kann ansonsten die Aufmerksamkeit von Hackern auf dich ziehen, wenn du zuviele Informationen preisgibst.

   * Deaktiviere jeden nicht mehr benutzten online-Account.

   * Gehe davon aus, dass Hacker sich einen Überblick über dein persönliches Profil zusammensuchen. Solange du online bist, schaue genau, mit wem du online zu tun hast.

   * Hackergruppen benutzen automatische Scripte, sofern deren Möglichkeiten damit aber erschöpft sind, werden sie versuchen, über den sozialen persönlichen und direkten Kontakt Dinge herauszufinden.

   * Hackergruppen sind Profis in der Bewertung von Personen/Gruppen/Dingen des sozialen Netzlebens. Sie haben dies oft genug gemacht.

   * Öffne keine Links oder Dateien, die ohne Grund in Slack & Co gepostet werden.

   * Falle nicht auf Leute rein, die dir Geschichten erzählen wie z.B., sie haben alle Ihre Coins verloren, und um Hilfe bitten, ohne dies selbst nachzuprüfen.

   * Sichere deine privaten Schlüssel regelmässig und mehrfach ab.

   * Versichere dich, dass deine Backups korrekt sind, indem du sie in deinen Clienten importierst.

   * Sichere deine Backups in M-DISC oder Papierformaten.

   * Nutze zugehörige Wallets und mache deinen Staking PC zu einem sicheren PC. Nutze diesen idealerweise NICHT für andere Aktivitäten im Netz.

   * Verschlüssele deine Festplatten.

   * Nutze Open-Source-Programme sofern möglich.

   * Halte deine Software immer auf neuestem Stand.

   * Installiere keine Software von unbekannten Drittparteien.

   * Nutze jede Möglichkeit, um dein Netzwerk zu sichern und schwäche damit die Möglichkeit von Attacken auf deinen Wallet-PC ab.
