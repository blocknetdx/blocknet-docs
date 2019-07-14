**Blocknet´s freigegebene spezifische coin.conf´s**

Dieses Repo ist jetzt veraltet. Weitere Informationen finden Sie im [Blockchain-Konfigurationsdateien-Repository](https://github.com/blocknetdx/blockchain-configuration-files).

Konfigurationserstellungshandbuch:
https://github.com/blocknetdx/blockchain-configuration-files#creating-configuration-files

---

* Bei jedem Coin editiere wie folgt für deinen Bedarf

    * ```rpcuser=``` füge einen einmaligen Nutzernamen ein

    * ```rpcpassword=``` füge ein kompliziertes Passwort ein

    * Gehe sicher, daß die Nutzernamen und Passwörter für jeden Coin unterschiedlich sind

* Sichere jede Wallet mit einem kompliziertem, einmaligem Passwort

* Dieses Dokument beinhaltet alle Coins, die bereits erfolgreich auf der
    Blocknet DX gehandelt wurden. Über weitere Coins, die erfolgreich durch die
    Testphase gegangen sind, wird entsprechend informiert. Nach der
    Bekanntmachung werden die entsprechenden Konfigurationen dieser Coins in
    diesem Dokument veröffentlicht.

__bitcoin.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1

txindex=1
```

__blocknetdx.conf__
```
listen=1
server=1
rpcallowip=127.0.0.1
port=49901
rpcport=41490
rpcuser=
rpcpassword=
staking=0
enableaccounts=1
```

__dash.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__digibyte.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__dogecoin.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__dynamic.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__faircoin.conf__
```
server=1
listen=1
rpcallowip=127.0.0.1
rpcuser=
rpcpassword=
```

__LBRY Credits LBC Command Line__
```
lbrycrdd -server -listen -rpcuser= -rpcpassword= -rpcallowip=127.0.0.1
```
OR

__lbrycrd.conf__

```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__litecoin.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__monacoin.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```


__mue.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__namecoin.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__pivx.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__qtum.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__syscoin.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__vertcoin.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

__viacoin.conf__
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```
