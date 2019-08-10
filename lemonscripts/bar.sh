#!/bin/bash
Clock(){
	DATE=$(date "+%m.%d.%y")
	TIME=$(date "+%R")

	echo -e -n "\uf073 ${DATE} \uf017 ${TIME}"
}

ActiveWindow(){
	echo -n $(xdotool getwindowfocus getwindowname)
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
	echo "%{c} $(ActiveWindow) " "%{r} RAM: $(Memory) - VOL: $(Sound) - BAT: $(Battery) - $(Clock)  " 
	#echo -e "%{c}$(ActiveWindow)" "%{r}$(Wifi)  $(Battery)  $(Sound)  $(Clock)"

	
    # use `nowplaying scroll` to get a scrolling output!
    sleep 1 # The HUD will be updated every second
done



