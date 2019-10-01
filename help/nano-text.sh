#!/bin/bash

[[ -f ~/.bin/ttyrec-utils ]] && . ~/.bin/ttyrec-utils

clear; ttyplayhelp; tput setaf 7

cat <<EOF | PV
Today I am going to show you how to do simple python programming within your terminal.
First, you should write your program within an editor.
The editor I am going to use is called 'nano'.
And the program I am going to write is...my favorite "Hello, world!". So, let's do it...
EOF
prompt; tput setaf 3
echo "nano hello.py" | PV; waiting

tput setaf 7
cat <<EOF | PV; waiting
nano is small, simple, and easy to use.
You can see some shortcut keys are listed at the bottom of your nano window.
For example:
        ^O - WriteOut (Save)     ^K - Cut Text
        ^X - Exit                ^U - Uncut Text (paste)
'^' means the 'Ctrl' key. Got it?

Now, let's say something nice to our holy world...
EOF

cat <<EOF | PV; waiting
Done with my cute one line programming! Easy, eh?
By the way, if you want to say 'hello' in Chinese,
you have to put one more line at the beginning of your file. Like this...
EOF

echo "And of course, you want to try it. God does understand Chinese, right?" | PV; waiting

cat <<EOF | PV; waiting
After finish editing, you should save your file by typing
        Ctro-o
It means you press and hold the 'Ctrl' key, then hit the 'o' key.
So, how do you know you haven't save your file?
If you see 'Modified' at the upper right corner of your nano window...
EOF

echo "it means you haven't save your changes. So you need to type 'Ctrl-o' to save it." | PV; waiting

cat <<EOF | PV; waiting
After saving your changes, you can exit from nano by typing
        Ctrl-x
Now, if you type 'ls' you can see your small program is ready in your current directory.

Now you can run it...
EOF

prompt; tput setaf 3; echo "python hello.py" | PV; waiting

tput setaf 7
cat <<EOF | PV; waiting
Ooops! Error! Can you see why?
Of course, the '^^^^^^^^' isn't a valid python statement. Let's remove it...
EOF

echo "Try it again..."| PV; waiting

cat <<EOF | PV; waiting
Ha! It works!
That's all for now.
You should try it yourself. And remember...

        Practice makes perfect!

EOF

havefun2 2>/dev/null

