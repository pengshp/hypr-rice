#!/bin/sh
# https://github.com/phatina/simple-mtpfs
# yay -S simple-mtpfs

# Dir=$XDG_DATA_HOME/cell/
Dir=$HOME/tmp/cell/

# Make the cell directory if it doesn't exist
if [ ! -d "$Dir" ]; then
    mkdir "$Dir"
fi

# Select device
Devices=$(simple-mtpfs -l)

if [ -z "$Devices" ]; then
    notify-send "No devices found"
    exit 0
else
    Device=$(echo "$Devices" | rofi -dmenu -p "Select device:" || notify-send "No device selected")
    Id=${Device%%:*}
    Name=${Device##*: }
    if [ ! -d "$Dir$Name" ]; then
        mkdir "$Dir$Name"
    fi
fi

if [ -z "$(find "$Dir$Name" -maxdepth 0 -empty)" ]; then
    fusermount -u "$Dir$Name" && notify-send "Android Mount" "Device Unmounted"
else
    simple-mtpfs --device "$Id" "$Dir$Name"
    notify-send "Android Mount" "Device Mounted in $Dir$Name"
fi
