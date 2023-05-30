FROM nginx:latest
RUN apt update && apt install -y vim iproute2 iputils-ping tcpdump iptables dnsutils curl
COPY nginx_loadbalancer.conf /etc/nginx/nginx.conf
