docker pull plexinc/pms-docker
docker stop plex
docker rm plex

sleep 15
docker run \
-d \
--name plex \
-p 32400:32400/tcp \
-p 3005:3005/tcp \
-p 8324:8324/tcp \
-p 32469:32469/tcp \
-p 1900:1900/udp \
-p 32410:32410/udp \
-p 32412:32412/udp \
-p 32413:32413/udp \
-p 32414:32414/udp \
-e TZ="Pacific/Auckland" \
-e PLEX_CLAIM="claim-<https://www.plex.tv/claim/>" \
-e ADVERTISE_IP="http://<IP_ADDRESS>:32400/" \
-e PLEX_UID="<GUID>" \
-e PLEX_GID"<GUID>" \
-h Glasir \
-v "/vol2/docker/plex/database:/config" \
-v "/vol2/docker/plex/transcode/temp:/transcode" \
-v "/vol2/Media/Movies:/Movies" \
-v "/vol2/Media/TV Shows:/TV_Shows" \
-v "/vol2/Media/Home Videos:/Home_Videos" \
-v "/vol2/Media/DVR Movies:/DVR_Movies" \
-v "/vol2/Media/DVR TV Shows:/DVR_TV_Shows" \
--device=/dev/dri:/dev/dri \
--restart=unless-stopped \
plexinc/pms-docker
