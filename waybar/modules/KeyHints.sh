#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Keyhints. Idea got from Garuda Hyprland

# GDK BACKEND. Change to either wayland or x11 if having issues
BACKEND=wayland

# Detect monitor resolution and scale
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')

# Calculate width and height based on percentages and monitor resolution
width=$((x_mon * hypr_scale / 100))
height=$((y_mon * hypr_scale / 100))

# Set maximum width and height
max_width=1200
max_height=1000

# Set percentage of screen size for dynamic adjustment
percentage_width=70
percentage_height=70

# Calculate dynamic width and height
dynamic_width=$((width * percentage_width / 100))
dynamic_height=$((height * percentage_height / 100))

# Limit width and height to maximum values
dynamic_width=$(($dynamic_width > $max_width ? $max_width : $dynamic_width))
dynamic_height=$(($dynamic_height > $max_height ? $max_height : $dynamic_height))

# Launch yad with calculated width and height
GDK_BACKEND=$BACKEND yad --width=$dynamic_width --height=$dynamic_height \
    --center \
    --title="Keybindings" \
    --no-buttons \
    --list \
    --column=Key: \
    --column=Description: \
    --column=Command: \
    --timeout-indicator=bottom \
    "ESC" "close this app" "" "=" "SUPER KEY (Windows Key)" "(SUPER KEY)" \
    " enter" "Terminal" "(alacritty)" \
    " Space" "App Launcher." "(rofi-wayland)" \
    " O" "Search emojis." "(rofi-wayland)" \
    " E" "Open File Manager." "(Thunar)" \
    " F" "Firefox" "(Firefox)" \
    " L" "Screen lock." "(hyprlock)" \
    " Q" "Close active window." "(not kill)" \
    " Shift Q " "kills an active window." "(kill)" \
    " B" "Random wallpaper." "(via swww)" \
    " Y" "Restart Waybar." "(waybar)" \
    " Print" "screenshot output." "(hyprshot)" \
    " S" "screenshot region." "(hyprshot)" \
    " W" "screenshot window." "(hyprshot)" \
    " X" "screenshot and edit. " "(grim+satty)" \
    " G" "Picker clipboard history." "(cliphist)" \
    " Delete" "Hyprland Exit." "(SAVE YOUR WORK!!!)" \
    " U" "Fullscreen." "Toggles to full screen" \
    " A" "Swap next window." "swap next window" \
    " V" "Toggle float." "single window" \
    "󰘳 ;" "Clipboard Manager." "(Fcitx5)" \
    " H" "Launch nwg-drawer." "(nwg-drawer)" \
    " D" "Launch anyrun." "(anyrun)" \
    " I" "Launch musicfox." "(musicfox)" \
    " M" "Launch ncmpcpp." "(ncmpcpp)" \
    " N" "Launch yazi." "(yazi)" \
    " K" "Lofi Girl Audio." "(rofi-wayland)" \
    "" "" "" \
    "More tips:" "https://github.com/JaKooLit/Hyprland-Dots/wiki" ""
