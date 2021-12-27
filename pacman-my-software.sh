#!/bin/sh

INSTALL_LIST="
which
stow
git
python
python-pip
screen
sharutils
the_silver_searcher
source-highlight
tree
zsh
openssh
base-devel
"

sudo pacman -S $INSTALL_LIST
