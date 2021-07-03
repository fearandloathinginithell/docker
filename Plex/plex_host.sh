docker pull plexinc/pms-docker
docker stop plex
docker rm plex

sleep 15
docker run \
-d \
--name plex \
--network=host \
-e TZ="Pacific/Auckland" \
-e PLEX_CLAIM="<CLAIM>" \
-e PLEX_UID="<GUID>" \
-e PLEX_GID"100" \
-e ADVERTISE_IP="http://<IP_ADDRESS>:32400/" \
-h <HOST_NAME> \
-v "/vol2/docker/plex/database:/config" \
-v "/vol2/docker/plex/transcode:/transcode" \
-v "/vol2/Media/Movies:/Movies" \
-v "/vol2/Media/TV Shows:/TV_Shows" \
-v "/vol2/Media/Home Videos:/Home_Videos" \
-v "/vol2/Media/DVR Movies:/DVR_Movies" \
-v "/vol2/Media/DVR TV Shows:/DVR_TV_Shows" \
--restart=unless-stopped \
--device=/dev/dri:/dev/dri \
plexinc/pms-docker
