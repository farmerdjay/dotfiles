#! /usr/bin/env bash

choices="firefox\nmpv\nvlc"

link=$(xsel)
charCount=$(echo -e "$link" | wc -c)

if [ "$charCount" -gt 60 ];
then 
	visual="$(echo -e "$link" | cut -c1-60)"
else 
	visual="$link"
fi

chosen=$(echo -e "$choices" | dmenu -i -l 20 -fn Terminus:size=16 -sb darkred -p "Open '$visual' with...")

case "$chosen" in 
	firefox) firefox "$link";;
	mpv) mpv --really-quiet "$link" 2&>/dev/null & disown;;
	vlc) vlc "$link" 2&>/dev/null & disown;;
esac

