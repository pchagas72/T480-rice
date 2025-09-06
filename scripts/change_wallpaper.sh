#!/bin/bash

JAPAN_CONFIG=$HOME/git/T480-rice/config/hypr/hyprpaper/japan.conf
KNIGHT_CONFIG=$HOME/git/T480-rice/config/hypr/hyprpaper/hollow_knight.conf
FISHES_CONFIG=$HOME/git/T480-rice/config/hypr/hyprpaper/two_fishes.conf
HORNET_CONFIG=$HOME/git/T480-rice/config/hypr/hyprpaper/hornet.conf
NASA_CONFIG=$HOME/git/T480-rice/config/hypr/hyprpaper/nasa.conf
MARKET_CONFIG=$HOME/git/T480-rice/config/hypr/hyprpaper/market.conf

for arg in "$@"; do
  case $arg in
    --japan)
        pkill hyprpaper; hyprpaper --config $JAPAN_CONFIG & disown
      ;;
    --knight)
        pkill hyprpaper; hyprpaper --config $KNIGHT_CONFIG & disown
      ;;
    --fishes)
        pkill hyprpaper; hyprpaper --config $FISHES_CONFIG & disown
      ;;
    --hornet)
        pkill hyprpaper; hyprpaper --config $HORNET_CONFIG & disown
      ;;
    --nasa)
        pkill hyprpaper; hyprpaper --config $NASA_CONFIG & disown
      ;;
    --market)
        pkill hyprpaper; hyprpaper --config $MARKET_CONFIG & disown
      ;;
    *)
      echo "Unknown argument: $arg"
      ;;
  esac
done

# Change this later, only doing it because hyprpaper opens on top of eww
pkill -9 eww
eww daemon
toggle_eww.sh --open
