#!/bin/bash
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar -c ~/comfy_guration/dotfiles/home/polybar_home -r left &
polybar -c ~/comfy_guration/dotfiles/home/polybar_home -r right &
