#!/bin/sh

dir='/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/*/'
file=`/bin/ls -1 "$dir" | sort --random-sort | head -1`
path=`readlink --canonicalize "$dir/$file"` # Converts to full path
echo "The randomly-selected file is: $path"