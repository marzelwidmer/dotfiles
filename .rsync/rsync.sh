#!/bin/bash
SRC="$HOME"
DST="/Volumes/AirPort"
EXCLUDE_FILE="$HOME/dotfiles/.rsync/rsync.excl"

fswatch -0 $SRC | while read -d "" event; do
    # rsync -ravuzhHSP --dry-run --delete-after --delete-excluded --exclude-from=$EXCLUDE_FILE $SRC $DST  
    rsync -ravuzq --delete-after --log-file=/tmp/rsync.log --delete-excluded --exclude-from=$EXCLUDE_FILE $SRC $DST  
done &