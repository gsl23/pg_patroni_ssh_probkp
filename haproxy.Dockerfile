FROM haproxy:2.8.3-alpine3.18
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
