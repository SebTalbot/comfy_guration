#!/bin/bash

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

mkdir ~/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ln -s ~/comfy_guration/dotfiles/common/init.vim ~/.config/nvim/init.vim
