#!/bin/bash

set -euC

CONF="~/.config/clash"
cd

tmux split-window -v

tmux select-pane -t 0
tmux resize-pane -U 30

tmux send-keys "clash -f $CONF/fy-55549.yaml" C-m

tmux split-window -h

tmux select-pane -t 1
tmux send-keys "cd $CONF/yml" C-m "clash" C-m

tmux select-pane -t 2
tmux send-keys "cd $CONF/yml" C-m C-l
