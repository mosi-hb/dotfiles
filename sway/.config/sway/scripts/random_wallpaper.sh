#!/bin/sh

# Wallpaper directory
WP_FOLDER=$HOME/.wallpapers

# Time in seconds to change wallpaper
WAIT_TIME=3600 # 1 hour

swaybg -i "$(find $WP_FOLDER/. -type f | shuf -n1)" -m fill &
OLD_PID=$!

while true; do
    sleep $WAIT_TIME
    swaybg -i "$(find $HOME/.wallpapers/. -type f | shuf -n1)" -m fill &
    NEXT_PID=$!
    sleep 5
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done
