#!/bin/sh

GREEN='\033[0;32m'
NC='\033[0m' # No Color

print_message() {
	echo -e "$GREEN$1$NC"
}

print_message "Installing i3"
sudo dnf install -y cava i3 feh kitty playerctl polybar rofi xdotool xclip xev

print_message "Remember to apply dotfiles"
