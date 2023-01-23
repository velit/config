#!/bin/sh

INSTALL_LIST="
git
stow
python3
python3-pip
python-is-python3
build-essential
curl
devtodo
exuberant-ctags
htop
ncurses-doc
ncurses-term
pwgen
screen
sharutils
silversearcher-ag
source-highlight
tree
vim-gtk
zsh
grip
"

sudo apt install $INSTALL_LIST
