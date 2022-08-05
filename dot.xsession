#!/bin/sh

# /usr/share/doc/xfree86-common/examples/xsession

xhost +

#/usr/bin/xmodmap .Xmodmap
setxkbmap -option ctrl:nocaps

# seems /etc/X11/xinit/xinput.d/fcitx is not sourced as expected. so have to do it here.
export XIM=fcitx5
export XIM_PROGRAM=/usr/bin/fcitx5
export XIM_ARGS=""
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# This messes up with fcitx5
# https://fcitx-im.org/wiki/Configure_(Other)
#export $(dbus-launch --sh-syntax --exit-with-x11)

# use 'xdg-settings set default-web-browser' instead
# see ~/.config/mimeapps.list
#export BROWSER='x-www-browser'

# Let Qt apps use GTK theme to make GUI font size larger.
export QT_QPA_PLATFORMTHEME=gtk3
# require qt5ct installed
#export QT_QPA_PLATFORMTHEME=qt5ct

# stop warning messages
export NO_AT_BRIDGE=1 

# see ~/.config/systemd/user/emacs.service
[ -x /usr/bin/udiskie ] && /usr/bin/udiskie -F &
#[ -x /usr/bin/redshift ] && /usr/bin/redshift &
[ -x /usr/lib/notification-daemon/notification-daemon ] && /usr/lib/notification-daemon/notification-daemon &
# -x /usr/bin/picom ] && /usr/bin/picom -b
# -x /usr/bin/hsetroot ] && /usr/bin/hsetroot -solid '#000000'

fcitx5 -d --replace
# fcitx5 first
sleep 1
/usr/bin/x-terminal-emulator -e tmux &

[ -x /usr/bin/keynav ] && keynav &
[ -x /usr/bin/xbanish ] && xbanish &

# keep screen on
xset s off -dpms

exec /usr/bin/x-window-manager
