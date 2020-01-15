#!/bin/bash
# Don't unlock via cli as your password is stored in the history
# # run this script from the folder containing the blocknetdx-cli executable
set -e

read -s -p 'blocknetdx wallet current passphrase: ' passphrase_current
read -s -p "$(echo -e '\nblocknetdx wallet new passphrase: ')" passphrase_new
read  -s -p "$(echo -e '\nblocknetdx wallet confirm new passphrase: ')"  passphrase_confirm

if [ "$passphrase_new" == "$passphrase_confirm" ]; then

echo -e "\n"

./blocknetdx-cli walletpassphrasechange ${passphrase_current} ${passphrase_new}

else

echo -e "\npasswords do not match"

fi

exit 0
