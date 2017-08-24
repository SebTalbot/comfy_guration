#!/bin/bash
clear
echo "  - - - - - - - - - - - - - - - -"
echo "/ D O T F I L E S   M A N A G E R \\"
echo

# Check if using pacman (arch) or apt (debian)
DISTRO=false
if type "pacman" >/dev/null 2>&1; then
  DISTRO="ARCH"
elif type "apt" >/dev/null 2>&1; then
  DISTRO="DEBIAN"
else
  echo "Not a valid distro"
  exit 0
fi

echo "- Using GNU/Linux: $DISTRO"; echo

# Update repo
echo "Do you want to update? (y/n)"
read -n 1 INPUT ; echo; echo

UPDATE=false
if [ $INPUT == "y" ] || [ $INPUT == "Y" ] ; then
  UPDATE=true
fi

if $UPDATE; then
  if [ $DISTRO == "ARCH" ]; then
    sudo pacman -Syu
  else
    sudo apt update
  fi
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#                                                 I N S T A L L   B A S I C S \
# Git
if ! type "git" >/dev/null 2>&1; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install git
  fi
fi

# WGET
if ! type "wget" >/dev/null 2>&1; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install wget
  fi
fi

# CURL
if ! type "curl" >/dev/null 2>&1; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install curl
  fi
fi

# Python
if ! type "python" >/dev/null 2>&1; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install python
  fi
fi
if ! type "python3" >/dev/null 2>&1; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install python3
  fi
fi

# PIP
if ! type "pip" >/dev/null 2>&1; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install python-pip
  fi
fi
if ! type "pip3" >/dev/null 2>&1; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install python3-pip
  fi
fi

# NPM
if ! type "npm" >/dev/null 2>&1; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install npm
  fi
fi

# - - - - - - - - -
# S O F T W A R E S

# URXVT
if ! type "urxvt" >/dev/null 2>&1; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install rxvt-unicode-256color
  fi
fi

# NVIM && Plugins dependencies
if ! type "nvim" >/dev/null 2>&1; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install software-properties-common
    sudo apt install python-software-properties

    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt update

    sudo apt install neovim
    sudo apt install python-dev python-pip python3-dev python3-pip
  fi

  mkdir ~/.config
  mkdir ~/.config/nvim
  ln -s -f ~/comfy_guration/dotfiles/init.vim ~/.config/nvim/init.vim

  # Plugins manager
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  ## Jedi
  pip3 install --user neovim jedi mistune psutil setproctitle

  ## React Lint
  sudo npm install -g eslint
  sudo npm install -g babel-eslint
  sudo npm install -g eslint-plugin-react
  sudo npm install -g react-tools
  sudo npm install -g syntastic-react
fi
