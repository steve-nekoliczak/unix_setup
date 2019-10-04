#!/bin/bash

# Setup .vimrc
mv ~/.vimrc ~/.vimrc.bak
cp ~/.unix_setup/.vimrc ~/.vimrc

# Setup global .gitignore
mv ~/.gitignore ~/.gitignore.bak
cp ~/.vim/.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# Setup .bashrc
mv ~/.bashrc ~/.bashrc.bak
cp ~/.vim/.bashrc ~/.bashrc

