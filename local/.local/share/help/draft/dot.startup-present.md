# In this short slides, I will show you...

1. The most frequently used key bindings
2. How to check WiFi connectivity
3. How to open video/audio files
4. How to adjust screen brightness
5. How to get more help

-------------------------------------------------------------------------------

# The most frequently used key bindings

  * **Super-F1**: help
  * **Super-TAB**: switch window
  * **Super-t**: open terminal
  * **Super-c**: open chromium browser
  * **Super-q**: open qutebrowser

-------------------------------------------------------------------------------

# Networking

Don't know if WiFi is connected? Try command `ip a`. If you can see outputs similar to the followings...  

> 2: wlp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500...  
> 	inet **192.168.1.192/24** brd 192.168.1.255 scope global dynamic noprefixroute wlp1s0  
> 	...  

Good! You've got an IP address. To check your connection:  
`ping -c1 cs6.swfu.edu.cn`  

> PING cs6 (39.129.9.40) 56(84) bytes of data.
> 64 bytes from cs6 (39.129.9.40): icmp_seq=2 ttl=43 time=42.1 ms
> 
> --- cs6 ping statistics ---
> 1 packets transmitted, 1 received, **0% packet loss**, time 1002ms
> rtt min/avg/max/mdev = 42.050/47.130/52.211/5.080 ms  

See the *0% packet loss*? That means you are online.  

**If you can't see the IP address...**

-------------------------------------------------------------------------------

## No IP address

1. Check if your WiFi card is blocked, run `rfkill list`.
```
0: phy0: Wireless LAN       9: hci0: Bluetooth
        Soft blocked: no            Soft blocked: no
        Hard blocked: no            Hard blocked: no
```
See the 4 *no* in the output? That means both the WiFi card and the bluetooth card are
ready for use. If you see any *yes* in the output, you should unblock it.  

* In case of *Soft blocked: yes*, you should do `rfkill unblock all`
* In case of *Hard blocked: yes*, you should find the _WiFi key_ somewhere at the top of
  your keyboard, press it to unblock.  
  
After unblock your WiFi card, do `nmtui`. In the popup menu, select *Activate a connection*, then select your WiFi network.

-------------------------------------------------------------------------------

## If you have an Ethernet card...

1. Connect it to an Ethernet cable
2. Obtain an IP address by doing `sudo dhclient`
3. Check the connectivity  
   `ping -c2 cs6.swfu.edu.cn`

-------------------------------------------------------------------------------

## Browse the web

Assuming your WiFi is working, now you can open a browser to surf the web:

- Press *Super-c* or *chromium* to start google-chrome. Or,
- Press *Super-q* or *qutebrowser* to start [my favorite browser](https://qutebrowser.org/)!

## Play videos

1. Download a video, for example:  
   `aria2c --no-conf -x5 https://cs6.swfu.edu.cn/~wx672/beijing2008.mkv`
	
2. Play it with `mpv beijing2008.mkv`. `mpv` can be used to play any video/audio files.  

. . .

**If you can't hear any sound...**

-------------------------------------------------------------------------------

### If no sound...

1. Make sure your sound card is not muted. How?  
    1. Find the _Mute key_ somewhere in the top line of your keyboard, and double check it
	   is not switched on.  
    2. Adjust the volume via `pulsemixer`  
2. What if the sound card is not shown in pulsemixer?  

	This probably means your sound card is not detected by the system.  
	Ask [Google](https://google.com) for help.  

-------------------------------------------------------------------------------

# Adjust the brightness of the screen

If the *brightness up* and *brightness down* function keys don't work as expected, you can
try...  
```sh
brightnessctl set 25%-
brightnessctl set +25%
```
-------------------------------------------------------------------------------

# Help!

* Press *Super-F1* to show the HELP screen (press '*q*' to quit);
* Press *Ctrl-a F1* to see the HELP screen in terminal;
* Press *Ctrl-a F2/F3/F4* to see more.
