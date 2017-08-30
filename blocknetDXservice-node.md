## Service Nodes Require a single 5k transaction (which is locked)
## Two wallets are required, a service-node wallet with public-ip and
## the activation wallet.  Funds are sent to the activation wallet
- Generate Address on activation wallet ```getaccountaddress snode1```
- Send 5k to that address
- Generate private key on activation wallet ```servicenode genkey```
- Get tx output information from the 5k tx ```servicenode outputs```
- P2P port is 41412
- On the activation wallet, edit servicenode.conf
- Add public_ip:port of service node, then the private key, then the tx output info, example is provided in existing servicenode.conf

## Switch to service node
- Edit blocknetdx.conf
```servicenode=1
servicenodeaddr=PUBLIC_IP:41412
servicenodeprivkey=OUTPUT_FROM_genkey_command_above```

