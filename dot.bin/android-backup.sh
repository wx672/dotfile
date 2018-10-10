#!/bin/bash

# This script is prepared for android-backup@.service to work.
# android-backup@.service will be invoked by /etc/udev/rules.d/99-android-backup.rules
# REF: https://blog.josefsson.org/2015/11/28/automatic-android-replicant-backup-over-usb-using-rsync/

[ -z "$1" ] && {
    echo "Usage: $0 <iSerial number>";
    exit 1;
}

DIRBASE=/home/wx672/android-backups
export ANDROID_SERIAL="$1"

exec 2>&1 | logger

if ! test -d "$DIRBASE/$ANDROID_SERIAL"; then
    echo "could not find directory: $DIRBASE/$ANDROID_SERIAL"
    exit 1
fi

set -x

adb wait-for-device
adb root
adb wait-for-device
#adb shell printf "address 127.0.0.1\nuid = root\ngid = root\n[root]\n\tpath = /\n" \> /mnt/secure/rsyncd.conf
adb shell rsync --daemon --no-detach --config=/sdcard/rsyncd.conf &
adb forward tcp:6010 tcp:873
sleep 5
rsync -a --delete rsync://localhost:6010/root/sdcard/ $DIRBASE/$ANDROID_SERIAL/sdcard/
#rsync -a --delete --exclude /dev --exclude /acct --exclude /sys --exclude /proc rsync://localhost:6010/root/sdcard/DCIM/Camera/ $DIRBASE/$ANDROID_SERIAL/

sudo chown -R wx672:wx672 $DIRBASE/$ANDROID_SERIAL
find $DIRBASE/$ANDROID_SERIAL/sdcard/DCIM/ -type f -name "*.jpg" | xargs chmod 644

: rc $?
sudo adb forward --remove tcp:6010
#adb shell rm -f /mnt/secure/rsyncd.conf
