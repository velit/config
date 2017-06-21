#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/velit/config/master/install_bare.sh) && source ~/.bashrc

# Install config files without setting up bin/links folders, without symlinks
# or leaving a modifiable git repository behind

wget -q -O master.zip https://github.com/velit/config/archive/master.zip
unzip -qo master.zip

echo "Overwrite existing files?"
select yn in "Yes" "No" "Ask"; do
    case $yn in
        Yes)
            cp -f config-master/dotfiles/.[!.]* ~
            cp -rf config-master/vim/.vim/ ~
            break;;
        No)
            cp -n config-master/dotfiles/.[!.]* ~
            cp -rn config-master/vim/.vim/ ~
            break;;
        Ask)
            cp -i config-master/dotfiles/.[!.]* ~
            cp -ri config-master/vim/.vim/ ~
            break;;
    esac
done

# Install .bash_alias support if it doesn't already exist
if [ ! -e ~/.bashrc ] || ! grep -q ".bash_aliases" ~/.bashrc ; then
    echo '
[ -z "$PS1" ] && return
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
' >> ~/.bashrc
fi

rm -rf config-master master.zip
