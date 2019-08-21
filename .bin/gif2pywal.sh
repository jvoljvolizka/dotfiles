#!/bin/sh
file=$1
filename=${file%????}
filename=gif2pywal-$filename
pkill mpv
if [ -f /tmp/$filename/$filename-0.png ]
then	
	echo "Lucky ! cache found"
	wal -i /tmp/$filename/$filename-0.png
	~/.bin/gif-soup $file 2>/dev/null&
else
	echo "Creating tmp folder"
	mkdir /tmp/$filename
	echo "Converting gif"
	convert $file /tmp/$filename/$filename.png
	mv /tmp/$filename/$filename-0.png /tmp/
	rm -rf /tmp/$filename/*
	mv /tmp/$filename-0.png /tmp/$filename/
	echo "Executing pywal"
	wal -i /tmp/$filename/$filename-0.png
	~/.bin/gif-soup $file &
fi
