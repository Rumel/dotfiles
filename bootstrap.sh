#!/usr/bin/env bash

echo "Cloning dotfiles"
git clone https://github.com/Rumel/dotfiles.git ~/.dotfiles

cd ~/.dotfiles
./install.sh
