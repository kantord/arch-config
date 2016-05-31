yaourt -S compton rofi zsh ttf-font-icons ttf-font-awesome ttf-ms-fonts ttf-vista-fonts ttf-mplus gvim nautilus feh git-cola
cp .xinitrc ~
cp -r .i3 ~
cd i3
make install
cd -
ln -s ~/repos/arch-config/.vimrc ~
