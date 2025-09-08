#!/bin/bash

# --- CONFIGURATION ---
WALLPAPER_DIR="$HOME/media/wallpapers/rotate"
THUMBNAIL_DIR="$HOME/.cache/eww/thumbnails"

# --- SCRIPT LOGIC ---

mkdir -p "$THUMBNAIL_DIR"

echo '(box :class "container" :orientation "v" :spacing 10'

find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | \
sort | \
while read -r file; do
    filename=$(basename "$file")
    thumbnail_path="$THUMBNAIL_DIR/$filename"

    if [ ! -f "$thumbnail_path" ]; then
        convert "$file" -thumbnail 100x100^ -gravity center -extent 100x100 "$thumbnail_path"
    fi

    echo "(button \
            :class \"button_wallpaper\" \
            :style \"background-image: url('${thumbnail_path}');\" \
            :onclick \"hyprctl hyprpaper wallpaper \\\"eDP-1,${file}\\\" && eww close wallpapersbox\")"
done

echo ')'
