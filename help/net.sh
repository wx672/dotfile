#!/bin/bash

[ -f ~/.bin/ttyrec-utils ] && . ~/.bin/ttyrec-utils

clear; ttyplayhelp; tput setaf 7
cat <<EOF | PV
Hi, now I am going to show you how to bring up your network card, and
how to check your Internet connectivity.

First, you should have a basic idea about your network cards.
EOF
prompt; tput setaf 3
echo -n "ip a" | PV; tput setaf 7;waiting
cat <<EOF | PV
This command can list on the screen all the available network cards in your PC.
Let's take a closer look...
EOF

tput setaf 3
cat <<EOF | PV
   lo - a virtual network card. You can ignore it for now.
 eth0 - your ethernet card.
wlan0 - your wireless network card.
EOF

tput setaf 7
cat <<EOF | PV
To use the wired network card (eth0), be sure the network cable is properly connected, and then...
EOF
prompt; tput setaf 3
echo -n "sudo dhclient eth0" | PV; tput setaf 7; waiting

cat <<EOF | PV
You won't see much output on the screen unless errors occur.
Now you can check to see if it's up...
EOF
prompt; tput setaf 3
echo -n "ip a" | PV; tput setaf 7; waiting
echo "If you can see a line similar to the following one, it means your eth0 is up working." | PV
tput setaf 3
echo -e "\tinet 192.168.43.129/24 brd 192.168.43.255 ..."; tput setaf 7; waiting

cat <<EOF | PV
Now you can 'ping' some well known web site to see if you can access the Internet.
For example,
EOF
prompt; tput setaf 3
echo "ping www.swfu.edu.cn" | PV
prompt; tput setaf 3
echo "ping baidu.com" | PV; tput setaf 7

echo "If you can see outputs similar to the following lines, it means 'Ya, I'm online!'." | PV
tput setaf 3
cat <<EOF
        PING cs2.swfu.edu.cn (202.203.132.242) 56(84) bytes of data.
        64 bytes from cs2.swfu.edu.cn (202.203.132.242): icmp_seq=1 ttl=39 time=125 ms
        64 bytes from cs2.swfu.edu.cn (202.203.132.242): icmp_seq=3 ttl=39 time=125 ms
EOF
# tput setaf 7; waiting
# echo "Now, let's see the wireless card (wlan0)." | PV
# echo "To bring up wlan0, you first have to make sure the config file is ready." | PV
# tput setaf 3
# echo -en "\tless /etc/network/interfaces" | PV; tput setaf 7;waiting
# echo "To bring up your wireless card (wlan0), you use this command:" | PV
# tput setaf 3
# echo -en "\tsudo ifup wlan0=home" | PV; tput setaf 7;waiting
# echo "There're quite some outputs on the screen." | PV 
# echo "Hopefully it tells me my wlan0 is up running!" | PV 
# echo "Now you can try..." | PV
# tput setaf 3
# echo -e "\tifconfig wlan0" | PV; tput setaf 7;
# echo "and" | PV 
# tput setaf 3
# echo -e "\tping cs2.swfu.edu.cn" | PV; tput setaf 7
# echo "just like we did before." | PV; waiting
# echo "If the outputs looks good, you can enjoy the Internet now. :-)" | PV
havefun2 2>/dev/null
