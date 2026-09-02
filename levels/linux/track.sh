# track: linux sysadmin incidents — one ubuntu container, enter with `wg shell`
C=${WG_LINUX_C:-wg-linux}; IMG=${WG_LINUX_IMG:-wg-linux:base}   # override for isolated test runs
_wg_img() { docker image inspect $IMG >/dev/null 2>&1 || { echo "building ${IMG}…" >&2; docker build -q -t $IMG "$WG_ROOT/levels/linux/image" >/dev/null 2>&1; }; }
_wg_run() { _wg_img; docker run -d --name $C --hostname prod-app-01 --tmpfs /var/lib/appdata:size=64m,mode=755 $IMG >/dev/null; }
_wg_up()  { [ "$(docker inspect -f '{{.State.Running}}' $C 2>/dev/null)" = true ]; }
track_start() {
  docker info >/dev/null 2>&1 || { echo "docker is not running" >&2; return 1; }
  if _wg_up; then echo "container $C running"; else docker rm -f $C >/dev/null 2>&1 || true; _wg_run; fi
}
track_stop()  { docker rm -f $C >/dev/null 2>&1 || true; docker rmi $IMG >/dev/null 2>&1 || true; }
track_ready() { docker info >/dev/null 2>&1 || return 1; _wg_up || { docker rm -f $C >/dev/null 2>&1 || true; _wg_run; }; }  # self-heals if the box vanished
track_wipe()  { docker rm -f $C >/dev/null 2>&1 || true; _wg_run; }   # fresh container from base image, ~2s
track_shell() { docker exec -it $C bash; }
