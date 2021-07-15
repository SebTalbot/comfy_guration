#!/bin/bash
A='#30365F74'  # dark
B='#00000000'  # blank
C='#30365F22'  # clear ish
D='#7a5cccff'  # default
T='#b3a1e6ff'  # text
W='#ce6f8fff'  # wrong
V='#ecf0c1ff'  # verifying

killall -SIGUSR1 dunst # pause
setxkbmap us

i3lock \
  --insidever-color=$A   \
  --ringver-color=$V     \
  \
  --insidewrong-color=$A \
  --ringwrong-color=$W   \
  \
  --inside-color=$A \
  --ring-color=$D        \
  --line-color=$B        \
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

killall -SIGUSR2 dunst # resume
