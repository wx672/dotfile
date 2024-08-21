#!/bin/bash

# for simplify crontab@cs6

PUB="$HOME/public_html"

for D in $PUB/{dotfile,lecture_notes,texmf}; do
  cd $D && {
    git co -f
    git update-server-info
  }
done

# doesn't work?
# YML="$HOME/yml"
# ln -sf $(/bin/ls -t1 $YML/*yml | head -1) $YML/config.yaml
