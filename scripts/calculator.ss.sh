#!/usr/bin/env bash

while inp=$(echo -e "$oup" | dmenu -l 20 -fn Terminus:size=16 -p  Calculate:)
do
    if oup2=$(calc -pd "$inp"); then
        echo -n "$oup2" | xsel -i
        oup="$oup2\n$oup"
    fi
done
