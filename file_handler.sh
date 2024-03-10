#!/bin/bash

ln -s ~/.unix_setup/config_files/.xinitrc ~/.xinitrc
ln -s ~/.unix_setup/config_files/.Xresources ~/.Xresources
ln -s ~/.unix_setup/config_files/.zshrc ~/.zshrc
ln -s ~/.unix_setup/config_files/.gitignore ~/.gitignore
ln -s ~/.unix_setup/config_files/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/nvim/
ln -s ~/.unix_setup/config_files/init.lua ~/.config/nvim/init.lua
ln -s ~/.unix_setup/config_files/coc-settings.json ~/.config/nvim/coc-settings.json
mkdir -p ~/.config/kitty/
ln -s ~/.unix_setup/config_files/kitty.conf ~/.config/kitty/kitty.conf
