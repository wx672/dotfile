#!/bin/sh

# /usr/share/doc/xfree86-common/examples/xsession
# seems /etc/X11/xinit/xinput.d/fcitx is not sourced as expected. so have to do it here.

# fcitx crashes, so try ibus instead
export XIM=fcitx
export XIM_PROGRAM=/usr/bin/fcitx
export XIM_ARGS=""
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xhost +
#/usr/bin/xmodmap .Xmodmap
setxkbmap -option ctrl:nocaps

export $(dbus-launch)

# use 'xdg-settings set default-web-browser' instead
# see ~/.config/mimeapps.list
#export BROWSER='x-www-browser'

# Let Qt apps use GTK theme to make GUI font size larger.
export QT_QPA_PLATFORMTHEME=gtk3

# stop warning messages
export NO_AT_BRIDGE=1 

# see ~/.config/systemd/user/emacs.service
#[ -x /usr/bin/emacs ] && /usr/bin/emacs --daemon &
[ -x /usr/bin/udiskie ] && /usr/bin/udiskie -F &
[ -x /usr/bin/redshift ] && /usr/bin/redshift &
[ -x /usr/lib/notification-daemon/notification-daemon ] && /usr/lib/notification-daemon/notification-daemon &
#[ -x /usr/bin/compton ] && /usr/bin/compton -b
#[ -x /usr/bin/hsetroot ] && /usr/bin/hsetroot -solid '#000000'
#[ -x /usr/local/bin/xterm ] && /usr/local/bin/xterm -e tmux &
[ -x /usr/local/bin/wal ] && wal -R
[ -x /usr/bin/keynav ] && keynav
exec /etc/alternatives/x-window-manager
