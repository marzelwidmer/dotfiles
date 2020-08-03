SRC="$HOME"
DST="/Volumes/AirPort/"
FILTER_RULE="$HOME/dotfiles/launchd/airport-home-sync/filter.rules"


if [ -d  $DST ]
then
   	/usr/bin/osascript -e 'display notification "Home AirPort  sync is started" with title "Home AirPort Rsync"'
    rsync -ravuzhPE  --delete-after --delete-excluded --log-file=/tmp/airport-rsync.log --filter="merge $FILTER_RULE" $SRC $DST
    /usr/bin/say -v "lee" "Home AirPort directory is successfully synchronized."

else
    /usr/bin/osascript -e 'display notification "Some problem with home sync!" with title "Rsync"'
	  /usr/bin/say -v "lee" "Holy molly ... Houston we have a problem."
fi





