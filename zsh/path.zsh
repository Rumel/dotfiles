# Any global bath options can go here


# Then load the local configuration
if [[ -a $DOTFILES/zsh/local.zsh ]]; then
  source $DOTFILES/zsh/local.zsh
fi
