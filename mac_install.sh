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

function translate {
   echo "$@" | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
}

brew install git python3 stow

git clone git@github.com:velit/config.git ~/config
cd ~/config
git config user.name "Tapani Kiiskinen"
git config user.email $(translate gncnav.xvvfxvara@tznvy.pbz)

./install_configs.py
brew install $INSTALL_LIST
