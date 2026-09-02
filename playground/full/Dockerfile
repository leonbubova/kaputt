# kaputt FULL sandbox — one per player, runs under the Sysbox runtime (no --privileged):
# an inner Docker daemon + k3d/kubectl/helm + node + all tracks. Images are pre-baked by build-full.sh so
# the sandbox runs with NO internet access.
FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN rm -f /etc/dpkg/dpkg.cfg.d/docker; apt-get update -q && apt-get install -y -q --no-install-recommends \
      ca-certificates curl gnupg lsb-release bash git sudo procps iproute2 iputils-ping dnsutils netcat-openbsd openssl \
      less nano vim-tiny man-db manpages jq python3 unzip xz-utils postgresql-client redis-tools rsync file \
    && apt-get install -y -q --reinstall --no-install-recommends coreutils grep sed findutils bash && mandb -q 2>/dev/null; \
    install -m 0755 -d /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu noble stable" > /etc/apt/sources.list.d/docker.list \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - >/dev/null 2>&1 \
    && apt-get update -q && apt-get install -y -q --no-install-recommends docker-ce docker-ce-cli containerd.io docker-compose-plugin nodejs \
    && rm -rf /var/lib/apt/lists/*
# k8s tooling + helm + k3d + terraform (offline provider mirror is built by preload)
RUN curl -fsSLo /usr/local/bin/kubectl "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x /usr/local/bin/kubectl \
    && curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash >/dev/null 2>&1 \
    && curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash >/dev/null 2>&1 \
    && TFV=1.9.8 && curl -fsSLo /tmp/tf.zip "https://releases.hashicorp.com/terraform/${TFV}/terraform_${TFV}_linux_amd64.zip" && unzip -q /tmp/tf.zip -d /usr/local/bin && rm /tmp/tf.zip
# the player: sudo inside the sandbox is fine — under Sysbox, root in here is an unprivileged uid on the host
RUN useradd -m -s /bin/bash -G docker,sudo player && echo 'player ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/player \
    && mkdir -p /etc/docker && echo '{"storage-driver":"overlay2","log-driver":"json-file","log-opts":{"max-size":"10m"}}' > /etc/docker/daemon.json
# the game (all tracks except systemd, which needs an external systemd host)
COPY bin/ /opt/kaputt/bin/
COPY lib/ /opt/kaputt/lib/
COPY test/ /opt/kaputt/test/
COPY levels/ /opt/kaputt/levels/
COPY playground/full/motd.sh playground/full/entrypoint.sh playground/full/preload.sh /opt/kaputt/playground/full/
RUN rm -rf /opt/kaputt/levels/systemd && chmod +x /opt/kaputt/bin/wg /opt/kaputt/test/*.sh /opt/kaputt/playground/full/*.sh
ENV PATH=/opt/kaputt/bin:$PATH TERM=xterm-256color
ENTRYPOINT ["/opt/kaputt/playground/full/entrypoint.sh"]
