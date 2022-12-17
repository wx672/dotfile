#!/bin/bash

set -euC

tmux set -w remain-on-exit on

tmux split-window -bl75% "clash.sh fy"
tmux split-window -hl75% 'clash.sh'

tmux send-keys -t{bottom} 'while ! systemctl --user start offlineimap-oneshot; do echo try again...; done' C-m
