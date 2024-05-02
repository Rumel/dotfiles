#!/bin/sh

pgrep -l polybar || polybar -r -c ~/.config/polybar/config.ini &
