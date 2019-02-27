#!/bin/bash

# This installation process is taken from
# https://github.com/lightningnetwork/lnd/blob/master/docs/INSTALL.md

# This section checks to see if bitcoind is already installed

# TODO Use the official binaries for installation instead of repositories
#      Include a hash check.
# TODO Determine bitcoind installed version
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

# TODO Test to see if GO v1.11 or higher is installed before downloading
# TODO Test to see golang 1.11 or higher is in the repositories
# TODO Put blocks of code into functions

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
else
    echo "ERROR: incorrect sha256 hash"
    exit 1
fi

# Install GO
printf "Checking GO language... "
DESIRED_GO_VERSION="go version go1.11.5 linux/amd64"
if [ "$DESIRED_GO_VERSION" = "`command go version`" ]; then
    echo "$DESIRED_GO_VERSION installed"
else
    printf "Installing GO language... "
    sudo tar -C /usr/local -xzf $GO_FILENAME
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=~/gocode
    export PATH=$PATH:$GOPATH/bin

    echo "export GOPATH=~/gocode" >> ~/.bashrc
    echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
    if [ "$DESIRED_GO_VERSION" = "`command go version`" ]; then
        echo "COMPLETE"
        echo "Installing GO language... $DESIRED_GO_VERSION installed"
    else
        echo "Installing GO language... ERROR: 'go' no present"
        exit 1
    fi
fi
