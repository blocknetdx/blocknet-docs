## Passi per migrare dalla vecchia chain alla nuova chain
- Fare il backup del file wallet.dat prima di fare qualsiasi altra cosa (fanne 2 copie separate)
- Per Windows, il file wallet.dat puó essere trovato in C:\Users\User\AppData\Roaming\blocknet (o nelle nuove versioni di \BlocknetDX)
- Per OSX, il file wallet.dat puó essere trovato in ~/Library/Application Support/blocknet (o nelle nuove versioni di /BlocknetDX)
- Sblocca completamente il wallet (non solo per lo staking) dalla UI (nel menu principale, "Settings" > "Unlock Wallet")
- Usa la console per il debug (nel menu principale, "Tools" > "Debug Console") e scrivi ```dumpwallet filename.txt``` (rimpiazza "filename.txt" con un nome di tua scelta)
- Il file sará collocato nella directory dalla quale hai lanciato il wallet 

## Scarica un nuovo wallet
- Lancia il wallet
- Usa la console per il debug e scrivi ```importwallet filename.txt``` (rimpiazza filename.txt con il nome del file usato nel comdando dumpwallet sopra)
- Verifica i vecchi indirizzi che sono stati importati dalla consele debug scrivendo ``` listreceivedbyaddress 0 true```

## Quando sposti il tuo wallet.dat e inizi ad usare il nuovo wallet
- Ogni volta che vi é un fork della chain avrai bisogno di spostare il tuo file wallet.dat
- Se una versione specifica del wallet é richiesta per un fork, scarica il nuovo wallet, sincronizzalo, e sposta il tuo wallet.bat nella directory prima del fork 
- Comunque, il saldo del nuovo wallet rimarrá zero fino alla migrazione (fork) 
- Lo snapshot verrá fatto al momento del blocco finale sulla vecchia chain 
- Una volta che lo snapshot viene applicato alla nuova chain, il tuo saldo verrá mostrato nel nuovo wallet 
- Puó essere previsto che exchanges (centralizzati) riabilitino il trading una volta che abbiano confermato che la nuova chain sia in funzione come previsto.

## Problemi nel sincronizzare la nuova chain
- chiudi il wallet
- Fai un backuo del file wallet.dat prima di fare qualsiasi altra cosa (fanne 2 copie separate) 
- Fai il backup del file blocknetdx.conf se hai un nodo di servizio (fanne 2 copie separate)
- Apri il walle e lascia sincronizzare la chain 
- sostituisci i file wallet.dat e blocknetdx.conf creati con la copia di backup
