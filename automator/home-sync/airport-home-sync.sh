SRC="$HOME"
DST="/Volumes/AirPort/"
FILTER_RULE="$HOME/dotfiles/automator/home-sync/filter.rules"


if [ -d  $DST ]
then
   	/usr/bin/osascript -e 'display notification "Helsana sync is started" with title "Rsync"'
    rsync -ravuzhPE  --delete-after --delete-excluded --log-file=/tmp/airport-rsync.log --filter="merge $FILTER_RULE" $SRC $DST

   	/usr/bin/osascript -e 'display notification "Home Sync is Done" with title "Home Rsync"'
	/usr/bin/say Helsana Sync is Done

else
    /usr/bin/osascript -e 'display notification "Some problem with home sync!" with title "Rsync"'
	/usr/bin/say Some problem with home sync!
fi





