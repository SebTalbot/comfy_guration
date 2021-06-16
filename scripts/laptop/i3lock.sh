#!/bin/bash
A='#494a4574'  # dark
B='#00000000'  # blank
C='#494a4522'  # clear ish
D='#ad6143ff'  # default
T='#d8c29dff'  # text
W='#b73c33ff'  # wrong
V='#494a45ff'  # verifying

killall -s SIGSTOP notify-osd
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

killall -s SIGCONT notify-osd
