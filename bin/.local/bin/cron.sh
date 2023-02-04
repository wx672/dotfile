#!/bin/bash

# for simplify crontab@cs6

DOTFILE="$HOME/public_html/dotfile"
LECTURES="$HOME/public_html/lecture_notes"
TEXMF="$HOME/public_html/texmf"

for DIR in $DOTFILE $LECTURES $TEXMF; do
	cd $DIR && {
		git co -f
		git update-server-info
	}
done
unset DIR LECTURES DOTFILE TEXMF

YML="$HOME/public_html/debian-install/misc/yml"

cd $YML && LATEST="$(/bin/ls -t *yml | head -1)"

cd $YML && ln -sf $LATEST config.yaml

unset YML LATEST
