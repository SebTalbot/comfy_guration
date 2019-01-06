#!/bin/bash
xrandr --output DVI-I-1 --primary
xrandr --output DVI-D-0 --left-of DVI-I-1
feh --bg-fill ~/pictures/background/synthwave.jpg

~/comfy_guration/scripts/polybar/lauch_cookit.sh
