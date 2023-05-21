- Add permissions owner and group permissions to the VM A key
> chmod og-wrx g.rsa

- SSH to VM A using the identity file
> ssh -i g.rsa theuser@192.168.109.156

- Add default route on VM B
> ip route del default
> ip route add default via 192.168.88.100

- Enable forwarding and nat on the VM A
> sysctl -w net.ipv4.ip_forward=1
> iptables -t nat -A POSTROUTING -s 192.168.88.101 -o eth0 -j MASQUERADE

- To copy files using SCP
> scp -r -i ./vms/management/keys/gors-2122-2s.rsa ../feup-grs-labs/ theuser@192.168.109.156:~

- To download files using SCP
> mkdir ../copy/ && scp -r -i ./vms/management/keys/gors-2122-2s.rsa theuser@192.168.109.156:~/feup-grs-labs ../copy/

- Tracepath
> tracepath (ip/name) [-n to disable name resolving]

- NAT rule for forwarding kubernetes dash
> sudo iptables -t nat -A PREROUTING -p tcp --dport 8001 -j DNAT --to-destination 192.168.88.101:10443
