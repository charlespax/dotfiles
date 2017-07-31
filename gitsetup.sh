#!/bin/sh

# Configure user name and email
git config --global user.email "charles.pax@gmail.com"
git config --global user.name "Charles Edward Pax"

# Use vim as difftool
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool

