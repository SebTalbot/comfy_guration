#!/bin/bash
# TODO: install cmus if
# TODO: cmus theme
# TODO: install vis if
# TODO: vis theme

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
    echo "DONE"
  else
    sudo apt update
    echo "DONE"
  fi
fi

# Install gui
echo "Do you want to install the GUI? (y/n)"
read -n 1 INPUT ; echo; echo

GUI=false
if [ $INPUT == "y" ] || [ $INPUT == "Y" ] ; then
  GUI=true
fi

# Force
echo "Do you want to force install? (y/n)"
read -n 1 INPUT ; echo; echo

FORCE=false
if [ $INPUT == "y" ] || [ $INPUT == "Y" ] ; then
  FORCE=true
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#                                                 I N S T A L L   B A S I C S \
# Git
if ! type "git" >/dev/null 2>&1 || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install git
  fi
fi

# WGET
if ! type "wget" >/dev/null 2>&1 || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install wget
  fi
fi

# CURL
if ! type "curl" >/dev/null 2>&1 || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install curl
  fi
fi

# Python
if ! type "python" >/dev/null 2>&1 || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install python
  fi
fi
if ! type "python3" >/dev/null 2>&1 || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install python3
  fi
fi

# PIP
if ! type "pip" >/dev/null 2>&1 || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install python-pip
  fi
fi
if ! type "pip3" >/dev/null 2>&1 || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install python3-pip
  fi
fi

# NPM
if ! type "npm" >/dev/null 2>&1 || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install npm
  fi
fi

# - - - - - - - - -
# S O F T W A R E S

# URXVT
if ! type "urxvt" >/dev/null 2>&1 && $GUI || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install rxvt-unicode-256color
  fi
fi

# NVIM && Plugins dependencies
if ! type "nvim" >/dev/null 2>&1 || $FORCE; then
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

# i3WM-GAPS
if ! type "i3" >/dev/null 2>&1 && $GUI || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo add-apt-repository ppa:aguignard/ppa
    sudo apt-get update
    sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake
    sudo apt install i3

    #i3-gaps
    mkdir -p ~/tmp
    cd ~/tmp
    git clone https://www.github.com/Airblader/i3 i3-gaps
    cd i3-gaps
    autoreconf --force --install
    rm -rf build/
    mkdir -p build && cd build/
    ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
    make
    sudo make install
    cd ~

    #I3LOCK
    sudo apt-get install pkg-config libxcb1-dev libxcb1 libgl2ps-dev libx11-dev libglc0 libglc-dev libcairo2-dev libcairo-gobject2 libcairo2-dev libxkbfile-dev libxkbfile1 libxkbcommon-dev libxkbcommon-x11-dev libxcb-xkb-dev libxcb-dpms0-dev libxcb-damage0-dev libpam0g-dev libev-dev libxcb-image0-dev libxcb-util0-dev libxcb-composite0-dev libxcb-xinerama0-dev
    cd ~/tmp
    git clone git@github.com:karulont/i3lock-blur.git
    cd i3lock-blur
    make
    sudo make install
    cd ~
  fi
fi

#FEH
if ! type "feh" >/dev/null 2>&1 && $GUI || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install feh
  fi
fi

#ROFI
if ! type "rofi" >/dev/null 2>&1 && $GUI || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install rofi
  fi
fi

# Polybar
if ! type "polybar" >/dev/null 2>&1 && $GUI || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev
    mkdir -p ~/tmp
    cd ~/tmp
    git clone --recursive https://github.com/jaagr/polybar
    mkdir polybar/build
    cd polybar/build
    cmake ..
    sudo make install
    cd ~
  fi
fi

#NM-APPLET
if ! type "nm-applet" >/dev/null 2>&1 && $GUI || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install network-manager
  fi
fi

#ALSA MIXER
if ! type "amixer" >/dev/null 2>&1 && $GUI || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install alsa-utils alsamixer
  fi
fi

#COMPTON
if ! type "compton" >/dev/null 2>&1 && $GUI || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    sudo apt install compton
  fi
fi

#FONTS
if $GUI || $FORCE; then
  if [ $DISTRO == "ARCH" ]; then
    echo reee
  else
    mkdir -p ~/tmp
    cd ~/tmp
    git clone git@github.com:powerline/fonts.git
    cd fonts
    ./install.sh
    cd ~
  fi
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#                                                             D O T F I L E S \
INPUT=false;
echo
echo "Do you want to use dotfiles from ~/comfy_guration/dotfiles? (y/n)"
read -n 1 INPUT ; echo; echo

if [ $INPUT == "y" ] || [ $INPUT == "Y" ] ; then
  # Activate laptop dotfiles
  LAPTOP=false;
  INPUT=false;
  echo "Are you on a laptop (y/n)"
  read -n 1 INPUT ; echo; echo
  if [ $INPUT == "y" ] || [ $INPUT == "Y" ] ; then
    LAPTOP=true;
  fi

  # NVIM dotfile
  INPUT=false;
  echo "Do you want to use NVIM dotfile? (y/n)"
  read -n 1 INPUT ; echo; echo
  if [ $INPUT == "y" ] || [ $INPUT == "Y" ] ; then
    mkdir -p ~/.config
    mkdir -p ~/.config/nvim
    ln -s -f ~/comfy_guration/dotfiles/init.vim ~/.config/nvim/init.vim
    echo "DONE"
  fi

  # i3wm dotfile
  INPUT=false;
  echo "Do you want to use i3WM dotfile? (y/n)"
  read -n 1 INPUT ; echo; echo
  if [ $INPUT == "y" ] || [ $INPUT == "Y" ] ; then
    mkdir -p ~/.config
    mkdir -p ~/.config/i3/
    if [ $LAPTOP ] ; then
      ln -s -f ~/comfy_guration/dotfiles/i3_laptop ~/.config/i3/config
      echo "DONE"
    fi
  fi

  # polybar dotfile
  INPUT=false;
  echo "Do you want to use polybar dotfile? (y/n)"
  read -n 1 INPUT ; echo; echo
  if [ $INPUT == "y" ] || [ $INPUT == "Y" ] ; then
    mkdir -p ~/.config
    mkdir -p ~/.config/polybar/
    if [ $LAPTOP ] ; then
      ln -s -f ~/comfy_guration/dotfiles/polybar_laptop ~/.config/polybar/config
      echo "DONE"
    fi
  fi

  # URXVT dotfile
  INPUT=false;
  echo "Do you want to use URXVT dotfile? (y/n)"
  read -n 1 INPUT ; echo; echo
  if [ $INPUT == "y" ] || [ $INPUT == "Y" ] ; then
    ln -s -f ~/comfy_guration/dotfiles/Xresources ~/.Xresources
    xrdb ~/.Xresources
    echo "DONE"
  fi
fi
