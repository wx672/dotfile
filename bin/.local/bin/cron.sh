#!/bin/bash

# for simplify crontab@cs6

PUB="$HOME/public_html"

for D in $PUB/{dotfile,lecture_notes,texmf}; do
  cd $D && {
    git co -f
    git update-server-info
  }
done

cd "$PUB/debian-install/misc/yml" && {
  ln -sf "$(/bin/ls -t *yml | head -1)" config.yaml
}
