#!/bin/bash
# Need Blurlocker https://github.com/SafwanLjd/BlurLocker
function prelock() {
  killall -SIGUSR1 dunst
  amixer -D pulse set Master 1+ mute
  setxkbmap us
}

function postlock() {
  killall -SIGUSR2 dunst
  amixer -D pulse set Master 1+ unmute
}

function lock() {
  local A='#282828cc'  # dark
  local B='#00000000'  # blank
  local C='#28282822'  # clear ish
  local D='#d79921'  # default
  local T='#d79921'  # text
  local W='#fb4934'  # wrong
  local V='#458588'  # verifying

  blurlock \
    --insidever-color=$A   \
    --ringver-color=$V     \
    \
    --insidewrong-color=$A \
    --ringwrong-color=$W   \
    \
    --inside-color=$A \
    --ring-color=$D        \
    --line-color=$A        \
    --separator-color=$D   \
    \
    --verif-color=$T        \
    --wrong-color=$W        \
    --time-color=$T        \
    --date-color=$T        \
    --layout-color=$T      \
    --keyhl-color=$V       \
    --bshl-color=$V        \
    \
    --screen 1            \
    --blur 9              \
    --clock               \
    --indicator           \
    --time-str="%H:%M:%S"  \
    --date-str="%A, %m %Y" \
    --keylayout 2         \
    -n
}

prelock
lock
postlock
delpid
