# Blocknet Enabled Specific coin.conf's

* Under each coin edit the following to suit your requirements:

  * ```rpcuser=``` Add a unique username
  * ```rpcpassword=``` Add a complex password
  
  * Ensure the user/pass is different for each coin
  
* Encrypt each wallet with a complex password. Wallets need to be unlocked for trading.

* This document contains all of the successfully traded coin's currently on the Blocknet DX. As future coin's go through the testing phase and have successful swaps, they will be announced accordingly. After the announcement those configuration parameters will be released on this document.

bitcoin.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1

txindex=1
```

dash.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
enableaccounts=1
staking=0
paytxfee=0.00015
```

digibyte.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
mintxfee=.001
```

dogecoin.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
enableaccounts=1
staking=0
paytxfee=1
```

dynamic.conf
```
rpcport=31350
port=31300
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
enableaccounts=1
staking=0
```

LBRY Credits LBC Command Line
```
lbrycrdd -server -listen -rpcuser= -rpcpassword= -rpcallowip=127.0.0.1
```

litecoin.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

mue.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
enableaccounts=1
paytxfee=0.001
```

namecoin.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
enableaccounts=1
paytxfee=0.001
addnode=144.76.39.233
addnode=198.15.127.242
addnode=198.15.127.242
addnode=176.9.113.75
addnode=62.63.157.78
addnode=195.154.188.50
addnode=47.89.183.30
addnode=108.62.19.130
```

pivx.conf
```
rpcport=51473
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
enableaccounts=1
paytxfee=0.001
```

qtum.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
enableaccounts=1
staking=0
```

syscoin.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
```

vertcoin.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
enableaccounts=1
staking=0
```

viacoin.conf
```
server=1
listen=1
rpcuser=
rpcpassword=
rpcallowip=127.0.0.1
enableaccounts=1
staking=0
```
