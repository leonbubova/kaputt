# track: one redis container (wg-redis, redis:7-alpine). Play with redis-cli. `wg shell` opens a client.
RC=${WG_REDIS_C:-wg-redis}; RIMG=redis:7-alpine
_up()  { [ "$(docker inspect -f '{{.State.Running}}' "$RC" 2>/dev/null)" = true ]; }
_run() { docker run -d --name "$RC" "$RIMG" >/dev/null; local i=0; while [ $i -lt 30 ]; do [ "$(docker exec "$RC" redis-cli ping 2>/dev/null)" = PONG ] && return 0; sleep 0.3; i=$((i+1)); done; echo "redis did not come up" >&2; return 1; }
track_start() {
  docker info >/dev/null 2>&1 || { echo "docker is not running" >&2; return 1; }
  { docker image inspect "$RIMG" >/dev/null 2>&1 || docker pull -q "$RIMG"; } >/dev/null 2>&1 || true
  if _up; then echo "container $RC running"; else docker rm -f "$RC" >/dev/null 2>&1 || true; _run; fi
  echo "client: docker exec -it $RC redis-cli   (or: wg shell)"
}
track_stop()  { docker rm -f "$RC" >/dev/null 2>&1 || true; }
track_ready() { docker info >/dev/null 2>&1 || return 1; _up || { docker rm -f "$RC" >/dev/null 2>&1 || true; _run; }; }
track_wipe()  { docker rm -f "$RC" >/dev/null 2>&1 || true; _run; }
track_shell() { docker exec -it "$RC" redis-cli; }
