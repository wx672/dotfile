#!/bin/bash

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

command -v fcitx5 && fcitx5 -d --replace

# This messes up with fcitx5
# https://fcitx-im.org/wiki/Configure_(Other)
#export $(dbus-launch --sh-syntax --exit-with-x11)

# use 'xdg-settings set default-web-browser' instead
# see ~/.config/mimeapps.list
#export BROWSER='x-www-browser'

# Let Qt apps use GTK theme to make GUI font size larger.
#export QT_QPA_PLATFORMTHEME=gtk3

# require qt6ct installed
export QT_QPA_PLATFORMTHEME=qt6ct

# required by libreoffice-qt6
export SAL_USE_VCLPLUGIN=qt6

# stop warning messages
export NO_AT_BRIDGE=1 

# see ~/.config/systemd/user/emacs.service
command -v udiskie && /usr/bin/udiskie -F &
#[ -x /usr/bin/redshift ] && /usr/bin/redshift &
[ -x /usr/lib/notification-daemon/notification-daemon ] && /usr/lib/notification-daemon/notification-daemon &
# command -v picom && /usr/bin/picom -b
# command -v hsetroot && /usr/bin/hsetroot -solid '#000000'

command -v keynav && keynav &
command -v xbanish && xbanish &

# keep screen on
xset s off -dpms

# # window class is set to Xterm in alacritty.yml, or config.h for st.
# [[ "$(realpath /etc/alternatives/x-terminal-emulator)" == *alacritty* ]] \
# 	&& CLS='--class Xterm' || CLS='-c Xterm'

# /usr/bin/x-terminal-emulator $CLS -e tmux &

# have to sleep 1 otherwise xterm doesn't start. don't know why.
sleep 1
command x-terminal-emulator -e tmux &

exec /usr/bin/x-window-manager
