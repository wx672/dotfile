#!/bin/bash

# shellcheck source=/dev/null

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
[ -f $HOME/.bash_aliases ] && . $HOME/.bash_aliases
[ -f $HOME/.local/bin/utils ] && . $HOME/.local/bin/utils

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

compdir="$HOME/.local/share/bash-completion/completions"
if [ -d "$compdir" ]; then
	for f in "$compdir"/*; do
		. "$f"
	done
	unset f compdir
fi
	
eval "$(lesspipe)"

export PROMPT_DIRTRIM=1
export HISTIGNORE="&:[ ]*:exit"
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTCONTROL=ignoreboth
export LESSHISTFILE=-
export BROWSER='/usr/bin/x-www-browser'
export PDFVIEWER='mupdf'
export EDITOR='vim'
export ALTERNATE_EDITOR="vim"
export PAGER='bat'
export BAT_PAGER='bat'
export BAT_STYLE="plain"
export LESSCHARSET=utf-8
tabs -4 &>/dev/null

# Use colors for less, man, etc.
[[ -f "$HOME/.LESS_TERMCAP" ]] && tty -s && . $HOME/.LESS_TERMCAP

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -x "/usr/bin/zoxide" ] && eval "$(zoxide init bash)"
[ -x "$HOME/.cargo/bin/starship" ] && eval "$(starship init bash)"

export SKIM_DEFAULT_COMMAND="fd --type f || rg --files || find ."
