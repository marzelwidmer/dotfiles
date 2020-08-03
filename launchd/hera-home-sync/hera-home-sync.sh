SRC="$HOME"
DST="/Volumes/Hera/"
FILTER_RULE="$HOME/dotfiles/launchd/hera-home-sync/filter.rules"

if [ -d  $DST ]
then
   	/usr/bin/osascript -e 'display notification "Home Hera  sync is started" with title "Home Hera Rsync"'
    rsync -ravuzhPE  --delete-after --delete-excluded --log-file=/tmp/hera-home.log --filter="merge $FILTER_RULE" $SRC $DST

	  /usr/bin/say -v "lee" "Home Hera directory is successfully synchronized."

else
    /usr/bin/osascript -e 'display notification "Some problem with home sync!" with title "Rsync"'
	  /usr/bin/say -v "lee" "Holy molly ... Houston we have a problem."
fi





