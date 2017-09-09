# xbridge.conf

* Under the ```[Main]``` heading, edit the following to suit your requirements:

  * ```ExchangeWallets=``` Add/remove coin heading's here (only add the coin's you wish to host on your service node or trade with)
  * ```LogPath=``` Change file path to desired location 

* Under each ```[COIN]``` heading, edit the following to suit your individual wallet's RPC configuration:

  * ```Address=``` Edit this field to match your labelled receive address
  * ```Username=``` Edit this field to match RPCuser in the coin's .conf
  * ```Password=``` Edit this field to match RPCpassword in the coin's .conf
  
  * https://github.com/BlocknetDX/blocknet-docs/blob/master/walletsCONF.md

* This master xbridge.conf contains all of the successfully traded coin's currently on the Blocknet DX. As future coin's go through the testing phase and have successful swaps, they will be announced accordingly. After the announcement those configuration parameters will be released on this document.

```
[Main]
ExchangeWallets=BTC,SYS,LTC,DASH,DGB,DYN,DOGE,PIVX,VIA,VTC,MUE,NMC,QTUM,LBC
FullLog=true
LogPath=
ExchangeTax=300

[RPC]
Enable=false
UserName=rpc1
Password=rpc1
UseSSL=false
Port=8080

[BTC]
Title=Bitcoin
Address=
Ip=127.0.0.1
Port=8332
Username=
Password=
AddressPrefix=0
ScriptPrefix=5
SecretPrefix=128
COIN=100000000
MinimumAmount=0
TxVersion=2
DustAmount=0
CreateTxMethod=BTC
MinTxFee=27000
BlockTime=600
GetNewKeySupported=false
ImportWithNoScanSupported=false
FeePerByte=105
Confirmations=0

[SYS]
Title=SysCoin2
Address=
Ip=127.0.0.1
Port=8370
Username=
Password=
AddressPrefix=0
ScriptPrefix=5
SecretPrefix=128
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
MinTxFee=60000
BlockTime=60
GetNewKeySupported=false
ImportWithNoScanSupported=false
FeePerByte=100
Confirmations=0

[LTC]
Title=Litecoin
Address=
Ip=127.0.0.1
Port=9332
Username=
Password=
AddressPrefix=48
ScriptPrefix=5
SecretPrefix=176
COIN=100000000
MinimumAmount=0
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=true
FeePerByte=110
MinTxFee=60000
TxVersion=1
BlockTime=60
Confirmations=0

[DASH]
Title=Dash
Address=
Ip=127.0.0.1
Port=9998
Username=
Password=
AddressPrefix=76
ScriptPrefix=16
SecretPrefix=204
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=true
MinTxFee=15000
BlockTime=150
FeePerByte=15
Confirmations=0

[DGB]
Title=Digibyte
Address=
Ip=127.0.0.1
Port=14022
Username=
Password=
AddressPrefix=30
ScriptPrefix=5
SecretPrefix=128
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=true
MinTxFee=100000
BlockTime=60
FeePerByte=100
Confirmations=0

[DYN]
Title=Dynamic
Address=
Ip=127.0.0.1
Port=31350
Username=
Password=
AddressPrefix=30
ScriptPrefix=10
SecretPrefix=140
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=false
MinTxFee=40000
BlockTime=128
FeePerByte=80
Confirmations=0

[DOGE]
Title=Dogecoin
Address=
Ip=127.0.0.1
Port=22555
Username=
Password=
AddressPrefix=30
ScriptPrefix=22
SecretPrefix=158
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=true
MinTxFee=100000000
BlockTime=60
FeePerByte=100000
Confirmations=0

[PIVX]
Title=Pivx
Address=
Ip=127.0.0.1
Port=51473
Username=
Password=
AddressPrefix=30
ScriptPrefix=13
SecretPrefix=212
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=true
MinTxFee=100000
BlockTime=60
FeePerByte=110
Confirmations=0

[VIA]
Title=Viacoin
Address=
Ip=127.0.0.1
Port=5222
Username=
Password=
AddressPrefix=71
ScriptPrefix=33
SecretPrefix=199
COIN=100000000
MinimumAmount=0
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=false
FeePerByte=110
MinTxFee=60000
TxVersion=1
BlockTime=24
Confirmations=0

[VTC]
Title=Vertcoin
Address=
Ip=127.0.0.1
Port=5888
Username=
Password=
AddressPrefix=71
ScriptPrefix=5
SecretPrefix=199
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=false
MinTxFee=100000
BlockTime=150
FeePerByte=200
Confirmations=0

[MUE]
Title=MonetaryUnit
Address=
Ip=127.0.0.1
Port=29683
Username=
Password=
AddressPrefix=16
ScriptPrefix=76
SecretPrefix=126
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=true
MinTxFee=100000
BlockTime=40
FeePerByte=300
Confirmations=0

[NMC]
Title=Namecoin
Address=
Ip=127.0.0.1
Port=8336
Username=
Password=
AddressPrefix=52
ScriptPrefix=13
SecretPrefix=180
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=true
MinTxFee=100000
BlockTime=600
FeePerByte=100
Confirmations=0

[QTUM]
Title=Qtum
Address=
Ip=127.0.0.1
Port=3889  // Test-net port, Main-net port will be updated upon release
Username=
Password=
AddressPrefix=58
ScriptPrefix=50
SecretPrefix=128
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=true
MinTxFee=20000
BlockTime=150
FeePerByte=20
Confirmations=0

[LBC]
Title=LBRY Credits
Address=
Ip=127.0.0.1
Port=9245
Username=
Password=
AddressPrefix=85
ScriptPrefix=122
SecretPrefix=28
COIN=100000000
MinimumAmount=0
TxVersion=1
DustAmount=0
CreateTxMethod=BTC
GetNewKeySupported=false
ImportWithNoScanSupported=true
MinTxFee=200000
BlockTime=150
FeePerByte=200
Confirmations=0
```
