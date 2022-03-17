#!/bin/bash

TTY=6
SECONDARY_DISPLAYS=$(xrandr | grep " connected" | grep -v eDP | wc -l)
echo $SECONDARY_DISPLAYS > /dev/pts/$TTY

if [ $SECONDARY_DISPLAYS -eq 0 ]; then
	echo full > /dev/pts/$TTY
	SOURCE=full
else
	echo screen > /dev/pts/$TTY
	SOURCE=screen
fi

if [ "$1" = file ]; then
	echo file > /dev/pts/$TTY
    flameshot $SOURCE -p /home/ctw01895/Pictures/
elif [ "$1" = clipboard ]; then
	echo clipboard > /dev/pts/$TTY
    flameshot $SOURCE -c
fi

