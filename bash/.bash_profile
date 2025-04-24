#!/bin/bash

# Set umask for secure file permissions
umask 022

# Initialize PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/sbin:/usr/sbin:/sbin"

dirs=(
  "/usr/lib/cargo/bin/coreutils"
  "$HOME/.cargo/bin"
  "$HOME/.local/bin"
  "$HOME/bin"
)
for dir in ${dirs[@]}; do
  [[ -d "$dir" ]] && export PATH="$dir:$PATH"
done

# XDG directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_DIRS="${XDG_DATA_HOME:-$HOME/.local/share}:/usr/local/share:/usr/share"

# Start graphical session unless on ssh
if [[ -z "$SSH_TTY" ]]; then
  # NOTE: libpam-systemd is required for XDG_VTNR
  if [[ -z "$DISPLAY" && -n "$XDG_VTNR" && "$XDG_VTNR" -eq 1 ]] && command -v startx; then
    exec startx -- vt1 -keeptty
  fi

  # Start sway on tty3 (if used)
  if [[ -z "$DISPLAY" && "$(tty)" == "/dev/tty3" ]] && command -v sway; then
      exec sway
  fi
fi

# Source .bashrc for interactive settings
[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

# GPG for SSH (info gpg-agent)
GPG_TTY=$(tty); export GPG_TTY

if [[ -n "$GPG_TTY" ]]; then
  SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  export SSH_AUTH_SOCK
fi

