FROM nginx:latest
RUN apt update && apt install -y vim iproute2 iputils-ping tcpdump iptables dnsutils curl
RUN mkdir /html
#COPY index.html /html/index.html
COPY nginx.conf /etc/nginx/nginx.conf
CMD sh -c 'echo $(hostname) > /html/index.html; /usr/sbin/nginx -g "daemon off;"'
