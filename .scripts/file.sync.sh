#!/bin/sh
SRC="$HOME"
DST="/Volumes/Home/"
RSYNC_EXCL="$HOME/dotfiles/.scripts/rsync.excl"

if [ -d  $DST ]
then
    echo "---- Sync ----"
    rsync -rauvzhHSP --delete-after --stats --exclude-from=$RSYNC_EXCL "$SRC" "$DST"
    #rsync -rauz --quiet --delete-after --exclude-from=$RSYNC_EXCL "$SRC" "$DST"
    #rsync -rauz --quiet --delete-after --exclude-from=$RSYNC_EXCL "$SRC" "$DST"
    #rsync -rau --quiet --delete --exclude-from=$RSYNC_EXCL "$SRC" "$DST"
    # rsync -rtuv --exclude-from=$RSYNC_EXCL "$SRC" "$DST"
else
    /usr/bin/osascript -e 'display notification "Some problem with file sync!" with title "Sync"'
fi

