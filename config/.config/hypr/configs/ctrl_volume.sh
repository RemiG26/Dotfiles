#!/bin/bash

# Arbitrary but unique message tag
msgTag="myvolume"

# If a parameter is set (eg increase/decrease), change the volume if not toggle mute
if [[ $# -eq 1 ]] ; then
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ "$@"
else
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
fi

status="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
volume=$(echo "$status" | grep -oP 'Volume: \K\d+\.\d+')
volume_percentage=$(echo "$volume * 100" | bc)
mute=$(echo "$status" | grep -q 'MUTED' && echo true || echo false)

mutedIcon="/usr/share/icons/breeze-dark/status/24/audio-volume-muted.svg"
volumeIcon="/usr/share/icons/breeze-dark/status/24/audio-volume-high.svg"

if [[ $volume_percentage == 0 || $mute == true ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -t 800 -i $mutedIcon -h string:x-dunst-stack-tag:$msgTag "Volume muted" 
else
    # Show the volume notification
    dunstify -a "changeVolume" -t 800 -i $volumeIcon -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume_percentage" "Volume: ${volume_percentage}%"
fi

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
