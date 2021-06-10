#!/bin/bash

current_layouts=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')

if [ "$current_layouts" = "us" ]; then
  setxkbmap ca,fr; xset -r 66
elif [ "$current_layouts" = "ca" ]; then
  setxkbmap us; xset -r 66
else
  setxkbmap -v workman && xset r 66 
fi
