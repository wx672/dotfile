#!/bin/bash
[ -f ~/.bin/ttyrec-utils ] && . ~/.bin/ttyrec-utils
clear
ttyplayhelp
echo
echo "Hi, now I am going to show you how to bring up your network card, and" | PV
echo "how to check your Internet connectivity." | PV
echo
echo "First, you should have a basic idea about your network cards." | PV
tput setaf 3
echo -en "\tifconfig -a" | PV; tput setaf 7;waiting
echo "This command can list on the screen all the available network cards in your PC." | PV
echo "Let's take a closer look..." | PV
tput setaf 3
echo -e "\t eth0 - this is your wired network card." | PV
echo -e "\t   lo - this is a virtual network card. You can ignore it for now." | PV
echo -e  "\twlan0 - this is your wireless network card." | PV; tput setaf 7
echo
echo "If you want to use your wired network card (eth0), you have to" | PV
echo "first make sure the network cable is properly connected, and then..." | PV
tput setaf 3
echo -en "\tsudo dhclient eth0" | PV; tput setaf 7; waiting
echo "By typing this command, you won't see much output on the screen unless errors occur." | PV
echo "Now you can check to see if it's up" | PV
tput setaf 3
echo -en "\tifconfig eth0" | PV; tput setaf 7;waiting
echo "If you can see a line similar to the following one, it means your eth0 is up working." | PV
tput setaf 3
echo -e "\tinet addr:192.168.1.102  Bcast:192.168.1.255  Mask:255.255.255.0"; tput setaf 7;waiting
echo "Now you can 'ping' a well known web site to see if you can access the Internet." | PV
echo "For example," | PV
tput setaf 3
echo -e "\tping cs2.swfu.edu.cn" | PV
echo -e "\tping baidu.com" | PV; tput setaf 7
echo "If you can see outputs similar to the following lines, it means 'Ya, I'm online!'." | PV
tput setaf 3
echo -e "\tPING cs2.swfu.edu.cn (202.203.132.242) 56(84) bytes of data." 
echo -e "\t64 bytes from cs2.swfu.edu.cn (202.203.132.242): icmp_seq=1 ttl=39 time=125 ms" 
echo -e "\t64 bytes from cs2.swfu.edu.cn (202.203.132.242): icmp_seq=3 ttl=39 time=125 ms"; tput setaf 7;waiting
echo "Now, let's see the wireless card (wlan0)." | PV
echo "To bring up wlan0, you first have to make sure the config file is ready." | PV
tput setaf 3
echo -en "\tless /etc/network/interfaces" | PV; tput setaf 7;waiting
echo "To bring up your wireless card (wlan0), you use this command:" | PV
tput setaf 3
echo -en "\tsudo ifup wlan0=home" | PV; tput setaf 7;waiting
echo "There're quite some outputs on the screen." | PV 
echo "Hopefully it tells me my wlan0 is up running!" | PV 
echo "Now you can try..." | PV
tput setaf 3
echo -e "\tifconfig wlan0" | PV; tput setaf 7;
echo "and" | PV 
tput setaf 3
echo -e "\tping cs2.swfu.edu.cn" | PV; tput setaf 7
echo "just like we did before." | PV; waiting
echo "If the outputs looks good, you can enjoy the Internet now. :-)" | PV
havefun2 2>/dev/null
