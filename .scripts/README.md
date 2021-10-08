https://www.systemcodegeeks.com/mac-os/macos-sync-files-between-two-volumes-using-launchd-and-rsync/

The easiest way to fix this is by giving bin/sh Full Disk Access in System Preferences > Security & Privacy > Privacy > Full Disk Access.

# Change file.sync.plist
User Home definition
```
/Users/morpheus/
```

# Copy file.sync.plist
```
cp .scripts/file.sync.plist  ~/Library/LaunchAgents
```

# System.log
```
tail -f /var/log/system.log
```

# Load
```
launchctl load -w ~/Library/LaunchAgents/file.sync.plist
```

# file.sync.err
```
tail -f /tmp/file.sync.err
```

# file.sync.out
```
tail -f /tmp/file.sync.out
```


# List launchctl
```
launchctl list | grep file.sync
```

# Unload
```
launchctl unload -w ~/Library/LaunchAgents/file.sync.plist
```