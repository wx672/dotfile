#!/bin/bash

[[ -n "$2" ]] || { 
	echo Usage: $(basename $0) '<mobile number> <text>';
	exit 0;
}

# KEYCODE_BACK
sudo adb shell input keyevent 4
sleep 1
sudo adb shell am start -a android.intent.action.SENDTO -dsms:$1 --es sms_body \"$2\"
sleep 1
# KEYCODE_ENTER to send out
sudo adb shell input keyevent 66
sleep 5
# KEYCODE_BACK. Have to go back, otherwise it will add new messages in the same session.
sudo adb shell input keyevent 4
sleep 1
sudo adb shell input keyevent 4

# 0 -->  "KEYCODE_UNKNOWN" 
# 1 -->  "KEYCODE_MENU" 
# 2 -->  "KEYCODE_SOFT_RIGHT" 
# 3 -->  "KEYCODE_HOME" 
# 4 -->  "KEYCODE_BACK" 
# 5 -->  "KEYCODE_CALL" 
# 6 -->  "KEYCODE_ENDCALL" 
# 19 -->  "KEYCODE_DPAD_UP" 
# 20 -->  "KEYCODE_DPAD_DOWN" 
# 21 -->  "KEYCODE_DPAD_LEFT" 
# 22 -->  "KEYCODE_DPAD_RIGHT" 
# 23 -->  "KEYCODE_DPAD_CENTER" 
# 24 -->  "KEYCODE_VOLUME_UP" 
# 25 -->  "KEYCODE_VOLUME_DOWN" 
# 26 -->  "KEYCODE_POWER" 
# 27 -->  "KEYCODE_CAMERA" 
# 28 -->  "KEYCODE_CLEAR" 
# 57 -->  "KEYCODE_ALT_LEFT" 
# 58 -->  "KEYCODE_ALT_RIGHT" 
# 59 -->  "KEYCODE_SHIFT_LEFT" 
# 60 -->  "KEYCODE_SHIFT_RIGHT" 
# 61 -->  "KEYCODE_TAB" 
# 63 -->  "KEYCODE_SYM" 
# 64 -->  "KEYCODE_EXPLORER" 
# 65 -->  "KEYCODE_ENVELOPE" 
# 66 -->  "KEYCODE_ENTER" 
# 67 -->  "KEYCODE_DEL" 
# 68 -->  "KEYCODE_GRAVE" 
# 75 -->  "KEYCODE_APOSTROPHE" 
# 78 -->  "KEYCODE_NUM" 
# 79 -->  "KEYCODE_HEADSETHOOK" 
# 80 -->  "KEYCODE_FOCUS" 
# 82 -->  "KEYCODE_MENU" 
# 83 -->  "KEYCODE_NOTIFICATION" 
# 84 -->  "KEYCODE_SEARCH" 
# 85 -->  "TAG_LAST_KEYCODE"
