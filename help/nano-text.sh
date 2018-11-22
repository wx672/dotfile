#!/bin/bash

. ~/.bin/ttyrec-utils

clear; ttyplayhelp
echo
echo "Today I am going to show you how to do simple python programming within your terminal." | PV
echo "First, you should write your program with an editor." | PV
echo "The editor I am going to use is called 'nano'. And..." | PV
echo -n "the program I am going to write is..." | PV
echo "my favorite one --- Hello, world! So, let's do it..." | PV
echo
echo -e "\tnano hello.py" | PV; waiting
echo "nano is small, simple, and easy to use." | PV
echo "You can see some shortcut keys are listed at the bottom of your nano window." | PV
echo "For example:" | PV
echo -e "\t^G - Get Help\t^O - WriteOut (Save)\t^K - Cut Text" | PV
echo -e "\t^X - Exit\t^U - Uncut Text (paste)" | PV
echo "'^' means the 'Ctrl' key. Got it?" | PV
echo
echo "Now, let's say something nice to our holy world..." | PV; waiting
echo "Done with my cute one line programming! Easy, eh?" | PV
echo "By the way, if you want to say 'hello' in Chinese," | PV
echo -n "you have to put one more line at the beginning of your file. Like this..." | PV; waiting
echo "And of course, you want to try it. God do understand Chinese, right?" | PV; waiting
echo "After finish editing, you should save your file by typing" | PV
echo
echo -e "\tCtrl-o" | PV
echo "It means you press 'Ctrl' key and 'o' key at the same time." | PV
echo
echo "So, how do you know you haven't save your file?" | PV
echo -n "If you see 'Modified' at the upper right corner of your nano window..." | PV; waiting
echo "it means you haven't save your changes. So you need to type 'Ctrl-o' to save it." | PV; waiting
echo "After saving your changes, you can exit from nano by typing" | PV
echo
echo -e "\tCtrl-x" | PV; waiting
echo "if you type 'ls' you can see your small program is ready in your current directory." | PV; waiting
echo "Now you can run it..." | PV
echo
echo -e "\tpython hello.py" | PV; waiting
echo -n "Ooops! Error! Can you see why? " | PV
echo "Of course, the '^^^^^^^^' isn't a valid python statement." | PV
echo "Let's remove it..." | PV; waiting
echo "Try it again..."| PV; waiting
echo "Ha! It works!" | PV
echo -n "That's all for now. " | PV
echo "You should try it yourself. And remember..." | PV
echo
echo -e "\tPractice makes perfect!" | PV
echo
echo "Have fun!" | PV; sleep 10

