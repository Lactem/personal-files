#!/bin/bash

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

sudo apt-get install vim git nodejs


echo ""
echo "***"
echo "~/.vimrc is being replaced. The old file will be moved to ~/.vimrc.backup."
echo "***"
echo ""
if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.backup
fi
cp .vimrc ~/.vimrc
