#!/bin/bash

# Install the basics
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y install git vim

# get my dotfiles
mkdir ~/github
cd ~/github
git clone https://github.com/charlespax/dotfiles
cd ~/github/dotfiles
bash link.sh
bash gitsetup.sh
