#!/bin/sh

# sh <(curl -s https://raw.githubusercontent.com/velit/config/master/install_bare.sh)

# Install config files without setting up bin/links folders, without symlinks
# or leaving a modifiable git repository behind
wget -q -O master.zip https://github.com/velit/config/archive/master.zip
unzip -qo master.zip
cp -i config-master/dotfiles/.[!.]* ~
cp -ri config-master/vim/.vim/ ~
rm -rf config-master master.zip
