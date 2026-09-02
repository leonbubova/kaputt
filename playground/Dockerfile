# kaputt playground — the browser demo image. Only the Docker-free tracks (git, bash).
FROM debian:bookworm-slim
RUN apt-get update -q && apt-get install -y -q --no-install-recommends \
      bash git coreutils findutils grep sed gawk less nano vim-tiny ca-certificates procps python3 \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -s /bin/bash player
# the game, read-only; only the light tracks
COPY --chown=root:root bin/ /opt/kaputt/bin/
COPY --chown=root:root lib/ /opt/kaputt/lib/
COPY --chown=root:root test/ /opt/kaputt/test/
COPY --chown=root:root levels/git/  /opt/kaputt/levels/git/
COPY --chown=root:root levels/bash/ /opt/kaputt/levels/bash/
RUN chmod +x /opt/kaputt/bin/wg /opt/kaputt/test/*.sh
ENV PATH=/opt/kaputt/bin:$PATH TERM=xterm-256color HOME=/home/player
USER player
WORKDIR /home/player
COPY playground/motd.sh /opt/kaputt/playground/motd.sh
# HOME is a tmpfs at runtime (see run.sh); everything the player does lives there and dies with the session
CMD ["bash","--rcfile","/opt/kaputt/playground/motd.sh","-i"]
