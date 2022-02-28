#!/bin/bash

resetWifi() {

SSID=$(nmcli device wifi show-password | sed -n 1p | cut -d ' ' -f 2)
PASSWD=$(nmcli device wifi show-password | sed -n 3p | cut -d ' ' -f 2)
ID=$(nmcli connection | grep $SSID | head -n 1 | sed -s "s/$SSID*\s *//" | sed -s "s/\s *.*//")

nmcli connection delete $ID
nmcli device wifi connect $SSID password $PASSWD
}

resetWifi
