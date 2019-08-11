
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap tr
wal -i /home/jvol/freedom.jpg

xset +fp ~/.fonts/misc/
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
greenclip daemon &


exec bspwm
