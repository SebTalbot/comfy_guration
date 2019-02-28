#!/bin/bash

if [[ $(awk '/muted/ {print $2}' <(pacmd list-sinks)) = 'no' ]]; then
  echo $(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
else
  echo 
fi
