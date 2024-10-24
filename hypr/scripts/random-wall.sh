#!/bin/bash

# Randomly change wallpapers via swww.
wallpaper_dir="$HOME/Pictures/wallpapers"

find_images() {
    # find "$1" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)
    fd . "$1" -t f -e jpg -e jpeg -e png -e gif
}

if [[ -d $wallpaper_dir && $(find_images "$wallpaper_dir") ]]; then
    random_wallpaper=$(find_images "$wallpaper_dir" | shuf -n 1)

    swww img "$random_wallpaper" --transition-type outer --transition-step 90

    dunstify -a swww \
        -u NORMAL \
        -t 3000 "Wallpaper set to: $random_wallpaper"
else
    dunstify -a swww \
        -u urgency \
        -t 3000 \
        "Wallpaper directory is either missing or does not contain any images."
fi
