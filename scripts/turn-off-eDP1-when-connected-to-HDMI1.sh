#!/bin/bash

if (xrandr | grep -q 'HDMI1 connected')
then
	xrandr --output eDP1 --off
	echo "eDP1 is off."
else
	echo "There is no HDMI1."
fi

