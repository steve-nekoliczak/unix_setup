#!/bin/bash

ln -s ~/.unix_setup/config_files/.Xresources ~/.Xresources
ln -s ~/.unix_setup/config_files/.bashrc ~/.bashrc
ln -s ~/.unix_setup/config_files/.ctags ~/.ctags
ln -s ~/.unix_setup/config_files/.gitignore ~/.gitignore
ln -s ~/.unix_setup/config_files/.git-completion.bash ~/.git-completion.bash
ln -s ~/.unix_setup/config_files/.inputrc ~/.inputrc
ln -s ~/.unix_setup/config_files/.tmux.conf ~/.tmux.conf
ln -s ~/.unix_setup/config_files/.tmux/ ~/
ln -s ~/.unix_setup/config_files/.vimrc ~/.vimrc

mkdir -p ~/.tmux/
ln -st ~/.tmux/ ~/.unix_setup/config_files/.tmux/plugins/

# setup nvim by symlinking existing vim files
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
ln -s ~/.vim/* ~/.config/nvim/
