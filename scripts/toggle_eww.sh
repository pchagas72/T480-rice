#!/bin/bash

for arg in "$@"; do
    case $arg in
        --close)
            if [[ $(eww active-windows) != "" ]]; then
                eww close userinfo
                eww close closewallpapersbox
                eww close wallpapersbox
                eww close appmenubox
                eww close closeappmenubox
                eww close powermenu
                eww close infobox
            fi
            ;;
        --open)
            if [[ $(eww active-windows) == "" ]]; then
                eww open --screen 0 userinfo
                eww open --screen 0 infobox
            fi
            ;;
        --toggle)
            if [[ $(eww active-windows) == "" ]]; then
                eww open --screen 0 userinfo
                eww open --screen 0 infobox
            else 
                eww close userinfo
                eww close closewallpapersbox
                eww close wallpapersbox
                eww close appmenubox
                eww close closeappmenubox
                eww close powermenu
                eww close infobox
            fi
            ;;
        *)
            echo "Unknown argument: $arg"
            ;;
    esac
done


