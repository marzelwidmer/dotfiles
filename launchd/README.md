https://www.systemcodegeeks.com/mac-os/macos-sync-files-between-two-volumes-using-launchd-and-rsync/

The easiest way to fix this is by giving bin/sh Full Disk Access in System Preferences > Security & Privacy > Privacy > Full Disk Access.

# airport-work.sync.plist

# Copy airport-work.sync.plist
```
cp dotfiles/launchd/airport-work-sync/airport-work.sync.plist ~/Library/LaunchAgents
```

# System.log
```
tail -f /var/log/system.log
```

# Load
```
launchctl load -w ~/Library/LaunchAgents/airport-work.sync.plist
```

# Log
```
tail -f /tmp/airport-work-sync.out
```


# Error Log
```
tail -f /tmp/airport-work-sync.err
```


# List launchctl
```
launchctl list | grep airport-work-sync
```

# Unload
```
launchctl unload -w ~/Library/LaunchAgents/airport-work.sync.plist
```
