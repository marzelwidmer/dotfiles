#!/bin/sh
SRC="$HOME"
DST="/Volumes/Home/"
EXCLUDE_FILE="$HOME/dotfiles/.scripts/rsync.excl"
FILTER_RULE="$HOME/dotfiles/.scripts/filter.rules"

if [ -d  $DST ]
then
    # rsync -ravuzhHSP --delete-after --delete-excluded --exclude-from=$EXCLUDE_FILE $SRC $DST 
    rsync -ravuzhHSP  --delete-after --delete-excluded  --filter="merge $FILTER_RULE" $SRC $DST
else
    /usr/bin/osascript -e 'display notification "Some problem with file sync!" with title "Sync"'
fi

