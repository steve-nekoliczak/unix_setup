#!/bin/bash

# Setup .vimrc
cp -n ~/.unix_setup/.vimrc ~/.vimrc

# Setup global .gitignore
cp -n ~/.unix_setup/.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# Setup .bashrc
cp -n ~/.unix_setup/.bashrc ~/.bashrc

