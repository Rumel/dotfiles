#!/bin/sh

HOSTNAME=$(hostname)
if [ "fedora-dell" = "$HOSTNAME" ]; then
	xrandr --output eDP-1 --mode 1680x1050
	feh --bg-fill ~/Dropbox/Wallpapers/cat-white-background.jpeg

	xinput set-prop "VEN_04F3:00 04F3:32AA Touchpad" "libinput Tapping Enabled" 1
	xinput set-prop "VEN_04F3:00 04F3:32AA Touchpad" "libinput Natural Scrolling Enabled" 1
fi
