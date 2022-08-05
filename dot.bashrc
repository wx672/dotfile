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

vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

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
export BAT_STYLE="plain"
export LESSCHARSET=utf-8
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

tabs -4 &>/dev/null

#[[ -f "$HOME/.wayland" ]] && . "$HOME/.wayland"

# Use colors for less, man, etc.
[[ -f "$HOME/.LESS_TERMCAP" ]] && tty -s && . $HOME/.LESS_TERMCAP

# man gpg-agent
GPG_TTY=$(tty)
export GPG_TTY
export GPGKEY=0EE277C8D838C7DA

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -x "/usr/bin/zoxide" ] && eval "$(zoxide init bash)"
[ -x "$HOME/.cargo/bin/starship" ] && eval "$(starship init bash)"

export SKIM_DEFAULT_COMMAND="fd -d1 || rg --files --max-depth 1 || find . -maxdepth 1"
