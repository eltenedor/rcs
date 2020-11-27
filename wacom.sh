#!/bin/bash
#xsetwacom --list devices
#xsetwacom --set "21" MaptoOutput VGA-1
devNum=`xsetwacom --list devices | grep "stylus" | awk '{print $8}'`

echo "Detected stylus at id:" $devNum

xsetwacom --set $devNum MaptoOutput VGA-1

