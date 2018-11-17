#/bin/bash

#make -C /home/jason/codes/dwm

setxkbmap -option caps:escape

xinput set-prop 'ELAN0501:00 04F3:3018 Touchpad' 'libinput Tapping Enabled' 1
xinput set-prop 'ELAN0501:00 04F3:3018 Touchpad' 'libinput Natural Scrolling Enabled' 1

export PATH="${PATH}:$HOME/codes/scripts"

### cmus =================================
function CMUS(){
	cmusstatus=$(cmus-remote -C status)
	grep position <<< "$cmusstatus" 1>/dev/null 2>&1
	if [ ! $? -eq 0 ]; then exit; fi
	
	strindex() {
	  x="${1%%$2*}"
	  [[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
	}
	
	prepend_zero () {
	    seq -f "%02g" $1 $1
	}
	
	get_all_but_first() {
	  shift
	  echo "$@"
	}
	
	get_stat() {
	  line=$(grep "$1" -m 1 <<< "$cmusstatus")
	  a=$(strindex "$line" "$1")
	  sub="${line:a}"
	  echo "$(get_all_but_first $sub)"
	}
	
	min_sec_from_sec() {
	  echo -n "$(prepend_zero $(($1 / 60))):$(prepend_zero $(($1 % 60)))"
	}
	
	echo -n "$(get_stat title) - $(get_stat artist) [$(min_sec_from_sec $(get_stat position))/$(min_sec_from_sec $(get_stat duration))]    "
}
### cmus end =============================

# CPU line courtesy Procyon:
# https://bbs.archlinux.org/viewtopic.php?pid=874333#p874333
function CPU(){
	read cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu="$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))"
	echo -e "$cpu%"
	}

while true
do
	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
	LOCALTIME=$(date +%b\ %d\ %a\ %r)
	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
	MEM=$(free -h | awk 'FNR == 2 {print $3}' | tr -d 'i') 


	if acpi -a | grep off-line > /dev/null
	then
		BAT="Bat:$(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
		if pgrep -x cmus > /dev/null
		then
			xsetroot -name "$(CMUS) $(CPU) $MEM $BAT $IP $VOL $TEMP $LOCALTIME"
		else

			xsetroot -name "$(CPU) $MEM $BAT $IP $VOL $TEMP $LOCALTIME"
		fi
	else
		if pgrep -x cmus > /dev/null
		then
			xsetroot -name "$(CMUS) $(CPU) $MEM $IP $VOL $TEMP $LOCALTIME" 
		else
			xsetroot -name "$(CPU) $MEM $IP $VOL $TEMP $LOCALTIME" 
		fi
	fi
	sleep 2s
done &


exec /home/jason/codes/scripts/turn-off-eDP1-when-connected-to-HDMI1.sh &
exec redshift-gtk &
exec feh --randomize --bg-fill ~/Dropbox/Photos/wallpapers &
exec compton -CG &
exec clipmenud &

exec /home/jason/codes/dwm/dwm
