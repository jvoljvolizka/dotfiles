#!/bin/bash
Clock(){
	DATE=$(date "+%m.%d.%y")
	TIME=$(date "+%R")

	echo -e -n "\uf073 ${DATE} \uf017 ${TIME}"
}

ActiveWindow(){
	echo -n $(xdotool getwindowfocus getwindowname)
}


Ip(){
	 ifconfig | grep "inet " | awk '{print $2}' | tr '\n' ' '
}

Sound(){
	amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p'
}


Memory(){
	 free -h | grep Mem | awk '{print $3}'
}
Battery(){
    BATC=/sys/class/power_supply/BAT1/capacity
    BATS=/sys/class/power_supply/BAT1/status

    test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'

    sed -n p $BATC

}

while :; do
	echo -e "%{c} $(ActiveWindow) " "%{r} \uf26b $(Ip) \uf2db $(Memory) \uf028 $(Sound)  \uf240 $(Battery)  $(Clock)  " 
	#echo -e "%{c}$(ActiveWindow)" "%{r}$(Wifi)  $(Battery)  $(Sound)  $(Clock)"

	
    # use `nowplaying scroll` to get a scrolling output!
    sleep 1 # The HUD will be updated every second
done



