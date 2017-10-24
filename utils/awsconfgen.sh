#!/usr/bin/env bash
# aws config generation script, used with ansible deployments
mypublicip=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
# simple password generation
myrpcpass=$(date +%s | sha256sum | base64 | head -c 32 ; echo)
# this script expects the servicenodeprivkey to already exist in the conf file (via ansible)
echo "server=1" >> /root/.blocknetdx/blocknetdx.conf
echo "listen=1" >> /root/.blocknetdx/blocknetdx.conf
echo "daemon=1" >> /root/.blocknetdx/blocknetdx.conf
echo "maxconnections=250" >> /root/.blocknetdx/blocknetdx.conf
echo "rpcpassword=${myrpcpass}" >> /root/.blocknetdx/blocknetdx.conf
echo "rpcuser=blocknetdxrpc" >> /root/.blocknetdx/blocknetdx.conf
echo "servicenode=1" >> /root/.blocknetdx/blocknetdx.conf
echo "servicenodeaddr=${mypublicip}:41412" >> /root/.blocknetdx/blocknetdx.conf
