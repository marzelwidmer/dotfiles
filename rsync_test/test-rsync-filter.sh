#!/bin/sh
SRC=/Users/morpheus/dotfiles/rsync_test
DST=/Volumes/Home/rsync_test/

fswatch -0 $SRC | while read -d "" event; do
    rsync -ravuzhHSP  --delete-after --delete-excluded  --filter='merge somerules.rules' $SRC $DST  
done
