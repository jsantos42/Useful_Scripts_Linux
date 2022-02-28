#!/bin/sh
# ==============================================================================
# Note: for this to work, the user has to have permissions to manipulate the i2c
# devices. In order to avoid having to do this on every boot, one could just
# create a file that is going to be run as root on every boot in /etc/rc.local
# with the following (uncommented obviously):
# 		#!/bin/sh -e
# 		chmod 666 /dev/i2c-*
# 		exit 0
# ==============================================================================


DISPLAY=$(ddcutil detect | grep I2C | sed -e s/"   I2C bus:             \/dev\/i2c-"// | head -n 1)

CURRENT=$(ddcutil getvcp 10 --bus $DISPLAY | sed -e s/"VCP code 0x10 (Brightness                    ): current value = "// | sed -e s/", max value =   100"//)

if [ $CURRENT -gt 140 ]; then
	ITERATOR=3
elif [ $CURRENT -gt 130 ]; then
	ITERATOR=2
else
	ITERATOR=1
fi

if [ "$1" = increase ]; then
	NEW=$((CURRENT + ITERATOR))
elif [ "$1" = decrease ]; then
	NEW=$((CURRENT - ITERATOR))
fi

#Check if it is less than
if [ $NEW -lt 113 ]
then
	NEW=113
fi

# 10 is for the code for brightness
ddcutil setvcp 10 $NEW --bus $DISPLAY

#echo $NEW  > /dev/pts/0
