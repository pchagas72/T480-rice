#!/bin/bash

sleep 1
NUM_WINDOWS=$(hyprctl activeworkspace -j | jq '.windows')

if [[ "$NUM_WINDOWS" -eq 0 ]]; then
    if [[ $(eww active-windows) == "" ]]; then
        start_eww.sh
    fi
else
    stop_eww.sh
fi
