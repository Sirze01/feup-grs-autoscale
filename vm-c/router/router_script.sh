#! /bin/bash

# Routes
ip route replace default via 172.31.255.1
ip addr add 10.0.2.1/24 dev eth0
ip addr add 10.0.1.1/24 dev eth1

# Nat
iptables -t nat -F
iptables -t filter -F
iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -o eth2 -j MASQUERADE

./root/sleep.sh
