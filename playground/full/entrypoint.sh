#!/usr/bin/env bash
# start the inner Docker daemon, then hand the terminal to the player (or sleep in PREP mode for build-full.sh)
set -euo pipefail
export WG_K3S_SNAPSHOTTER=native   # nested Sysbox: no mknod → no overlayfs whiteouts
# a committed image may carry a stale pid/sock from the build daemon — always start clean
rm -rf /var/run/docker.pid /var/run/docker.sock /var/run/docker /run/containerd /var/run/containerd 2>/dev/null || true
dockerd >/var/log/dockerd.log 2>&1 &
for i in $(seq 1 60); do docker info >/dev/null 2>&1 && break; sleep 0.5; done
docker info >/dev/null 2>&1 || { echo "inner docker daemon failed to start:"; tail -20 /var/log/dockerd.log; exit 1; }
if [ "${PREP:-}" = 1 ]; then exec sleep infinity; fi
# explicit command (tests, automation) runs as the player; default = interactive session
[ $# -gt 0 ] && exec runuser -u player -- "$@"
exec runuser -u player -- bash --rcfile /opt/kaputt/playground/full/motd.sh -i
