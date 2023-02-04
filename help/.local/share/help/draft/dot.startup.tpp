--title A Quick Startup Guide To Your New System
--author WANG Xiaolin <wx672ster@gmail.com>
--date Oct 29 2020

--center Press <SPACE> to continue...

---
--center In this short slides, I will show you:
---
1. How to check WiFi connectivity
---
2. How to open video/audio files
---
3. How to adjust screen brightness
---
4. How to get more help

---
--beginoutput
If the terminal font size is too large, try:
     * [Super--] to make it smaller;
     * [Super-=] to enlarge it.
--endoutput

--newpage
--heading Is WiFi connected?
---
If not, try...
--beginshelloutput
$ ip a
--endshelloutput
---
If you can see lines similar to the followings...
--beginoutput
2: wlp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 ...
--revon
	inet 192.168.1.192/24 brd 192.168.1.255 scope global dynamic noprefixroute wlp1s0
--revoff
	...
--endoutput
---
Good! Your WiFi looks good. To make sure...
---
--beginshelloutput
$ ping -c1 cs6.swfu.edu.cn
---
PING cs6 (39.129.9.40) 56(84) bytes of data.
64 bytes from cs6 (39.129.9.40): icmp_seq=2 ttl=43 time=42.1 ms

>>> cs6 ping statistics <<<
1 packets transmitted, 1 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 42.050/47.130/52.211/5.080 ms
--endshelloutput
See the "0% packet loss"? That means the WiFi works really well.

--newpage
--heading If WiFi doesn't work...
1. Check if your WiFi card is blocked
--beginshelloutput
$ rfkill list
--endshelloutput
---
The output should be like the followings:
--beginoutput
0: phy0: Wireless LAN       9: hci0: Bluetooth      
        Soft blocked: no            Soft blocked: no
        Hard blocked: no            Hard blocked: no
--endoutput
---
It's good to see 4 'no' in the output. That means both your WiFi card and bluetooth card are ready for use.
---
If you see any 'yes' in the output, that means your WiFi card is blocked.
---
* In case of 'Soft blocked: yes', you should do:
---
--beginshelloutput
$ rfkill unblock phy0
--endshelloutput
---
* If 'Hard blocked: yes', you should find the 'WiFi key' somewhere at the top of your keyboard, press it to unblock.
--newpage
After unblock your WiFi card, do:
---
--beginshelloutput
$ nmtui
--endshelloutput
nmtui -> Activate a connection -> Select your WiFi network
---


--heading If you have an Ethernet card...
---
1. Connect it to an Ethernet cable;
---
2. Obtain an IP address via DHCP
--beginshelloutput
$ sudo dhclient
--endshelloutput
3. Ping again to check the connectivity
---
--beginshelloutput
$ ping -c2 cs6.swfu.edu.cn
--endshelloutput

--newpage
--heading Browse the web
Assuming your WiFi is working, now you can open a browser to surf the net:
---
--beginshelloutput
$ chromium  # or just type [Super-c]. Or,
---
$ qutebrowser # [Super-q], this is my favorite browser!
--endshelloutput

--newpage
--heading Let's have some music!

1. Download a video, for example:
--beginshelloutput
$ aria2c --no-conf -x5 https://cs6.swfu.edu.cn/~wx672/beijing2008.mkv
--endshelloutput
---
2. Play it with mpv
--beginshelloutput
$ mpv beijing2008.mkv
--endshelloutput
---
--revon
mpv can be used to open any video/audio file.
--revoff

---
--heading If you hear no sound...

---
1. Make sure your sound card is not muted. How?
---	
	1) Make sure the 'Mute key' somewhere within the top line of your keyboard is not switched on.
---	   
	2) Adjust the volume via pulsemixer
--beginshelloutput
$ pulsemixer
--endshelloutput
---
2. What if the sound card is not shown in pulsemixer?
---
	I hate this situation. Ask google for help.

--newpage
--heading Adjust the brightness of the screen
---
If the 'brightness up' and 'brightness down' function keys don't work as expected, you can try...
---
--beginshelloutput
$ brightnessctl set 25%-
$ brightnessctl set +25%
--endshelloutput


--heading Help!

---
* Press <Super-F1> to show the HELP screen (press 'q' to quit);
---
* Press <Ctrl-a F1> to see the HELP screen in terminal;
---
* Press <Ctrl-a F2/F3/F4> to see more.
