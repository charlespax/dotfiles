#!/bin/bash

# TODO
# - Put each item in a function
# - Add argument support
# - Add menu system
# - Add help function
# - Determine what OS we are running
#   * if mint...; elif ubuntu...

USERNAME=`whoami`
# Get the Ubunth codename for this Linux Mint version
eval $(source /etc/os-release; echo UBUNTU_CODENAME=$UBUNTU_CODENAME;)

## Devleopment tools
sudo apt-get install vim
sudo apt-get isntall git
sudo apt-get install build-essential
sudo apt-get install exuberant-ctags

## System tools
# ukuu kernel manager
# This is used for updating the system with a mainline kernel version
sudo add-apt-repository ppa:teejee2008/ppa
sudo apt-get update
sudo apt-get install ukuu

## Applications
# Chromium browser
sudo apt-get install chromium-browser
# Install SpeedCrunch, a calculator
sudo apt-get install speedcrunch

## Install Virtualbox 5.1.x
# Add Virtualbox repo for yakkety 
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $UBUNTU_CODENAME contrib"
# Add keys
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - 
sudo apt-get update
sudo apt-get install virtualbox-5.1
sudo apt-get install dkms # Helps with host kernel modules
sudo usermod -a -G vboxusers $USERNAME # Add user to vboxusers group

## SC-IM stuff
sudo apt-get install libzip-dev libxml2-dev bison  libncurses5-dev
sudo apt-get install libncurses5 libncursesw5
sudo apt-get install libncursesw5-dev
sudo apt-get install stow
