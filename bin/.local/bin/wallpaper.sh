#!/bin/bash

#"$HOME/Pics/2009Summer/wallpapers/2009summer-1280x768"
IMGDIR="$HOME/.local/share/wallpapers/2k"

files=($IMGDIR/*.webp)

# get the length of array ${files[@]}
n=${#files[@]}

# get a random array element
wallpaper="${files[RANDOM % n]}"

# set it as wallpaper
#qiv -z $wallpaper
hsetroot -cover $wallpaper
