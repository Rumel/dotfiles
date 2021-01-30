#!/usr/bin/env bash
#
# bootstrap installs things.
#
# This file is pretty much stolen from Zach Holman
# https://www.github.com/holman

DOTFILES_ROOT=~/.dotfiles

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $(basename "$src"), what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

clone_repo() {
  local url=$1 directory=$2 create=$3 symbolic=$4
  
  info "Checking repo $directory\n"

  if [ "$create" != "" ]; then
    echo "$symbolic"
    if [[ -h "$symbolic" ]]; then
      info "Removing symbolic link for $symbolic\n"

      rm "$symbolic"
    fi

    mkdir -p "$create"
  fi

  if [[ -h "$directory" ]]; then
    info "Removing symbolic link for $directory\n"
    rm "$directory"
  fi

  if [[ ! -d "$directory" ]]; then
    git clone "$url" "$directory"
    info "Cloned $url\n"
  fi
}

[ ! -e "$DOTFILES_ROOT/zsh/local-machine.symlink" ] && cp "$DOTFILES_ROOT/zsh/local-machine.symlink.example" "$DOTFILES_ROOT/zsh/local-machine.symlink"

install_dotfiles

# if hash brew 2> /dev/null; then
#   # xargs brew install < ~/.dotfiles/brew/installs
#   cat ~/.dotfiles/brew/installs | while read line 
#   do
#     if ! [[ hash $line 2> /dev/null ]]; then
#       brew upgrade $line
#     else
#       brew install $line
#     fi
#   done
# else
#   echo "Brew needs to be installed"
# fi

if ! hash rustc 2> /dev/null; then
  info "Installing rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if ! hash volta 2> /dev/null; then
  info "Installing Volta"
  curl https://get.volta.sh | bash
fi

clone_repo https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
clone_repo https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim ~/.vim/bundle ~/.vim

mkdir -p $HOME/go

info "Updating Vim plugins"
vim +PluginInstall +qall

echo ''
echo '  All installed!'
