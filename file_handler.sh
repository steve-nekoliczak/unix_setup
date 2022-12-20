#!/bin/bash

ln -s ~/.unix_setup/config_files/.Xresources ~/.Xresources
ln -s ~/.unix_setup/config_files/.zshrc ~/.zshrc
ln -s ~/.unix_setup/config_files/.gitignore ~/.gitignore
ln -s ~/.unix_setup/config_files/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/nvim/
ln -s ~/.unix_setup/config_files/init.lua ~/.config/nvim/init.lua
