# docker
Docker Configs from Synology

## Macvlan
Model: DS916+ (Upgraded 8 GB Ram)
Tested: DSM 7.0-41882

Script to create macvlan used by some of these docker images

https://github.com/fearandloathinginithell/docker/blob/main/macvlan/macvlan.sh

Scheduled task (On boot) on Synology to allow the NAS to talk to images on the MACVLAN network, this shim is lost on reboot.

https://github.com/fearandloathinginithell/docker/blob/main/macvlan/docker-shim.sh

## PiHole

Model: DS916+ (Upgraded 8 GB Ram)
Tested: DSM 7.0-41882

### Whitelist
Run using a scheduled task in Synology run as root

https://github.com/fearandloathinginithell/docker/blob/main/pi-hole/whitelist.sh

distilled from:

https://github.com/anudeepND/whitelist#for-whitelisttxt

## Plex

Model: DS916+ (Upgraded 8 GB Ram)
Tested: DSM 7.0-41882

### GUIDs
https://github.com/fearandloathinginithell/docker/blob/main/Plex/whoami.sh
Retreives the GUIDs to use with plex docker
```
-e PLEX_UID="<GUID>" \
-e PLEX_GID"<GUID>" \
```
Which provides access to the following shares
```
-v "/vol2/Media/Movies:/Movies" \
-v "/vol2/Media/TV Shows:/TV_Shows" \
-v "/vol2/Media/Home Videos:/Home_Videos" \
-v "/vol2/Media/DVR Movies:/DVR_Movies" \
-v "/vol2/Media/DVR TV Shows:/DVR_TV_Shows" \
```

# Docker Host
##  DS916+
DS916+ (2GB)
Memory Upgrade: 
Kingston
KVR16LS11/8
8GB 2Rx8 1G x 64-Bit PC3L-12800 CL11 204-Pin SODIMM
