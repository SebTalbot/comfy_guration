#!/bin/bash
source ~/comfy_guration/scripts/manager/utils.sh

u_link_file "PROMPT" "P10K" ~/comfy_guration/dotfiles/common/p10k ~/.p10k.zsh
u_link_file "SHELL" "ZSH" ~/comfy_guration/dotfiles/common/zsh ~/.zshrc
u_link_file "DIRECTORIES" "XDG" ~/comfy_guration/dotfiles/common/xdg_directories ~/.config/user-dirs.dirs
