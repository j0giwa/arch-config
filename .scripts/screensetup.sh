#!/bin/sh

# Menu
menu=$(dialog --menu "Select Option" 0 0 4 1 "Internal Display (Default)" 2 "Single external Display" 3 "Mirror Screens (720p)" 4 "Dual Monitor" 2>&1 >/dev/tty)

for choice in $menu
do
    case $choice in

        1) # internal display
            xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-1 --off 
            xrandr --output HDMI-2 --off 
            xrandr --output DP-1 --off 
            xrandr --output DP-2 --off
            xrandr --output VGA-1 --off 
            ;;

        2) # single external display (HDMI)
            xrandr --output eDP-1 --off 
            xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
            xrandr --output HDMI-2 --off 
            xrandr --output DP-1 --off 
            xrandr --output DP-2 --off
            xrandr --output VGA-1 --off
            ;;

        3) # mirror displays (720p)
            xrandr --output eDP-1 --primary --mode 1280x720 --pos 0x0 --rotate normal
            xrandr --output HDMI-1 --mode 1280x720 --pos 0x0 --rotate normal 
            xrandr --output HDMI-2 --off 
            xrandr --output DP-1 --off 
            xrandr --output DP-2 --off
            xrandr --output VGA-1 --off 
            ;;

        4)  # dual display (internal + HDMI)
            xrandr --output eDP-1 --mode 1366x768 --pos 0x156 --rotate normal
            xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1366x0 --rotate normal
            xrandr --output HDMI-2 --off 
            xrandr --output DP-1 --off
            xrandr --output DP-2 --off
            xrandr --output VGA-1 --off
            ;;
    esac
done

# Fix Wallpaper if nitrogen is running
pgrep -x nitrogen > /dev/null || nitrogen --restore &

# clear screen (terminal) after selection
clear

