#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bin/bashmarks.sh ] && . ~/.bin/bashmarks.sh
[ -f ~/.bin/bash_completion_tmux.sh ] && . ~/.bin/bash_completion_tmux.sh
[ -f ~/.bin/git-prompt.sh ] && . ~/.bin/git-prompt.sh
test -f ~/.bin/utils && . ~/.bin/utils

eval "$(lesspipe)"

## add git info
PS1='${debian_chroot:+($debian_chroot)}\[\e[0;36m\]\w$(__git_ps1 "(%s)")\$\[\e[0m\] '

[ -f ~/.lscolors ] && eval "$(tty -s && dircolors ~/.lscolors)" || eval "$(dircolors)"

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
[[ -f ~/.LESS_TERMCAP ]] && tty -s && . ~/.LESS_TERMCAP

export GPGKEY=0EE277C8D838C7DA

export SKIM_DEFAULT_COMMAND="fd --type f || rg --files || find ."
