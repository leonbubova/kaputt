#!/usr/bin/env bash
# Build the full sandbox image. Must run on a host with the Sysbox runtime (the preload step runs an inner dockerd).
#   1) plain docker build (software only)  2) run it under Sysbox in PREP mode and preload images/deps  3) docker commit
set -euo pipefail
cd "$(dirname "$0")/../.."
IMG=${PLAYGROUND_FULL_IMAGE:-kaputt-full}
docker build -q -f playground/full/Dockerfile -t "$IMG:base" . >/dev/null && echo "base image built"
docker rm -f kf-prep >/dev/null 2>&1 || true
docker run -d --name kf-prep --runtime=sysbox-runc -e PREP=1 "$IMG:base" >/dev/null
sleep 5; docker exec kf-prep docker info >/dev/null 2>&1 || { echo "inner dockerd not up"; docker logs kf-prep | tail; exit 1; }
docker exec kf-prep /opt/kaputt/playground/full/preload.sh
# stop the inner daemon cleanly so the commit has no live daemon state / stale pid
docker exec kf-prep sh -c 'kill "$(cat /var/run/docker.pid)" 2>/dev/null; for i in $(seq 1 30); do [ -e /var/run/docker.pid ] || break; sleep 1; done; rm -f /var/run/docker.pid /var/run/docker.sock' || true
docker commit --change 'ENV PREP=' kf-prep "$IMG:latest" >/dev/null && echo "committed → $IMG:latest"
docker rm -f kf-prep >/dev/null
docker image inspect "$IMG:latest" --format '{{.Size}}' | awk '{printf "size: %.1f GB\n",$1/1073741824}'
