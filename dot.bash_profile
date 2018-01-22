#!/bin/bash

# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

umask 022

[ -f ~/.bashrc ] && source ~/.bashrc

[ -d ~/bin ] && PATH="~/bin:${PATH}"
[ -d ~/.bin ] && PATH="~/.bin:${PATH}"
[ -d ~/.local/bin ] && PATH="~/.local/bin:${PATH}"

export PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"

# make sure libpam-systemd is installed, otherwise XDG_VTNR will be NULL.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- vt1 -keeptty


#source ~/.xsh
