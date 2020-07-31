#!/bin/sh
SRC="$HOME"
DST="/Volumes/Home/"
DST_AIRPORT="/Volumes/AirPort/"
EXCLUDE_FILE="$HOME/dotfiles/.scripts/rsync.excl"
FILTER_RULE="$HOME/dotfiles/.scripts/filter.rules"

if [ -d  $DST ]
then
    # rsync -ravuzhHSP --delete-after --delete-excluded --exclude-from=$EXCLUDE_FILE $SRC $DST 
    # rsync -ravuzhHSP  --delete-after --delete-excluded  --filter="merge $FILTER_RULE" $SRC $DST
    rsync -ravuzhPE  --delete-after --delete-excluded  --filter="merge $FILTER_RULE" $SRC $DST_AIRPORT
    /usr/bin/say -v "Lee" "AirPort Sync, is Done"
    
    rsync -ravuzhPE  --delete-after --delete-excluded  --filter="merge $FILTER_RULE" $SRC $DST
    /usr/bin/say -v "Oliver" "Hera Sync, is Done"
   
else
    /usr/bin/osascript -e 'display notification "Some problem with file sync!" with title "Sync"'
    /usr/bin/say -v "Good News" "Synchronisation have some problems."
fi





