#!/bin/bash

# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/velit/config/master/run_apt_install.sh)"

INSTALL_LIST="
build-essential
curl
devtodo
ncurses-doc
ncurses-term
screen
sharutils
source-highlight
tree
vim-gtk
zsh
grip
"

sudo apt install git python3 python3-pip stow openssh
echo

if [ ! -d ~/config ]; then
    read -p "Enter email, enter to skip setting ssh-key: " email
    if [ -n "$email" ]; then
        ssh-keygen -t ed25519 -C $email
        echo
        echo "Input .pub contents to github:"
	echo
        cat ~/.ssh/*.pub
	echo
        read -p "Enter to continue:"
    fi
    git clone git@github.com:velit/config.git ~/config
    echo
fi

python3 ~/config/install_configs.py
echo

python3 -m pip install --user -r ~/config/python_packages.txt
echo

sudo apt install $INSTALL_LIST
