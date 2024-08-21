#!/bin/bash

# /usr/share/doc/xfree86-common/examples/xsession

# See ~/.config/systemd/user/*.service

xhost +

#/usr/bin/xmodmap .Xmodmap
setxkbmap -option ctrl:nocaps

export QT_QPA_PLATFORMTHEME=qt6ct # qt6ct must be installed
export SAL_USE_VCLPLUGIN=qt6 # required by libreoffice-qt6
export NO_AT_BRIDGE=1 # stop warning messages

[ -x /usr/lib/notification-daemon/notification-daemon ] && /usr/lib/notification-daemon/notification-daemon &

# command -v hsetroot && /usr/bin/hsetroot -solid '#000000'

# trying warpd.service/keynav.service instead (failed)
command -v warpd && warpd || {
  command -v keynav && keynav &
}

# trying xbanish.service instead
# command -v xbanish && xbanish &

xset s off -dpms # keep screen on

command x-terminal-emulator &

exec /usr/bin/x-window-manager
