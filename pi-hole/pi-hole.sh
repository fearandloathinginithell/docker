docker pull pihole/pihole
docker stop pihole
docker rm pihole

sleep 15

docker run -d \
    --name pihole \
    -v "/vol2/docker/pihole/etc-pihole/:/etc/pihole/" \
    -v "/vol2/docker/pihole/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=<INTERNAL_ROUTER_IP> --dns=1.1.1.1 \
    --restart=unless-stopped \
    --hostname pi.hole \
    --network=trusted-net \
    --ip=<IP_ADDRESS_off_Pi_Hole> \
    -e TZ="Pacific/Auckland" \
    -e ADMIN_EMAIL="<email>" \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e ServerIP="<IP_ADDRESS_off_Pi_Hole>" \
    -e PIHOLE_DNS_="8.8.8.8.1;1.1.1.1" \
    -e DNS_FQDN_REQUIRED="true" \
    -e DNS_BOGUS_PRIV="true" \
    -e REV_SERVER="true" \
    -e REV_SERVER_TARGETP="<INTERNAL_ROUTER>" \
    -e REV_SERVER_DOMAIN="tld.co.nz" \
    -e REV_SERVER_CIDR="192.168.0.0/16" \
    -e DNSMASQ_LISTENING="all" \
    pihole/pihole:latest

sleep 60
