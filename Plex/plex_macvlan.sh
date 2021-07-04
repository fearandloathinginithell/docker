docker pull plexinc/pms-docker:plexpass
docker stop plex
docker rm plex

sleep 15
docker run \
-d \
--name plex \
--network=trusted-net \
--ip=<IP_ADDRESS> \
-e TZ="Pacific/Auckland" \
-e PLEX_CLAIM="claim-<https://www.plex.tv/claim/>" \
-e PLEX_UID="<GUID>" \
-e PLEX_GID"<GUID>" \
-h <PLEX_HOSTNAME> \
-v "/vol2/docker/plex/database:/config" \
-v "/vol2/docker/plex/transcode/temp:/transcode" \
-v "/vol2/Media/Movies:/Movies" \
-v "/vol2/Media/TV Shows:/TV_Shows" \
-v "/vol2/Media/Home Videos:/Home_Videos" \
-v "/vol2/Media/DVR Movies:/DVR_Movies" \
-v "/vol2/Media/DVR TV Shows:/DVR_TV_Shows" \
--restart=unless-stopped \
--device=/dev/dri:/dev/dri \
plexinc/pms-docker:plexpass
