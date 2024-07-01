#!/bin/bash

pidof -q mihomo && exit

set -euC

tmux set -w remain-on-exit on

tmux split-window -bl25% 'clash.sh fy'
tmux split-window -hl50% 'clash.sh'

tmux select-pane -t{bottom}
#tmux send-keys -t{bottom} 'while ! systemctl --user start offlineimap-oneshot; do echo try again...; done' C-m
