#!/bin/bash

# This script is to copy dot files from ~wx672
# It is invoked by /etc/skel/.bash_profile while adding a new user

cp -Lfr ~wx672/{.bashrc,.bash_profile,.bash_aliases,.cmd.tpp,.emacs.d,.gitconfig,.gitignore,.HELP*,.latexmkrc,.lessfilter,.LESS_TERMCAP,.lscolors,.lynxrc,.nanorc,.nano.ttyrec,.terminfo,.tmux*,.usb.ttyrec,.vim,.vimrc} ~/

