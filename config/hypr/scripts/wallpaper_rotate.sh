#!/bin/bash

WALLPAPER_DIR="/home/pedro/media/wallpapers/catpuccin/"

while true; do
    toggle_eww.sh --close
    RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    hyprctl hyprpaper reload "eDP-1,$RANDOM_WALLPAPER"

    sleep .1

    toggle_eww.sh --open

    sleep 120
done
