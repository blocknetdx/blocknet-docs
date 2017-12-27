# Configurare Decred CMD Line Per Blocknet DX

GRAZIE A @86b (Slack) per aver trascorso ore e ore su questa configurazione!

*Questa configurazione otterrá un resp di 200 sul blocco DX w/ un errore, questo é stato esaminato.* 

* Vai a: https://github.com/decred/decred-release/releases/tag/v1.0.5

* Scarica: `dcrinstall-windows-amd64-v1.0.5.exe`

* Esegui il .exe

* Trova la directory, dovrebbe essere: `C:\Users\<NAME>\decred\ `

---

* Apri 3 fineste cmd prompt 
  * Su tutte e 3, cambia la directory con la directory sorgente:
  
	  `cd C:\Users\<NAME>\decred` o dovunque sia installata
    
## Prima Finestra CMD PROMPT 

* Scrivi:

  * `dcrd --notls --rpcuser=CHANGE --rpcpass=CHANGE --minrelaytxfee=0.01 --rpclisten=127.0.0.1`
  	* (change rpc user/pass)

* Dovrebbe connettersi e scaricare la blockchain. Lascialo in esecuzione in background

## Seconda Finestra CMD PROMPT

* Scrivi: `dcrwallet --create`

* Crea e inserisci una password (non verrá mostrato nulla quando la password sará inserita) 

* Scrivila nuovamente per confermarla

* Scrivi `n` per ulteriore sicurezza

* Scrivi: `n` su un wallet esistente

* Copia il Seed, mettilo in un documento e salvalo

* Scrivi: `OK`  (lettere maiuscole)

* Il tuo wallet dovrebbe essere stato creato correttamente!

## Terza Finestra CMD PROMPT 

* Scrivi:

	* `dcrwallet --username=CHANGE --password=CHANGE --noclienttls --noservertls --walletpass public --dcrdusername=CHANGE --dcrdpassword=CHANGE --txfee=0.01`
		* (enter the same user/pass as the above RPC for both user/pass)

* Inserisci la password, dovrebbe rianalizzare i blocchi ed eventualmente riconnettersi 
  
* Lascialo in esecuzione in background 

## Torna Indietro Alla Seconda Finestra CMD PROMPT 

* scrivi: 

	* `dcrctl -u CHANGE -P CHANGE --wallet --notls walletpassphrase <password> 1000000`
		* (-u and -P is your user/pass from above)
		* ("password" is your wallet password, but don’t use the <> symbols)

* dovrebbe portarti indietro alla directory

* scrivi: 

	* `dcrctl -u CHANGE -P CHANGE --wallet --notls createnewaccount "testDECRED"`
		* (“testDECRED” is what I am calling my labelled address, use the quotation marks and label it whatever you want)

* Dovrebbe portarti indietro alla directory

* Scrivi:

	* `dcrctl -u CHANGE -P CHANGE --wallet --notls getnewaddress "testDECRED"`
		* (getnewaddress " " is whatever you wrote on the above command for a label)

* Dovrebbe produrre il tuo indirizzo DCR etichettato

## XBRIDGE.conf

* Vai al tuo xbridge.conf e aggiungi questa configurazione per DCR:

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

* esegui xbridge

