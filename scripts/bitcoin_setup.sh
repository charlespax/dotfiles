#!/bin/bash

# Tested on lubuntu 18.10
# # Connect to wifi
# # git is already installed
# git clone https://github.com/charlespax/dotfiles
# cd dotfiles/scripts/
# ./bitcoin_setup.sh
# This installation process is taken from
# https://github.com/lightningnetwork/lnd/blob/master/docs/INSTALL.md

# Global variables
GO_FILENAME="go1.11.5.linux-amd64.tar.gz"
GO_HASH=`echo "ff54aafedff961eb94792487e827515da683d61a5f9482f668008832631e5d25"`
GO_URL="https://dl.google.com/go/"
GO_FILEURL=$GO_URL/$GO_FILENAME
GO_VERSION_STRING="go version go1.11.5 linux/amd64"

source ~/.bashrc

# TODO Support i386
# TODO Support ARM
# TODO Determine bitcoind installed version


install_bitcoind_from_ppa () {
    # Attempt to install bitcoind
    sudo apt-add-repository -y ppa:bitcoin/bitcoin
    sudo apt-get update
    sudo apt-get -y install bitcoind bitcoin-qt
    local status="$(command -v bitcoind)"
    if [ "${status##*/}" = "bitcoind" ]; then
        echo "Installing bitcoind from ppa... SUCCESS"
    else
        echo "Installing bitcoind from ppa... ERROR"
    fi
}

bitcoind_installed () {
    # return "true" if bitcoind is installed
    # return "false" otherwise
    local status="$(command -v bitcoind)"
    if [ "${status##*/}" = "bitcoind" ]; then
        echo "true"
    else
        echo "false"
    fi
}

go_installed () {
    # return "true" if 'go' is installed at or above desired version
    # return "false" otherwise
    if [ "$GO_VERSION_STRING" = "`command go version`" ]; then
        echo "true"
    else
        echo "false"
    fi
}

download_go() {
    # Download go
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
}

install_go () {
    # Install GO
    printf "Checking GO installation... "
    DESIRED_GO_VERSION=$GO_VERSION_STRING
    if [ "$DESIRED_GO_VERSION" = "`command go version`" ]; then
        echo "$DESIRED_GO_VERSION installed"
    else
        # See if we already have the file
        if [ -f $GO_FILENAME ]; then
            echo "$GO_FILENAME found"
        else
            download_go
        fi
        printf "Installing GO language... "
        sudo tar -C /usr/local -xzf $GO_FILENAME
        export PATH=$PATH:/usr/local/go/bin
        export GOPATH=~/gocode
        export PATH=$PATH:$GOPATH/bin

        echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
        echo "export GOPATH=~/gocode" >> ~/.bashrc
        echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
        source ~/.bashrc
        if [ "$DESIRED_GO_VERSION" = "`command go version`" ]; then
            echo "COMPLETE"
            echo "Installing GO language... $DESIRED_GO_VERSION installed"
        else
            echo "Installing GO language... ERROR: 'go' not present"
            exit 1
        fi
    fi
}

# TODO Use the official binaries for installation instead of repositories
#      Include a hash check. Note that the ppa does not have file for
#      ubuntu disco prerelease as of 2019-02-26. In this case, using the
#      official binaries would be better.
install_bitcoind_from_binary () {
    :
}

echo "******************************************"
echo "******************************************"
echo "***                                    ***"
echo "***     Installing Lightning Node      ***"
echo "***                                    ***"
echo "******************************************"
echo "******************************************"

printf "Checking for bitcoind installation... "
if [ "$(bitcoind_installed)" = "true" ]; then
    echo "INSTALLED"
else
    echo "NOT installed"
    echo "Installing bitcoind from ppa... "
    install_bitcoind_from_ppa
fi

printf "Checking for go installation... "
if [ "$(go_installed)" = "true" ]; then
    echo "INSTALLED"
else
    echo "NOT installed"
    echo "Installing bitcoind from $GO_FILEURL "
    install_go
fi

# See https://golang.org/dl/ for the latest version of go
# TODO Test to see if GO v1.11 or higher is installed before downloading
# TODO Test to see golang 1.11 or higher is in the repositories
#      v1.11 and 1.12 are in ubuntu-19.04 as of 2019-02-26
# TODO Give the option of downloading from the repository or official binaries
# TODO Put blocks of code into functions



# TODO Figure out a mechanism to updating the PATH in the bash session
#      from which the bitcoin script is run.
# TODO Only print this message if necessary
echo "Exit this terminal, start a new terminal session, and rerun this script."
