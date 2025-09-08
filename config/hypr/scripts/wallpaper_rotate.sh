#!/bin/bash

WALLPAPER_DIR="/home/pedro/media/wallpapers/rotate/"
WALLPAPER_FILE="/home/pedro/.local/used_wallpapers.txt"
MONITOR="eDP-1"
SLEEP_DURATION=300

touch "$WALLPAPER_FILE"

while true; do
    toggle_eww.sh --close

    UNUSED_WALLPAPERS=$(comm -23 \
        <(find "$WALLPAPER_DIR" -type f | sort) \
        <(sort "$WALLPAPER_FILE"))

    if [[ -z "$UNUSED_WALLPAPERS" ]]; then
        echo "All wallpapers shown. Resetting cycle."
        CURRENT_WALLPAPER=$(hyprctl hyprpaper listloaded | grep "$MONITOR" | awk -F', ' '{print $2}')
        
        echo "$CURRENT_WALLPAPER" >> "$WALLPAPER_FILE"

        UNUSED_WALLPAPERS=$(comm -23 \
            <(find "$WALLPAPER_DIR" -type f | sort) \
            <(sort "$WALLPAPER_FILE"))
    fi

    RANDOM_WALLPAPER=$(echo "$UNUSED_WALLPAPERS" | shuf -n 1)

    if [[ -n "$RANDOM_WALLPAPER" ]]; then
        hyprctl hyprpaper reload "$MONITOR,$RANDOM_WALLPAPER"

        echo "$RANDOM_WALLPAPER" >> "$WALLPAPER_FILE"
    fi

    sleep .1

    toggle_eww.sh --open

    echo "Waiting for $SLEEP_DURATION seconds..."
    sleep $SLEEP_DURATION
done
