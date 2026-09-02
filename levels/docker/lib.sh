# docker-track helpers — sourced by break.sh / check.sh after lib/common.sh (cwd = level dir)
LVL=$(basename "$PWD"); WORK=$HOME/.k8s-wargame/docker/$LVL
# copy level assets (everything except the wargame scripts) into the player's work dir
setup_work() { rm -rf "$WORK"; mkdir -p "$WORK"; for f in *; do case "$f" in README.md|break.sh|check.sh|hints.md|solution.md|clean.sh) ;; *) cp -R "$f" "$WORK/";; esac; done; }
running() { [ "$(docker inspect -f '{{.State.Running}}' "$1" 2>/dev/null)" = true ]; }
# wait until container runs, then verify it stays up for a few seconds
wait_running() { # name [timeout]
  local t=${2:-30} i=0; [ -n "${WG_FAST:-}" ] && t=6
  while [ $i -lt $t ]; do running "$1" && break; sleep 1; i=$((i+1)); done
  running "$1" || return 1; sleep 3; running "$1"
}
# curl a published port with retries; prints body
http_get() { # url [tries]
  local n=${2:-10} i=0; [ -n "${WG_FAST:-}" ] && n=3
  while [ $i -lt $n ]; do curl -fsS -m 3 "$1" 2>/dev/null && return 0; sleep 1; i=$((i+1)); done; return 1
}
image_of() { docker inspect -f '{{.Config.Image}}' "$1" 2>/dev/null; }
