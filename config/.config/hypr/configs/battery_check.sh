#!/bin/bash
notify_levels=(5 10 20)
last_notify=100

while true; do
  bat_lvl=$(cat /sys/class/power_supply/BAT0/capacity)
  bat_stat=$(cat /sys/class/power_supply/BAT0/status)
  
  if [ $bat_lvl -gt $last_notify ]; then
    last_notify=$bat_lvl
  fi

  if [ "$bat_stat" == "Discharging" ]; then
    for notify_level in ${notify_levels[@]}; do
      if [ $bat_lvl -le $notify_level ]; then
        if [ $notify_level -lt $last_notify ]; then
          notify-send --urgency=CRITICAL "Battery Low" "Level: ${bat_lvl}%"
	  last_notify=$bat_lvl
	fi
      fi
    done
    sleep 60
  fi
done
