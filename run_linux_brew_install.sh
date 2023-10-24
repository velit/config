#!/bin/bash

# To install (homebrew required)
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/velit/config/master/run_mac_install.sh)"

INSTALL_LIST="
taskwarrior
source-highlight
tree
vim
"

brew install git python3 stow

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

~/config/install_configs.py
python3 -m pip install --user -r ~/config/python_packages.txt
brew install $INSTALL_LIST
