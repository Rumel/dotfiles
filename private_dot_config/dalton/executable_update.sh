#!/usr/bin/env sh

# Update all the tools script

set -v
set -e

# Pull latest
cd ~/.local/share/chezmoi && git pull
cd ~/.config/nvim/lua/custom && git pull

# Apply dotfiles
chezmoi apply

# source ~/.zshrc

# Update NvChad
nvim +NvChadUpdate +qall
# Add in PackerSync
# Add in MasonInstall

# Update homebrew and all packages
brew update
brew upgrade

# Install languages
asdf install ruby latest
asdf global ruby latest
asdf install python latest
asdf global python latest
asdf install nodejs lts
asdf global nodejs lts

rm -rf ~/.asdf/shims
asdf reshim
