#!/bin/bash

show_notification() {
    local title="$1"
    local message="$2"
    dunstify -u normal -t 3000 -r 1000 "$title" "$message"
}

if [ "$1" == "mute" ]; then
    amixer set Capture nocap
    show_notification "Microphone" "Muted"
elif [ "$1" == "unmute" ]; then
    amixer set Capture cap
    show_notification "Microphone" "Unmuted"
else
    show_notification "Microphone" "Invalid argument: $1"
fi
