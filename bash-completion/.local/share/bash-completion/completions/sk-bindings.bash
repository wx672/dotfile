#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_
#  / __/ / /_/ __/
# /_/   /___/_/ key-bindings.bash
#
# - $SKIM_TMUX_OPTS
# - $SKIM_CTRL_T_COMMAND
# - $SKIM_CTRL_T_OPTS
# - $SKIM_CTRL_R_OPTS
# - $SKIM_ALT_C_COMMAND
# - $SKIM_ALT_C_OPTS

# Key bindings
# ------------
# copied and modified from https://github.com/junegunn/fzf/blob/master/shell/key-bindings.bash
__skim_select__() {
  local cmd="${SKIM_CTRL_T_COMMAND:-"fd . -H"}"
  eval "$cmd" | SKIM_DEFAULT_OPTIONS="--height ${SKIM_TMUX_HEIGHT:-90%} --reverse $SKIM_DEFAULT_OPTIONS $SKIM_CTRL_T_OPTS" $(__skimcmd) -m "$@" | while read -r item; do
    printf '%q ' "$item"
  done
  echo
}

if [[ $- =~ i ]]; then

__skimcmd() {
    echo "sk -e"
}

skim-file-widget() {
  local selected="$(__skim_select__)"
  READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
  READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}

__skim_cd__() {
  local cmd dir
  cmd="${SKIM_ALT_C_COMMAND:-"fd . -H --type d"}"
  dir=$(eval "$cmd" | SKIM_DEFAULT_OPTIONS="--height ${SKIM_TMUX_HEIGHT:-90%} --reverse $SKIM_DEFAULT_OPTIONS $SKIM_ALT_C_OPTS" $(__skimcmd) --no-multi) && printf 'cd %q' "$dir"
}

__skim_history__() {
  local output
  output=$(
    builtin fc -lnr -2147483648 |
      last_hist=$(HISTTIMEFORMAT='' builtin history 1) perl -n -l0 -e 'BEGIN { getc; $/ = "\n\t"; $HISTCMD = $ENV{last_hist} + 1 } s/^[ *]//; print $HISTCMD - $. . "\t$_" if !$seen{$_}++' |
      SKIM_DEFAULT_OPTIONS="--height ${SKIM_TMUX_HEIGHT:-90%} $SKIM_DEFAULT_OPTIONS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $SKIM_CTRL_R_OPTS --no-multi --read0" $(__skimcmd) --query "$READLINE_LINE"
  ) || return
  READLINE_LINE=${output#*$'\t'}
  if [ -z "$READLINE_POINT" ]; then
    echo "$READLINE_LINE"
  else
    READLINE_POINT=0x7fffffff
  fi
}

# Required to refresh the prompt after skim
bind -m emacs-standard '"\er": redraw-current-line'

bind -m vi-command '"\C-z": emacs-editing-mode'
bind -m vi-insert '"\C-z": emacs-editing-mode'
bind -m emacs-standard '"\C-z": vi-editing-mode'

# CTRL-T - Paste the selected file path into the command line
bind -m emacs-standard -x '"\C-t": skim-file-widget'
bind -m vi-command -x '"\C-t": skim-file-widget'
bind -m vi-insert -x '"\C-t": skim-file-widget'

# CTRL-R - Paste the selected command from history into the command line
bind -m emacs-standard -x '"\C-r": __skim_history__'
bind -m vi-command -x '"\C-r": __skim_history__'
bind -m vi-insert -x '"\C-r": __skim_history__'

# ALT-C - cd into the selected directory
bind -m emacs-standard '"\ec": " \C-b\C-k \C-u`__skim_cd__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
bind -m vi-command '"\ec": "\C-z\ec\C-z"'
bind -m vi-insert '"\ec": "\C-z\ec\C-z"'

fi
