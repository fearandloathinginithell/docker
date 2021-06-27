docker exec -d pihole bash -c "git clone https://github.com/anudeepND/whitelist.git"
sleep 15
docker exec -d pihole bash -c "./whitelist/scripts/whitelist.sh"
