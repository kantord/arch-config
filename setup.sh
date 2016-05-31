#!/bin/bash

# install & update submodules
git submodule update --init --recursive

# install uninstalled arch packages
for package in `comm -23 <(cat packages.txt | sort) <(yaourt -Qqe | sort)`; do
    echo "Installing $package..."
    yaourt -S $package
done

cp .xinitrc ~
cp -r .i3 ~
ln -s ~/repos/arch-config/.vimrc ~
ln -s ~/repos/arch-config/terminator ~/.config/terminator
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
sudo pip install -r requirements.txt

# custom keyboard layout
sudo cp ~/repos/arch-config/keyboard/custom /usr/share/X11/xkb/symbols/

# update user workflowrc
ln -s ~/repos/arch-config/.workflowrc ~

# restart i3
i3-msg restart
