#!/bin/bash

# Already installed in Manjaro i3
# file manager: pcmanfm
# theme manager: lxappearance
# greeter: lightdm

# Dependencies system
# - paru
mkdir ~/tmp
cd ~/tmp
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
# - picom
paru -S picom
# - kitty
paru -S kitty
# - polybar
paru -S polybar
# - rofi
paru -S rofi
# - feh
paru -S feh
# - pulseaudio
paru -S pulseaudio

# - fzf
paru -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

ln -sf ~/comfy_guration/dotfiles/common/zshrc ~/.zshrc
ln -sf ~/comfy_guration/dotfiles/common/p10k.zsh ~/.p10k.zsh 

# - fonts
# Nerd Fonts
# cd ~/tmp
# git clone git@github.com:ryanoasis/nerd-fonts.git
# cd nerd-fonts
# ./install.sh

# Custome fonts
# ~/.local/share/fonts
# mv X ~/.local/share/fonts/
