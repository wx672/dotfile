#!/bin/bash

# shellcheck source=/dev/null

umask 022

PATH="/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/sbin:/usr/sbin:/sbin"

[ -d "$HOME/src/doom/bin" ] && PATH="$HOME/src/doom/bin:$PATH"
[ -d "/usr/lib/cargo/bin/coreutils" ] && PATH="/usr/lib/cargo/bin/coreutils/:$PATH"
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

export PATH="/usr/local/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"

[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# make sure libpam-systemd is installed, otherwise XDG_VTNR will be NULL.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- vt1 -keeptty
#[[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec fbterm
#[[ -z $DISPLAY && "$(tty)" = "/dev/tty1" ]] && exec sway
