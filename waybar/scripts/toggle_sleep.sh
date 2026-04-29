#!/usr/bin/env bash

if [[ "$1" != "check" ]]; then
    if pgrep -x "hypridle" > /dev/null; then
        pkill hypridle
    else
        hypridle > /dev/null 2>&1 &
        sleep 0.1
    fi
fi

# Output JSON for Waybar
if pgrep -x "hypridle" > /dev/null; then
    echo "{\"text\": \"󰒲\", \"tooltip\": \"Sleeping enabled\", \"class\": \"on\"}"
else
    echo "{\"text\": \"󰒳\", \"tooltip\": \"Sleeping inhibited\", \"class\": \"off\"}"
fi
