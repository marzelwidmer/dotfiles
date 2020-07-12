# Install fswatch
```
brew install fswatch
```

## Filter
```
rsync -ravuzhHSP--dry-run --delete-after --delete-excluded  --filter='merge somerules.rules' $SRC $DST

#       --delete-after          receiver deletes after transfer, not before
#       --delete-excluded       also delete excluded files from destination dirs
#
# -r    --recursive             recurse into directories
# -a    --archive               archive mode; same as -rlptgoD (no -H)
# -v    --verbose               increase verbosity
# -u    --update                skip files that are newer on the receiver
# -z    --compress              compress file data during the transfer    
# -h    --human-readable        output numbers in a human-readable forma
# -H    --hard-links            preserve hard links
# -S    --sparse                handle sparse files efficiently
# -P    --progress
# -q    --quiet                 suppress non-error messages
# -n    --dry-run

```

## Exclude
```
rsync -ravuzhHSP --dry-run --delete-after --delete-excluded --exclude-from=$EXCLUDE_FILE $SRC $DST  
```