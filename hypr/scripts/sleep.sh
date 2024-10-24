#!/bin/bash
swayidle -w \
        before-sleep /usr/bin/swaylock \
        timeout 240 'temp=$(brightnessctl g); brightnessctl set $((temp / 2))' \
            resume 'temp=$(brightnessctl g); brightnessctl set $((temp * 2))' \
        timeout 360 /usr/bin/swaylock & sleep 1 && hyprctl dispatch dpms off" \
            resume 'hyprctl dispatch dpms on' \
        timeout 600 'systemctl suspend' \
            resume 'hyprctl dispatch dpms on'
