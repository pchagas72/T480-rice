#!/bin/bash

sleep 1

# Use jq to directly parse the JSON and extract the numeric value of "windows"
NUM_WINDOWS=$(hyprctl activeworkspace -j | jq '.windows')

if [[ "$NUM_WINDOWS" -eq 0 ]]; then
    start_eww.sh
else
    stop_eww.sh
fi
