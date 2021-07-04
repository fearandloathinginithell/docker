docker pull pihole/pihole
docker stop pihole
docker rm pihole

sleep 15

docker run -d \
    --name pihole \
    -v "/vol2/docker/pihole/etc-pihole/:/etc/pihole/" \
    -v "/vol2/docker/pihole/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=<INTERNAL_ROUTER> --dns=1.1.1.1 \
    --restart=unless-stopped \
    --hostname pi.hole \
    --network=trusted-net \
    --ip=<IP_ADDRESS> \
    -e TZ="Pacific/Auckland" \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e ServerIP="<IP_ADDRESS>" \
    -e DNS1="<INTERNAL_ROUTER>" \
    -e DNS2="<DNS_PROVIDER>" \
    -e DNS_FQDN_REQUIRED="true" \
    -e CONDITIONAL_FORWARDING="true" \
    -e CONDITIONAL_FORWARDING_IP="<INTERNAL_ROUTER>" \
    -e CONDITIONAL_FORWARDING_DOMAIN="tld.co.nz" \
    -e DNSMASQ_LISTENING="all" \
    pihole/pihole:latest

sleep 60
