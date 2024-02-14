#!/bin/bash

current_layouts=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')

if [ "$current_layouts" = "us" ]; then
    setxkbmap ca,fr; xset -r 66
else
    setxkbmap us; xset -r 66
fi
