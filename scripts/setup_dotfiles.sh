#!/bin/bash
#
# This script installs my dotfile from Github.

# Get my dotfiles
mkdir ~/github
cd ~/github
git clone https://github.com/charlespax/dotfiles
cd ~/github/dotfiles/scripts
bash setup_links.sh
bash setup_git.sh
