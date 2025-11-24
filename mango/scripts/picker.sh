#!/bin/sh
swaync-client -t
sleep 0.2
notify-send "Hyprpicker " "You picked the color $(hyprpicker -a)"