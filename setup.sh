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

# rebuild YCM
cd ~/.vim/bundle/YouCompleteMe/
python2 install.py
cd -

# custom keyboard layout
sudo cp ~/repos/arch-config/keyboard/custom /usr/share/X11/xkb/symbols/

# update user workflowrc
link .workflowrc

# enable sound
systemctl --user enable pulseaudio.socket 
systemctl --user start pulseaudio.socket 

# De-uglifying i3
gsettings set org.gnome.desktop.interface gtk-theme Zukitre
gsettings set org.gnome.desktop.interface icon-theme Paper

./restart_gui.sh
