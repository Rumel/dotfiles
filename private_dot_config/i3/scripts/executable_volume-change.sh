#!/bin/sh

CURRENT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | head -1 | cut -d "/" -f 2)

echo $CURRENT_VOLUME

if [ $1 = 'volup' ]; then
	echo "Up"
	pactl set-sink-volume 0 +5%
	MSG='Volume up'
	getnewvol
elif [ $1 = 'voldown' ]; then
	echo "Down"
	pactl set-sink-volume 0 -5%
	MSG='Volume down'
	getnewvol
elif [ $1 = 'volmute' ]; then
	echo "Mute"
	pactl set-sink-mute 0 toggle
	if [ $(pactl list sinks | grep Mute | awk '{print $2}') = 'yes' ]; then
		MSG='Mute'
		ICON='audio-volume-muted'
	else
		MSG='Unmute'
		ICON='audio-volume-muted'
	fi
	getnewvol
fi
