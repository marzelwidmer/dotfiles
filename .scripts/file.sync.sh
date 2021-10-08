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
    say -v "Anna" "Die arbeits Artefakte wurden erfolgreich synchronisiert."

    rsync -ravuzhPE  --delete-after --delete-excluded  --filter="merge $FILTER_RULE" $SRC $DST
     /usr/bin/say -v "Lee" "Your data is successfully synchronized"
   
else
    /usr/bin/osascript -e 'display notification "Some problem with file sync!" with title "Sync"'
	  /usr/bin/say -v "lee" "Holy molly ... Houston we have a problem."
fi





