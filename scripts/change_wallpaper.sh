#!/bin/bash

JAPAN_CONFIG=$HOME/.local/rice/wallpaper_rotation/japan.conf
FISHES_CONFIG=$HOME/.local/rice/wallpaper_rotation/two_fishes.conf
KNIGHT_CONFIG=$HOME/.local/rice/wallpaper_rotation/japan.conf

for arg in "$@"; do
  case $arg in
    --japan)
        pkill hyprpaper; hyprpaper --config ~/.local/rice/wallpaper_rotation/japan.conf & disown
      ;;
    --knight)
        pkill hyprpaper; hyprpaper --config ~/.local/rice/wallpaper_rotation/hollow_knight.conf & disown
      ;;
    --fishes)
        pkill hyprpaper; hyprpaper --config ~/.local/rice/wallpaper_rotation/two_fishes.conf & disown
      ;;
    *)
      echo "Unknown argument: $arg"
      ;;
  esac
done

# Change this later, only doing it because hyprpaper opens on top of eww
pkill -9 eww
eww daemon
start_eww.sh
