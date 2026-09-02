# track: one ubuntu box (wg-net) with net tools; enter with `wg shell`. Needs NET_ADMIN for iptables/sysctl.
C=${WG_NET_C:-wg-net}; IMG=${WG_NET_IMG:-wg-net:base}
_img() { docker image inspect "$IMG" >/dev/null 2>&1 || { echo "building ${IMG}…" >&2; docker build -q -t "$IMG" "$WG_ROOT/levels/networking/image" >/dev/null 2>&1; }; }
_run() { _img; docker run -d --name "$C" --hostname net-lab --cap-add NET_ADMIN --cap-add NET_RAW "$IMG" >/dev/null; }
_up()  { [ "$(docker inspect -f '{{.State.Running}}' "$C" 2>/dev/null)" = true ]; }
track_start() {
  docker info >/dev/null 2>&1 || { echo "docker is not running" >&2; return 1; }
  if _up; then echo "container $C running"; else docker rm -f "$C" >/dev/null 2>&1 || true; _run; fi
}
track_stop()  { docker rm -f "$C" >/dev/null 2>&1 || true; docker rmi "$IMG" >/dev/null 2>&1 || true; }
track_ready() { docker info >/dev/null 2>&1 || return 1; _up || { docker rm -f "$C" >/dev/null 2>&1 || true; _run; }; }
track_wipe()  { docker rm -f "$C" >/dev/null 2>&1 || true; _run; sleep 1; }
track_shell() { docker exec -it "$C" bash; }
