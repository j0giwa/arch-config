#!/bin/sh

# Select a picture and set it as the wallpaper
[ -f "$1" ] && cp "$1" $HOME/.config/wallpaper/wal.png && notify-send -i "$HOME/.config/wallpaper/wal.png" "Wallpaper changed"
# If "$1" is a directory, select a random picture
[ -d "$1" ] && cp "$(find "$1"/*.{jpg,jpeg,png} -type f | shuf -n 1)" $HOME/.config/wallpaper/wal.png && notify-send -i "$HOME/.config/wallpaper/wal.png" "Random Wallpaper chosen"
# If pywall ist installde update colors
type wal >/dev/null 2>&1 && { wal -c
    wal -s -i $HOME/.config/wallpaper/wal.png -o $HOME/.config/wallpaper/postrun
    xsetroot -name "fsignal:xrdb"
    killall dwmblocks
    setsid dwmblocks >/dev/null & } >/dev/null 2>&1
xwallpaper --zoom $HOME/.config/wallpaper/wal.png
pidof dwm >/dev/null && xdotool key alt+F5
