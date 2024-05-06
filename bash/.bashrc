#!/bin/bash

# shellcheck source=/dev/null

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc
[ -f $HOME/.bash_aliases ] && . $HOME/.bash_aliases
[ -f $HOME/.local/bin/utils ] && . $HOME/.local/bin/utils
#[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && . /usr/share/doc/fzf/examples/key-bindings.bash

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
export HISTIGNORE="&:[ ]*:exit"
export HISTFILESIZE=10000
export HISTSIZE=10000
#export HISTCONTROL=ignoreboth
export HISTCONTROL=ignoredups:erasedups
export LESSHISTFILE=-
export BROWSER='/usr/bin/x-www-browser'
export PDFVIEWER='mupdf'
export EDITOR='vi'
export ALTERNATE_EDITOR="vi"
export BAT_STYLE="plain"
export LESSCHARSET=utf-8
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
#export MPD_HOST="cs6.swfu.edu.cn"
export W3M_DIR="$XDG_CONFIG_HOME/w3m"
#export CHEAT_USE_FZF=true

tabs -4 &>/dev/null

# Use colors for less, man, etc.
[[ -f "$HOME/.LESS_TERMCAP" ]] && tty -s && . $HOME/.LESS_TERMCAP

# info gpg-agent
GPG_TTY=$(tty)
export GPG_TTY
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

[ -f "$HOME/.cargo/env" ] && . $HOME/.cargo/env

command -v zoxide &>/dev/null && eval "$(zoxide init bash)"
command -v starship &>/dev/null && eval "$(starship init bash)"
command -v vivid &>/dev/null && export LS_COLORS="$(vivid generate dracula)"

export SKIM_DEFAULT_COMMAND="fd -d1 || rg --hidden --files --max-depth 1 || find . -maxdepth 1"
