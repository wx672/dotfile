#!/bin/bash

# Run this script as a cron job. For example:
#
# BATLOW_SHUTDOWN="/home/wx672/.local/bin/batlow-shutdown.sh"
# */10 * * * * $BATLOW_SHUTDOWN

battery_level=$(cat /sys/class/power_supply/BAT?/capacity)

(( $battery_level < 10 )) && poweroff || exit 0

