docker network create -d macvlan \
    --subnet=10.10.10.0/24 \
    --gateway=10.10.10.1 \
    --ip-range=10.10.10.80/29 \
    --aux-address="host=10.10.10.86" \
    -o parent=eth0 \
    --attachable \
       trusted-net
