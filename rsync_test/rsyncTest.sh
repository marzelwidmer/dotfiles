#!/bin/sh
SRC=$HOME/dotfiles/rsync_test
DST=/Volumes/Home/rsync_test/
RSYNC_INCLUDE_FILE=rsync.incl
RSYNC_EXCLUDE_FILE=rsync.excl

fswatch -0 $SRC | while read -d "" event; do
#   rsync -vrthP --include-from=$RSYNC_INCLUDE_FILE  --exclude="*" "$SRC" "$DST"
  rsync -avP --include="Demultiplexing" \
     --exclude=".*" \
     -exclude="*:*" \
     "$SRC" "$DST"
done


rsync --dry-run --verbose --recursive --filter='merge somerules.rules' $SRC $DST

rsync -av --include-from="$RSYNC_INCLUDE_FILE" --exclude="$RSYNC_EXCLUDE_FILE" "$SRC" "$DST"

rsync -av --include-from='path/to/rsyncInclude' --exclude-from='path/to/rsyncExclude' /directory/to/copy/ /destination/directory

# –delete-excluded

# rsync -vrthP \
#     --include="Demultiplexing" \
#     --include="Demultiplexing/*" \
#     --include="Demultiplexing/*/output/***" \
#     --exclude="*:*" \
#     --exclude="*" \
#      $HOME/dotfiles/ /Volumes/Home/foo/
