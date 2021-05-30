#!/bin/bash
SESSION="REMOTES"

tmux new-session -d -s $SESSION \; \
     split-window -h \; \
     select-pane -t 0 \; send-keys "mosh cs2" C-m \; \
     select-pane -t 1 \; send-keys "mosh cs3" C-m \; \
     split-window -v \; send-keys "mosh cs6wan" C-m \;
#     select-pane -t 0 \; \
#     split-window -v \; send-keys "mosh pub" C-m \;

tmux -2 attach-session -t $SESSION
