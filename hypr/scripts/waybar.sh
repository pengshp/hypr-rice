#!/bin/bash
# Restart waybar.

# pkill -SIGKILL waybar

function waybar_notify() {
    dunstify \
        --appname=waybar \
        --urgency=low \
        --icon=go-home \
        "Waybar Info:" \
        "$1"
}

if pgrep -x waybar; then
    # pkill -SIGKILL waybar
    waybar_notify "running..."
else
    waybar >/dev/null 2>&1
    sleep 1
    waybar_notify "Restarted."
fi
