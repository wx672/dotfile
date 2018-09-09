#!/bin/sh

# /usr/share/doc/xfree86-common/examples/xsession
# see /etc/x11/xinit/xinput.d/fcitx

xhost +
#/usr/bin/xmodmap .Xmodmap
setxkbmap -option ctrl:nocaps

export $(dbus-launch)
export BROWSER='x-www-browser'

# stop warning messages
export NO_AT_BRIDGE=1 

[ -x /usr/bin/xterm ] && /usr/bin/xterm -e tmux &
[ -x /usr/bin/emacs ] && /usr/bin/emacs --daemon &
[ -x /usr/bin/unclutter ] && /usr/bin/unclutter &
[ -x /usr/bin/udiskie ] && /usr/bin/udiskie -F &
#[ -x /usr/bin/chromium ] && /usr/bin/chromium --no-startup-window &
[ -x /usr/bin/redshift ] && /usr/bin/redshift &
[ -x /usr/lib/notification-daemon/notification-daemon ] && /usr/lib/notification-daemon/notification-daemon &
#[ -x /usr/bin/compton ] && /usr/bin/compton -b
[ -x /usr/bin/hsetroot ] && /usr/bin/hsetroot -solid '#000000'

exec /etc/alternatives/x-window-manager
