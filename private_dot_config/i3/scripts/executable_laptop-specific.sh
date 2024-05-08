#!/bin/sh

if [ ! -d ~/.wallpapers ]; then
	ln -s ~/Dropbox/Wallpapers ~/.wallpapers
fi

HOSTNAME=$(hostname)
if [ "fedora-dell" = "$HOSTNAME" ]; then
	xrandr --output eDP-1 --mode 1680x1050

	xinput set-prop "VEN_04F3:00 04F3:32AA Touchpad" "libinput Tapping Enabled" 1
	xinput set-prop "VEN_04F3:00 04F3:32AA Touchpad" "libinput Natural Scrolling Enabled" 1
elif [ "fedora-macbook" = "$HOSTNAME" ]; then
	xrandr --newmode "1440x900_60.00" 106.50 1440 1528 1672 1904 900 903 909 934 -hsync +vsync
	xrandr --addmode eDP-1 "1440x900_60.00"
	xrandr --output eDP-1 --mode 1440x900_60.00
fi

~/.scripts/randomize-background.sh
