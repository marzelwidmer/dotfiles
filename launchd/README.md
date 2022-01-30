https://www.systemcodegeeks.com/mac-os/macos-sync-files-between-two-volumes-using-launchd-and-rsync/

The easiest way to fix this is by giving `bin/sh` Full Disk Access in System Preferences > Security & Privacy > Privacy > Full Disk Access.


Check also `launchcontrol`
```
brew cask install launchcontrol
```


# work-delivery-sync.plist

# Copy work-delivery.sync.plist
```
cp dotfiles/launchd/work-delivery-sync/work-delivery-sync.plist ~/Library/LaunchAgents 
```

# System.log
```
tail -f /var/log/system.log
```

# Load
```
launchctl load -w ~/Library/LaunchAgents/work-delivery-sync.plist
```

# Logs
```
tail -f /var/log/system.log
tail -f /tmp/work-delivery-sync.log
tail -f /tmp/work-delivery-sync.out
tail -f /tmp/work-delivery-sync.err
```


# List launchctl
```
launchctl list | grep work-delivery-sync
```

# Unload
```
launchctl unload -w ~/Library/LaunchAgents/work-delivery-sync.plist
```



# work-sync.plist

# Copy work.sync.plist
```
cp dotfiles/launchd/work-sync/work-sync.plist ~/Library/LaunchAgents
```

# Load
```
launchctl load -w ~/Library/LaunchAgents/work-sync.plist
```
