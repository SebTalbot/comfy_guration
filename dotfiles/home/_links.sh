#!/bin/bash
source ~/comfy_guration/scripts/manager/utils.sh

u_link_file "LAUNCHER" "Rofi" ~/comfy_guration/dotfiles/home/rofi ~/.config/rofi/config.rasi
u_link_file "TERMINAL" "Kitty" ~/comfy_guration/dotfiles/home/kitty ~/.config/kitty/kitty.conf
u_link_file "WINDOWS_MANAGER" "I3" ~/comfy_guration/dotfiles/home/i3wm ~/.config/i3/config
u_link_file "ZSH" "local_env" ~/comfy_guration/dotfiles/home/zsh_local_env ~/.zsh_local_env

# Linked in i3wm warning
__i3_link () {
  declare tag="$1" name="$2"
  echo -e "${COLOR_CYAN} ? [${tag}] ${name} is linked through i3wm${COLOR_DEFAULT}"
}

__i3_link "COMPOSITOR" "Picom"
__i3_link "NOTIFICATION" "Dunst"
__i3_link "TOP_BAR" "Polybar"
