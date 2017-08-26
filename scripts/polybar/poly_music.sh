#!/bin/bash

icon=""
if pgrep -x "cmus" > /dev/null;then
	player_status=$(~/comfy_guration/scripts/polybar/playerctl-cmus status)
	if [[ $? -eq 0 ]]; then
		metadata="$(~/comfy_guration/scripts/polybar/playerctl-cmus metadata artist) - $(~/comfy_guration/scripts/polybar/playerctl-cmus metadata title)"
	fi

	if [[ $player_status = "playing" ]]; then
		echo "%{F#ececec}$icon $metadata"
	elif [[ $player_status = "paused" ]]; then
		echo "%{F#65737E}$icon $metadata"
	else
		echo ""
	fi
else
	echo ""
fi
