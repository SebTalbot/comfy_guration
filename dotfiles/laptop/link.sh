#!/bin/bash
safe_mkdir () {
  if [ ! -d "$1" ]; then
    mkdir $1
  fi
}

safe_mkdir "$HOME/.config/i3"
ln -sf $HOME/comfy_guration/dotfiles/laptop/i3_laptop $HOME/.config/i3/config

safe_mkdir "$HOME/.config/polybar"
ln -sf $HOME/comfy_guration/dotfiles/laptop/polybar_laptop $HOME/.config/polybar/config

safe_mkdir "$HOME/.config/rofi"
ln -sf $HOME/comfy_guration/dotfiles/laptop/rofi_config.rasi $HOME/.config/rofi/config.rasi

safe_mkdir "$HOME/.config/kitty"
ln -sf $HOME/comfy_guration/dotfiles/laptop/kitty.conf $HOME/.config/kitty/kitty.conf 
