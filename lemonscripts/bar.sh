#!/bin/bash
Clock(){
	DATE=$(date "+%m.%d.%y")
	TIME=$(date "+%R")

	echo -e -n "\uf073 ${DATE} \uf017 ${TIME}"
}

ActiveWindow(){
	echo -n $(xdotool get_desktop getwindowfocus getwindowname | tr '\n' ' ')
}


Ip(){
	SSID=$(iwconfig 2>/dev/null |  grep -oP 'ESSID:"\K[^"]+')
	IP=$(ifconfig | grep "inet " | awk '{print $2}' | tr '\n' ' ' | cut -b 11-)
	echo -e -n "${SSID} ${IP}"  
}

Sound(){

	if amixer get Master | grep --quiet "\[on\]"; then
		SOUN="\uf028"
	else
		SOUN="\uf026"
	fi
	VOL=$(amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p')
	echo -e -n "${SOUN} ${VOL}"
}


Memory(){
	 free -h --si | grep Mem | awk '{print $3}'
}

battery () {
	battery="$(</sys/class/power_supply/BAT1/capacity)"
	charging="$(</sys/class/power_supply/BAT1/status)"

	case "$battery" in
		[0-9]|10)
			battery="\uf244 ${battery}"
		;;

		1[0-9]|2[0-5])
			battery="\uf243 ${battery}"
		;;

		2[6-9]|3[0-9]|4[0-9]|50)
			battery="\uf242 ${battery}"
		;;

		5[1-9]|6[0-9]|7[0-5])
			battery="\uf241 ${battery}"
		;;

		7[6-9]|8[0-9]|9[0-9]|100)
			battery="\uf240 ${battery}"
		;;
	esac

	[ "$charging" == "Charging" ] && \
		battery="CHR $battery"

	printf "%s" "$battery"
}

Music() {
	mpc current 2>/dev/null
}

while :; do
	echo -e "%{l} $PANEL_FIFO $(ActiveWindow) " "%{c} $(Music)" "%{r} \uf26b $(Ip)- \uf2db $(Memory) - $(Sound) - $(battery) - $(Clock)  " 
	
done

