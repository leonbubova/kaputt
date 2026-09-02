#!/usr/bin/env bash
# Start the browser playground: ttyd spawns one hardened, network-less container per visitor.
# Usage: PLAYGROUND_BIND=127.0.0.1 PLAYGROUND_PORT=7681 ./run.sh
set -euo pipefail
IMG=${PLAYGROUND_IMAGE:-kaputt-playground}
BIND=${PLAYGROUND_BIND:-127.0.0.1}        # bind to loopback/tailnet; put a reverse proxy in front for the public
PORT=${PLAYGROUND_PORT:-7681}
MAX=${PLAYGROUND_MAX_CLIENTS:-20}         # simultaneous sessions
TTL=${PLAYGROUND_SESSION_TTL:-45m}
command -v ttyd >/dev/null || { echo "ttyd missing: apt install ttyd | brew install ttyd"; exit 1; }
docker image inspect "$IMG" >/dev/null 2>&1 || { echo "image $IMG missing — build it: playground/build.sh"; exit 1; }
exec ttyd -p "$PORT" -i "$BIND" -m "$MAX" -W -t titleFixed="kaputt — try it" -t fontSize=15 -t disableLeaveAlert=true \
  timeout "$TTL" docker run --rm -i -t \
    --network=none --memory=128m --memory-swap=128m --cpus=0.5 --pids-limit=64 \
    --cap-drop=ALL --security-opt=no-new-privileges --read-only \
    --tmpfs /home/player:rw,exec,size=64m,uid=1000,gid=1000 --tmpfs /tmp:rw,size=32m \
    "$IMG"
