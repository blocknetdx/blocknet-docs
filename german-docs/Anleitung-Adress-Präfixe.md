# Anleitung zum Finden der Präfixe der .conf-Dateien

Dieses Repo ist jetzt veraltet. Weitere Informationen finden Sie im [Blockchain-Konfigurationsdateien-Repository](https://github.com/blocknetdx/blockchain-configuration-files).

Konfigurationserstellungshandbuch:
https://github.com/blocknetdx/blockchain-configuration-files#creating-configuration-files

---

1. Adress-Präfixe:

    1. Gehe zu: http://lenschulwitz.com/base58
    2. Gib die Walletadresse in den Base 58 Decoder ein
    3. Die ersten beiden Stellen der HEX-Ausgabe gib hier ein: http://www.binaryhexconverter.com/hex-to-decimal-converter
    4. Der Dezimalwert = Adressen-Präfix

2. Script Präfix:

    1. Gehe zur Konsole der Wallet
    2. Schreibe `validateaddress <wallet address>`
    3. Kopiere den `pubkey`
    4. Wenn du die Meldung bekommst, dass die Wallet gesperrt ist, schreibe `walletpassphrase <walletpassword> <pick a number in seconds>` als Beispiel: `walletpassphrase password 10000`
    5. Schreibe nun `decodescript <enter copied pubkey from step iii>`
    6. Nimm die Ausgabe für p2sh und dekodiere dies in den HEX-Code auf der Base58-Webseite
    7. Danach wandle die ersten beiden Stellen des HEX-Codes um. Der Dezimalwert = Adressen-Präfix

3. Geheimer Präfix:

    1. Gehe zur Konsole der Wallet
    2. Schreibe `dumpprivkey <wallet address>`
    3. Kopiere den `privkey` 
    4. Dekodiere den privaten Schlüssel zu HEX-Code auf der Base58-Webseite
    5. Anschließend wandle die ersten beiden Stellen des HEX-Codes um.Then convert first 2 digits of hex. Der Dezimalwert = Geheimer Adressen-Präfix

4.  RPC Port:

    1. Durchsuche Github nach Wallets, die offiziellen Homepages, Bitcontalk, und allgemeine Google-Suchen
    2. Versuche einige der Homepages, die auf der nächsten Seite aufgelistet sind.
    3. Im Debug-Menü oder dem Tool-Menü, klicke auf den Tab Peers. Der Port der IP-Adresse steht manchmal 1 Zeile unter der Auflistung- Dies funktioniert nur manchmal.
    4. Gib in der Kommandozeile von Windows/Linux nachfolgendes ein: windows: `netstat -an` / linux: `netstat -anp`. Dies gibt die offenen Ports aus. (in Windows zeigt dies nicht den dazugehörigen Prozess, aber es gibt dafür ein Programm)

Danke für die Ausarbeitung der Methode an @86b
