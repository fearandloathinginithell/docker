docker pull mariadb:latest
docker stop mariaHAdb
docker rm mariaHAdb

sleep 15

docker run -d \
    --name mariaHAdb \
    -v "/volume1/docker/mariadbha/hassio/:/var/lib/mysql" \
    -p 3306 \
    --dns=<INTERNAL_ROUTER_IP> \
    --restart=unless-stopped \
    --hostname mariaHAdb \
    --network=trusted-net \
    --ip=<IP_ADDRESS_off_mariadb \
    -e MARIADB_ROOT_PASSWORD="<PASSWORD>" \
    -e MARIADB_DATABASE="<DBNAME>" \
    -e MARIADB_USER="<USER>" \
    -e MARIADB_PASSWORD="<PASSWORD>" \
    -e MARIADB_AUTO_UPGRADE="1" \
    -e MARIADB_INITDB_SKIP_TZINFO="1" \
    mariadb:latest

sleep 60
