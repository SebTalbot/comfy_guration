#!/bin/bash
source ~/comfy_guration/scripts/manager/utils.sh

u_link_file "PROMPT" "P10K" ~/comfy_guration/dotfiles/common/p10k ~/.p10k.zsh
u_link_file "SHELL" "ZSH" ~/comfy_guration/dotfiles/common/zsh ~/.zshrc
# u_link_file "DIRECTORIES" "XDG" ~/comfy_guration/dotfiles/common/xdg_directories ~/.config/user-dirs.dirs
# u_link_file "MIRRORS" "REFLECTOR" ~/comfy_guration/dotfiles/common/reflector /etc/xdg/reflector/reflector.conf "sudo"
u_link_file "TUI_FILES_MANAGER" "YAZI" ~/comfy_guration/dotfiles/common/yazi ~/.config/yazi

# temporary copy because sym link doesn't work
sudo cp -f ./reflector /etc/xdg/reflector/reflector.conf
cp -f ./xdg_directories ~/.config/user-dirs.dirs
