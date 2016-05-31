yaourt -S compton rofi zsh ttf-font-icons ttf-font-awesome ttf-ms-fonts ttf-vista-fonts ttf-mplus gvim nautilus feh git-cola tig terminator python-pip
cp .xinitrc ~
cp -r .i3 ~
ln -s ~/repos/arch-config/.vimrc ~
ln -s ~/repos/arch-config/terminator ~/.config/terminator
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
