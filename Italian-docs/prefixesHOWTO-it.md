# Come Trovare Le Istruzioni Prefix .CONF 

1. Indirizzo Prefix:

    1. Vai a: http://lenschulwitz.com/base58
    2. Inserisci l'indirizzo del wallet nel decodificatore in base 58
    3. Prime 2 cifre della copia HEX in: http://www.binaryhexconverter.com/hex-to-decimal-converter
    4. Valore Decimale = Indirizzo prefix

2. Script Prefix:

    1. Vai alla console del wallet
    2. Scrivi `validateaddress <wallet address>`
    3. Copia `pubkey`
    4. Se dice qualcosa sul wallet bloccato vai a `walletpassphrase <walletpassword> <pick a number in seconds>` esempio: `walletpassphrase password 10000`
    5. Scrivi `decodescript <enter copied pubkey from step iii>`
    6. Prendi l'output p2sh e decodificalo su HEX sul website base58 
    7. Poi converti le prime 2 cifre di HEX. Valore decimale = script prefix

3. Prefix Segreto:

    1. Vai alla console del wallet
    2. Scrivi `dumpprivkey <wallet address>`
    3. Copia la `privkey` 
    4. Decodifica la privkey in HEX sul sitoweb base58 
    5. Poi converti le prime 2 cifre di HEX. Valore decimale = prefix segreto

4.  RPC Port:

    1. Cerca il wallet su GitHub, pagina web ufficiale, bitcointalk, ricerche generali su google
    2. Prova alcune risorse del sito web elencate di seguito nella pagina successiva 
    3. Sotto il menu debug o Tool del wallet, clicca la scheda tab. La porta dell'indirizzo IP é a volte 1 sotto qunato listato. Funziona solo alcune volte.
    4. Dalla linea di comando (windows: `netstat -an` / linux: `netstat -anp`) che potrebbe mostrare porte aperte (su Windows non viene mostrato il processo, ma esiste una GUI che lo mostra)

Grazie @86b (Slack) per aver aver scoperto questo metodo.
