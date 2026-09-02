# track: docker on the host daemon (colima) — everything prefixed wg-
WG_DOCKER_WORK=$HOME/.k8s-wargame/docker
track_start() {
  docker info >/dev/null 2>&1 || { echo "docker daemon not reachable — start colima/docker" >&2; exit 1; }
  echo "pre-pulling images…"; for img in alpine:3.20 nginx:1.27-alpine busybox:1.36 redis:7-alpine; do docker pull -q "$img" >/dev/null 2>&1 || true; done
  mkdir -p "$WG_DOCKER_WORK"
}
track_stop() { track_wipe; }
track_ready() { docker info >/dev/null 2>&1; }
track_wipe() {  # before each level
  docker compose -p wg down -v --remove-orphans >/dev/null 2>&1 || true
  local ids; ids=$(docker ps -aq -f 'name=^wg-'); [ -n "$ids" ] && docker rm -f $ids >/dev/null 2>&1
  ids=$(docker network ls -q -f 'name=^wg[-_]'); [ -n "$ids" ] && docker network rm $ids >/dev/null 2>&1
  ids=$(docker volume ls -q -f 'name=^wg[-_]'); [ -n "$ids" ] && docker volume rm -f $ids >/dev/null 2>&1
  ids=$(docker images -q 'wg-*'); [ -n "$ids" ] && docker rmi -f $ids >/dev/null 2>&1
  docker image prune -f --filter label=wg.track=docker >/dev/null 2>&1 || true
  rm -rf "$WG_DOCKER_WORK"; mkdir -p "$WG_DOCKER_WORK"
  return 0
}
