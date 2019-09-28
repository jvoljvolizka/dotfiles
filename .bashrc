# If not running interactively, don't do anything
if [[ "$TERM" == *rxvt* ]]; then
   exec fish
fi
