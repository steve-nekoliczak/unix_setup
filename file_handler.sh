#!/bin/bash

ln -s ~/.unix_setup/config_files/.Xresources ~/.Xresources
ln -s ~/.unix_setup/config_files/.zshrc ~/.zshrc
ln -s ~/.unix_setup/config_files/.gitignore ~/.gitignore
ln -s ~/.unix_setup/config_files/.tmux.conf ~/.tmux.conf
mkdir ~/.xmonad
ln -s ~/.unix_setup/config_files/xmonad.hs ~/.xmonad/xmonad.hs
mkdir -p ~/.config/nvim/
ln -s ~/.unix_setup/config_files/init.lua ~/.config/nvim/init.lua
mkdir -p ~/.config/sakura/
ln -s ~/.unix_setup/config_files/sakura.conf ~/.config/sakura/sakura.conf
