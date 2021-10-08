#!/bin/sh

SRC="$HOME/helsana/"
DST="/Volumes/AirPort/morpheus/helsana"

if [ -d  $DST ]
then
#   	/usr/bin/osascript -e 'display notification "Work sync is started" with title "Work Sync"'
   	rsync -az --delete-after --exclude "delivery" --log-file=/tmp/work-sync.log  $SRC $DST
#    /usr/bin/say -v "lee" "Work directory is successfully synchronized."

else
    /usr/bin/osascript -e 'display notification "Some problem with delivery sync!" with title "Work Sync"'
#	  /usr/bin/say -v "lee" "Holy molly ... Houston we have a problem with synchronisation of the work directory."
fi





