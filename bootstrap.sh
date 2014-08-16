#!/usr/bin/env bash

echo "Cloning dotfiles"
git clone git@github.com:rumel/dotfiles.git ~/.dotfiles

cd ~/.dotfiles
./install.sh
