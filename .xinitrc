[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xbindkeys &
# Start xscreensaver
#/usr/bin/xscreensaver -no-splash &

# Lock screen when suspend
# xss-lock -- xscreensaver-command - lock &


# Remap keys
# xmodmap ~/.Xmodmap

# Configure Trackpoint speed
# source /home/kdani/repos/thinkpad_x240/trackpoint-speed.sh
# source /home/kdani/repos/thinkpad_x240/trackpad-disable.sh

# exec i3

# Keyboard settings
# reload keyboard settings: setxkbmap us intl-unicode
# custom mappings: /usr/share/X11/xkb/symbols/us
 setxkbmap custom intl-unicode -option caps:escape &
 xmodmap -e "keycode 94 = Multi_key" &

xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.3 &
xset r rate 200 60 &
#start-pulseaudio-x11 &
redshift -l 47.4159197:19.0666424 &
udiskie &
dunst &
#pulseaudio --start &
synclient TouchpadOff=1 &
xrdb ~/.Xdefault &

feh --bg-fill --magick-timeout 1 ~/.i3/wallpapers/active &

#exec gnome-session 
 exec i3
