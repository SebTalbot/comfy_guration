#!/bin/bash
xrandr --output DP-0 --primary --mode 3440x1440 --rate 120
xrandr --output DVI-I-1 --left-of DP-0 --mode 1920x1080 --rotate left
feh --bg-fill ~/pictures/wallpapers/montains.png

compton --config ~/comfy_guration/dotfiles/compton_home.conf
