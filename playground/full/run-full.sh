#!/usr/bin/env bash
# ttyd → one FULL sandbox per visitor under Sysbox: inner docker + k3d, no internet, hard caps, 45 min.
set -euo pipefail
IMG=${PLAYGROUND_FULL_IMAGE:-kaputt-full}; BIND=${PLAYGROUND_BIND:-127.0.0.1}; PORT=${PLAYGROUND_PORT:-7681}
MAX=${PLAYGROUND_MAX_CLIENTS:-12}; TTL=${PLAYGROUND_SESSION_TTL:-45m}; MEM=${PLAYGROUND_MEM:-4g}; CPUS=${PLAYGROUND_CPUS:-2}
NET=${PLAYGROUND_NET:-kaputt-sandbox}
command -v ttyd >/dev/null || { echo "ttyd missing"; exit 1; }
docker info --format '{{range $k,$v := .Runtimes}}{{$k}} {{end}}' | grep -q sysbox-runc || { echo "sysbox-runc runtime not installed"; exit 1; }
docker image inspect "$IMG:latest" >/dev/null 2>&1 || { echo "image $IMG missing — playground/full/build-full.sh"; exit 1; }
docker network inspect "$NET" >/dev/null 2>&1 || docker network create --internal "$NET" >/dev/null   # --internal = no route out
exec ttyd -p "$PORT" -i "$BIND" -m "$MAX" -W -t titleFixed="kaputt — your own broken cluster" -t fontSize=15 -t disableLeaveAlert=true \
  timeout "$TTL" docker run --rm -i -t --runtime=sysbox-runc --network "$NET" \
    --memory="$MEM" --memory-swap="$MEM" --cpus="$CPUS" --pids-limit=4096 \
    "$IMG:latest"
