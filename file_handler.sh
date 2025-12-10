#!/bin/bash

ln -s ~/.unix_setup/config_files/.zshrc ~/.zshrc
ln -s ~/.unix_setup/config_files/.gitignore ~/.gitignore
ln -s ~/.unix_setup/config_files/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/nvim/
ln -s ~/.unix_setup/config_files/init.lua ~/.config/nvim/init.lua
mkdir -p ~/.config/kitty/
ln -s ~/.unix_setup/config_files/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/.unix_setup/config_files/.ideavimrc ~/.ideavimrc
