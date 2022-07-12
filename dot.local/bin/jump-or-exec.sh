#!/bin/bash

# sawfish has jump-or-exec function, stumpwm has run-or-raise. This script provides such a function for dwm, sway, or any other WMs.
#
# This script is supposed to be invoked via shortcut keys configured in wm init files.
#
# $1 should be one of emacs, qute, alacritty

wid=$(wmctrl -l | rg -i $* | cut -b 1-10)

if [ -z $wid ]; then
	[[ $1 == *emacs* ]] && { emacsclient -c -n -a "" "$@"; exit 0; }	
	[[ $1 == *qute* ]] && { qutebrowser; exit 0; }
	[[ $1 == *alac* ]] && { alacritty; exit 0; }
else
	wmctrl -ia $wid
fi
