#!/bin/sh

# To install (homebrew required)
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/velit/config/master/mac_install.sh)"

INSTALL_LIST="
devtodo
ncurses
pwgen
screen
source-highlight
tree
vim
zsh
grip
curl
coreutils
findutils
grep
"

brew install git python3 stow
git clone git@github.com:velit/config.git ~/config
~/config/install_configs.py
brew install $INSTALL_LIST
