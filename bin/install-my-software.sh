#!/bin/sh

INSTALL_LIST="
build-essential
curl
devtodo
dtrx
exuberant-ctags
git
htop
ipython
kompare
ncurses-doc
ncurses-term
open-vm-tools
open-vm-tools-desktop
pwgen
python-pytest
python3
python3-pytest
realpath
screen
sharutils
silversearcher-ag
source-highlight
ssh
texinfo
texlive
texlive-font-utils
texlive-lang-english
texlive-lang-european
texlive-latex-base
texlive-latex-extra
texlive-latex-recommended
tree
vim-gtk
virtualenvwrapper
wajig
"

sudo apt-get install $INSTALL_LIST

#texlive-lang-finnish
