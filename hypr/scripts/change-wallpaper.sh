#!/bin/bash

DIR="$HOME/Pictures/Wallpapers"
WALL=$(find "$DIR" -type f | shuf -n 1)

awww img "$WALL" --transition-type fade --transition-duration 2
