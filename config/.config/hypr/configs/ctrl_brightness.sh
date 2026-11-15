#!/bin/bash

# Arbitrary but unique message tag
msgTag="mybrightness"

# If a parameter is set (eg increase/decrease), change the volume if not toggle mute
brightnessctl -e4 -n2 set "$@"

max=$(brightnessctl max)
value=$(brightnessctl get)
percentage=$(echo "($value * 100 + ($max / 2)) / $max" | bc)


icon="/usr/share/icons/breeze-dark/status/24/high-brightness.svg"

    # Show the volume notification
dunstify -a "changeBrightness" -u low -t 800 -i $icon -h string:x-dunst-stack-tag:$msgTag -h int:value:"$percentage" "Brightness: ${percentage}%"

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeBrightness"
