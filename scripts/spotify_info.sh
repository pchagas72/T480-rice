#!/bin/bash
for arg in "$@"; do
    case $arg in
        --name)
            dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/title/{n;p}' | cut -d '"' -f 2
            ;;
        --image)
            dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/artUrl/{n;p}' | cut -d '"' -f 2
            ;;
        *)
            echo "Unknown argument: $arg"
            ;;
    esac
done
