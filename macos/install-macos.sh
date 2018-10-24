#!/bin/bash

# Install neovim
if [ -f ~/.config/nvim/init.vim ]; then
  mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup
fi
brew install neovim
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

# Install plugin manager
brew install curl
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Replace .bash_profile (to add vim aliases)
echo "Replacing ~/.bash_profile and moving it to ~/.bash_profile.backup"
if [ -f ~/.bash_profile ]; then
  mv ~/.bash_profile ~/.bash_profile.backup
fi
cp .bash_profile ~/.bash_profile

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
export PATH=$PATH:/usr/local/bin:/usr/local/sbin

# Install Python 3
brew install python
echo "Checking Python3 installation. Make sure the version is correct in the message below..."
python3 --version
pip3 install neovim --upgrade

# Install CMake (required for the Vim Plug 'YouCompleteMe')
brew install cmake

# Install grip for viewing Github Flavored Markdown (command is grip -b)
brew install grip
