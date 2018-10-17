#!/bin/bash

# Setup sudo and aptitude sources
echo "Installing sudo. You will need to enter your password for root."
su -c 'apt-get install sudo'

echo ""
echo "***"
echo "/etc/apt/sources.list is being replaced. The old file will be moved to /etc/apt/sources.list.backup."
echo "***"
echo ""
sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo cp sources.list /etc/apt/sources.list
sudo apt-get update && sudo apt-get upgrade

# Remove vim and install neovim in its place
read -r -p "Would you like to remove vim and replace it with neovim? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  if [ -f ~/.config/nvim/init.vim ]; then
    mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup
  fi
  sudo apt-get remove vim*
  sudo apt-get install neovim
  mkdir -p ~/.config/nvim
  cp init.vim ~/.config/nvim/init.vim

  # Install plugin manager
  sudo apt-get install curl
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Use a different init.vim for root
  mkdir -p /root/.config/nvim
  cp init_room.vim /root/.config/nvim/init.vim
fi

sudo apt-get install nodejs

# Configure touchpad (use libinput)
# TODO: Check that proper dependencies are installed (libinput, xorg packages, display manager, etc...) and /etc/X11/xorg.conf.d exists
sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
echo "Touchpad settings have been updated but won't take effect until the display manager (probably gdm3 or lightdm) is restarted."
