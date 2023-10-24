#!/bin/bash
#
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/velit/config/master/run_pacman_install.sh)"

INSTALL_LIST="
screen
sharutils
source-highlight
ncurses
taskwarrior
tree
zsh
base-devel
vim
python-pytest
which
man-pages
man-db
"

sudo pacman -S --needed git python python-pip stow openssh
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

python ~/config/install_configs.py
echo

sudo pacman -S --needed $INSTALL_LIST
