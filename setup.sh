#!/bin/bash

# install & update submodules
git submodule update --init --recursive

# install uninstalled arch packages
for package in `comm -23 <(cat packages.txt | sort) <(yaourt -Qqe | sort)`; do
    echo "Installing $package..."
    yaourt -S $package
done

# links
link() {
    ln -s --backup ~/repos/arch-config/$1 ${2:-~}  # default value magic
}

link .xinitrc
link .i3
link .vimrc
link terminator ~/.config/terminator

# set up vim packages
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# set up python packages
sudo pip install --upgrade -r requirements.txt

# custom keyboard layout
sudo cp ~/repos/arch-config/keyboard/custom /usr/share/X11/xkb/symbols/

# update user workflowrc
ln -s ~/repos/arch-config/.workflowrc ~

# enable sound
systemctl --user enable pulseaudio.socket 
systemctl --user start pulseaudio.socket 

# restart i3
i3-msg restart
