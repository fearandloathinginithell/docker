sleep 120
ip link add docker-shim link eth0 type macvlan mode bridge
ip addr add 10.10.10.86/32 dev docker-shim
ip link set docker-shim up
ip route add 10.10.10.80/32 dev docker-shim
ip route add 10.10.10.81/32 dev docker-shim
ip route add 10.10.10.82/32 dev docker-shim
ip route add 10.10.10.83/32 dev docker-shim
ip route add 10.10.10.84/32 dev docker-shim
ip route add 10.10.10.85/32 dev docker-shim
