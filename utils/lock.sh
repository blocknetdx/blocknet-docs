#!/bin/bash
# Don't lock via cli as your password is stored in the history
# run this script from the folder containing the blocknetdx-cli executable
set -e

read -s -p 'blocknetdx wallet passphrase: ' passphrase 
./blocknetdx-cli encryptwallet ${passphrase}
