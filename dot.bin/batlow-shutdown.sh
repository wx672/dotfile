#!/bin/bash

# Run this script as a cron job. For example:

# BATLOW="/home/wx672/.bin/batlow-shutdown.sh"
# */10 * * * * $BATLOW

battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`

(acpi -a | grep -q 'on-line') || ( [[ $battery_level < 10 ]] && sudo poweroff )
