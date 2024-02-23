#!/bin/bash
config_file="$1"

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar --config=$config_file --reload main
