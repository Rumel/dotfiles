#!/bin/sh

GREEN='\033[0;32m'
NC='\033[0m' # No Color

print_message() {
	echo -e "$GREEN$1$NC"
}

print_message "Installing i3"
sudo dnf groups install "i3 desktop" -y

print_message "Installing some more tools"
sudo dnf install -y polybar rofi xev

print_message "Checking for libinput-gestures"
if [ ! -d "$HOME/Code/libinput-gestures" ]; then
	print_message "Installing libinput-gestures"
	mkdir -p ~/Code
	git clone https://github.com/bulletmark/libinput-gestures.git ~/Code/libinput-gestures
	sudo dnf install -y wmctrl xdotool
	sudo gpasswd -a $USER input

	cd ~/Code/libinput-gestures
	sudo ./libinput-gestures-setup install
	libinput-gestures-setup autostart start
fi

print_message "Remember to apply dotfiles"
