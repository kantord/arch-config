#!/bin/bash

# install & update submodules
git submodule update --init --recursive

# upgrade arch packages
yaourt -Syu --aur --devel

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
vim +PluginUpdate +qall

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

# Power settings
gsettings set org.gnome.settings-daemon.plugins.power power-button-action suspend
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 3600
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type suspend
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 1800
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type suspend
gsettings set org.gnome.desktop.lockdown disable-lock-screen true

./restart_gui.sh
