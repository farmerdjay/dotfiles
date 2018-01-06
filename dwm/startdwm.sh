#/bin/bash

#make -C /home/jason/codes/dwm

setxkbmap -option caps:escape

xinput set-prop 'ELAN0501:00 04F3:3018 Touchpad' 'libinput Tapping Enabled' 1
xinput set-prop 'ELAN0501:00 04F3:3018 Touchpad' 'libinput Natural Scrolling Enabled' 1

while true
do
	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
	#LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
	LOCALTIME=$(date)
	OTHERTIME=$(TZ=Europe/London date +%Z\=%H:%M)
	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

	if acpi -a | grep off-line > /dev/null
	then
		BAT="Bat:$(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
		xsetroot -name "$BAT $IP $VOL $TEMP $LOCALTIME"
	else
		xsetroot -name "$IP $VOL $TEMP $LOCALTIME" 
	fi
	sleep 5s
done &

exec redshift-gtk &
exec feh --randomize --bg-fill ~/Dropbox/Photos/wallpapers &
exec compton -CG &

exec /home/jason/codes/dwm/dwm
