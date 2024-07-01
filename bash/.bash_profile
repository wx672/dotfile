#!/bin/bash

# shellcheck source=/dev/null

umask 022

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/sbin:/usr/sbin:/sbin"

[ -d "/usr/lib/cargo/bin/coreutils" ] && PATH="/usr/lib/cargo/bin/coreutils/:$PATH"
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/src/doom/bin" ] && PATH="$HOME/src/doom/bin:$PATH"

export PATH

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"

# [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

[[ "$SSH_TTY" ]] && {
  [[ "$TMUX" ]] || { tmux a || tmux; }
} || {
  # make sure libpam-systemd is installed, otherwise XDG_VTNR will be NULL.
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- vt1 -keeptty
  #[ -z $DISPLAY && "$(tty)" = "/dev/tty3" ]] && exec sway
}
