#!/bin/bash
SEARCH='USB-HID Keyboard Mouse'
if [ "$SEARCH" = "" ]; then 
    exit 1
fi

ids=$(xinput --list | awk -v search="$SEARCH" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )

for i in $ids
do
  xinput set-prop $i "Device Accel Profile" 7
  xinput set-prop $i "Device Accel Velocity Scaling" 2.0
done
