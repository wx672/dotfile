#!/bin/bash

# Run this script as a cron job. For example:

# BATLOW="/home/wx672/.bin/notify-batlow.sh"
# */10 * * * * $BATLOW

battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
if [ $battery_level -le 30 ]
then
	espeak "Battery low"
	zenity --warning --title "Bettary low" --text "Battery level is ${battery_level}%!"
#	notify-send "Battery low" "Battery level is ${battery_level}%!"
fi
