#!/bin/bash
# Don't lock via cli as your password is stored in the history
set -e

read -s -p 'blocknetdx wallet passphrase: ' passphrase 
./blocknetdx-cli encryptwallet ${passphrase}
