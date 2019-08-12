#!/bin/bash                                                          
export DISPLAY=":0"
export XAUTHORITY=/home/jvol/.Xauthority

battery_level="$(</sys/class/power_supply/BAT1/capacity)"

if [ $battery_level -le 10 ]                                          
then                                                                  
    notify-send -u critical "Battery low" "Battery level is ${battery_level}%!"   
elif [ $battery_level -le 5 ]                                         
then
    # your custom actions here e.g.,                                                                  
    systemctl hibernate                                               
fi 
