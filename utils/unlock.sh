#!/bin/bash
# Don't unlock via cli as your password is stored in the history
set -e

read -s -p 'blocknetdx wallet passphrase: ' passphrase 

timeout=999999999 #300 years
stakeonly=true
./blocknetdx-cli walletpassphrase ${passphrase} ${timeout} ${stakeonly}

exit 0
