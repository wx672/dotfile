#!/bin/bash

# Run this script as a cron job. For example:
#
# BATLOW="/home/wx672/.bin/batlow-shutdown.sh"
# */10 * * * * $BATLOW

battery_level=$(cat /sys/class/power_supply/BAT?/capacity)

(( $battery_level < 10 )) && poweroff || exit 0

