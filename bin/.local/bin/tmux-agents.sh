#!/bin/bash

set -euC

#tmux a || tmux

tmux set -w remain-on-exit on

tmux split-window -bl35% "clash.sh fy"
tmux split-window -hl45% 'clash.sh'

tmux select-pane -t{bottom}
#tmux send-keys -t{bottom} 'while ! systemctl --user start offlineimap-oneshot; do echo try again...; done' C-m
