#!/bin/bash

# Exit if non-interactive
[[ $- != *i* ]] && return

# TMUX
if [[ -z "$TMUX" ]] && command -v tmux; then
  if tmux has-session; then
      tmux attach-session
  else
      tmux new-session
  fi
fi

# Source aliases
[[ -f "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases"
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Bash completion
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
		# shellcheck disable=SC1090
    . /usr/share/bash-completion/completions/*
fi

eval "$(lesspipe)"
shopt -s histappend cmdhist

# Environment variables
export PROMPT_DIRTRIM=1
unset HISTFILESIZE
export HISTIGNORE="&:exit:history:q *"
export HISTSIZE=90000
export HISTCONTROL=erasedups:ignorespace
export HISTTIMEFORMAT='%F %T '
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
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:/usr/local/go/bin:$HOME/.local/bin:$PATH"

export LESS='-R --use-color'
[[ -f "$HOME/.LESS_TERMCAP" ]] && . "$HOME/.LESS_TERMCAP"

# Tool initializations
command -v vivid &>/dev/null && LS_COLORS="$(vivid generate catppuccin-macchiato)"
export LS_COLORS
command -v starship &>/dev/null && eval "$(starship init bash)"
command -v zoxide &>/dev/null && eval "$(zoxide init bash)"
command -v fzf &>/dev/null && {
    eval "$(fzf --bash)"
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_DEFAULT_OPTS='--height 90% --exact'
}
command -v sk &>/dev/null && { 
  [[ -f "/usr/share/bash-completion/completions/sk-bindings" ]] && {
      . /usr/share/bash-completion/completions/sk-bindings; }

	export SKIM_DEFAULT_COMMAND='fd . --type f --hidden --exclude ".git"'
	export SKIM_TMUX_HEIGHT='90%'
	export SKIM_DEFAULT_OPTIONS='--exact --no-multi --select-1 --exit-0'
}
stty -ixon # disable Ctrl-s/Ctrl-q
