yaourt -S compton xcb-util-xrm libxcb-xrm-dev libxcb-xrm
cp .xinitrc ~
cp -r .i3 ~
cd i3
make install
cd -
