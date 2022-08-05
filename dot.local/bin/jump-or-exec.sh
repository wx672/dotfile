#!/bin/bash

# sawfish has jump-or-exec function, stumpwm has run-or-raise. This script provides such a function for dwm, sway, or any other WMs.
#
# This script is supposed to be invoked via shortcut keys configured in wm init files.
#
# $1 should be one of emacs, qute, alacritty

wid=$(wmctrl -l | rg -i $* | cut -b 1-10)

if [ -z $wid ]; then
	case "$1" in
		*emacs*)
			emacsclient -c -n -a "" ; exit 0;
			;;
		*qute*)
			exec qutebrowser
			;;
		*alacritty*)
			exec alacritty
			;;
		*) exit 1;
	esac
else
	wmctrl -ia $wid
fi
