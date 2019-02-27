#!/bin/bash

# This section checks to see if bitcoind is already installed
printf "Checking for bitcoind installation... "
INSTALLED="$(command -v bitcoind)"
if [ "${INSTALLED##*/}" = "bitcoind" ]; then
    echo "INSTALLED"
else
    echo "NOT installed"
    echo "Installing bitcoind... "
    sudo apt-add-repository -y ppa:bitcoin/bitcoin
    sudo apt-get update
    sudo apt-get -y install bitcoind bitcoin-qt
fi

# Download and verify the go language installation file
GO_FILENAME="go1.11.5.linux-amd64.tar.gz"
GO_URL="https://dl.google.com/go/"
GO_FILEURL=$GO_URL/$GO_FILENAME
GO_HASH=`echo "ff54aafedff961eb94792487e827515da683d61a5f9482f668008832631e5d25"`
echo Downloading GO... 
wget -qc --show-progress $GO_FILEURL 
HASH="`sha256sum go1.11.5.linux-amd64.tar.gz | awk -F \" \" '{ print $1 }'`"
echo Downloading GO... COMPLETE
printf "Verifying GO sha256... " 
if [ "$HASH" = "$GO_HASH" ]; then
    echo "PASSED"
fi
