#!/bin/bash
# Need Blurlocker https://github.com/SafwanLjd/BlurLocker
function prelock() {
  killall -SIGUSR1 dunst
  pamixer -t
  setxkbmap us
}

function postlock() {
  killall -SIGUSR2 dunst
}

function lock() {
  local A='#2c2a38'  # dark
  local B='#00000000'  # blank
  local C='#28282822'  # clear ish
  local D='#bd93f9'  # default
  local T='#bd93f9'  # text
  local W='#ff5555'  # wrong
  local V='#ff92df'  # verifying

  i3lock \
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
