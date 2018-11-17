#! /usr/bin/env bash

choices="rthk1\nrthk2\nrthk4\nkpcc\nkmrb\nkiis\nCBSN\nKill mpv"

chosen=$(echo -e "$choices" | dmenu -i -l 20 -fn Terminus:size=28 -sb darkred)

case "$chosen" in 
	rthk1) mpv --really-quiet http://stm.rthk.hk/radio1 2&>/dev/null & disown;;
	rthk2) mpv --really-quiet http://stm.rthk.hk/radio2 2&>/dev/null & disown;;
	rthk4) mpv --really-quiet http://stm.rthk.hk/radio4 2&>/dev/null & disown;;
	kpcc) mpv --really-quiet http://kpcclive1.publicradio.org/kpcclive/ 2&>/dev/null & disown;;
	kmrb) mpv --really-quiet http://mobilewzrc.serverroom.us:6916/\;stream 2&>/dev/null & disown;;
	kiis) mpv --really-quiet http://c2icyelb.prod.playlists.ihrhls.com/185_icy 2&>/dev/null & disown;;
	CBSN) mpv --really-quiet https://www.youtube.com/watch?v=75a6YwQ1Sc0 2&>/dev/null & disown;;
	"Kill mpv") pkill mpv;;
esac

