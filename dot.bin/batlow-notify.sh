#!/bin/bash

# Run this script as a cron job. For example:

# BATLOW="/home/wx672/.bin/notify-batlow.sh"
# */10 * * * * $BATLOW

battery_level=$(cat /sys/class/power_supply/BAT?/capacity)
if [ $battery_level -le 15 ]
then
	espeak "Battery low"
	echo "Battery low!" | dzen2 -fg red -bg white -p -e 'key_Escape=ungrabkeys,exit'
	# zenity --warning --title "Bettary low" --text "Battery level is ${battery_level}%!"
	# notify-send "Battery low" "Battery level is ${battery_level}%!"
fi
