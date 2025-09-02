#!/bin/bash

for arg in "$@"; do
    case $arg in
        --close)
            if [[ $(eww active-windows) != "" ]]; then
                eww close userinfo
                eww close yearbox
                eww close monthbox
                eww close daybox
                eww close leftbox
                eww close closewallpapersbox
                eww close wallpapersbox
            fi
            ;;
        --open)
            if [[ $(eww active-windows) == "" ]]; then
                eww open --screen 0 userinfo
                eww open --screen 0 yearbox
                eww open --screen 0 monthbox
                eww open --screen 0 daybox
                eww open --screen 0 leftbox
            fi
            ;;
        --toggle)
            if [[ $(eww active-windows) == "" ]]; then
                eww open --screen 0 userinfo
                eww open --screen 0 yearbox
                eww open --screen 0 monthbox
                eww open --screen 0 daybox
                eww open --screen 0 leftbox
            else 
                eww close userinfo
                eww close yearbox
                eww close monthbox
                eww close daybox
                eww close leftbox
                eww close closewallpapersbox
                eww close wallpapersbox
            fi
            ;;
        *)
            echo "Unknown argument: $arg"
            ;;
    esac
done


