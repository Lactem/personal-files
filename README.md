Scripts to setup my work environment on a Macbook once it's dual-booted with Debian 9 (Stretch) and macOS.

## Debian 9
git clone https://github.com/Lactem/personal-files.git
cd personal-files/debian9
./install-debian9stretch.sh

## macOS
git clone https://github.com/Lactem/personal-files.git
cd personal-files/macos
chmod +x install-macos.sh
./install-macos.sh

Note: You may need to open a file with vim and type ':PlugInstall' to finish setting up neovim.
Note: Don't forget to finish basic git configuration:
$ git config --global user.name "Lactem"
$ git config --global user.email tilie@usc.edu
$ git config --global core.editor nvim

Check the configuration with git config --list.
