#!/bin/bash

# Run this script as a cron job. For example:

# BATLOW="/home/wx672/.bin/notify-batlow.sh"
# */10 * * * * $BATLOW

battery_level=$(cat /sys/class/power_supply/BAT?/capacity)

(( $battery_level < 15 )) && { 
	# dzen2 -fg red -bg white -p -e 'onstart=grabkeys;key_Escape=ungrabkeys,exit' <<< 'Battery low!';
	rofi -theme msg -e "BATTERY LOW" -markup
} || exit 0

# zenity --warning --title "Bettary low" --text "Battery level is ${battery_level}%!"
# notify-send "Battery low" "Battery level is ${battery_level}%!"
