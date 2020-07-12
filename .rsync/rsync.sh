#!/bin/bash
SRC="$HOME"
DST="/Volumes/Home/"
RSYNC_EXCL="$HOME/dotfiles/.scripts/rsync.excl"

fswatch -0 $SRC | while read -d "" event; do
    #rsync -rauvzhHSP --delete-after --stats --exclude-from=$RSYNC_EXCL "$SRC" "$DST"
    #rsync -rauz --quiet --delete-after --exclude-from=$RSYNC_EXCL "$SRC" "$DST"
    #rsync -rauz --quiet --delete-after --exclude-from=$RSYNC_EXCL "$SRC" "$DST"
    #rsync -rau --quiet --delete --exclude-from=$RSYNC_EXCL "$SRC" "$DST"
    # rsync -rtuv --exclude-from=$RSYNC_EXCL "$SRC" "$DST"
    rsync -rau --quiet --delete --exclude-from=$RSYNC_EXCL 
done

 