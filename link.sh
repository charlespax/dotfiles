#!/bin/sh

PWD=`pwd`
ln -f -s $PWD/vimrc ~/.vimrc
ln -f -s $PWD/scimrc ~/.scimrc
ln -f -s $PWD/bash_profile ~/.bash_profile
ln -f -s $PWD/bash_profile ~/.bashrc
mkdir ~/.moc
ln -f -s $PWD/moc ~/.moc/config
