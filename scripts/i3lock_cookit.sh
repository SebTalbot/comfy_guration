#!/bin/bash
A='#1e1e1e44'  # dark
B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#D75F87ff'  # default
T='#4F97D7ff'  # text
W='#B73C33ff'  # wrong
V='#4F97D7ff'  # verifying

pkill -u "$USER" -USR1 dunst
setxkbmap us

~/softwares/i3lock-color/x86_64-pc-linux-gnu/i3lock \
  --insidevercolor=$A   \
  --ringvercolor=$V     \
  \
  --insidewrongcolor=$A \
  --ringwrongcolor=$W   \
  \
  --insidecolor=$A \
  --ringcolor=$D        \
  --linecolor=$B        \
  --separatorcolor=$D   \
  \
  --verifcolor=$T        \
  --wrongcolor=$T        \
  --timecolor=$T        \
  --datecolor=$T        \
  --layoutcolor=$T      \
  --keyhlcolor=$V       \
  --bshlcolor=$V        \
  \
  --screen 1            \
  --blur 5              \
  --clock               \
  --indicator           \
  --timestr="%H:%M:%S"  \
  --datestr="%A, %m %Y" \
  --keylayout 2         \
  -n

pkill -u "$USER" -USR2 dunst
