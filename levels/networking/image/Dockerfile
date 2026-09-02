FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
      iproute2 iputils-ping dnsutils netcat-openbsd curl nginx tcpdump iptables \
      procps vim less lsof ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /etc/nginx/sites-enabled/default \
    && mkdir -p /srv/api /root/.k8s-wargame/networking
CMD ["sleep","infinity"]
