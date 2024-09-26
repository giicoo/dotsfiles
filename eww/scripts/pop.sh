#!/bin/bash

calendar() {
LOCK_FILE="$HOME/.cache/eww-calendar.lock"
EWW_BIN="$HOME/.local/eww/eww"

run() {
    ${EWW_BIN} open calendar
}

# Open widgets
if [[ ! -f "$LOCK_FILE" ]]; then
    touch "$LOCK_FILE"
    run && echo "ok good!"
else
    ${EWW_BIN} close calendar
    rm "$LOCK_FILE" && echo "closed"
fi
}


if [ "$1" = "calendar" ]; then
calendar
fi