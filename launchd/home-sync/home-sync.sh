#!/bin/sh

SRC="$HOME"
DST="/Volumes/Home/"
DST_AIRPORT="/Volumes/AirPort/"
FILTER_RULE="$HOME/dotfiles/launchd/home-sync/filter.rules"

if [ -d  $DST ]
then
#   	/usr/bin/osascript -e 'display notification "Home sync is started" with title "Home Sync"'
    rsync -ravuzhPE  --delete-after --exclude "helsana"  --log-file=/tmp/airport-home.log --filter="merge $FILTER_RULE" $SRC $DST_AIRPORT
    rsync -ravuzhPE  --delete-after --exclude "helsana"  --log-file=/tmp/hera-home.log --filter="merge $FILTER_RULE" $SRC $DST

#	  /usr/bin/say -v "lee" "Home directory is successfully synchronized."

else
    /usr/bin/osascript -e 'display notification "Some problem with home sync!" with title "Home Sync"'
#	  /usr/bin/say -v ""Tessa"" "Holy molly ... Houston we have a problem with synchronisation of home directory."
fi





