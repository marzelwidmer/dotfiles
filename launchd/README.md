https://www.systemcodegeeks.com/mac-os/macos-sync-files-between-two-volumes-using-launchd-and-rsync/

The easiest way to fix this is by giving bin/sh Full Disk Access in System Preferences > Security & Privacy > Privacy > Full Disk Access.

# airport-work.sync.plist

# Copy airport-work.sync.plist
```
cp dotfiles/launchd/work-delivery-sync/airport-delivery.sync.plist ~/Library/LaunchAgents
```

# System.log
```
tail -f /var/log/system.log
```

# Load
```
launchctl load -w ~/Library/LaunchAgents/airport-delivery.sync.plist
```

# Log
```
tail -f /tmp/airport-delivery-sync.out
```


# Error Log
```
tail -f /tmp/airport-delivery-sync.err
```


# List launchctl
```
launchctl list | grep airport-work-sync
```

# Unload
```
launchctl unload -w ~/Library/LaunchAgents/airport-work.sync.plist
```


# airport-work.sync.plist
```
cp dotfiles/launchd/work-sync/airport-work.sync.plist  ~/Library/LaunchAgents
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







# hera-home.sync.plist
```
cp dotfiles/launchd/home-sync/home.sync.plist  ~/Library/LaunchAgents
launchctl load -w ~/Library/LaunchAgents/home.sync.plist
```
# Log
```
tail -f /tmp/hera-work-sync.out
```
# Error Log
```
tail -f /tmp/hera-work-sync.err




