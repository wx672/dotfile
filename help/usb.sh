#!/bin/bash
[ -f ~/bin/funcs ] && . ~/bin/funcs
clear
ttyplayhelp
echo
echo "Hi, today I am going to show you how to use your USB thumb drive on the command line." | PV
echo "First, of course, you should plug your USB drive into the PC." | PV
echo "Then, you can type command 'mount' to see if it's recognized by the system." | PV
tput setaf 3
echo -en "\tmount" | PV; tput setaf 7;waiting
echo "At the end of the output, you should see a very long line similar to the following..." | PV
tput setaf 3
echo -en "\t/dev/sdb1 on /media/usb0 type vfat (lots of options)"; tput setaf 7; waiting
echo "This line tells you that the USB drive (/dev/sdb1) is mounted at /media/usb0" | PV
echo "It means you can read/write your USB drive by reading/writing the /media/usb0 directory." | PV
echo "For example..." | PV
echo "To see what's in the USB drive..." | PV
tput setaf 3
echo -e "\tls -l /media/usb0" | PV; tput setaf 7; waiting
echo "Copy your file from the current directory to the USB drive..." | PV
tput setaf 3
echo -e "\tcp hello.py /media/usb0" | PV; tput setaf 7; waiting
echo "Copy a directory from the USB drive to your current directory..." | PV
tput setaf 3
echo -e "\tcp -a /media/usb0/homework ." | PV; tput setaf 7; waiting
echo "Easy, eh?" | PV
echo "After you finish using the USB drive, you should type command 'sync' before you pull it out." | PV
tput setaf 3
echo -e "\tsync" | PV; tput setaf 7; waiting
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
