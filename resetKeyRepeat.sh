#!/bin/bash

INTERVAL=$(gsettings get org.gnome.desktop.peripherals.keyboard repeat-interval | cut -d ' ' -f 2)
DELAY=$(gsettings get org.gnome.desktop.peripherals.keyboard delay | cut -d ' ' -f 2)

gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 10
gsettings set org.gnome.desktop.peripherals.keyboard delay 221

gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval $INTERVAL
gsettings set org.gnome.desktop.peripherals.keyboard delay $DELAY
