#!/bin/sh
set -x
MISE="$HOME/.local/share/mise"
RUBY="$MISE/installs/ruby/latest"
GEM="$RUBY/bin/gem"
FUSUMA="$RUBY/bin/fusuma"

if [ ! -f "$FUSUMA" ]; then
	echo "fusuma is not installed"
	eval "$GEM install fusuma"
	notify-send "fusuma installed"
fi

killall fusuma
eval "$FUSUMA -d"
