#!/bin/bash

sleep 0.1

NUM_WINDOWS=$(hyprctl activeworkspace -j | jq '.windows')

if [[ "$NUM_WINDOWS" -eq 0 ]]; then
    if [[ $(eww active-windows) == "" ]]; then
        toggle_eww.sh --open
    fi
else
    if [[ $(eww active-windows) != "" ]]; then
        toggle_eww.sh --close
    fi
fi
