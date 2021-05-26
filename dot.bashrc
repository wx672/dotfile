#!/bin/bash

# shellcheck source=/dev/null

[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
[ -f $HOME/.bash_aliases ] && . $HOME/.bash_aliases
#[ -f $HOME/.bin/bashmarks.sh ] && . $HOME/.bin/bashmarks.sh
#[ -f $HOME/.bin/git-prompt.sh ] && . $HOME/.bin/git-prompt.sh
test -f $HOME/.bin/utils && . $HOME/.bin/utils

eval "$(lesspipe)"

## add git info
#PS1='${debian_chroot:+($debian_chroot)}\[\e[0;36m\]\w$(__git_ps1 "(%s)")\$\[\e[0m\] '

#[ -f $HOME/.lscolors ] && eval "$(tty -s && dircolors $HOME/.lscolors)" || eval "$(dircolors)"

export PROMPT_DIRTRIM=1
export HISTIGNORE="&:[ ]*:exit"
export HISTFILESIZE=2000
export HISTSIZE=2000
export BROWSER='/usr/bin/x-www-browser'
export PDFVIEWER='mupdf'
export EDITOR='vim'
export ALTERNATE_EDITOR="vim"
export PAGER='bat'
export BAT_PAGER='bat'
export BAT_STYLE="plain"
export LESSCHARSET=utf-8
#export IGNOREEOF=2
#export TESSDATA_PREFIX='/usr/local/share/tesseract-ocr/4.00'
tabs -4 &>/dev/null

# Use colors for less, man, etc.
[[ -f "$HOME/.LESS_TERMCAP" ]] && tty -s && . $HOME/.LESS_TERMCAP

export GPGKEY=0EE277C8D838C7DA

[ -x "/usr/bin/zoxide" ] && eval "$(zoxide init bash)"
[ -x "$HOME/.cargo/bin/starship" ] && eval "$(starship init bash)"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
#[ -f "$HOME/.config/broot/launcher/bash/br" ] && source "$HOME/.config/broot/launcher/bash/br"

export SKIM_DEFAULT_COMMAND="fd --type f || rg --files || find ."
