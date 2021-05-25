#!/bin/bash

# shellcheck source=/dev/null

umask 022

[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

[ -d "$HOME/bin" ] && PATH="$HOME/bin:${PATH}"
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:${PATH}"
[ -d "$HOME/.bin" ] && PATH="$HOME/.bin:${PATH}"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:${PATH}"

export PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
export XDG_CONFIG_HOME="$HOME/.config"

# make sure libpam-systemd is installed, otherwise XDG_VTNR will be NULL.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- vt1 -keeptty
