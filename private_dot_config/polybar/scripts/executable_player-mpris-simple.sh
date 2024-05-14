#!/bin/sh

player_status=$(playerctl status 2>/dev/null)

if [ "$player_status" = "Playing" ]; then
  ARTIST=$(playerctl metadata artist 2>/dev/null)
  TITLE=$(playerctl metadata title 2>/dev/null)
  if [ -z "$ARTIST" ]; then
    STR=$TITLE
  else
    STR="$TITLE - $ARTIST"
  fi

	echo ${STR:0:30}
elif [ "$player_status" = "Paused" ]; then
  ARTIST=$(playerctl metadata artist 2>/dev/null)
  TITLE=$(playerctl metadata title 2>/dev/null)
  if [ -z "$ARTIST" ]; then
    STR=$TITLE
  else
    STR="$TITLE - $ARTIST"
  fi

  STR="󰏤 $STR"
  echo ${STR:0:30}
else
	echo ""
fi
