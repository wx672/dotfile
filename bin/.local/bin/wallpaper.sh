#!/bin/bash

shopt -s nullglob globstar

IMGDIR="$HOME/.local/share/wallpapers"

files=($IMGDIR/**/*.webp)

# get the length of array ${files[@]}
n=${#files[@]}

# get a random array element
wallpaper="${files[RANDOM % n]}"

# set it as wallpaper
#qiv -z $wallpaper
hsetroot -cover $wallpaper
