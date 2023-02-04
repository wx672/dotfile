#!/bin/bash

[ -f ~/.bin/ttyrec-utils ] && . ~/.bin/ttyrec-utils

clear; ttyplayhelp; tput setaf 7

cat <<EOF | PV
Hi, today I am going to show you how to use your USB thumb drive on the command line.
1) Plug your USB drive into the PC.
2) Type command 'lsblk -f' to see if it's recognized by the system.
EOF
prompt; tput setaf 3
echo -n "lsblk -f" | PV; tput setaf 7; waiting
echo "At the end of the output, you should see a very long line similar to the following..." | PV
tput setaf 3
echo -en "\tsdb\tvfat\tFC6B-6235\t5.1G\t32% /media/stud/FC6B-6235"; tput setaf 7; waiting

cat <<EOF | PV
This line tells you that your USB drive (/dev/sdb) is mounted at "/media/stud/FC6B-6235".
And it's ready to use. Now you can access your USB drive in the same way as you access any other directories. How? Let me show you some examples...

1) To see what's in the USB drive...
EOF
prompt; tput setaf 3
echo "ls /media/stud/FC6B-6235" | PV; tput setaf 7; waiting

echo "2) Copy files from the current directory to the USB drive..." | PV
prompt; tput setaf 3
echo "cp hello.py /media/stud/FC6B-6235" | PV; tput setaf 7; waiting

echo "3) Copy a directory from the USB drive to your current directory..." | PV
prompt; tput setaf 3
echo "cp -a /media/stud/FC6B-6235/homework ." | PV; tput setaf 7; waiting

cat <<EOF | PV
Easy, eh?
After you finish using the USB drive, you should type command 'sync' before you pull it out.
EOF
prompt; tput setaf 3
echo "sync" | PV; tput setaf 7; waiting
echo "Now you can pull it out." | PV
# echo "The 'mount' command lists all the available file systems currently mounted in your system." | PV
# echo "Well, what's a file system?"
# echo "Simply put, it's just the directory tree. Like this one"
# echo
# echo "/homework/       "
# echo " ├── c/	         "
# echo " │   └── hello.c "
# echo " └── python/     "
# echo "     ├── a.py    "
# echo "     ├── b.py    "
# echo "     ├── c.py    "
# echo "     └── hello.py"
# echo
# echo "In the above example, there is a directory called 'homework'."
# echo "Inside 'homework' there're two sub-directories, called 'c' and 'python'."
# echo "Inside 'c' and 'python', there're some normal files."
###################################
# echo "Let's take a closer look..." | PV
havefun2 2>/dev/null
