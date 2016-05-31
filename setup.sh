#!/bin/bash

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
