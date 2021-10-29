#!/bin/bash

set -euC

cd

tmux split-window -v

tmux select-pane -t 0
tmux resize-pane -U 30

tmux send-keys "ssr jp-177" C-m

tmux split-window -h

tmux select-pane -t 1
tmux send-keys "cd ~/.config/clash/yml" C-m "clash" C-m

tmux select-pane -t 2
tmux send-keys "cd ~/.config/clash/yml" C-m C-l

# Local Variables:
# Ref: https://www.arp242.net/tmux.html
# End:
