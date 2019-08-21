#mopidy 2>/tmp/mopidy.log &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap tr
wal -i /home/jvol/wal1-0.png
/home/jvol/.bin/gif-soup /home/jvol/.gifs/wal1.gif & 

xset +fp ~/.fonts/misc/
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
greenclip daemon &

pidof -s xautolock >& /dev/null
if [ $? -ne 0 ]; then
  xautolock -time 60 -locker "systemctl suspend" &
fi

dunst &
exec bspwm
