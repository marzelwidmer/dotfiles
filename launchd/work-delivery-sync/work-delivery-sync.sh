#!/bin/sh

SRC="$HOME/helsana/azure"
DST="/Volumes/AirPort/helsana"

if [ -d  $DST ]
then
#   	/usr/bin/osascript -e 'display notification "Delivery sync is started" with title "Delivery Sync"'
#   	rsync -az --delete-after --exclude "dev" --exclude "azure" --exclude "alma" --exclude "gitlab"  --log-file=/tmp/work-delivery-sync.log  $SRC $DST
   	rsync -az --delete-after --log-file=/tmp/work-delivery-sync.log  $SRC $DST
#    rsync -ravuzhPE --delete-after --delete-excluded --log-file=/tmp/airport-work-delivery.log --filter="merge $FILTER_RULE" $SRC $DST
#  --dry-run
# rsync -az --exclude "delivery"  --log-file=/tmp/airport-work-delivery.log  $HOME/helsana/ /Volumes/AirPort/morpheus/helsana

#	  /usr/bin/say -v "lee" "Delivery directory is successfully synchronized."

else
    /usr/bin/osascript -e 'display notification "Some problem with delivery sync!" with title "Delivery Sync"'
#	  /usr/bin/say -v "Veena" "Holy molly ... Houston we have a problem with synchronisation of delivery directory."
fi
