#!/bin/bash

set -euC

CONF="~/.config/clash"
cd

tmux set -w remain-on-exit on

tmux split-window -h
tmux split-window -vfl99

tmux send-keys -t{top-left}  "clash -f $CONF/fy-55549.yaml" C-m
tmux send-keys -t{top-right} "cd $CONF/yml" C-m "clash" C-m
tmux send-keys -t{bottom}    "cd $CONF/yml" C-m C-l
