# Decred Kommandozeilen Setup für Blocknets DX

Danke an 86b (Slack) für unzählige Stunden Arbeit an diesem Setup!

*Dieses Setup wird einen resp 200-Fehler auf der Blocknet Exchange ausgeben; es wird daran gearbeitet.* 

* Gehe zu: https://github.com/decred/decred-release/releases/tag/v1.0.5

* Lade herunter: `dcrinstall-windows-amd64-v1.0.5.exe`

* Starte die .exe-Datei

* Suche nach dem Hauptverzeichnis, welches standardmäßig hier sein sollte: `C:\Users\<NAME>\decred\ `

---

* Öffne 3 Kommandozeilen von Windows
  * In allen 3, wechsle in das Hauptverzeichnis von Decred:
  
	  `cd C:\Users\<NAME>\decred` oder wo es installiert wurde
    
## In der ersten Windows-Kommandozeile

* Schreibe:

  * `dcrd --notls --rpcuser=CHANGE --rpcpass=CHANGE --minrelaytxfee=0.01 --rpclisten=127.0.0.1`
  	* (Wechsle den RPC Nutzernamen und das Passwort)

* Es wird sich nun verbinden und die Blockchain herunterladen. Lass diesen Prozess im Hintergrund weiterlaufen.

## In der zweiten Windows-Kommandozeile

* Schreibe: `dcrwallet --create`

* Erstelle ein Passwort und gib es ein (es wird dir nicht beim Tippen angezeigt!) 

* Gib das Passwort zur Bestätigung erneut ein.

* Schreibe `n` auf die Abfrage "addition security"

* Schreibe: `n` auf die Abfrage "on an exisiting wallet"

* Kopiere deinen Seed und Hexcode in ein Dokument und speichere es

* Schreibe: `OK`  (Großbuchstaben)

* Deine Wallet sollte nun erfolgreich erstellt sein!

## In der dritten Windows-Kommandozeile

* Schreibe:

	* `dcrwallet --username=CHANGE --password=CHANGE --noclienttls --noservertls --walletpass public --dcrdusername=CHANGE --dcrdpassword=CHANGE --txfee=0.01`
		* (gib hier den selben Nutzername und das Passwort ein wie der RPC darüber für beide)

* Gib dein Passwort ein, der Rescan der Blocks sollte starten und gegebenfalls verbinden
  
* Lass diesen Prozess im Hintergrund weiterlaufen.

## Zurück zur zweiten Windows-Kommandozeile

* Schreibe: 

	* `dcrctl -u CHANGE -P CHANGE --wallet --notls walletpassphrase <password> 1000000`
		* (-u und -P ist dein Nutzername und das Passwort von vorher)
		* ("password" ist dein Wallet-Passwort, gib aber nicht die <>-Symbole mit ein)

* Dies sollte dich zurück in das Hauptverzeichnis bringen

* Schreibe: 

	* `dcrctl -u CHANGE -P CHANGE --wallet --notls createnewaccount "testDECRED"`
		* (“testDECRED” ist der Walletadressenname, den ich meiner Adresse gegeben habe, verwende die Anführungszeichen und bennen es wie immer du möchtest)

* Dies sollte dich zurück in das Hauptverzeichnis bringen

* Schreibe:

	* `dcrctl -u CHANGE -P CHANGE --wallet --notls getnewaddress "testDECRED"`
		* (getnewaddress " " ist der Walletadressname, den du eben schon benannt hast)

* Dies sollte die deine DCR-Adresse ausgeben

## XBRIDGE.conf

* Öffne die Datei xbridge.conf und ergänze nachfolgende Konfiguration für DCR:

```
[DCR]
Title=Decred
Address=DCR ADDRESS
Ip=127.0.0.1
Port=9110
Username=YOUR USERNAME
Password=YOUR PASSWORD
AddressPrefix=7
ScriptPrefix=7
SecretPrefix=34
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=true
MinTxFee=1000000
BlockTime=150
FeePerByte=1000
```

* STarte die xbridge

