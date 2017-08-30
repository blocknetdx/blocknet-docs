## Service Nodes Require a single 5k transaction (which is locked)
## Two wallets are required, a service-node wallet with public-ip and
## the activation wallet.  Funds are sent to the activation wallet
- Generate Address on activation wallet ```getaccountaddress snode1```
- Send 5k to that address (Requires 15 confirmations before you activate)
- Generate private key on activation wallet ```servicenode genkey```
- Get tx output information from the 5k tx ```servicenode outputs```
- P2P port is 41412
- On the activation wallet, edit servicenode.conf
- Add alias, public_ip:port of service node, then the private key, then the tx output info, example is provided in existing servicenode.conf
- Example
```
snode1 4.4.4.4:41412 93HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg 2bcd3c84c84f87eaa86e4e56834c92927a07f9e18718810b92e0d0324456a67c 0
```
- Restart activation wallet
## Switch to service node
- Edit blocknetdx.conf
```
servicenode=1
servicenodeaddr=PUBLIC_IP:41412
servicenodeprivkey=OUTPUT_FROM_genkey_command_above
```
- Restart service node

## Switch back to activation node
```
servicenode start-alias snode1
```

## Check servicenode status
- From servicenode
```
servicenode status
```

