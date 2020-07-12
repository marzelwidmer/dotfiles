#!/bin/sh
SRC="$HOME"
DST="/Volumes/Home/"
EXCLUDE_FILE="$HOME/dotfiles/.scripts/rsync.excl"

if [ -d  $DST ]
then
    echo "---- Sync ----"
    rsync -ravuzhHSP --delete-after --delete-excluded --exclude-from=$EXCLUDE_FILE $SRC $DST 
else
    /usr/bin/osascript -e 'display notification "Some problem with file sync!" with title "Sync"'
fi

