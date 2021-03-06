#!/bin/bash

# Home directory
mkdir -p ~/pics
mkdir -p ~/pics/screenshots

# install & update submodules
git submodule update --init --recursive

# avoid some headaches in the future
sudo pacman -Sy archlinux-keyring

# upgrade arch packages
yaourt -Syu --aur --devel --noconfirm

# install arch packages
for package in `comm -23 <(cat packages.txt | sort) <(yaourt -Qqe | sort)`; do
     echo "Installing $package..."
     yaourt -S $package --noconfirm
done
 
# links
link() {
    ln -s --backup ~/repos/arch-config/$1 ${2:-~}  # default value magic
}

link .xinitrc
link .i3
link .vimrc
link .zshrc
link terminator ~/.config/terminator
link luakit ~/.config/
link .zpreztorc
link .Xresources
link .tmux.conf
link conky.conf ~/.config/conky/conky.conf
link ./urxvt-config-reload/config-reload/* ~/.urxvt/ext/
link ./taskwarrior.timer /etc/systemd/system/taskwarrior.timer

# set up vim packages
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
vim +PluginUpdate +qall

# set up python packages
sudo pip install --upgrade -r requirements.txt

# set up node packages
sudo npm install sshync -g

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


# Default applications
xdg-settings set default-web-browser google-chrome.desktop


# Set up global gitignore
git config --global core.excludesfile '~/repos/arch-config/global_gitignore'

./restart_gui.sh

# Set meld as default difftool
git config --global diff.tool meld

# Install oh my zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Update mlocate
sudo updatedb
