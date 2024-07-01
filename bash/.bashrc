#!/bin/bash

# shellcheck source=/dev/null

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ "$TMUX" ]] || { tmux a || tmux; }

#[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc
[ -f $HOME/.bash_aliases ] && . $HOME/.bash_aliases
[ -f $HOME/.local/bin/utils ] && . $HOME/.local/bin/utils

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

# should be automatically done. See the FAQ in:
# /usr/share/doc/bash-completion/README.md.gz
# but it's not :(
compdir="$XDG_DATA_HOME/bash-completion/completions"
if [ -d "$compdir" ]; then
	for f in "$compdir"/*; do
		. "$f"
	done
	unset f compdir
fi

eval "$(lesspipe)"

export PROMPT_DIRTRIM=1
shopt  -s histappend
unset  HISTFILESIZE
export HISTIGNORE="&:exit:ls *:history:z *:q *:touch *:type *:command *"
export HISTSIZE=90000
export HISTCONTROL=erasedups:ignorespace
export LESSHISTFILE=-
export BROWSER='x-www-browser'
export PDFVIEWER='mupdf -C FDF6E3'
export EDITOR='vi'
export VISUAL='vi'
export ALTERNATE_EDITOR="vim"
export PAGER="batcat"
export BAT_STYLE="plain"
export BAT_THEME="Catppuccin-Mocha"
export LESSCHARSET=utf-8
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
#export MPD_HOST="cs6.swfu.edu.cn"
export W3M_DIR="$XDG_CONFIG_HOME/w3m"
# export CHEAT_USE_SKIM=true

tabs -2 &>/dev/null

# Use colors for less, man, etc.
# [[ -f "$HOME/.LESS_TERMCAP" ]] && tty -s && . $HOME/.LESS_TERMCAP

# info gpg-agent
GPG_TTY=$(tty)
export GPG_TTY
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

[ -f "$HOME/.cargo/env" ] && . $HOME/.cargo/env

# command -v fzf &>/dev/null && { 
# 	eval "$(fzf --bash)"
# 	export  FZF_DEFAULT_COMMAND='fd . --hidden --exclude ".git"'
# }

command -v starship &>/dev/null && { 
	eval "$(starship init bash)"
	export PROMPT_COMMAND="history -a; starship_precmd"
}

command -v vivid &>/dev/null && export LS_COLORS="$(vivid generate catppuccin-macchiato)"
command -v zoxide &>/dev/null && eval "$(zoxide init bash)"
command -v sk &>/dev/null && export SKIM_DEFAULT_COMMAND='fd . --hidden --exclude ".git"'

stty -ixon # disable Ctrl-s
