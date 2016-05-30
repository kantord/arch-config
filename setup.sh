yaourt -S compton rofi zsh prezto-git ttf-font-icons ttf-font-awesome ttf-ms-fonts ttf-vista-fonts ttf-mplus gvim nautilus
cp .xinitrc ~
cp -r .i3 ~
cd i3
make install
cd -
ln -s ~/repos/arch-config/.vimrc ~
